package com.galgga.cart.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.galgga.cart.dao.LodCartDAO;
import com.galgga.cart.vo.LodCartVO;

@Service("lodCartService")
@Transactional(propagation=Propagation.REQUIRED)
public class LodCartServiceImpl implements LodCartService {
	@Autowired
	private LodCartDAO lodCartDAO;
	
	
	@Override
	public void lodCartInsert(int lod_id, int m_id) throws Exception{
		lodCartDAO.addLodCart(lod_id, m_id);
	}
	@Override
	public List<LodCartVO> lodCartList(int lod_id, int m_id) throws Exception{
		return lodCartDAO.lodCart(lod_id, m_id);
	}
	@Override
	public void lodCartDelete(int lod_id, int m_id) throws Exception{
		lodCartDAO.deleteLodCart(lod_id, m_id);
	}
	@Override
	public List<LodCartVO> cartList(int m_id) throws Exception{
		return lodCartDAO.lodCartList(m_id);
	}
}
