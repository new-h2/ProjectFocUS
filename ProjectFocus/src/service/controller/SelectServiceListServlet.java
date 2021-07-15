package service.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.model.vo.Board;
import board.model.vo.Image;
import common.PageInfo;
import like.model.service.LikeService;
import like.model.vo.Likey;
import member.model.vo.Member;
import service.model.service.ServiceService;
import service.model.vo.Service;


/**
 * Servlet implementation class SelectServiceListServlet
 */
@WebServlet("/selectServiceList.bo")
public class SelectServiceListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectServiceListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		request.getRequestDispatcher("WEB-INF/views/service/3_service.jsp").forward(request, response);
//		// 여기서 null java.lang.NumberFormatException: null 반환중
//		
//		
//		ServiceService ss = new ServiceService();
//		
		ServiceService service = new ServiceService();
		
		int listCount;		// 게시물의 총 개수
		int currentPage;	// 현재 페이지
		int pageLimit;		// 한 페이지에 표시될 페이지 수
		int boardLimit;		// 한 페이지에 보일 게시글 최대 개수
		int maxPage;		// 전체 페이지 중 가장 마지막 페이지
		int startPage;		// 페이징이 된 페이지 중 시작 페이지
		int endPage;		// 페이징이 된 페이지 중 끝 페이지
		
		int mNo = ((Member)request.getSession().getAttribute("loginUser")).getmNo();

		ServiceService pService = new ServiceService();
		listCount = pService.getListCount();
		
		currentPage = 1;
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		pageLimit = 10;
		boardLimit = 10;
		
		maxPage = (int)Math.ceil((double)listCount / boardLimit);
		
		startPage = ((currentPage - 1)/pageLimit) * pageLimit + 1;
		
		endPage = startPage + pageLimit - 1;
		if(endPage > maxPage) {
			endPage = maxPage;
		}

		String page = null;
		
	
//		// 뿌려질것들 여기에 다 적어주고.. 
		
		PageInfo pi = new PageInfo(currentPage, listCount, pageLimit, boardLimit, maxPage, startPage, endPage);
	
		
		ArrayList<Board> bList = service.selectTList(1); // 게시판 리스트 가져오기
		ArrayList<Image> iList = service.selectTList(2);	// 이미지 리스트 가져오기 
		ArrayList<Service> sList = service.selectTList(3); // 서비스 리스트 가져오기 b_type 3
		ArrayList<Likey> lList = new LikeService().selectLikeList(mNo);
		
		if(bList != null && iList != null && sList != null) {
			request.setAttribute("bList", bList);
			request.setAttribute("iList", iList);
			request.setAttribute("sList", sList); 
			request.setAttribute("lList", lList);
			request.setAttribute("pi", pi);
			
			page = "WEB-INF/views/service/3_service.jsp";
			
//			request.getRequestDispatcher("WEB-INF/views/service/3_service.jsp").forward(request, response);
		} else {
//			request.getRequestDispatcher("WEB-INF/views/common/mainPage.jsp").forward(request, response);
			request.setAttribute("msg", "사진 게시판 조회에 실패하였습니다.");
			page = "WEB-INF/views/common/main.jsp";
		}
		
		request.getRequestDispatcher(page).forward(request, response);
	}
		
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}


