package com.galgga.order.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.galgga.board.vo.Criteria;
import com.galgga.member.vo.MemberVO;
import com.galgga.order.vo.OrderVO;

@Repository("orderDAO")
public class OrderDAOImpl implements OrderDAO {
	@Autowired
	private SqlSession sqlSession;
	
	public void insertOrder(OrderVO orderVO) throws DataAccessException{
		sqlSession.insert("mapper.order.insertOrder",orderVO);
	}
	
	public List<OrderVO> selectOrderList(Criteria cri) throws DataAccessException {
		List<OrderVO> orderList = sqlSession.selectList("mapper.order.selectOrderList", cri);
		return orderList;

	}
	
	public int orderListCount() throws Exception {
		return (Integer)sqlSession.selectOne("mapper.order.orderListCount");
	}
}
