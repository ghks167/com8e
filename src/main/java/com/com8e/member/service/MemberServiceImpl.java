package com.com8e.member.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.com8e.member.dao.IMemberDao;
import com.com8e.member.vo.MemberVO;

@Service
public class MemberServiceImpl implements IMemberService{
	
	@Autowired
	IMemberDao memberDao;
	
	
	@Override
	public List<MemberVO> selectMemberList() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public MemberVO selectMember(String mem_id) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insertMember(MemberVO member) throws Exception {
		// TODO Auto-generated method stub
		memberDao.insertMember(member);
		return 0;
	}

	@Override
	public int updateMember(MemberVO member) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteMember(MemberVO member) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

}
