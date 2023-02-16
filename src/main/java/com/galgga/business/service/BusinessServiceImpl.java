package com.galgga.business.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.galgga.business.dao.BusinessDAO;
import com.galgga.business.vo.BusinessVO;

@Service("businessService")
@Transactional(propagation=Propagation.REQUIRED)
public class BusinessServiceImpl implements BusinessService {
	@Autowired
	private BusinessDAO businessDAO;
	@Autowired
	BCryptPasswordEncoder pwEncoder;
	
	@Override
	public BusinessVO login(Map loginMap) throws Exception {
		return businessDAO.login(loginMap);
	}
	
	@Override
	public void addBusiness(BusinessVO businessVO) throws Exception {
		String encodePw = pwEncoder.encode(businessVO.getBusiness_pw());
		businessVO.setBusiness_pw(encodePw);
		businessDAO.insertNewBusiness(businessVO);
	}
	
	@Override
	public String overlapped(String id) throws Exception {
		return businessDAO.selectOverlappedID(id);
	}
}
