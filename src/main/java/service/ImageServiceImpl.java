package service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.ImageDAOImpl;
import dao.MemberDAOImpl;
import model.ImageBean;

@Service
public class ImageServiceImpl {
	@Autowired
	private ImageDAOImpl imageDAO;
	
	public int insertImage(ImageBean image)throws Exception{
		return imageDAO.insertImage(image);
	}
	
	
}
