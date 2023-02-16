package com.galgga.Lods.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.galgga.Lods.dao.LodsDAO;
import com.galgga.Lods.dao.UnitDAO;
import com.galgga.Lods.vo.CateVO;
import com.galgga.Lods.vo.LodImgFileVO;
import com.galgga.Lods.vo.LodVO;
import com.galgga.Lods.vo.UnitImgFileVO;
import com.galgga.Lods.vo.UnitVO;
import com.galgga.goods.vo.GoodsCateVO;
import com.galgga.main.vo.MainListVO;
@Service("lodsService")
@Transactional(propagation=Propagation.REQUIRED)
public class LodsServiceImpl implements LodsService{
	 
	@Autowired
	private LodsDAO lodsDAO;
	@Autowired
	private UnitDAO unitDAO;
	
	public List<MainListVO> valueLods() throws Exception{
		  return lodsDAO.lodList_value();
	  }
	  
	  public List<MainListVO> reserveLods() throws Exception{
		  return lodsDAO.lodList_reserve();
		  
	  }
	  
	  @Override
	  public Map lodsInfo(String lod_id) throws Exception{
		  Map lodsInfoMap = new HashMap();
		  LodVO lodVO = lodsDAO.selectLodsDetail(lod_id);
		  List <LodImgFileVO> lodComImgList = lodsDAO.selectLodComImg(lod_id);
		  lodsInfoMap.put("lodVO", lodVO);
		  lodsInfoMap.put("lodComImgList", lodComImgList);
		  return lodsInfoMap;
		  
	  }

	  @Override
	  public Map unitsInfo(String lod_id) throws Exception{
		  Map unitsInfoMap = new HashMap();
		  List <UnitVO> unitVO = unitDAO.selectUnitsDetail(lod_id);
		  List <UnitImgFileVO> unitImgList = unitDAO.selectUnitDetailImage(lod_id);
		  List <UnitImgFileVO> unitComImgList = unitDAO.selectUnitDetailImage_com(lod_id);
		  unitsInfoMap.put("unitVO", unitVO);
		  unitsInfoMap.put("unitImgList", unitImgList);
		  unitsInfoMap.put("unitComImgList", unitComImgList);
		  
		  return unitsInfoMap;
		  
	  }
	  @Override
	  public List<CateVO> categoryView(String lod_category) throws Exception{
		  return lodsDAO.selectCateList(lod_category);
	  }
	  
	  //숙소 검색
	  @Override
	  public List<CateVO> lodsSearch(String keyword) throws Exception {
		  return lodsDAO.selectLodSearch(keyword);
	  }
	  //상품 검색
	  @Override public List<GoodsCateVO> goodsSearch(String keyword) throws Exception {
		  return lodsDAO.selectGoodsSearch(keyword);
	  }
	 
}
