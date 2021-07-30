package com.kmerz.app.dto;

public class PostPagingDto {
	private int page = 1; // 페이지
	private int startRow = 1; // 첫번째줄
	private int endRow = 10; // 마지막줄
	private int count; // 검색결과
	private int startPage; // 표시될 페이지 번호 첫번째
	private int endPage; // 표시될 페이지 번호 마지막
	private int totalPage; // 전체 페이지 갯수
	private int perPage = 15; // 한페이지당 표시할 게시글 수
	private final int PAGE_BLOCK = 10;
	// 검색 관련 변수임. 따로 dto로 만들어도됨
	private String searchType;
	private String keyword;
	
	public PostPagingDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	public PostPagingDto(int page, int startRow, int endRow, int count, int startPage, int endPage, int totalPage,
			int perPage, String searchType, String keyword) {
		super();
		this.page = page;
		this.startRow = startRow;
		this.endRow = endRow;
		this.count = count;
		this.startPage = startPage;
		this.endPage = endPage;
		this.totalPage = totalPage;
		this.perPage = perPage;
		this.searchType = searchType;
		this.keyword = keyword;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public int getStartRow() {
		return startRow;
	}

	public void setStartRow(int startRow) {
		this.startRow = startRow;
	}

	public int getEndRow() {
		return endRow;
	}

	public void setEndRow(int endRow) {
		this.endRow = endRow;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
		this.endRow = page * this.perPage;
		this.startRow = endRow - this.perPage + 1;
		this.startPage = ((page-1)/PAGE_BLOCK) * PAGE_BLOCK + 1;
		this.endPage = startPage + PAGE_BLOCK-1;
		this.totalPage = count / perPage;
		if(count % perPage != 0) {
			this.totalPage += 1;
		}
		if(this.endPage > totalPage) {
			this.endPage = this.totalPage;
		}
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public int getPerPage() {
		return perPage;
	}

	public void setPerPage(int perPage) {
		this.perPage = perPage;
	}

	public String getSearchType() {
		return searchType;
	}

	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public int getPAGE_BLOCK() {
		return PAGE_BLOCK;
	}

	@Override
	public String toString() {
		return "PostPagingDto [page=" + page + ", startRow=" + startRow + ", endRow=" + endRow + ", count=" + count
				+ ", startPage=" + startPage + ", endPage=" + endPage + ", totalPage=" + totalPage + ", perPage="
				+ perPage + ", PAGE_BLOCK=" + PAGE_BLOCK + ", searchType=" + searchType + ", keyword=" + keyword + "]";
	}
	
}
