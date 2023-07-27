package kr.smhrd.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor 
@AllArgsConstructor
@Data
public class Log {
// 로그 저장될 DB내용
   private int LOG_NUM;    // 로그번호
   private String ID;      // 회원ID
   private String M_ID;    // TRACK ID
   private String M_TITLE; // 노래제목
   private String M_ARTIST;// 노래가수
   private String M_IMG;   // 앨범이미지
   private int P_NUM1;      // 향수1번호
   private int P_NUM2;      // 향수2번호
   private int P_NUM3;      // 향수3번호
   private String P_TYPE;   // 분위기
}