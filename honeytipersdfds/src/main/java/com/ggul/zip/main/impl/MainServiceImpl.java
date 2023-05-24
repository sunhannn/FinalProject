package com.ggul.zip.main.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ggul.zip.lesson.LessonVO;
import com.ggul.zip.main.MainService;

@Service("mainService")
public class MainServiceImpl implements MainService {

   @Autowired
   private MainDAO mainDAO;
   
   public List<LessonVO> getMainRecm(LessonVO vo){
      return mainDAO.getMainRecm(vo);
   }
   
   public List<LessonVO> getMainRecm2(LessonVO vo){
      return mainDAO.getMainRecm2(vo);
   }
   
   public List<LessonVO> getMainPop(LessonVO vo){
      return mainDAO.getMainPop(vo);
   }
   
   public List<LessonVO> getMainNew(LessonVO vo){
      return mainDAO.getMainNew(vo);
   }
   
   public List<LessonVO> getMainNew2(LessonVO vo){
      return mainDAO.getMainNew2(vo);
   }
   
}