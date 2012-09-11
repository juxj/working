package com.zj198.util;

public class Pagination {

	private int recordCount;
	private int pageSize;
	private int current;
	
	private int pages;
	private int first;
	private int last;
	private int previous;
	private int next;
	
	
	public Pagination(int recordCount, int pageSize, int current) {
		this.recordCount = recordCount;
		this.pageSize = pageSize;
		this.current = current;
		
		int remaining = recordCount % pageSize;
		pages = recordCount / pageSize;
		
		if (remaining > 0) {
			pages ++;
		}
		first = 1;
		last = pages;
		previous = current-1>1 ? current-1 : 1;
		next = current< pages -1 ? current +1 : pages;
	}

	public int getRecordCount() {
		return recordCount;
	}

	public void setRecordCount(int recordCount) {
		this.recordCount = recordCount;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getPages() {
		return pages;
	}

	public void setPages(int pages) {
		this.pages = pages;
	}

	public int getFirst() {
		return first;
	}

	public void setFirst(int first) {
		this.first = first;
	}

	public int getLast() {
		return last;
	}

	public void setLast(int last) {
		this.last = last;
	}

	public int getPrevious() {
		return previous;
	}

	public void setPrevious(int previous) {
		this.previous = previous;
	}

	public int getNext() {
		return next;
	}

	public void setNext(int next) {
		this.next = next;
	}

	public int getCurrent() {
		return current;
	}

	public void setCurrent(int current) {
		this.current = current;
	}
	
	
	
}
