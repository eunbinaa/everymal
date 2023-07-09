package com.myspring.stsproject.userMypage.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.myspring.stsproject.hosmypage.vo.HosMypageInfoVO;
import com.myspring.stsproject.userMypage.vo.UserVO;

public interface UserController {
	public ModelAndView isValidPwd( HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView isValid(Model model, @ModelAttribute("userVO") UserVO userVO, @RequestParam("hos_id") String hos_id, RedirectAttributes rAttr, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView myInfo ( HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView myReview (Model model, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView viewReview (Model model, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView modMyReview (Model model, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView returnMyReview (Model model, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView myQuestion	(Model model, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView myRevDel  ( HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView myQusDel( HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView modInfo(@ModelAttribute("userVO") UserVO userVO, @RequestParam("file") MultipartFile file,HttpServletRequest request, HttpServletResponse response)throws Exception;
	
}
