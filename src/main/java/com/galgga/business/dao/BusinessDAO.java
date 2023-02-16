package com.galgga.business.dao;

import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.galgga.business.vo.BusinessVO;

public interface BusinessDAO {
	public BusinessVO login(Map loginMap) throws DataAccessException;
	public void insertNewBusiness(BusinessVO businessVO) throws DataAccessException;
	public String selectOverlappedID(String id) throws DataAccessException;
}