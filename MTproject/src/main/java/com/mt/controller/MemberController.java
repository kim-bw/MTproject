package com.mt.controller;

import java.io.File;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.mt.domain.MemberVO;
import com.mt.service.MemService;

import lombok.extern.log4j.Log4j;
import lombok.extern.slf4j.Slf4j;



@Slf4j
@Log4j
@Controller
@RequestMapping("/member")
public class MemberController {

	@Autowired
	@Qualifier("member")
	public MemService ms;
	
	int result;  //int 결과값을 위한 변수

	HttpSession session; // session값을 위한 변수

//――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― 비인증
	@PostMapping("/joinMember") 
	public ModelAndView joinMember(ModelAndView mv, MemberVO mvo,MultipartFile m_upimage) {
		//servlet 3.0 이상부터는 commons-file-upload 라이브러리를 사용하지 않아도 된다.
		//file type은 vo에 자동으로 바인딩되지 않는다.
		//따로 받아서 세팅시켜주는 코드 추가
		//파일이 여러개일 때는 매개변수를 배열로 만들어주고 for를 활용한다.
		mvo.setM_upimage(m_upimage);
		
		//파일 저장
		//1. c:에 upload 폴더를 생성한다.
		//2. 주소 저장
		String uploadFolder = "C:\\upload";
		//3. multipartFile타입으로 해당 파일을 저장한다.
		MultipartFile upfile = mvo.getM_upimage();
		//4.File타입 변수를 만들어 생성자로(경로,파일명)을 해서 file타입의 객체에 해당 경로의 파일을 넣어준다.
		File saveFile = new File(uploadFolder, upfile.getOriginalFilename());
		//예외처리
		try {
			upfile.transferTo(saveFile);
		}catch(Exception e) {
			log.error(e.getMessage());
		}//end try
		
		//5.DB에 저장할 경로를 세팅해준다.
		//상대주소
		mvo.setM_adrimage("resources/upload/"+upfile.getOriginalFilename());
		
		log.info("mvo = "+mvo);
		log.info("upfile : "+upfile);
		
		if (ms.joinMember(mvo)) {
			mv.setViewName("redirect:/");
			mv.addObject("msg","회원가입 성공");
		} else {
			mv.setViewName("result");
			mv.addObject("msg","회원가입 실패");
		}
		
		
		return mv;
	}

//――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― 인증/로그인상태/
	@RequestMapping("/showDetailMember")
	public ModelAndView showDetailMember(ModelAndView mv, MemberVO mvo,HttpServletRequest request) {

		mvo.setM_id((String)request.getAttribute("USERID"));

		mvo = ms.showDetailMember(mvo);

		if (mvo != null) { 
			mv.setViewName("member/detailInfo");
			mv.addObject("mvo",mvo);
		} else {
			mv.setViewName("result");
			mv.addObject("msg","회원상세정보 보기 실패");
		}

		return mv;
	}
//――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――	인증/로그인상태
	@RequestMapping("/deleteMember")
	public ModelAndView deleteMember(ModelAndView mv, MemberVO mvo,HttpServletRequest request) {
		
		if (ms.deleteMember(mvo)) {
			mv.setViewName("result");
			mv.addObject("msg","회원탈퇴 성공");
		} else {
			mv.setViewName("result");
			mv.addObject("msg","회원탈퇴 실패");
		}

		return mv;
	}
	
//――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――	인증/로그인상태
		@RequestMapping("/updateMember") 
		public ModelAndView updateMember(ModelAndView mv, MemberVO mvo) {
			
			log.info("정보수정시작 :"+mvo);

			if ( ms.updateMember(mvo)) {
				mv.setViewName("result");
				mv.addObject("msg","회원정보수정 성공");
			} else {
				mv.setViewName("result");
				mv.addObject("msg","회원정보수정 실패");
			}

			return mv;
		}
		
//――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――	M6/아이디중복체크/한규원
		@RequestMapping("idcheck")
		public ModelAndView idCheck(ModelAndView mv, MemberVO mvo) { 

			mvo = ms.showDetailMember(mvo);
		      
		      if(mvo != null) { //이미 있는 사용 불가능한 id
		         mv.addObject("idCheck", "UA");
		      } else { //존재하지 않는 id = 사용 가능
		         mv.addObject("idCheck", "A");
		      }
		      
		      // 결과 출력
		      mv.addObject("m_id", mvo.getM_id());
		      mv.setViewName("member/idCheck");
		      return mv;
		   } 
		
}
