package com.lhdx.www.server.web;

import com.lhdx.www.server.model.User;
import com.lhdx.www.server.service.HdService;
import com.lhdx.www.server.util.DataFormat;
import com.sina.sae.storage.SaeStorage;
import com.sina.sae.util.SaeUserInfo;
import org.apache.commons.io.FileUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping(value = "/service")
public class HDController {

    @Resource(name = "hdService")
    private HdService hdService;


    @RequestMapping(value = "/addHd", method = RequestMethod.POST)
    public
    @ResponseBody
    Map addNewNotice(
            @RequestParam(value = "name", required = false) String name,
            @RequestParam(value = "phone", required = false) String phone,
            @RequestParam(value = "addr", required = false) String addr,
            @RequestParam(value = "contactImage", required = false) MultipartFile contactImage, HttpSession httpSession) {
        User u = (User) httpSession.getAttribute("user");
        Map<String, Boolean> map = new HashMap<String, Boolean>();
        if (hdService.isJoined(u.getWxId())) {
            map.put("isAddSucessed", false);
            return map;
        } else {
            SaeStorage storage = new SaeStorage();
            String hdName = null;
            String hdPhone = null;
            String hdAddr = null;
            try {
                hdName = new String(name.getBytes("ISO8859-1"), "UTF-8");
                hdPhone = new String(phone.getBytes("ISO8859-1"), "UTF-8");
                hdAddr = new String(addr.getBytes("ISO8859-1"), "UTF-8");
            } catch (UnsupportedEncodingException e) {
                e.printStackTrace();
            }
            String image = null;
            if (contactImage == null || contactImage.isEmpty()) {
                System.out.println("文件未上传");
                image = null;
            } else {
                try {
                    String fileName = contactImage.getOriginalFilename();
                    String suffix = fileName.substring(fileName.lastIndexOf(".") + 1);
                    image = DataFormat.getUUID() + "." + suffix;
                    FileUtils.copyInputStreamToFile(contactImage.getInputStream(), new File(SaeUserInfo.getSaeTmpPath() + image));
                    storage.upload("hd", SaeUserInfo.getSaeTmpPath() + image, image);
//                    String realPath = httpSession.getServletContext().getRealPath("/hdImages/");
//                    FileUtils.copyInputStreamToFile(contactImage.getInputStream(), new File(realPath, image));

                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
            return hdService.insertHd(u.getWxId(), hdName, hdPhone, hdAddr, image);
        }
    }

    @RequestMapping(value = "/findHdorders", method = RequestMethod.POST)
    public
    @ResponseBody
    List findHdorders(HttpSession httpSession) {
        User u = (User) httpSession.getAttribute("user");
        return hdService.findHds(u.getWxId());
    }

    @RequestMapping(value = "/isJoined", method = RequestMethod.POST)
    public
    @ResponseBody
    Map isJoined(HttpSession httpSession) {
        User u = (User) httpSession.getAttribute("user");
        Map<String, Boolean> map = new HashMap<String, Boolean>();
        map.put("isJoined", hdService.isJoined(u.getWxId()));
        return map;
    }

    //管理员查询
    @RequestMapping(value = "/findHdInfo", method = RequestMethod.POST)
    public
    @ResponseBody
    List findHdInfo(HttpSession httpSession) {
        User u = (User) httpSession.getAttribute("user");
        return hdService.findHdInfo(u.getWxId());
    }


}
