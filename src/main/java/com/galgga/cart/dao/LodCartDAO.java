package com.galgga.cart.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.galgga.cart.vo.LodCartVO;

public interface LodCartDAO {

	public void addLodCart(int lod_id, int m_id) throws DataAccessException;
	public List<LodCartVO> lodCart(int lod_id, int m_id) throws DataAccessException;
	public void deleteLodCart(int lod_id, int m_id) throws DataAccessException;
	public List<LodCartVO> lodCartList(int m_id) throws DataAccessException;

}
