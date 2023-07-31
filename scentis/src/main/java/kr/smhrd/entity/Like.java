package kr.smhrd.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class Like {

   private String ID;
   private String P_MODEL; // 좋아요시 등록, 취소시 delete하는걸로
}
