package com.myspring.stsproject.hosMyReplyInfo.service;

import java.util.Map;

import org.springframework.dao.DataAccessException;

public interface HosMyReplyService {
	public Map<String, Integer> listReply(Map<String, Integer> pagingMap, String hos_id) throws DataAccessException;
	public int replyCount(String hos_id) throws DataAccessException;
	public void delReply(String[] items) throws DataAccessException;
	public String viewReply(String a_code) throws DataAccessException;
}
