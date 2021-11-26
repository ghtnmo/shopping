package controller;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import model.ItemBean;
import service.ImageServiceImpl;
import service.ItemServiceImpl;
import service.MemberServiceImpl;
import util.FileUtil;


@Controller
public class ItemController {
	
	@Autowired
	FileUtil FU;
	
	@Autowired
	private ItemServiceImpl itemService;

	@RequestMapping(value = "/items/list/best.nhn")
	public String list(@RequestParam(value="page", defaultValue="1") int page,Model model) throws Exception {
		int listCnt = itemService.listItemCount();
		int pageSize = 10;
		int totalPage = (int) Math.ceil(listCnt/(double)pageSize);
		int endNum = page * pageSize;
		int startNum = endNum -(pageSize -1);
		Map<String,String> map = new HashMap();
		map.put("startNum",String.valueOf(startNum));
		map.put("endNum",String.valueOf(endNum));
		List<ItemBean> itemList = itemService.listItem(map);
		
		model.addAttribute("itemList", itemList);
		return "/items/item_list";
	}
	
	
	
	
	//데이터 입력용임시페이지
	@RequestMapping(value = "/data.nhn")
	public String data() {
		return "/test";
	}
	//이미지 저장페이지
	@RequestMapping(value = "/uploadImage", method = RequestMethod.POST)
    public String uploadImage(@RequestParam("file") MultipartFile file,HttpServletRequest request) {
 
        System.out.println("파일 이름 : " + file.getOriginalFilename());
        System.out.println("파일 크기 : " + file.getSize());


        FU.fileSave(file);
        
        return "uploadok";
    }
	
	//아이템 저장페이지
	@RequestMapping(value = "/uploadItem", method = RequestMethod.POST)
    public String uploadItem( @RequestParam Map<String, String> param) {
		
		String item_title = param.get("item_title");
		int item_price =   Integer.parseInt(param.get("item_price"));
		int item_discount = 0;
		try {
			item_discount =   Integer.parseInt(param.get("item_discount"));
		}catch(Exception e) {
			
		}
		int item_stock =   Integer.parseInt(param.get("item_stock"));
		String item_description =  param.get("item_description");
		String item_thumbnail = param.get("item_thumbnail");
		
		ItemBean item = new ItemBean(item_title, item_price, item_discount, item_stock, item_description,item_thumbnail);
		
		try {
			itemService.insertItem(item);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
        return "uploadok";
    }

	
}
