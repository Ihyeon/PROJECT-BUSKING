package com.busking.board.controller;

import java.io.IOException;

import com.busking.board.service.BoardCustomerService;
import com.busking.board.service.BoardCustomerServiceImpl;
import com.busking.board.service.BoardServiceFree;
import com.busking.board.service.BoardServiceNews;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("*.customer_board")
public class BoardCustomerController extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doAction(req, resp);
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doAction(req, resp);
	}

	protected void doAction(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// 요청을 분기
		request.setCharacterEncoding("utf-8");

		String uri = request.getRequestURI(); // ip, port번호 제외된 주소
		String path = request.getContextPath(); // 프로젝트 식별 주소
		String command = uri.substring(path.length());

		System.out.println("요청됨 " + command); // 요청 되는지 보기

		//BoardService 선언해두기
		BoardCustomerService service;
		
		
		if (command.equals("/customer_center/customer_center_index.customer_board")) {
			service = new BoardCustomerServiceImpl();
			service.regist(request, response);
			
			System.out.println("등록기능 요청");
			//request.getRequestDispatcher("board_write.jsp").forward(request, response);

		} else if(command.equals("/customer_center/customer_center_index.customer_board")) {
			
			service = new BoardCustomerServiceImpl();
            service.getList(request, response);
			System.out.println("공지사항 요청");
			
		} else if(command.equals("/customer_center/customer_notice_list.customer_board")) {
			//누르면 데이터가 필요하면 서비스
			//아니면 리다이렉트
			
			service = new BoardCustomerServiceImpl();
			service.getList(request, response);
			
		}
	}
}
