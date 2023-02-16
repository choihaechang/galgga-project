package com.galgga.order.service;

import java.util.List;

import com.galgga.board.vo.Criteria;
import com.galgga.member.vo.MemberVO;
import com.galgga.order.vo.OrderVO;

public interface OrderService {
	public void addOrder(OrderVO orderVO) throws Exception;
	public List<OrderVO> myOrderList(Criteria cri) throws Exception;
	public int myOrderListCount() throws Exception;
}
