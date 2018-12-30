package com.example.controller.web.api;

import java.io.IOException;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.example.model.NewUserModel;
import com.example.service.INewService;
import com.example.utils.HttpUtil;
import com.example.utils.SessionUtil;
import com.fasterxml.jackson.databind.ObjectMapper;

@WebServlet(urlPatterns = {"/api-admin-new-comment"})
public class CommentAPI extends HttpServlet {
	
	private static final long serialVersionUID = 974167050037031839L;
	
	@Inject
	private INewService newService;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			request.setCharacterEncoding("UTF-8");
	        response.setContentType("application/json");
	        ObjectMapper mapper = new ObjectMapper();
	        NewUserModel model = HttpUtil.of(request.getReader()).toDto(NewUserModel.class);
	        model.setUserId((Long) SessionUtil.getInstance().getValue(request, "ID"));
	        newService.saveComment(model);
	        mapper.writeValue(response.getOutputStream(), "{}");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
