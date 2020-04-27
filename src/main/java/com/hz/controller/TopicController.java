package com.hz.controller;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.hz.bean.Kind;
import com.hz.bean.Reply;
import com.hz.bean.Topic;
import com.hz.bean.User;
import com.hz.service.ReplyService;
import com.hz.service.TopicService;
import com.hz.service.impl.userServiceImpl;
import com.hz.service.kindService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class TopicController {
    @Autowired
    private TopicService topicService;
    @Autowired
    private userServiceImpl userImpl;
    @Autowired
    private kindService kindservice;
    @Autowired
    private ReplyService replyService;

    @RequestMapping("/")
    public ModelAndView toLogin(@RequestParam(required = true, defaultValue = "1") Integer leaf, HttpServletRequest request , HttpSession session){
        ModelAndView val= new ModelAndView("main");
        //page.setTotal(topicService.selectAllTopic());
        PageHelper.startPage(leaf,5);
        List<Topic> topics = topicService.quarrySelectAll();
        PageInfo<Topic> page = new PageInfo<Topic>(topics, 5);
        List<Kind> allTop = kindservice.listKind();
        val.addObject("topics",topics);
        val.addObject( "allTop",allTop);
        val.addObject("page",page);
        return val;
    }

    @RequestMapping("/topicKindView")
    public ModelAndView topicKindView(HttpServletRequest request){
        ModelAndView val= new ModelAndView("topic");
        Topic topic = new Topic();
        int scr= Integer.parseInt(request.getParameter("id"));
        System.out.println("当前登录页面的id是"+scr);
        topic.setKindId(scr);
        List<Topic> topics = topicService.quarrySelectAllByKindId(topic);
        List<Kind> allTop = kindservice.listKind();
        val.addObject("topics",topics);
        val.addObject( "allTop",allTop);
        return val;
    }
    /*个人主页面*/
    @RequestMapping("/toUserHome")
    public ModelAndView toUserHome(HttpServletRequest request, HttpSession session){
        ModelAndView val=new ModelAndView("userMain");
        List<Topic> topics = topicService.quarrySelectAllByUserId((Integer) session.getAttribute("userId"));
        List<Kind> allTop = kindservice.listKind();
        val.addObject( "allTop",allTop);
        val.addObject( "topics",topics);
        return val;
    }
    //看帖
    @RequestMapping("/toViewContent/{id}")
    public ModelAndView toViewContent(@PathVariable("id")Integer id,HttpServletRequest request, HttpSession session){
        ModelAndView val=new ModelAndView("content");
        Topic topic = topicService.quarryTopicById(id);
        User user = userImpl.selectUserById(topic.getUserId());
        List<Kind> allTop = kindservice.listKind();
        List<Reply> replies= replyService.selectAllByTopicId(id);
        val.addObject( "allTop",allTop);
        val.addObject("user",user);
        val.addObject("topic",topic);
        val.addObject("replies",replies);
        return val;
    }

    @RequestMapping("/createTitle")
    public ModelAndView createTitle(HttpServletRequest request, HttpSession session){
        Topic topic = new Topic();
        System.out.println(request.getParameter("kind"));
        int id=Integer.parseInt(request.getParameter("kind"));
        topic.setKindId(id);
        topic.setUserId((Integer)session.getAttribute("userId"));
        topic.setTitle(request.getParameter("title"));
        topic.setContent(request.getParameter("content"));
         int num=topicService.createTitle(topic);
         if(num>0){
             return new ModelAndView("redirect:/toUserHome");
         }else{
             session.setAttribute("out","发表失败");
             return new ModelAndView("redirect:/toUserHome");
         }

    }
}
