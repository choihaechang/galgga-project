package com.galgga.Lods.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.galgga.Lods.vo.CateVO;
import com.galgga.Lods.vo.LodImgFileVO;
import com.galgga.Lods.vo.LodVO;
import com.galgga.goods.vo.GoodsCateVO;
import com.galgga.main.vo.MainListVO;

public interface LodsDAO {
	  public List<MainListVO> lodList_value() throws DataAccessException;
	  public List<MainListVO> lodList_reserve() throws DataAccessException;
	  
	  public LodVO selectLodsDetail(String lod_id) throws DataAccessException;
	  public List<LodImgFileVO> selectLodComImg(String lod_id) throws DataAccessException;
	  public List<CateVO> selectCateList(String lod_category) throws DataAccessException;
	  public List<CateVO> selectLodSearch(String keyword) throws DataAccessException;
	  public List<GoodsCateVO> selectGoodsSearch(String keyword) throws DataAccessException;
}
