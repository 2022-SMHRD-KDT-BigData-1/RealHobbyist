package com.message.service;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.message.model.AcademyDTO;
import com.message.model.AddrDTO;
import com.message.model.MemberDTO;
import com.message.model.RecommendDAO;
import com.message.model.RecommendDTO;
import com.message.model.ReviewDAO;
import com.message.model.ReviewDTO;
import com.message.model.WishlistDAO;
import com.message.model.WishlistDTO;

@WebServlet("/RecommendSelectCon")
public class RecommendSelectCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		if(session.getAttribute("recommend") != null) {
			session.removeAttribute("recommend");
			session.removeAttribute("count");
			session.removeAttribute("avgScore");
			session.removeAttribute("wish");
			session.removeAttribute("Review");
		}
		
		
		request.setCharacterEncoding("utf-8");
//		String a_L_category = request.getParameter("a_L_category1"); 
//		String dong = request.getParameter("dong"); 
		String a_m_category = request.getParameter("a_m_category1"); 
		String a_city = request.getParameter("city"); 
		MemberDTO member = (MemberDTO) session.getAttribute("member");
		
		
		
//		AcademyDTO Recommend = new AcademyDTO(null,null,null,a_L_category, a_m_category, null, a_city);
		AddrDTO Recommend = new AddrDTO(null, null, null, a_city, null, null, a_m_category, null, null, null,null,null);
		RecommendDAO dao = new RecommendDAO();
		ReviewDAO dao2 = new ReviewDAO();
		WishlistDAO dao3 = new WishlistDAO();
		
		
		
//		ArrayList<AcademyDTO> recommend =  dao.recSelect(Recommend);
		ArrayList<AddrDTO> recommend = dao.recSelect(Recommend);
		ArrayList<ReviewDTO> Review = dao2.reviewSelect(recommend);
		ArrayList<Double> avgScore = dao2.avgScore(recommend);
		if(session.getAttribute("member") != null) {
			String email = member.getM_email();
			ArrayList<WishlistDTO> wish = dao3.recoWishSelect(recommend, email);
			System.out.println(wish.size() + "위시 어레이리스트 생성 완료");
			session.setAttribute("wish", wish);
			System.out.println(session.getAttribute("wish") + "위시 세션 생성 완료");
		}
		
		int count = 0;
		count = dao.getCount(Recommend);  
		session.setAttribute("recommend", recommend);
		session.setAttribute("count", count);
		session.setAttribute("Review", Review);
		session.setAttribute("avgScore", avgScore);
		
		response.sendRedirect("Recommend.jsp");
		
		
		
		
		
		
		
		
		
		
		
		
	}

}
