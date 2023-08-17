package com.myspring.stsproject.hosMyReplyInfo.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

public interface HosMyReplyController {

	public ModelAndView listMyReply (Model model, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView hosReplyDel (HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView viewReply (HttpServletRequest request, HttpServletResponse response) throws Exception;


}
