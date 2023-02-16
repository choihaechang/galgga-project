package com.galgga.order.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.galgga.board.vo.Criteria;
import com.galgga.member.vo.MemberVO;
import com.galgga.order.dao.OrderDAO;
import com.galgga.order.vo.OrderVO;

@Service("orderService")
@Transactional(propagation=Propagation.REQUIRED)
public class OrderServiceImpl implements OrderService {
	
	@Autowired
	BCryptPasswordEncoder pwEncoder;
	@Autowired
	private OrderDAO orderDAO;
	
	public void addOrder(OrderVO orderVO) throws Exception{
		String encodePw = pwEncoder.encode(orderVO.getOrder_pw());
		orderVO.setOrder_pw(encodePw);
		orderDAO.insertOrder(orderVO);
		//카트에서 주문 상품 제거한다.
		//orderDAO.removeGoodsFromCart(myOrderList);
	}
	
	public List<OrderVO> myOrderList(Criteria cri) throws Exception {
		return orderDAO.selectOrderList(cri);
	}
	
	public int myOrderListCount() throws Exception {
		return orderDAO.orderListCount();
	}
}
