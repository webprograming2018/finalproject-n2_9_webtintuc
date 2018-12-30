package com.example.controller.admin;

import java.io.IOException;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;

import com.example.constant.SystemConstant;
import com.example.model.NewModel;
import com.example.service.ICategoryService;
import com.example.service.INewService;
import com.example.utils.FormUtil;
import com.example.utils.MessageResponseUtil;

@WebServlet(urlPatterns = {"/admin-new-list","/admin-new-edit"})
public class NewController extends HttpServlet {
	
	@Inject
	private INewService newService;
	
	@Inject
	private ICategoryService categoryService;
	
	private static final long serialVersionUID = 990588436918148002L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		NewModel model = FormUtil.populate(NewModel.class, request);
		try {
			String path = request.getServletPath();
			String view = "";
			if (path.equals("/admin-new-list")) {
				model.setListResult(newService.findAll());
				view = "/views/admin/new/list.jsp";
			} else if (path.equals("/admin-new-edit")) {
				if (model.getId() != null) {
					model = newService.findById(model.getId());
				}
				request.setAttribute("categories", categoryService.findAll());
				view = "/views/admin/new/edit.jsp";
			}
			initMessageResponse(request);
			request.setAttribute("model", model);
			RequestDispatcher rd = request.getRequestDispatcher(view);
			rd.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}
	
	private void initMessageResponse(HttpServletRequest request) {
        String message = request.getParameter("message");
        if (StringUtils.isNotBlank(message)) {
            Map<String, String> messageResponse = MessageResponseUtil.getMessage(message);
            request.setAttribute(SystemConstant.ALERT, messageResponse.get(SystemConstant.ALERT));
            request.setAttribute(SystemConstant.MESSAGE_RESPONSE, messageResponse.get(SystemConstant.MESSAGE_RESPONSE));
        }
    }
}
