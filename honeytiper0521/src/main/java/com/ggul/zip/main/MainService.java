package com.ggul.zip.main;

import java.util.List;

import com.ggul.zip.lesson.LessonVO;

public interface MainService {
   
   public List<LessonVO> getMainRecm(LessonVO vo);
   
   public List<LessonVO> getMainRecm2(LessonVO vo);
   
   public List<LessonVO> getMainPop(LessonVO vo);
   
   public List<LessonVO> getMainNew(LessonVO vo);
   
   public List<LessonVO> getMainNew2(LessonVO vo);
   
}