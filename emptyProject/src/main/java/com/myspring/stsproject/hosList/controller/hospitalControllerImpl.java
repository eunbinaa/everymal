package com.myspring.stsproject.hosList.controller;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.myspring.stsproject.hosReviewInfo.dao.HosReviewDAO;
import com.myspring.stsproject.hosReviewInfo.service.HosReviewService;
import com.myspring.stsproject.hosReviewInfo.vo.ReviewVO;

@Controller("hospitalController")
public class hospitalControllerImpl implements hospitalController{
	@Autowired
	private HosReviewService hosReviewService;
	@Autowired
	private HosReviewDAO hosReviewDAO;
	
	@Autowired
	private ReviewVO reviewVO;
	
	

	@Override
	@RequestMapping(value = "/hos_List/Hospital_detail.do", method = RequestMethod.GET)
	public ModelAndView Hospital_detail(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName=(String) request.getAttribute("viewName");
		request.setCharacterEncoding("utf-8");
	      HttpSession session=request.getSession();
	      response.setContentType("text/html;charset=utf-8");
	      PrintWriter out = response.getWriter();
	      String hos_code=request.getParameter("hos_code");
	      hos_code="hos0001";
	      //hospitalVO result = hospitalDAO.selectHos(hos_code);
	      List<ReviewVO> hosReviewList=new ArrayList();
	      int review_count=hosReviewDAO.reviewcount(hos_code);// (hosReview��Ű�� �̿�)
	      hosReviewList = hosReviewService.listRev2(hos_code); //���� ���� �������� (hosReview��Ű�� �̿�)
	      float review_avg_result=hosReviewService.reviewAvg(hos_code); //�������ϱ� (hosReview��Ű�� �̿�)
	     String review_avg=String.format("%.2f", review_avg_result); //���� �Ҽ� 2�ڸ����� ��� 
	     System.out.println(review_avg);
	     System.out.println(review_count);
	     ModelAndView mav = new ModelAndView(viewName);
		 mav.addObject("hosReviewList", hosReviewList); 
		 mav.addObject("review_count", review_count);
		 mav.addObject("review_avg", review_avg);
		return mav;
	}
	
	
}
