package com.galgga.reserve.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.galgga.reserve.vo.BeforeResVO;
import com.galgga.reserve.vo.ReserveVO;

public interface ReserveDAO {
	public void haveReserve(ReserveVO reserveVO) throws DataAccessException;
	
	public BeforeResVO reserveData(String lod_id, String unit_name) throws DataAccessException;
	
	public List selectMyReserveList(int m_id) throws DataAccessException;
	
	public List dateRange(String lod_id, String unit_name) throws DataAccessException;
	public List reserveCon(String lod_id, String m_id) throws DataAccessException;
	public void lodNameUpdate(int lod_id, String lod_name) throws DataAccessException;
	public int reserve_remove(int R_id) throws DataAccessException;
}
