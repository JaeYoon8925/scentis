acousticness  : 어쿠스틱정도를 말해주는 지표 ( 0 ~ 100, 어쿠스틱에 가까운 음악일수록 1에 가까움)
‘Danceability’ : 템포, 리듬의 안정성등의 조합을 기반으로 춤에 적합한지 나타내는 지표 ( 0 ~ 100, 춤에 적합할 수록 1에 가까움 )
‘Key’ : 음의 높낮이를 의미하며, 각각에 해당하는 음의 높낮이를 정수에 mapping했다. E.g. 0 = C, 1 = C♯/D♭, 2 = D등
‘Mode’ : 장조(도레미파솔라시)로 이루어져있다면 1, 단조(라시도레미파솔)로 이루어져 있다면 0을 갖는다.

‘Danceability’ : 음악적 요소인 템포, 리듬의 안정성등의 조합을 기반으로하여 춤에 적합한지를 나타내는 지표이다. 0~1사이의 값을 갖으며, 춤에 적합한 트랙일수록 1의 값을 갖는다.
‘Energy’ : 활동적이고 긴장을 줄 수 있는 트랙인지에 대한 지표로서 0~1사이의 값을 갖는다.
‘Instrumentalness’ : 트랙이 목소리가 주인지를 파악하는 지표로서, 여기서 말하는 목소리란, 추임새적인 부분들을 악기적인 요소로 보고 이런 악기적인 요소가 많을수록 1에 가깝운 값을 갖는다.
‘Liveness’ : 해당 트랙이 live음원인지를 파악하는 요소로서, 0.8을 넘는다면 live 트랙일 확률이 높다.
‘Loudness’ : 트랙 전반적인 평균 데시벨(dB)로서, 상대적으로 다른 트랙들과 비교할 수 있다. 일반적인 값은 -60에서 0 db 사이이다.
‘Speechiness’ : 토크쇼, 오디오북, 시같이 구어체 단어들의 존재를 탐지하는 지표로서 0.66 값 이상은 아마도 완전히 구어체로 만들어진 트랙을 의미한다고 하며, 1에 가까울수록 구어체를 많이 가지고 있다.
‘Valence’ : 트랙의 감성을 나타내는 지표로서, 0~1사이의 값을 갖는다. 1에 가까울수록 밝고 긍정적인 느낌의 트랙을 의미한다.
‘Tempo’ : 전반적인 트랙의 BPM을 추정하는 지표이다.


CREATE TABLE T_MEMBER
(
    `ID`         VARCHAR(50)    NOT NULL    COMMENT '아이디', 
    `PW`         VARCHAR(50)    NOT NULL    COMMENT '비밀번호', 
    `NAME`       VARCHAR(40)    NOT NULL    COMMENT '이름', 
    `NICKNAME`   VARCHAR(30)    NOT NULL    COMMENT '닉네임', 
    `BIRTHDATE`  DATETIME       NULL        COMMENT '생년월일', 
    `GENDER`     CHAR(1)        NULL        COMMENT '성별', 
     PRIMARY KEY (ID)
);

-- 테이블 Comment 설정 SQL - T_MEMBER
ALTER TABLE T_MEMBER COMMENT '회원정보';

-- 테이블 생성 SQL - T_PERFUME
CREATE TABLE T_PERFUME
(
    `P_NUM`     INT UNSIGNED     NOT NULL    AUTO_INCREMENT COMMENT '향수번호', 
    `P_BRAND`   VARCHAR(50)      NOT NULL    COMMENT '브랜드명', 
    `P_MODEL`   VARCHAR(50)      NOT NULL    COMMENT '모델명', 
    `P_TOP`     VARCHAR(50)      NOT NULL    COMMENT '탑노트', 
    `P_MIDDLE`  VARCHAR(50)      NOT NULL    COMMENT '미들노트', 
    `P_BASE`    VARCHAR(50)      NOT NULL    COMMENT '베이스노트', 
    `P_TYPE`    INT UNSIGNED     NOT NULL    COMMENT '향', 
    `P_INFO`    TEXT             NOT NULL    COMMENT '향수설명', 
    `P_PATH`    VARCHAR(1000)    NOT NULL    COMMENT '구매사이트', 
     PRIMARY KEY (P_NUM)
);

-- 테이블 Comment 설정 SQL - T_PERFUME
ALTER TABLE T_PERFUME COMMENT '향수정보';

-- 테이블 생성 SQL - T_LOG
CREATE TABLE T_LOG
(
    `LOG_NUM`   INT UNSIGNED     NOT NULL    AUTO_INCREMENT COMMENT '로그번호', 
    `ID`        VARCHAR(50)      NOT NULL    COMMENT '아이디', 
    `M_ID`      VARCHAR(100)     NOT NULL    COMMENT '음악ID', 
    `M_TITLE`   VARCHAR(100)     NOT NULL    COMMENT '음악명', 
    `M_ARTIST`  VARCHAR(100)     NOT NULL    COMMENT '아티스트', 
    `M_IMG`     VARCHAR(1000)    NULL        COMMENT '앨범이미지', 
    `P_NUM1`    INT UNSIGNED     NULL        COMMENT '향수번호1', 
    `P_NUM2`    INT UNSIGNED     NULL        COMMENT '향수번호2', 
    `P_NUM3`    INT UNSIGNED     NULL        COMMENT '향수번호3', 
    `LOG_STF`   INT              NULL        COMMENT '만족도', 
     PRIMARY KEY (LOG_NUM)
);

-- 테이블 Comment 설정 SQL - T_LOG
ALTER TABLE T_LOG COMMENT '로그정보';

-- Foreign Key 설정 SQL - T_LOG(ID) -> T_MEMBER(ID)
ALTER TABLE T_LOG
    ADD CONSTRAINT FK_T_LOG_ID_T_MEMBER_ID FOREIGN KEY (ID)
        REFERENCES T_MEMBER (ID) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- Foreign Key 삭제 SQL - T_LOG(ID)
-- ALTER TABLE T_LOG
-- DROP FOREIGN KEY FK_T_LOG_ID_T_MEMBER_ID;

-- Foreign Key 설정 SQL - T_LOG(P_NUM1) -> T_PERFUME(P_NUM)
ALTER TABLE T_LOG
    ADD CONSTRAINT FK_T_LOG_P_NUM1_T_PERFUME_P_NUM FOREIGN KEY (P_NUM1)
        REFERENCES T_PERFUME (P_NUM) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- Foreign Key 삭제 SQL - T_LOG(P_NUM1)
-- ALTER TABLE T_LOG
-- DROP FOREIGN KEY FK_T_LOG_P_NUM1_T_PERFUME_P_NUM;

-- Foreign Key 설정 SQL - T_LOG(P_NUM2) -> T_PERFUME(P_NUM)
ALTER TABLE T_LOG
    ADD CONSTRAINT FK_T_LOG_P_NUM2_T_PERFUME_P_NUM FOREIGN KEY (P_NUM2)
        REFERENCES T_PERFUME (P_NUM) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- Foreign Key 삭제 SQL - T_LOG(P_NUM2)
-- ALTER TABLE T_LOG
-- DROP FOREIGN KEY FK_T_LOG_P_NUM2_T_PERFUME_P_NUM;

-- Foreign Key 설정 SQL - T_LOG(P_NUM3) -> T_PERFUME(P_NUM)
ALTER TABLE T_LOG
    ADD CONSTRAINT FK_T_LOG_P_NUM3_T_PERFUME_P_NUM FOREIGN KEY (P_NUM3)
        REFERENCES T_PERFUME (P_NUM) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- Foreign Key 삭제 SQL - T_LOG(P_NUM3)
-- ALTER TABLE T_LOG
-- DROP FOREIGN KEY FK_T_LOG_P_NUM3_T_PERFUME_P_NUM;