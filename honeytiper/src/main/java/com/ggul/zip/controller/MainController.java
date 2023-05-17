package com.ggul.zip.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ggul.zip.lesson.LessonVO;
import com.ggul.zip.main.MainService;
import com.ggul.zip.search.SearchService;
import com.ggul.zip.user.UserVO;
import com.google.gson.Gson;

@Controller
public class MainController {
   
   @Autowired
   private SearchService searchService;
   
   @Autowired
   private MainService mainService;
   
   
   @RequestMapping(value = { "/", "/index"}, method = RequestMethod.GET)
   public String home(LessonVO vo, Model model, HttpSession session, UserVO uvo) {
      String user_id = session.getAttribute("user_id") != null ? session.getAttribute("user_id").toString() : "";
      vo.setUser_id(user_id);
      
      model.addAttribute("mainRecm", mainService.getMainRecm(vo));
      model.addAttribute("mainRecm2", mainService.getMainRecm2(vo));
      model.addAttribute("mainPop", mainService.getMainPop(vo));
      model.addAttribute("mainNew", mainService.getMainNew(vo));
      model.addAttribute("mainNew2", mainService.getMainNew2(vo));
      return "index";
   }
   
   @RequestMapping(value="/cateSearch", method = RequestMethod.GET)
   public String getSearchCate(LessonVO vo, Model model) {
      model.addAttribute("searchAll", searchService.getSearchCate(vo));
      String reportListJSON = new Gson().toJson(searchService.getSearchCate(vo));
      model.addAttribute("searchAllJSON", reportListJSON);
      return "search/searchAll";
   }
   
   @RequestMapping(value="/allSearch", method = RequestMethod.GET)
   public String getSearchAll(LessonVO vo, Model model) {
      model.addAttribute("searchAll", searchService.getSearchAll(vo));
      String reportListJSON = new Gson().toJson(searchService.getSearchAll(vo));
      model.addAttribute("searchAllJSON", reportListJSON);
      return "search/searchAll";
   }
   
   @ResponseBody
   @RequestMapping(value= "/selectPartSearch", method = RequestMethod.POST)
   public List<LessonVO> getSearch(LessonVO vo){
      return searchService.getPartSearchList(vo);
   }
   
   @RequestMapping(value= "/selectSearch", method = RequestMethod.POST)
   public String getSearchList(LessonVO vo, Model model){
      model.addAttribute("searchAll", searchService.getSearchList(vo));
      String reportListJSON = new Gson().toJson(searchService.getSearchList(vo));
      model.addAttribute("searchAllJSON", reportListJSON);
      return "search/searchAll";
   }
}