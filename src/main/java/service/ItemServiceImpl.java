package service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.ImageDAOImpl;
import dao.ItemDAOImpl;
import dao.MemberDAOImpl;
import model.ImageBean;
import model.ItemBean;

@Service
public class ItemServiceImpl {
	@Autowired
	private ItemDAOImpl itemDAO;
	
	public int insertItem(ItemBean item)throws Exception{
		return itemDAO.insertItem(item);
	}
	
	
	public List<ItemBean> listItem(Map<String,String> map)throws Exception{
		return itemDAO.listItem(map);
	}
	
	public int listItemCount()throws Exception{
		return itemDAO.listItemCount();
	}
}
