package com.galgga.order.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.galgga.board.vo.Criteria;
import com.galgga.member.vo.MemberVO;
import com.galgga.order.vo.OrderVO;

public interface OrderDAO {
	public void insertOrder(OrderVO orderVO) throws DataAccessException;
	public List<OrderVO> selectOrderList(Criteria cri) throws DataAccessException;
	public int orderListCount() throws Exception;
}
