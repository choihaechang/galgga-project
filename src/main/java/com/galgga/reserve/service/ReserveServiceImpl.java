package com.galgga.reserve.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.galgga.member.dao.MemberDAO;
import com.galgga.reserve.dao.ReserveDAO;
import com.galgga.reserve.vo.BeforeResVO;
import com.galgga.reserve.vo.ReserveVO;

@Service("reserveService")
@Transactional(propagation=Propagation.REQUIRED)
public class ReserveServiceImpl implements ReserveService{

	@Autowired
	private ReserveDAO reserveDAO;
	  public void haveReserve(ReserveVO reserveVO) throws Exception{
	  reserveDAO.haveReserve(reserveVO);
	  
	  }

	@Override
	public Map beforeRes(String lod_id, String unit_name) throws Exception{
		Map beforeMap = new HashMap();
		BeforeResVO beforeResVO = reserveDAO.reserveData(lod_id, unit_name);
		beforeMap.put("beforeResVO", beforeResVO);
		
		return beforeMap;
	}
	
	  @Override 
	  public List myReserveList(int m_id) throws Exception{
	   List myReserveList= reserveDAO.selectMyReserveList(m_id);
	   if(myReserveList.size()==0) {
		   return null;
	   }
		  
	   return myReserveList; 
	}
	
		@Override
		public List date(String lod_id, String unit_name) throws Exception{

			List dateList = reserveDAO.dateRange(lod_id, unit_name);
			
			
			return dateList;
		}
		
		@Override
		public List reserveCheck(String lod_id, String m_id) throws Exception{
			
			List reserveCheck = reserveDAO.reserveCon(lod_id, m_id);
			return reserveCheck;
		}
		@Override
		public void lodUpdate(int lod_id, String lod_name) throws Exception{
			reserveDAO.lodNameUpdate(lod_id, lod_name);
		}
		
		  
		 @Override
		 public int reserve_remove(int R_id) throws Exception {
			 return reserveDAO.reserve_remove(R_id);
		 }
		
	
}
