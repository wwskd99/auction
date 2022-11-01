package org.zerock.domain;

// 페이지 처리와 검색 기능을 수행하기 위해 필요한 데이터 저장하는 클래스

public class Criteria {
	// 필드
	private int pageNum;	// 현재 페이지 번호
	private int amount;		// 페이지 당 보여줄 게시글의 수 (보통 10개 : 가변)
	private String keyword;	// 키워드
	
	
	public Criteria() {		
		this(1, 10);	
	}

	public Criteria(int pageNum, int amount) {	
		this.pageNum = pageNum;
		this.amount = amount;
	}
	
	public int getAmount() {
		return amount;
	}
	
	public void setAmount(int amount) {
		this.amount = amount;
	}
	
	public String getKeyword() {
		return keyword;
	}
	
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	
	@Override
	public String toString() {
		return "Criteria [pageNum= " + pageNum + ", amount= " + amount + ", keyword=" + keyword + "]";
	}
}
