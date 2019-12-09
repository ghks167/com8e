package com.com8e.member.service;

import java.util.List;

import com.com8e.member.vo.MemberVO;

public interface IMemberService {
	/**
	 * 
	 * <b>회원목록 전체 </b>를 조회한다. <br>
	 * @return
	 * @throws Exception
	 */
	public List<MemberVO> selectMemberList() throws Exception;
	
	/**
	 * <b>회원상세정보</b>를 조회한다 <br>
	 * @param mem_id
	 * @return
	 * @throws Exception
	 */
	public MemberVO selectMember(String mem_id) throws Exception;
	
	/**
	 * 입력된 회원정보를 저장한다
	 * @param member
	 * @return
	 * @throws Exception
	 */
	public int insertMember(MemberVO member) throws Exception;
	
	/**
	 * 입력된 회원정보를 업데이트한다
	 * @param member
	 * @return
	 * @throws Exception
	 */
	public int updateMember(MemberVO member) throws Exception;
	
	/**
	 * 해당회원의 탈퇴여부를 "Y" 로 변경 <br>
	 * 회원아이디,비밀번호가 매칭되어야한다.
	 * @param member
	 * @return
	 * @throws Exception
	 */
	public int deleteMember(MemberVO member) throws Exception;
	
}
