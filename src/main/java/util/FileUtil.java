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
		        // 파일을 읽을 크기 만큼의 buffer를 생성하고
		// ( 보통 1024, 2048, 4096, 8192 와 같이 배수 형식으로 버퍼의 크기를 잡는 것이 일반적이다.)
		
		while ((readCount = is.read(buffer)) != -1) {
		    //  파일에서 가져온 fileInputStream을 설정한 크기 (1024byte) 만큼 읽고
		    fos.write(buffer, 0, readCount);
		    // 위에서 생성한 fileOutputStream 객체에 출력하기를 반복한다
		    }
		    
		    
		    ImageBean img = new ImageBean(file.getOriginalFilename(),dirPath,fileSize);
		    imageService.insertImage(img);

		  
		    
			} catch (Exception ex) {
			   ex.printStackTrace();
	        }
	}
}