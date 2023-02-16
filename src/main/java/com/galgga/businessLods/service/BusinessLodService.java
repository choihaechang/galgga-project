package com.galgga.businessLods.service;

import java.util.List;
import java.util.Map;

import com.galgga.Lods.vo.LodVO;
import com.galgga.Lods.vo.UnitVO;
import com.galgga.main.vo.MainListVO;

public interface BusinessLodService {
	public int addNewLods(Map newLodsMap) throws Exception;
	public List myLodsList(int b_id) throws Exception; 
	public int addNewUnits(Map newUnitsMap) throws Exception; 
	
	public Map lodsInfo(String lod_id) throws Exception;
	public Map unitsInfo(String lod_id) throws Exception;
	
	public List<MainListVO> valueLods() throws Exception;
	public List<MainListVO> reserveLods() throws Exception;
	
	
	public List myLodsReserveList(int b_id) throws Exception;
	public void modiLodsInfo(LodVO lodVO) throws Exception;
	public void modiunitsInfo(UnitVO unitVO) throws Exception;
	public Map unit_Info(String unit_id) throws Exception;
	public void lodRefund(int lod_id, String refund) throws Exception;
}
