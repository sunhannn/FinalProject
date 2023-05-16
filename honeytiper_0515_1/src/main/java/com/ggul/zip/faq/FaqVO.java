package com.ggul.zip.faq;

public class FaqVO {
	private int faq_question_num;
	private String faq_question;
	private String faq_answer;
	
	private String faq_search;
	
	public String getFaq_search() {
		return faq_search;
	}
	public void setFaq_search(String faq_search) {
		this.faq_search = faq_search;
	}
	public int getFaq_question_num() {
		return faq_question_num;
	}
	public void setFaq_question_num(int faq_question_num) {
		this.faq_question_num = faq_question_num;
	}
	public String getFaq_question() {
		return faq_question;
	}
	public void setFaq_question(String faq_question) {
		this.faq_question = faq_question;
	}
	public String getFaq_answer() {
		return faq_answer;
	}
	public void setFaq_answer(String faq_answer) {
		this.faq_answer = faq_answer;
	}
	@Override
	public String toString() {
		return "FaqVO [faq_question_num=" + faq_question_num + ", faq_question=" + faq_question + ", faq_answer="
				+ faq_answer + "]";
	}
	
}
