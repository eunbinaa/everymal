package com.myspring.stsproject.hosMyReplyInfo.controller;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.myspring.stsproject.forImg.dao.HosImgDAO;
import com.myspring.stsproject.forImg.vo.HosImgVO;
import com.myspring.stsproject.hosMyReplyInfo.service.HosMyReplyService;
import com.myspring.stsproject.hosMyReplyInfo.vo.ReplyVO;
import com.myspring.stsproject.hosReviewInfo.service.HosReviewService;
import com.myspring.stsproject.hosmypage.service.HosMypageInfoService;
import com.myspring.stsproject.hosmypage.vo.HosMypageInfoVO;


@Controller("hosMyReplyController")
public class HosMyReplyControllerImpl implements HosMyReplyController {

	@Autowired
	private HosMyReplyService hosMyReplyService;

	@Autowired
	private ReplyVO replyVO;
	
	@Autowired
	HosMypageInfoVO hosMypageInfoVO;
	
	@Autowired
	HosMypageInfoService hosmypageinfoService;
	
	@Autowired
	HosImgVO hosImgVO;
	
	@Autowired
	HosImgDAO hosImgDAO;
	
	

	
	@Override
	@RequestMapping(value = "/hos_MyReplyInfo/listMyReply.do", method = RequestMethod.GET)
	public ModelAndView listMyReply(Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName=(String) request.getAttribute("viewName");
		request.setCharacterEncoding("utf-8");
	    response.setContentType("text/html;charset=utf-8");
	    HttpSession session=request.getSession();
	    String hos_id=(String)session.getAttribute("log_id");
		String hos_code=(String)session.getAttribute("hos_code");
		
		model.addAttribute("hos_code",hos_code);
		
		
		System.out.println("hos아이디 불러왔나?>>>>"+ hos_id);
		hosMypageInfoVO =hosmypageinfoService.selecthosInfo(hos_id);
		String _section=request.getParameter("section");
		String _pageNum=request.getParameter("pageNum");
		int section=Integer.parseInt((_section==null)?"1":_section);
		int pageNum=Integer.parseInt((_pageNum==null)?"1":_pageNum);
		Map<String, Integer> pagingMap=new HashMap<String, Integer>();
		pagingMap.put("section", section);
		pagingMap.put("pageNum", pageNum);
		Map hosReplyMap=hosMyReplyService.listReply(pagingMap, hos_id);
		hosReplyMap.put("section", section);
		hosReplyMap.put("pageNum", pageNum);
		int reply_count=hosMyReplyService.replyCount(hos_id);
		System.out.println(hos_id + " 가 작성한 "+reply_count +"개의 답변이 조회됨!!!");
		
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("hosReplyMap", hosReplyMap); 
		mav.addObject("reply_count", reply_count); 
		mav.addObject("hosMypageInfoVO", hosMypageInfoVO);
		mav.addObject("hosImgVO", hosImgVO);
		return mav;
	}

@Override
   @RequestMapping(value = "/hos_MyReplyInfo/viewReply.do", method = RequestMethod.GET)
   public ModelAndView viewReply(HttpServletRequest request, HttpServletResponse response) throws Exception {
      HttpSession session=request.getSession();
      String hos_id=(String)session.getAttribute("log_id");
       String a_code=request.getParameter("a_code");
      String q_code=hosMyReplyService.viewReply(a_code);   
      ModelAndView redirectMav = new ModelAndView("redirect:/qna_Board/viewArticle.do?q_code="+q_code);
      return redirectMav;
   }


	
	@Override
	@RequestMapping(value = "/hos_MyReplyInfo/hosReplyDel.do", method = RequestMethod.GET)
	public ModelAndView hosReplyDel(HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
    	HttpSession session=request.getSession();
	   // session = request.getSession();
		String hos_id=(String)session.getAttribute("log_id");
		String[] items=null;
        items=request.getParameterValues("del_chk");
		
		
		if(items==null){
			out.print("<script>");
			out.print("alert('삭제할 답변을 선택해주세요!');");
			out.print("location.href='" +request.getContextPath()+ "/hos_MyReplyInfo/listMyReply.do" + "';");
			out.print("</script>");
			out.flush();	
			 return null;
		}else {
			
			for(int i=0; i<items.length; i++) {
    			System.out.println( "items(답변등록번호) : " + items[i]);
    		}
			hosMyReplyService.delReply(items);
			out.print("<script>");
			out.print("alert('답변이 삭제되었습니다.');");
			out.print("location.href='" +request.getContextPath() + "/hos_MyReplyInfo/listMyReply.do" + "';");
			ModelAndView redirectMav = new ModelAndView("redirect:/hos_MyReplyInfo/listMyReply.do");
			return redirectMav;
		}
	}

}
