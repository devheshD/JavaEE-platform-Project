package com.sist.model;

import java.util.Map;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sist.controller.RequestMapping;
import com.sist.dao.*;

import com.sist.vo.*;
//
public class AccModel {

	@RequestMapping("acc/accDetail.do")
	public String acc_detail(HttpServletRequest request, HttpServletResponse response) {

		HttpSession session = request.getSession();
		String product_id = request.getParameter("product_id");
		String id = (String) session.getAttribute("id");

		AccVO vo = AccDAO.accDetailData(product_id);

		// 장바구니
		Acc_cartVO avo = new Acc_cartVO();
		avo.setId(id);
		avo.setProduct_id(product_id);

		int count = AccDAO.accOkCount(avo);
		request.setAttribute("count", count);
		// 장바구니 end

		// 최근 본 목록 쿠키 추가
		if (id == null) {
			id = "NOID";
		}

		Cookie[] cookies = request.getCookies();
		for (int i = 0; i < cookies.length; i++) {
			if (cookies[i].getName().equals(id + product_id)) {
				cookies[i].setMaxAge(0);
				response.addCookie(cookies[i]);
				break;
			}
		}

		Cookie cookie = new Cookie(id + product_id, product_id);
		cookie.setMaxAge(60 * 60 * 24);
		response.addCookie(cookie);
		// end

		List<AccVO> list = new ArrayList<AccVO>();

		request.setAttribute("list", list);

		request.setAttribute("vo", vo);
		request.setAttribute("acc_jsp", "../acc/accDetail.jsp");

		return "../acc/accDetail.jsp";
	}

	@RequestMapping("acc/acc.do")
	public String acc_list(HttpServletRequest request) {

		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");

		Cookie[] cookies = request.getCookies();

		List<AccVO> cookieList1 = new ArrayList<AccVO>();

		if (id == null) {
			id = "NOID";
		}

		for (int i = 0; i < cookies.length; i++) {
			if (cookies[i].getName().startsWith(id)) {
				String value = cookies[i].getValue();

				AccVO avo = AccDAO.accDetailData(value);
				cookieList1.add(avo);
			}
		}

		List<AccVO> cookieList = new ArrayList<AccVO>();
		for (int i = cookieList1.size() - 1; i >= 0; i--) {
			AccVO v = cookieList1.get(i);
			cookieList.add(v);
		}
		
		request.setAttribute("cookieList", cookieList);

		String[] cateList = { "전체", "시트", "거치대", "가리개", "방향제", "목쿠션", "핸들커버", "먼지털이" };
		String strPage = request.getParameter("page");
		String no = request.getParameter("no");
		if (strPage == null)
			strPage = "1";
		if (no == null)
			no = "0";

		int curpage = Integer.parseInt(strPage);
		int rowSize = 9;
		int start = (curpage * rowSize) - (rowSize - 1);
		int end = (curpage * rowSize);
		Map map = new HashMap();
		map.put("start", start);
		map.put("end", end);
		map.put("cate", cateList[Integer.parseInt(no)]);
		List<AccVO> alist = AccDAO.accListData(map);
		int totalpage = AccDAO.accTotalPage(map);

		final int BLOCK = 5;
		int allPage = totalpage;
		int startPage = ((curpage - 1) / BLOCK * BLOCK) + 1;
		/*
		 * curpage : 1~5 ==> BLOCK 1 (6-1)/5*5 => 5+1 => 6
		 * 
		 * 현재 페이지 ==> 1~5 : 1 ==> 6~10 : 6 ==> 11~15 : 11
		 */
		int endPage = ((curpage - 1) / BLOCK * BLOCK) + BLOCK;
		if (endPage > allPage)
			endPage = allPage;
		request.setAttribute("no", no);
		request.setAttribute("alist", alist);
		request.setAttribute("curpage", curpage);
		request.setAttribute("totalpage", totalpage);
		request.setAttribute("BLOCK", BLOCK);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("allPage", allPage);

		request.setAttribute("accList_jsp", "acc_list.jsp");

		return "../acc/acc.jsp";
	}

	@RequestMapping("acc/acc_search.do")
	public String acc_search(HttpServletRequest request) {
		try {
			// 한글 변환
			request.setCharacterEncoding("UTF-8");
			// 컴파일 예외처리 => 반드시 컴파일 전에 예외처리를 한다
		} catch (Exception ex) {
		}

		String keyword = request.getParameter("keyword");

		List<AccVO> list = AccDAO.accSearchData(keyword);

		

		request.setAttribute("alist", list);

		return "acc_list.jsp";
	}

	// cart Insert
	@RequestMapping("acc/acc_insert.do")
	public String acc_insert(HttpServletRequest request) {
		String product_id = request.getParameter("product_id");
		// Insert
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");

		Acc_cartVO vo = new Acc_cartVO();
		vo.setId(id);
		vo.setProduct_id(product_id);

		AccDAO.accInsert(vo);
		return "redirect:../mypage/mypage_accCart.do";
	}

	@RequestMapping("acc/acc_buy.do")
	public String acc_buy(HttpServletRequest request) {

		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		String product_id = request.getParameter("product_id");
		String quantity = request.getParameter("amount");
		// Insert

		

		Acc_payVO vo = new Acc_payVO();
		vo.setId(id);
		vo.setProduct_id(product_id);
		vo.setQuantity(Integer.parseInt(quantity));

		AccDAO.acc_buy(vo);

		return "redirect:../mypage/mypage_acc.do";
	}

}
