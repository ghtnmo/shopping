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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import model.ImageBean;
import model.ItemBean;
import service.ImageServiceImpl;
import service.ItemServiceImpl;
import service.MemberServiceImpl;
import util.FileUtil;
import util.PagingVO;


@Controller
public class ItemController {
	
	@Autowired
	FileUtil FU;
	
	@Autowired
	private ItemServiceImpl itemService;

	//데이터 입력용임시페이지
	@RequestMapping(value = "/data.nhn")
	public String data() {
		return "/test";
	}
	//이미지 저장API
	@RequestMapping(value = "/uploadImage", method = RequestMethod.POST)
	@ResponseBody
    public HashMap<String,String> uploadImage(@RequestParam("file") MultipartFile file,HttpServletRequest request) {
 
        System.out.println("파일 이름 : " + file.getOriginalFilename());
        System.out.println("파일 크기 : " + file.getSize());


        FU.fileSave(file);
        
        //JsonResponse
        HashMap<String,String> map = new HashMap<String,String>();
        map.put("result","200");
        
        return map;
    }
	
	//아이템 저장API
	@RequestMapping(value = "/uploadItem", method = RequestMethod.POST)
    public HashMap<String,String> uploadItem( @RequestParam Map<String, String> param) {
		
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
		
		//JsonResponse
        HashMap<String,String> map = new HashMap<String,String>();
        map.put("result","200");
        
        return map;
    }

	
	
	
	@RequestMapping(value = "/items/list/best.nhn")
	public String list(@RequestParam(value="page", defaultValue="1") int page,Model model) throws Exception {
		int listCnt = itemService.listItemCount();
		int pageSize = 12;
		
		//페이징
		PagingVO vo = new PagingVO(listCnt,page,pageSize);
		Map<String,String> map = new HashMap();
		map.put("startNum",String.valueOf(vo.getStart()));
		map.put("endNum",String.valueOf(vo.getEnd()));
		List<ItemBean> itemList = itemService.listItem(map);
		
		
		model.addAttribute("itemList", itemList);
		model.addAttribute("paging", vo);
		return "/items/item_list";
	}
	
	@RequestMapping(value = "/items/detail.nhn")
	public String detail(@RequestParam(value="item_code",defaultValue="0") int item_code, Model model) throws Exception{
		
		try {
			ItemBean data = itemService.detailItem(item_code);
			
			if(data == null) {
				return "error";
			}
			
			model.addAttribute("data", data);
			return "items/item_detail";
			
		}catch(Exception e) {//JsonResponse
			return "error";
		}
		
	}

	
}
