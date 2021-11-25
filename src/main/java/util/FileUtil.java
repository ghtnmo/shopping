package util;

import java.io.FileOutputStream;
import java.io.InputStream;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

import model.ImageBean;
import service.ImageServiceImpl;

@Repository
public class FileUtil{
	
	String dirPath = "D:\\javaProjects\\shopping\\src\\main\\webapp\\images\\";

	@Autowired
	private ImageServiceImpl imageService;
	
	public void fileSave(MultipartFile file) {
		String fullPath = dirPath + file.getOriginalFilename();
        String fileSize = Long.toString(file.getSize());
			
		try (
	            FileOutputStream fos = new FileOutputStream(fullPath);
	            InputStream is = file.getInputStream();) {
		        
	        	int readCount = 0;
	        	byte[] buffer = new byte[1024];
		        // ������ ���� ũ�� ��ŭ�� buffer�� �����ϰ�
		// ( ���� 1024, 2048, 4096, 8192 �� ���� ��� �������� ������ ũ�⸦ ��� ���� �Ϲ����̴�.)
		
		while ((readCount = is.read(buffer)) != -1) {
		    //  ���Ͽ��� ������ fileInputStream�� ������ ũ�� (1024byte) ��ŭ �а�
		    fos.write(buffer, 0, readCount);
		    // ������ ������ fileOutputStream ��ü�� ����ϱ⸦ �ݺ��Ѵ�
		    }
		    
		    
		    ImageBean img = new ImageBean(file.getOriginalFilename(),dirPath,fileSize);
		    imageService.insertImage(img);

		  
		    
			} catch (Exception ex) {
			   ex.printStackTrace();
	        }
	}
}