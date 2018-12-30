package com.example.controller.admin.api;

import java.io.IOException;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.example.model.NewModel;
import com.example.service.INewService;
import com.example.utils.HttpUtil;
import com.fasterxml.jackson.databind.ObjectMapper;

@WebServlet(urlPatterns = {"/api-admin-new","/api-admin-new-slide","/api-admin-new-hotnew"})
public class NewAPI extends HttpServlet {
	
	private static final long serialVersionUID = 6868176199031972373L;
	
	@Inject
	private INewService newService;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			request.setCharacterEncoding("UTF-8");
	        response.setContentType("application/json");
	        ObjectMapper mapper = new ObjectMapper();
	        NewModel model = HttpUtil.of(request.getReader()).toDto(NewModel.class);
	        String path = request.getServletPath();
	        if (path.equals("/api-admin-new")) {
	        	if (model.getId() != null) {
		        	newService.update(model);
		            mapper.writeValue(response.getOutputStream(), "{}");
		        } else {
		            model = newService.save(model);
		            mapper.writeValue(response.getOutputStream(), model);
		        }
	        } else if (path.equals("/api-admin-new-slide")) {
	        	newService.updateSlide(model.getNewIds());
	        	mapper.writeValue(response.getOutputStream(), "{}");
	        } else if (path.equals("/api-admin-new-hotnew")) {
	        	newService.updateHotNew(model.getNewIds());
	        	mapper.writeValue(response.getOutputStream(), "{}");
	        }
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
