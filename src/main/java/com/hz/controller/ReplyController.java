package com.hz.controller;

import com.hz.bean.Reply;
import com.hz.bean.User;
import com.hz.service.ReplyService;
import com.hz.service.impl.userServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;
@Controller
public class ReplyController {
    @Autowired
    private ReplyService replyService;

    @Autowired
    private userServiceImpl userImpl;

    @RequestMapping("/reply/{id}")
    public ModelAndView reply(@PathVariable("id")Integer id, HttpServletRequest request, HttpSession session) {
        Reply reply = new Reply();
        if (session.getAttribute("userId") != null && session.getAttribute("userId") != "") {
            reply.setTopicId(id);
            reply.setReplyContent(request.getParameter("reply_content"));
            reply.setReplyUserId((Integer) session.getAttribute("userId"));
            replyService.createReply(reply);
            User user = userImpl.selectUserById(reply.getReplyUserId());
            session.setAttribute("userName", user.getUserName());
            return new ModelAndView("redirect:/toViewContent/" + id);
        }else{
            session.setAttribute("toLogin","请先登录");
            return new ModelAndView("redirect:/");
        }
    }
}
