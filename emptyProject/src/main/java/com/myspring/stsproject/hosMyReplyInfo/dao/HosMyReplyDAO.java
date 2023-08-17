package com.myspring.stsproject.hosMyReplyInfo.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

public interface HosMyReplyDAO {
	public List selectAllReplyList(Map<String, Integer> pagingMap, String hos_id) throws DataAccessException;
	public int replyCount(String hos_id) throws DataAccessException;
	public void deleteReply(String[] items)throws DataAccessException;
	public String selectReply(String a_code)throws DataAccessException;


}
