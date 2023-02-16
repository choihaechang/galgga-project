package com.galgga.businessLods.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.galgga.Lods.vo.LodImgFileVO;
import com.galgga.Lods.vo.LodVO;
import com.galgga.Lods.vo.UnitImgFileVO;
import com.galgga.Lods.vo.UnitVO;
import com.galgga.businessLods.dao.BusinessLodDAO;
import com.galgga.businessLods.dao.BusinessUnitDAO;
import com.galgga.main.vo.MainListVO;

@Service("businessLodService")
@Transactional(propagation=Propagation.REQUIRED)
public class BusinessLodServiceImpl implements BusinessLodService {
	@Autowired
	private BusinessLodDAO businessLodDAO;
	@Autowired
	private BusinessUnitDAO businessUnitDAO;
	
	
	@Override
	public int addNewLods(Map newLodsMap) throws Exception{
		int lod_id = businessLodDAO.insertNewLods(newLodsMap);
		int unit_id = businessUnitDAO.insertNewUnits(newLodsMap);
		
		ArrayList<LodImgFileVO> lodImgFileList = (ArrayList)newLodsMap.get("lodImgFileList");
		ArrayList<UnitImgFileVO> unitImgFileList = (ArrayList)newLodsMap.get("unitImgFileList");
		for(LodImgFileVO lodImgFileVO : lodImgFileList) {
			lodImgFileVO.setLod_id(lod_id);
		}
		for(UnitImgFileVO unitImgFileVO : unitImgFileList) {
			unitImgFileVO.setUnit_id(unit_id);
		}
		businessLodDAO.insertLodsImageFile(lodImgFileList);
		businessUnitDAO.insertUnitsImageFile(unitImgFileList);
		
		return lod_id;
	}
	 
	
	  @Override 
	  public int addNewUnits(Map newUnitsMap) throws Exception{ 
	  int unit_id = businessUnitDAO.insertNewUnits(newUnitsMap);
	  ArrayList<UnitImgFileVO> unitImgFileList = (ArrayList)newUnitsMap.get("unitImgFileList"); 
	  for(UnitImgFileVO unitImgFileVO : unitImgFileList) { 
		  unitImgFileVO.setUnit_id(unit_id); 
		  }
	  businessUnitDAO.insertUnitsImageFile(unitImgFileList); 
	  return unit_id; 
	  }
	 
		
		
		
	  @Override 
	  public List myLodsList(int b_id) throws Exception{
	   List myLodsList= businessLodDAO.selectMyLodsList(b_id);
	   if(myLodsList.size()==0) {
		   return null;
	   }
		  
	   return myLodsList; 
	}
	  
	
	  @Override
	  public Map lodsInfo(String lod_id) throws Exception{
		  Map lodsInfoMap = new HashMap();
		  LodVO lodVO = businessLodDAO.selectLodsDetail(lod_id);
		  List <LodImgFileVO> lodComImgList = businessLodDAO.selectLodComImg(lod_id);
		  lodsInfoMap.put("lodVO", lodVO);
		  lodsInfoMap.put("lodComImgList", lodComImgList);
		  return lodsInfoMap;
		  
	  }

	  @Override
	  public Map unitsInfo(String lod_id) throws Exception{
		  Map unitsInfoMap = new HashMap();
		  List <UnitVO> unitVO = businessUnitDAO.selectUnitsDetail(lod_id);
		  List <UnitImgFileVO> unitImgList = businessUnitDAO.selectUnitDetailImage(lod_id);
		  
		  List <UnitImgFileVO> unitImgList_com = businessUnitDAO.selectUnitDetailImage(lod_id);
		  
		  unitsInfoMap.put("unitVO", unitVO);
		  unitsInfoMap.put("unitImgList", unitImgList);
		  unitsInfoMap.put("unitImgList_com", unitImgList_com);
		  return unitsInfoMap;
		  
	  }
	  
  
	  public List<MainListVO> valueLods() throws Exception{
		  return businessLodDAO.lodList_value();
	  }
	  
	  public List<MainListVO> reserveLods() throws Exception{
		  return businessLodDAO.lodList_reserve();
		  
	  }
	  
	 
	  @Override 
	  public List myLodsReserveList(int b_id) throws Exception{
	   List myLodsReserveList= businessLodDAO.selectLodsReserveList(b_id);
	   if(myLodsReserveList.size()==0) {
		   return null;
	   }
		  
	   return myLodsReserveList; 
	}
	  
 
	  @Override
	  public void modiLodsInfo(LodVO lodVO) throws Exception{
		  
		  businessLodDAO.updatetLodsInfo(lodVO);
	  }
	  
	  @Override
	  public void modiunitsInfo(UnitVO unitVO) throws Exception{
		  businessUnitDAO.updatetunitsInfo(unitVO);
	  }
	  
	  
	  @Override
	  public Map unit_Info(String unit_id) throws Exception {
		  Map unitInfoUp = new HashMap();
		  UnitVO unitVO = businessUnitDAO.unitInfo(unit_id);
		  List <UnitImgFileVO> unitImgList = businessUnitDAO.unitImg(unit_id);
		  unitInfoUp.put("unitVO", unitVO);
		  unitInfoUp.put("unitImgList", unitImgList);
		  
		  return unitInfoUp;
	  }
	  @Override
	  public void lodRefund(int lod_id, String refund) throws Exception{
		  businessLodDAO.updateRefund(lod_id, refund);
	  }
	  
}
