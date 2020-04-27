package com.hz.controller;
import com.hz.bean.Kind;
import com.hz.bean.Topic;
import com.hz.bean.User;
import com.hz.service.impl.userServiceImpl;
import com.hz.service.kindService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;

@Controller
public class userController<response> {
    @Autowired
    private userServiceImpl userImpl;
    @Autowired
    private kindService kindservice;

    @RequestMapping("/toRegister")
    public ModelAndView toLogin(HttpServletRequest request, HttpServletResponse response){

        return new ModelAndView("register");
    }
    @RequestMapping( value = "/toCreate",method = RequestMethod.POST)
    public ModelAndView toCreate(@RequestParam("picture") MultipartFile picture, HttpServletRequest request, HttpServletResponse response){

        String userPicture = picture.getContentType();//获取文件的类型

        String fileName=picture.getOriginalFilename();//获取原文件名

        if(!picture.isEmpty()){
            try {
                FileOutputStream outputStream= new FileOutputStream("C:/Users/guo/IdeaProjects/puke/src/main/webapp/img/"+fileName);
                    outputStream.write(picture.getBytes());
                    outputStream.flush();
                    outputStream.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        User user= new User();
        user.setUserName(request.getParameter("userName"));
        user.setPassword(request.getParameter("password"));
        user.setTelephone(request.getParameter("telephone"));
        user.setSex(request.getParameter("sex"));
        user.setBirthday(request.getParameter("birthday"));
        user.setPicture("/img/"+fileName);
        int cre = userImpl.create(user);
        if(cre>0){
        return new ModelAndView("redirect:/");
        } else {
            return new ModelAndView("redirect:/toRegister");
        }
    }

    @RequestMapping("/login")
    public ModelAndView loginTo(HttpServletRequest request, HttpSession session){
        User user = new User();
        user.setUserName(request.getParameter("userName"));
        user.setPassword(request.getParameter("password"));
        if(user.getUserName()==null||user.getUserName()==""){
            session.setAttribute("fault","请输入用户名");
            return new ModelAndView("redirect:/");
        }else if(user.getPassword()==null||user.getPassword()==""){
            session.setAttribute("pass","请输入密码");
            return new ModelAndView("redirect:/");
        }else{
        int usi=userImpl.login(user);
         if (usi>0){
             session.setAttribute("userName",user.getUserName());
             User user1 = userImpl.quarryUserIdByName(user);
             session.setAttribute("userId",user1.getId());
             session.setAttribute("picture",user1.getPicture());
             session.setAttribute("fault","");
             session.setAttribute("pass","");
             session.setAttribute("toLogin","");
             return new ModelAndView("redirect:/");
         }else
       return new ModelAndView("main");
        }
    }

    @RequestMapping(value = "/toUpdate",method = RequestMethod.POST)
    public ModelAndView toUpdate(@RequestParam("picture") MultipartFile picture,HttpServletRequest request,HttpSession session){
        String userPicture = picture.getContentType();//获取文件的类型

        String fileName=picture.getOriginalFilename();//获取原文件名

        if(!picture.isEmpty()){
            try {
                FileOutputStream outputStream= new FileOutputStream("C:/Users/guo/IdeaProjects/puke/src/main/webapp/img/"+fileName);
                outputStream.write(picture.getBytes());
                outputStream.flush();
                outputStream.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        User user= new User();
        user.setId((Integer)session.getAttribute("userId"));
        System.out.println(request.getParameter("userName"));
        user.setUserName(request.getParameter("userName"));
        user.setPassword(request.getParameter("password"));
        user.setTelephone(request.getParameter("telephone"));
        user.setSex(request.getParameter("sex"));
        user.setBirthday(request.getParameter("birthday"));
        user.setPicture(request.getParameter("/img/"+fileName));
        int cre = userImpl.updateUserById(user);
        if(cre>0){
            session.setAttribute("sorry","用户信息修改成功");
            return new ModelAndView("redirect:/toUserHome");
        } else {
            session.setAttribute("sorry","用户信息修改失败");
            return new ModelAndView("redirect:/toUserHome");
        }
    }
    @RequestMapping("/toExit")
    public ModelAndView toExit(HttpSession session,HttpServletRequest request){
        ModelAndView val= new ModelAndView("redirect:/");
        session.setAttribute("userName","");
        session.setAttribute("userId","");
        session.setAttribute("picture","");
        return val;
    }

    @RequestMapping("/reMain")
    public ModelAndView reMain(HttpSession session,HttpServletRequest request){
        return new ModelAndView("redirect:/");
    }

}
