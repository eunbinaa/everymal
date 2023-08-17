package com.myspring.stsproject.userMypage.controller;

import java.io.BufferedReader;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.myspring.stsproject.animal.dao.AnimalDAO;
import com.myspring.stsproject.animal.vo.AnimalVO;
import com.myspring.stsproject.forImg.dao.HosImgDAO;
import com.myspring.stsproject.forImg.vo.HosImgVO;
import com.myspring.stsproject.userMypage.dao.PetInfoDAO;
import com.myspring.stsproject.userMypage.dao.UserDAO;
import com.myspring.stsproject.userMypage.service.UserService;
import com.myspring.stsproject.userMypage.vo.PetInfoVO;
import com.myspring.stsproject.userMypage.vo.UserVO;

@Controller("petInfoController")
public class PetInfoControllerImpl implements PetInfoController{

	@Autowired
	PetInfoDAO petInfoDAO;
	
	@Autowired
	PetInfoVO petInfoVO;
	
	@Autowired
	UserDAO userDAO;
	
	@Autowired
	UserVO userVO;
	
	@Autowired
	UserService userService;
	
	//pet 추가할때
	@Autowired
	AnimalDAO animalDAO;
	
	
	@Autowired
	AnimalVO animalVO;
	
	
	@Override
	@RequestMapping(value = "/user_Page/myPetList.do", method = RequestMethod.GET)
	public ModelAndView myPetList(Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName=(String) request.getAttribute("viewName");
		 ModelAndView mav = new ModelAndView(viewName);
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8;");
		HttpSession session = request.getSession();
		String user_code=(String) session.getAttribute("user_code");		
		System.out.println("user_code가 뭐냐>>>>>:"+user_code);
		model.addAttribute("user_code",user_code); //jsp로 값 넘겨줘야 할 때 사용
		List<PetInfoVO> petList=petInfoDAO.selectPetList(user_code);		
		mav.addObject("petList", petList);
		return mav;
	}

	@Override
	@RequestMapping(value = "/user_Page/modPet.do", method = RequestMethod.POST)
	public ModelAndView modPet( @ModelAttribute("petInfoVO") PetInfoVO petInfoVO, Model model, HttpServletRequest request,		
		HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8;");
		String viewName=(String) request.getAttribute("viewName");
		
		
		HttpSession session = request.getSession();
		String user_code=(String) session.getAttribute("user_code");
		//
		 BufferedReader reader = request.getReader();
		    StringBuilder sb = new StringBuilder();
		    String line;
		    while ((line = reader.readLine()) != null) {
		        sb.append(line);
		    }
		    String jsonData = sb.toString();

		    // JSON 데이터를 Map으로 파싱
		    ObjectMapper objectMapper = new ObjectMapper();
		    List<Map<String, Object>> petInfoList = objectMapper.readValue(jsonData, List.class);

		    // 각 JSON 객체를 처리
		    for (Map<String, Object> petInfo : petInfoList) {
		        String pet_code = (String) petInfo.get("pet_code");
		        String pet_name = (String) petInfo.get("pet_name");
		        int pet_age = Integer.parseInt(petInfo.get("pet_age").toString());
		        String pet_sex = (String) petInfo.get("pet_sex");
		        String pet_types = (String) petInfo.get("pet_types");
		        String pet_number = (String) petInfo.get("pet_number");
		        String b_type = (String) petInfo.get("b_type");
		        float pet_weight = Float.parseFloat(petInfo.get("pet_weight").toString());
		        String pet_etc = (String) petInfo.get("pet_etc");
		        System.out.println("펫코드: " + pet_code);
		        System.out.println("이름: " + pet_name);
		        System.out.println("나이: " + pet_age);
		        System.out.println("성별: " + pet_sex);
		        System.out.println("타입: " + pet_types);
		        System.out.println("번호: " + pet_number);
		        System.out.println("혈액평: " + b_type);
		        System.out.println("무게: " + pet_weight);
		        System.out.println("기타: " + pet_etc);
		        // 이제 각각의 필드 값을 이용하여 업데이트 로직을 수행
		        petInfoVO=new PetInfoVO(pet_code, pet_name, pet_age, pet_sex, pet_types, pet_number, b_type, pet_weight, pet_etc);
		        petInfoDAO.updatePet(petInfoVO);
		        // ...
		       
		    }
		    PrintWriter out = response.getWriter();
		    
			out.print("<script>");
			out.print("alert('수정되었습니다.');");
			out.print("location.href='"+request.getContextPath()+"/user_Page/myPetList.do';");
			out.print("</script>");
		
		return null;
		
		
	}
	

	@Override
	@RequestMapping(value = "/user_Page/addPet.do", method = RequestMethod.POST)
	public ModelAndView addPet(Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8;");
		HttpSession session = request.getSession();
		String user_code=(String) session.getAttribute("user_code");
		
		String viewName=(String) request.getAttribute("viewName");
		PrintWriter out = response.getWriter();
		String pet_name=request.getParameter("pet_name");
		int pet_age=Integer.parseInt(request.getParameter("pet_age"));
		String pet_sex=request.getParameter("pet_sex");
		String pet_types=request.getParameter("pet_types");
		String pet_number=request.getParameter("pet_number");
		String b_type=request.getParameter("b_type");
		float pet_weight=Float.parseFloat(request.getParameter("pet_weight"));
		String pet_etc=request.getParameter("pet_etc");
		System.out.println(pet_name);
		AnimalVO animalVO = new AnimalVO(user_code, pet_name, pet_age, pet_sex, pet_types, pet_number, b_type, pet_weight, pet_etc);
		animalDAO.addAnimal(animalVO);
		out=response.getWriter();
		out.print("<script>");
		out.print("alert('동물을 추가했습니다');");
		out.print("location.href='"+request.getContextPath()+"/user_Page/myPetList.do';");
		out.print("</script>");
		
		return null;
	}

	@Override
	@RequestMapping(value = "/user_Page/removePetInfo.do", method = RequestMethod.POST)
	public ModelAndView removePetInfo(Model model, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8;");
		HttpSession session = request.getSession();
		PrintWriter out = response.getWriter();
		String pet_code=request.getParameter("pet_code");
		System.out.println("삭제수행");
		petInfoDAO.removePetInfo(pet_code);
		out=response.getWriter();
		out.print("<script>");
		out.print("alert('동물을 삭제했습니다');");
		out.print("location.href='"+request.getContextPath()+"/user_Page/myPetList.do';");
		out.print("</script>");
		return null;
	}

}
