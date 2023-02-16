package com.galgga.reserve.service;

import java.util.List;
import java.util.Map;

import com.galgga.reserve.vo.BeforeResVO;
import com.galgga.reserve.vo.ReserveVO;

public interface ReserveService {
	public void haveReserve(ReserveVO reserveVO) throws Exception;
	public Map beforeRes(String lod_id, String unit_name) throws Exception;
	
	public List myReserveList(int m_id) throws Exception;
	public List date(String lod_id, String unit_name) throws Exception;
	public List reserveCheck(String lod_id, String m_id) throws Exception;
	public void lodUpdate(int lod_id, String lod_name) throws Exception;
	public int reserve_remove(int R_id) throws Exception;
}
