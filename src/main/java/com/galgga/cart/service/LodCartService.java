package com.galgga.cart.service;

import java.util.List;

import com.galgga.cart.vo.LodCartVO;

public interface LodCartService {

	
	public void lodCartInsert(int lod_id, int m_id) throws Exception;
	public List<LodCartVO> lodCartList(int lod_id, int m_id) throws Exception;
	public void lodCartDelete(int lod_id, int m_id) throws Exception;
	public List<LodCartVO> cartList(int m_id) throws Exception;

}
