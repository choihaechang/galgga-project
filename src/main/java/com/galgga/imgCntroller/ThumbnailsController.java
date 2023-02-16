package com.galgga.imgCntroller;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import net.coobird.thumbnailator.Thumbnails;

@Controller
public class ThumbnailsController {
	private static String CURR_IMAGE_REPO_PATH = "C:\\galgga\\";	
	
	@RequestMapping("/lodThumbnails.do")
	protected void lodThumbnails(@RequestParam("lod_imgName") String lod_imgName,
                            	 @RequestParam("lod_id") String lod_id,
			                 HttpServletResponse response) throws Exception {
		
		OutputStream out = response.getOutputStream();
		String filePath=CURR_IMAGE_REPO_PATH+"\\"+"file_repo"+"\\"+"temp"+"\\"+ "lods" + "\\" + lod_id +"\\"+ "lod"+"\\"+lod_imgName;
		File img=new File(filePath);
		
		if (img.exists()) { 
			Thumbnails.of(img).size(400,220).outputFormat("png").toOutputStream(out);
		}
		byte[] buffer = new byte[1024 * 8];
		out.write(buffer);
		out.close();
	}
	
	@RequestMapping("/unitThumbnails.do")
	protected void unitThumbnails(@RequestParam("unit_imgName") String unit_imgName,
                            	 @RequestParam("lod_id") String lod_id,
                            	 @RequestParam("unit_id") String unit_id,
			                 HttpServletResponse response) throws Exception {
		OutputStream out = response.getOutputStream();
		String filePath=CURR_IMAGE_REPO_PATH+"\\"+"file_repo"+"\\"+"temp"+"\\"+"lods"+"\\"+lod_id+"\\"+"unit"+"\\"+unit_id+"\\"+unit_imgName;
		File img=new File(filePath);
		
		if (img.exists()) { 
			Thumbnails.of(img).size(550,370).outputFormat("png").toOutputStream(out);
		}
		byte[] buffer = new byte[1024 * 8];
		out.write(buffer);
		out.close();
	}
	
	@RequestMapping("/reivewThumnail.do")
	protected void reivewThumnails(@RequestParam("imgName") String imgName,
                            	 @RequestParam("lod_id") String lod_id,
                            	 @RequestParam("review_id") String review_id,
                            	 HttpServletResponse response) throws Exception {

		OutputStream out = response.getOutputStream();
		String filePath=CURR_IMAGE_REPO_PATH + "\\" + "file_repo" + "\\" + "temp" + "\\" + "lods" + "\\" + lod_id +"\\"+ "lod"+"\\"+"review"+"\\"+review_id+"\\"+imgName;
		File img=new File(filePath);
		
		if (img.exists()) { 
			Thumbnails.of(img).size(300,170).outputFormat("png").toOutputStream(out);
		}
		byte[] buffer = new byte[1024 * 8];
		out.write(buffer);
		out.close();
	}

}
