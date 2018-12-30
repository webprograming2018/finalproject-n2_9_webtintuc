package com.example.controller.web;

import java.io.IOException;

import javax.inject.Inject;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.example.model.NewModel;
import com.example.model.UserModel;
import com.example.service.ICategoryService;
import com.example.service.INewService;
import com.example.service.IUserService;
import com.example.utils.FormUtil;
import com.example.utils.SessionUtil;

@WebServlet(urlPatterns = {"/trang-chu", "/dang-nhap", "/thoat","/bai-viet-moi"})
public class HomeController extends HttpServlet {
	
	@Inject
	private IUserService userService;
	
	@Inject
	private ICategoryService categoryService;
	
	@Inject
	private INewService newService;
	
	private static final long serialVersionUID = 1L;
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String path = request.getServletPath();
			if (path.equals("/trang-chu")) {
				request.setAttribute("hotnew", newService.getHotNew());
				request.setAttribute("slide", newService.getSlides());
				request.setAttribute("categories", categoryService.findAll());
				RequestDispatcher rd = request.getRequestDispatcher("/views/web/home.jsp");
				rd.forward(request, response);
			} else if (path.equals("/dang-nhap")) {
				RequestDispatcher rd = request.getRequestDispatcher("/views/web/login.jsp");
				rd.forward(request, response);
			} else if (path.equals("/thoat")) {
				SessionUtil.getInstance().remove(request, "ROLE");
				SessionUtil.getInstance().remove(request, "USERNAME");
				SessionUtil.getInstance().remove(request, "ID");
				response.sendRedirect(request.getContextPath()+"/trang-chu");
			} else if (path.equals("/bai-viet-moi")) {
				NewModel model = newService.findNewLatest();
				response.sendRedirect(request.getContextPath()+"/chi-tiet-bai-viet?id="+model.getId());
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String path = request.getServletPath();
			if (path.equals("/dang-nhap")) {
				UserModel userModel = FormUtil.populate(UserModel.class, request);
				userModel = userService.findByUserNameAndPassword(userModel.getUserName(), userModel.getPassword());
				if (userModel != null) {
					SessionUtil.getInstance().putValue(request, "ROLE", userModel.getRoleCode());
					SessionUtil.getInstance().putValue(request, "USERNAME", userModel.getUserName());
					SessionUtil.getInstance().putValue(request, "ID", userModel.getId());
					if (userModel.getRoleCode().equals("ADMIN")) {
						response.sendRedirect(request.getContextPath()+"/admin-home");
					} else if (userModel.getRoleCode().equals("USER")) {
						response.sendRedirect(request.getContextPath()+"/trang-chu");
					}
				} else {
					response.sendRedirect(request.getContextPath()+"/dang-nhap");
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			response.sendRedirect(request.getContextPath()+"/dang-nhap");
		}
	}

}
