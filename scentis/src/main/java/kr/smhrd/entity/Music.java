package kr.smhrd.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class Music {

   private String acousticness;
   private String danceability;
   private String energy;
   private String valence;
   private String tempo;
   private String mode;
   private String time_signature;
   private String loudness;

}