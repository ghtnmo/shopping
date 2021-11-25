package controller;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.sql.rowset.serial.SerialException;

import org.apache.tomcat.jni.FileInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import model.ImageBean;
import service.ImageServiceImpl;
import service.MemberServiceImpl;
import util.FileUtil;


@Controller
public class ItemController {
	
	@Autowired
	FileUtil FU;
	

	@RequestMapping(value = "/items/list/best.nhn")
	public String list() {
		
		return "/items/item_list";
	}
	
	@RequestMapping(value = "/test.nhn")
	public String test() {
		
		return "/test";
	}
	
	@RequestMapping(value = "/upload", method = RequestMethod.POST)
    public String upload(@RequestParam("file") MultipartFile file,HttpServletRequest request) {
 
        System.out.println("파일 이름 : " + file.getOriginalFilename());
        System.out.println("파일 크기 : " + file.getSize());


        FU.fileSave(file);
        
        return "uploadok";
    }

	
}
