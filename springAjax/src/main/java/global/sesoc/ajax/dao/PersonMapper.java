package global.sesoc.ajax.dao;

import java.util.ArrayList;

import global.sesoc.ajax.vo.Person;

/**
 * 회원정보 관련 Mybatis 사용 메서드.
 * customerMapper.xml의 id와 매핑
 */
public interface PersonMapper {
	//회원정보 저장
	public int insert(Person member);
	//ID로 해당 회원 정보 검색
	public Person selectOne(String id);
	//전체 회원정보 목록 검색
	public ArrayList<Person> select();
	//ID로 해당 회원 정보 삭제
	public int delete(String id);
}
