package kr.smhrd.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class Like {

	private int F_NUM;
	private String ID;
	private int P_NUM; // 좋아요시 등록, 취소시 delete하는걸로
	private int LIKE; // 0= X  1=O
}
