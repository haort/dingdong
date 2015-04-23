package com.lhdx.www.server.web;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import com.lhdx.www.server.model.Notice;
import com.lhdx.www.server.model.User;
import com.lhdx.www.server.util.DataFormat;
import com.sina.sae.storage.SaeStorage;
import com.sina.sae.util.SaeUserInfo;
import org.apache.commons.io.FileUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lhdx.www.server.service.NoticeService;
import org.springframework.web.multipart.MultipartFile;

@Controller
@RequestMapping(value = "/service")
public class NoticeController {

    @Resource(name = "noticeService")
    private NoticeService noticeService;

    @RequestMapping(value = "/findNotice", method = RequestMethod.POST)
    public
    @ResponseBody
    Notice findNoticeById(HttpSession httpSession) {
        User u = (User) httpSession.getAttribute("user");
        return noticeService.findNotice2(u.getWxId());
    }

    @RequestMapping(value = "/getNotices", method = RequestMethod.POST)
    public
    @ResponseBody
    List getNoticeById(HttpSession httpSession) {
        User u = (User) httpSession.getAttribute("user");
        return noticeService.findNotices(u.getWxId());
    }


    @RequestMapping(value = "/addNewNotice", method = RequestMethod.POST)
    public
    @ResponseBody
    Map addNewNotice(
            @RequestParam("title") String title,
            @RequestParam("description") String description,
            @RequestParam(value = "contactImage", required = false) MultipartFile contactImage, HttpSession httpSession) {
        User u = (User) httpSession.getAttribute("user");
        SaeStorage storage = new SaeStorage();
        String noticeTitle = null;
        String noticeDescription = null;
        try {
            noticeTitle = new String(title.getBytes("ISO8859-1"), "UTF-8");
            noticeDescription = new String(description.getBytes("ISO8859-1"), "UTF-8");
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
				storage.upload("notice", SaeUserInfo.getSaeTmpPath()+image,image);
//                String realPath = httpSession.getServletContext().getRealPath("/noticeImages/");
//                FileUtils.copyInputStreamToFile(contactImage.getInputStream(), new File(realPath, image));

            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        return noticeService.insertNotice2(noticeTitle, noticeDescription, u.getWxId(), image);
    }

}
