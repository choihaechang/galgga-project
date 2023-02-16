package com.galgga.Lods.service;

import java.util.List;
import java.util.Map;

import com.galgga.Lods.vo.CateVO;
import com.galgga.goods.vo.GoodsCateVO;
import com.galgga.main.vo.MainListVO;

public interface LodsService {

	public List<MainListVO> valueLods() throws Exception;
	public List<MainListVO> reserveLods() throws Exception;
	
	public Map lodsInfo(String lod_id) throws Exception;
	public Map unitsInfo(String lod_id) throws Exception;
	
	public List<CateVO> categoryView(String lod_category) throws Exception;
	
	public List<CateVO> lodsSearch(String keyword) throws Exception;
	public List<GoodsCateVO> goodsSearch(String keyword) throws Exception;
}
