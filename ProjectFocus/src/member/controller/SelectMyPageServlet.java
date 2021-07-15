package member.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import goods.model.service.GoodsService;
import goods.model.vo.GoodsBag;
import member.model.service.MemberService;
import member.model.vo.Member;
import service.model.service.ServiceService;
import service.model.vo.Reserve;
import service.model.vo.Service;

/**
 * Servlet implementation class SelectMyPageServlet
 */
@WebServlet("/myPageSelect.me")
public class SelectMyPageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectMyPageServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Member loginUser = (Member)request.getSession().getAttribute("loginUser");
		
//		Member m = new MemberService().selectMember(loginUser);
		int mNo = ((Member)request.getSession().getAttribute("loginUser")).getmNo();
		
		String mNick = ((Member)request.getSession().getAttribute("loginUser")).getmNick();
		Service s = new ServiceService().selectServiceDetail(mNo);
		Reserve r = new ServiceService().selectReserveDetail(mNo);
		
		ArrayList<GoodsBag> bagList = new GoodsService().selectGoodsPay(mNo);
		
		
//		if(loginUser != null) {
//			request.getSession().setAttribute("loginUser", loginUser);
//			
//			request.setAttribute("m", m);
//			request.setAttribute("bagList", bagList);
//			request.getRequestDispatcher("WEB-INF/views/member/1_myPage.jsp").forward(request, response);
//		} else {
//			// 
//		}
		
		if (s == null && r == null) {
			request.getSession().setAttribute("loginUser", loginUser);
			
//			request.setAttribute("m", m);
			request.setAttribute("bagList", bagList);
			request.getRequestDispatcher("WEB-INF/views/member/1_myPage.jsp").forward(request, response);
		} else if (s.getmNick().equals(mNick)) {
			request.getSession().setAttribute("loginUser", loginUser);
			
//			request.setAttribute("m", m);
			request.setAttribute("bagList", bagList);
			request.setAttribute("s", s);
			request.getRequestDispatcher("WEB-INF/views/member/1_myPage.jsp").forward(request, response);
		} else if (r.getrUserNo() == mNo) {
			request.getSession().setAttribute("loginUser", loginUser);
			
//			request.setAttribute("m", m);
			request.setAttribute("bagList", bagList);
			request.setAttribute("r", r);
			request.getRequestDispatcher("WEB-INF/views/member/1_myPage.jsp").forward(request, response);
		} else {
			// 실패
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
