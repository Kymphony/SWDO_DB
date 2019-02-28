package global.sesoc.ajax.dao;

import java.util.ArrayList;

import global.sesoc.ajax.vo.CommentVO;

public interface CommentMapper {

	public int saveComment(CommentVO comment);
	
	public ArrayList<CommentVO> list();
	
	public int delete(int num);
	
	public int edit(CommentVO text);
}
