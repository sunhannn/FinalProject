package com.ggul.zip.main.impl;

import java.util.List;


import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ggul.zip.lesson.LessonVO;

@Repository
public class MainDAO {

   @Autowired
   private SqlSessionTemplate mybatis;
   
   public List<LessonVO> getMainRecm(LessonVO vo){
      return mybatis.selectList("MainDAO.getMainRecm", vo);
   }
   
   public List<LessonVO> getMainRecm2(LessonVO vo){
      return mybatis.selectList("MainDAO.getMainRecm2", vo);
   }
   
   public List<LessonVO> getMainPop(LessonVO vo){
      return mybatis.selectList("MainDAO.getMainPop", vo);
   }
   
   public List<LessonVO> getMainNew(LessonVO vo){
      return mybatis.selectList("MainDAO.getMainNew", vo);
   }
   
   public List<LessonVO> getMainNew2(LessonVO vo){
      return mybatis.selectList("MainDAO.getMainNew2", vo);
   }
}