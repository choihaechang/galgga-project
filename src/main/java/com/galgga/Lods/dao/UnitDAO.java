package com.galgga.Lods.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.galgga.Lods.vo.UnitImgFileVO;
import com.galgga.Lods.vo.UnitVO;

public interface UnitDAO {

	
	public List<UnitVO> selectUnitsDetail(String lod_id) throws DataAccessException;
	public List<UnitImgFileVO> selectUnitDetailImage(String lod_id) throws DataAccessException;
	public List<UnitImgFileVO> selectUnitDetailImage_com(String lod_id) throws DataAccessException;
	
}
