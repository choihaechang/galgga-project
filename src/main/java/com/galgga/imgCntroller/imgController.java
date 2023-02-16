package com.galgga.imgCntroller;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.galgga.Lods.vo.LodImgFileVO;
import com.galgga.Lods.vo.UnitImgFileVO;
import com.galgga.board.vo.ReviewImgVO;

import net.coobird.thumbnailator.Thumbnails;

public class imgController {
private static String CURR_IMAGE_REPO_PATH = "C:\\galgga\\file_repo";
	
// 숙소에 대한 upload
@RequestMapping("/lodupload")
protected List<LodImgFileVO> lodupload(MultipartHttpServletRequest multipartRequest) throws Exception{
	List<LodImgFileVO> lodfileList= new ArrayList<LodImgFileVO>();
	 Iterator<String> fileNames = multipartRequest.getFileNames(); //form 내부 name 받와서 fileNames에 저장, 

	while(fileNames.hasNext()){ //fileNames 내부에 값이 있을 경우에 실행
		LodImgFileVO lodImgFileVO =new LodImgFileVO();	
		String fileName = fileNames.next();		// fileNames에 다음 값이 있을 경우 다시 대입
		lodImgFileVO.setImgType(fileName);
		if(fileName.contains("lod_img")) {
		MultipartFile mFile = multipartRequest.getFile(fileName);	//위에서 저장한 filename 가져와서 mfil 저장
		String originalFileName=mFile.getOriginalFilename();
		lodImgFileVO.setLod_imgName(originalFileName);
		lodfileList.add(lodImgFileVO);
		File file = new File(CURR_IMAGE_REPO_PATH +"\\"+ fileName);
		
		if(mFile.getSize()!=0){
			if(! file.exists()){ 
				if(file.getParentFile().mkdirs()){ 
						file.createNewFile();
				}
			}
			mFile.transferTo(new File(CURR_IMAGE_REPO_PATH +"\\"+"temp"+ "\\"+originalFileName)); 
		}
		}
	}
	return lodfileList;
}

@RequestMapping("/unitupload")
protected List<UnitImgFileVO> unitupload(MultipartHttpServletRequest multipartRequest) throws Exception{
	List<UnitImgFileVO> unitfileList= new ArrayList<UnitImgFileVO>();
	Iterator<String> fileNames = multipartRequest.getFileNames();
	while(fileNames.hasNext()){
		UnitImgFileVO unitImgFileVO =new UnitImgFileVO();
		String fileName = fileNames.next();
		unitImgFileVO.setImgType(fileName);
		if(fileName.contains("unit_img")) {
		MultipartFile mFile = multipartRequest.getFile(fileName);
		String originalFileName=mFile.getOriginalFilename();
		unitImgFileVO.setUnit_imgName(originalFileName);
		unitfileList.add(unitImgFileVO);
		
		File file = new File(CURR_IMAGE_REPO_PATH +"\\"+ fileName);
		if(mFile.getSize()!=0){
			if(! file.exists()){ 
				if(file.getParentFile().mkdirs()){ 
						file.createNewFile();
				}
			}
			mFile.transferTo(new File(CURR_IMAGE_REPO_PATH + "\\"+"temp"+ "\\"+originalFileName)); 
			
		}
	}
	}
	return unitfileList;
}

	@RequestMapping("/download")
	protected void download(@RequestParam("fileName") String fileName,
		                 	@RequestParam("goods_id") String goods_id,
			                 HttpServletResponse response) throws Exception {
		OutputStream out = response.getOutputStream();
		String filePath=CURR_IMAGE_REPO_PATH+"\\"+goods_id+"\\"+fileName;
		File image=new File(filePath);

		response.setHeader("Cache-Control","no-cache");
		response.addHeader("Content-disposition", "attachment; fileName="+fileName);
		FileInputStream in=new FileInputStream(image); 
		byte[] buffer=new byte[1024*8];
		while(true){
			int count=in.read(buffer); 
			if(count==-1)  
				break;
			out.write(buffer,0,count);
		}
		in.close();
		out.close();
	}
	
	@RequestMapping("/thumbnails.do")
	protected void thumbnails(@RequestParam("fileName") String fileName,
                            	@RequestParam("goods_id") String goods_id,
			                 HttpServletResponse response) throws Exception {
		OutputStream out = response.getOutputStream();
		String filePath=CURR_IMAGE_REPO_PATH+"\\"+goods_id+"\\"+fileName;
		File image=new File(filePath);
		
		if (image.exists()) { 
			Thumbnails.of(image).size(330,170).outputFormat("png").toOutputStream(out);
		}
		byte[] buffer = new byte[1024 * 8];
		out.write(buffer);
		out.close();
	}
	
	@RequestMapping("/reviewUpload")
	protected List<ReviewImgVO> reviewUpload(MultipartHttpServletRequest multipartRequest) throws Exception{
		List<ReviewImgVO> reviewimg= new ArrayList<ReviewImgVO>();
		Iterator<String> fileNames = multipartRequest.getFileNames();
		while(fileNames.hasNext()){
			ReviewImgVO reviewImgVO =new ReviewImgVO();
			String fileName = fileNames.next();
			reviewImgVO.setImgType(fileName);
			MultipartFile mFile = multipartRequest.getFile(fileName);
			String originalFileName=mFile.getOriginalFilename();
			reviewImgVO.setImgName(originalFileName);
			reviewimg.add(reviewImgVO);
			
			File file = new File(CURR_IMAGE_REPO_PATH +"\\"+ fileName);
			if(mFile.getSize()!=0){
				if(! file.exists()){ 
					if(file.getParentFile().mkdirs()){ 
							file.createNewFile();
					}
				}
				mFile.transferTo(new File(CURR_IMAGE_REPO_PATH + "\\"+"temp"+ "\\"+originalFileName)); 
				
			}
		
		}
		return reviewimg;
	}
}
