package com.example.controller.web;

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
import com.example.service.INewService;
import com.example.utils.FormUtil;
import com.example.utils.MessageResponseUtil;
import com.example.utils.SessionUtil;

@WebServlet(urlPatterns = {"/danh-sach-bai-viet-yeu-thich","/chi-tiet-bai-viet"})
public class NewController extends HttpServlet {
	
	@Inject
	private INewService newService;
	
	private static final long serialVersionUID = 990588436918148002L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			NewModel model = FormUtil.populate(NewModel.class, request);
			String path = request.getServletPath();
			String view = "";
			if (path.equals("/chi-tiet-bai-viet")) {
				request.setAttribute("comments", newService.findCommentByNew(model.getId()));
				request.setAttribute("model", newService.findById(model.getId()));
				view = "/views/web/new/detail.jsp";
			} else if (path.equals("/danh-sach-bai-viet-yeu-thich")) {
				Long userId = (Long) SessionUtil.getInstance().getValue(request, "ID");
				request.setAttribute("favorites", newService.findFavoriteByUser(userId));
				view = "/views/web/new/favorite.jsp";
			}
			initMessageResponse(request);
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
