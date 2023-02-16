package com.galgga.admin.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.galgga.admin.dao.AdminDAO;
import com.galgga.admin.vo.AdminVO;
import com.galgga.board.vo.Criteria;

@Service("adminService")
@Transactional(propagation=Propagation.REQUIRED)
public class AdminServiceImpl implements AdminService {
	@Autowired
	private AdminDAO adminDAO;
	@Autowired
	BCryptPasswordEncoder pwEncoder;
	
	@Override
	public AdminVO login(Map loginMap) throws Exception{
		return adminDAO.login(loginMap);
	}
	
	@Override
	public void addAdmin(AdminVO adminVO) throws Exception {
		String encodePw = pwEncoder.encode(adminVO.getAdmin_pw());
		adminVO.setAdmin_pw(encodePw);
		adminDAO.insertNewAdmin(adminVO);
	}
	
	@Override
	public String overlapped(String id) throws Exception{
		return adminDAO.selectOverlappedID(id);
	}
	
	@Override
	public List<Criteria> businessList(Criteria cri) throws Exception {
		return adminDAO.selectbusinessList(cri);
	}
	
	@Override
	public int businessListCount() throws Exception {
		return adminDAO.businessListCount();
	}
}
