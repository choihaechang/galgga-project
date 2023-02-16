package com.galgga.businessLods.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.galgga.Lods.vo.LodVO;
import com.galgga.Lods.vo.UnitImgFileVO;
import com.galgga.Lods.vo.UnitVO;

public interface BusinessUnitDAO {
	public int insertNewUnits(Map newUnitsMap) throws DataAccessException;
	public void insertUnitsImageFile(List UnitsImgList)  throws DataAccessException;

	public List<UnitVO> selectUnitsDetail(String lod_id) throws DataAccessException;
	public List<UnitImgFileVO> selectUnitDetailImage(String lod_id) throws DataAccessException;
	public void updatetunitsInfo (UnitVO unitVO) throws DataAccessException;
	public UnitVO unitInfo(String unit_id) throws DataAccessException;
	public List<UnitImgFileVO> unitImg(String unit_id) throws DataAccessException;
	public List<UnitImgFileVO> selectUnitDetailImage_common(String lod_id) throws DataAccessException;
}
