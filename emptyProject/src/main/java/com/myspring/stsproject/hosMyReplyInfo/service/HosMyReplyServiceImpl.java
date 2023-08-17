package com.myspring.stsproject.hosMyReplyInfo.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import com.myspring.stsproject.hosMyReplyInfo.dao.HosMyReplyDAO;
import com.myspring.stsproject.hosMyReplyInfo.vo.ReplyVO;
import com.myspring.stsproject.hosReviewInfo.dao.HosReviewDAO;
import com.myspring.stsproject.qna_Board.vo.ArticleVO;

@Service("hosMyReplyService")
public class HosMyReplyServiceImpl implements HosMyReplyService {

	@Autowired
	private HosMyReplyDAO hosMyReplyDAO;
	
	
	@Override
	public Map<String, Integer> listReply(Map<String, Integer> pagingMap, String hos_id) throws DataAccessException {
		Map hosReplyMap=new HashMap();
		List<ArticleVO> hosReplyList=hosMyReplyDAO.selectAllReplyList(pagingMap, hos_id);
		int totalhosReply=hosMyReplyDAO.replyCount(hos_id);
		hosReplyMap.put("hosReplyList", hosReplyList);
		hosReplyMap.put("totalhosReply", totalhosReply);
		return hosReplyMap;
	}


	@Override
	public int replyCount(String hos_id) throws DataAccessException {
		int reply_count=hosMyReplyDAO.replyCount(hos_id);
		return reply_count;
	}


	@Override
	public void delReply(String[] items) throws DataAccessException {
		hosMyReplyDAO.deleteReply(items);
		
	}

	@Override
       public String viewReply(String a_code) throws DataAccessException {
      String q_code=hosMyReplyDAO.selectReply(a_code);
      return q_code;
   }


}
