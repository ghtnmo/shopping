package service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.MemberDAOImpl;
import model.MemberBean;

@Service
public class MemberServiceImpl {
	@Autowired
	private MemberDAOImpl memberDao;
	
	public int checkMemberId(String id) throws Exception{
		System.out.println("id:" +id);
		return memberDao.checkMemberId(id);
	}

	public void insertMember(MemberBean member) throws Exception{
		// TODO Auto-generated method stub
		memberDao.insertMember(member);
	}
	
	
}
