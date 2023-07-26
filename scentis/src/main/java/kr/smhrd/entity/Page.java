package kr.smhrd.entity;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class Page {

	private int pageNo; // 현재 페이지
	private int pageSize; // 보일 로그 갯수
	private int totalCount; // 전체 로그 갯수

	private int startNo; // 현재 페이지 로그 시작 번호
	private int endNo; // 현재 페이지 로그 끝 번호 : startNo+pageSize-1
	private int startPage; // 페이지 이동 버튼 시작 번호
	private int endPage; // 페이지 이동 버튼의 마지막 번호
	private int totalPage;

	public Page(int pageNo, int pageSize, int totalCount) {
		this.pageSize = pageSize;
		this.totalCount = totalCount;
		
		totalPage = (totalCount - 1) / pageSize + 1;				// totalPage 계산
		this.pageNo = (pageNo < 1) ? 1 : pageNo;					// pageNo이 1 미만인 경우 1로
		this.pageNo = (pageNo > totalPage) ? totalPage : pageNo;	// pageNo이 totalPage보다 큰 경우 totalPage로

		startNo = (this.pageNo - 1) * pageSize + 1;
		endNo = startNo + (pageSize - 1);
		this.endNo = this.endNo > totalCount ? totalCount : this.endNo;

		startPage = (this.pageNo - 1) / 10 * 10 + 1;
		endPage = startPage + 9;
		this.endPage = this.endPage > totalPage ? totalPage : this.endPage;
	}
}
