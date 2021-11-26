package dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.MemberBean;

@Repository
public class MemberDAOImpl {

	@Autowired
	private SqlSession sqlSession;
	
	//아이디 중복 체크
	public int checkMemberId(String id) throws Exception{
		System.out.println("id:" + id);
		int re = -1;
		MemberBean mb = sqlSession.selectOne("join_check", id);
		if(mb != null) {
			re = 1;
		}
		return re;
	}

	public void insertMember(MemberBean member) throws Exception{
		sqlSession.insert("member_join", member);
	}
}
