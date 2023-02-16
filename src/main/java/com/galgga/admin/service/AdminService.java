package com.galgga.admin.service;

import java.util.List;
import java.util.Map;

import com.galgga.admin.vo.AdminVO;
import com.galgga.board.vo.Criteria;

public interface AdminService {
	public AdminVO login(Map loginMap) throws Exception;
	public String overlapped(String id) throws Exception;
	public void addAdmin(AdminVO adminVO) throws Exception;
	public List<Criteria> businessList(Criteria cri) throws Exception;
	public int businessListCount() throws Exception;
}
