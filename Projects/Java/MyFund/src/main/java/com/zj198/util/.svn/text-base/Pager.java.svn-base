package com.zj198.util;

import java.util.ArrayList;
import java.util.List;

public class Pager {
	private int totalRows;
	private int currentPage = 1;
	private int pageCount = 0;
	private List<Object> data;
	private List<Integer> pages;

	public Pager() {}
	
	public Pager(int totalRows, int currentPage, int pageCount, List<Object> data) {
		super();
		this.currentPage = currentPage;
		this.pageCount = pageCount;
		this.data = data;
		
		if(currentPage<1){currentPage=1;}
		int totalPages = 0;
		if(totalRows % pageCount == 0){
			totalPages = totalRows / pageCount;
		}else{
			totalPages = totalRows / pageCount + 1;
		}
		
		pages = new ArrayList<Integer>();
		if(totalPages < 8){
			for(int i=1;i<=totalPages;i++){
				pages.add(i);
			}
		}else if(currentPage + 3 >= totalPages){
			pages.add(1);
			pages.add(-1);
			for(int i=totalPages-4;i<=totalPages;i++){
				pages.add(i);
			}
		}else{
			if(currentPage <= 4){
				int size = totalPages > 5 ? 5 : totalPages;
				for(int i=1;i<=size;i++){
					pages.add(i);
				}
				pages.add(-1);
				pages.add(totalPages);
			}else{
				pages.add(1);
				pages.add(-1);
				for(int i=currentPage-2;i<=currentPage+2;i++){
					pages.add(i);
				}
				pages.add(-1);
				pages.add(totalPages);
			}
		}
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getPageCount() {
		return pageCount;
	}

	public void setPageCount(int pageCount) {
		this.pageCount = pageCount;
	}

	public List<Object> getData() {
		return data;
	}

	public void setData(List<Object> data) {
		this.data = data;
	}
	
	public List<Integer> getPages() {
		return pages;
	}

	public void setPages(List<Integer> pages) {
		this.pages = pages;
	}

	public int getTotalRows() {
		return totalRows;
	}

	public void setTotalRows(int totalRows) {
		this.totalRows = totalRows;
	}

}
