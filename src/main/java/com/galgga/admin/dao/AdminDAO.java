package com.galgga.admin.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.galgga.admin.vo.AdminVO;
import com.galgga.board.vo.Criteria;

public interface AdminDAO {
	public AdminVO login(Map loginMap) throws DataAccessException;
	public String selectOverlappedID(String id) throws DataAccessException;
	public void insertNewAdmin(AdminVO adminVO) throws DataAccessException;
	public List<Criteria> selectbusinessList(Criteria cri) throws DataAccessException;
	public int businessListCount() throws Exception;
}
