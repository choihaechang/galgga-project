package com.galgga.common.base;

import java.io.File;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.galgga.board.vo.ReviewImgVO;
import com.galgga.goods.vo.GoodsImgFileVO;

public abstract class BaseController  {
	private static final String CURR_IMAGE_REPO_PATH = "C:\\galgga\\file_goodsImgRepo";
	
	protected List<GoodsImgFileVO> upload(MultipartHttpServletRequest multipartRequest) throws Exception{
		List<GoodsImgFileVO> fileList = new ArrayList<GoodsImgFileVO>();
		Iterator<String> fileNames = multipartRequest.getFileNames();
		while(fileNames.hasNext()){
			GoodsImgFileVO goodsImgFileVO =new GoodsImgFileVO();
			String fileName = fileNames.next();
			goodsImgFileVO.setFileType(fileName);
			MultipartFile mFile = multipartRequest.getFile(fileName);
			String originalFileName=mFile.getOriginalFilename();
			goodsImgFileVO.setFile_name(originalFileName);
			fileList.add(goodsImgFileVO);
			
			File file = new File(CURR_IMAGE_REPO_PATH +"\\"+ fileName);
			if(mFile.getSize()!=0){ //File Null Check
				if(! file.exists()){ 
					if(file.getParentFile().mkdirs()){
							file.createNewFile(); 
					}
				}
				mFile.transferTo(new File(CURR_IMAGE_REPO_PATH + "\\" + "temp" + "\\" + originalFileName));
			}
		}
		return fileList;
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