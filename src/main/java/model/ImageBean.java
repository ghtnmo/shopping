package model;

import java.sql.Blob;

public class ImageBean {
	private int image_code;
	private String image_name;
	private String image_cdate;
	private String image_path;
	private String image_size;
	

	public ImageBean(String image_name, String image_path, String image_size) {
		super();
		this.image_name = image_name;
		this.image_path = image_path;
		this.image_size = image_size;
	}

	
	public String getImage_path() {
		return image_path;
	}

	public void setImage_path(String image_path) {
		this.image_path = image_path;
	}

	public String getImage_size() {
		return image_size;
	}

	public void setImage_size(String image_size) {
		this.image_size = image_size;
	}

	
	public int getImage_code() {
		return image_code;
	}
	
	public void setImage_code(int image_code) {
		this.image_code = image_code;
	}
	public String getImage_name() {
		return image_name;
	}
	public void setImage_name(String image_name) {
		this.image_name = image_name;
	}
	public String getImage_cdate() {
		return image_cdate;
	}
	public void setImage_cdate(String image_cdate) {
		this.image_cdate = image_cdate;
	}
	
}
