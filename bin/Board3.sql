SELECT * FROM usertable; 
CREATE SEQUENCE B_SEQ
        MINVALUE 1
        MAXVALUE 9999
        INCREMENT BY 1
        NOCACHE
        CYCLE;
        
SELECT B_SEQ.CURRVAL FROM DUAL;
SELECT * FROM USER_SEQUENCES; 

SELECT userid, uname, uemail FROM usertable;

INSERT INTO board(bid, btitle, bcontent)
VALUES(B_SEQ.NEXTVAL, '안녕', '안녕하세요');
INSERT INTO board(bid, btitle, bcontent)
VALUES(B_SEQ.NEXTVAL, '안녕2', '안녕하세요2');

SELECT * FROM board;
SELECT bid, btitle, bregdate FROM board;
DELETE FROM board;

UPDATE board SET btitle='제목수정', bcontent='글 내용 수정',bupdate =sysdate WHERE bid=10;

SELECT * FROM board WHERE bid=11;
DELETE FROM board WHERE bid=11;

CREATE SEQUENCE R1_SEQ
        MINVALUE 1
        MAXVALUE 9999
        INCREMENT BY 1
        NOCACHE
        CYCLE;
        
CREATE SEQUENCE R2_SEQ
        MINVALUE 1
        MAXVALUE 9999
        INCREMENT BY 1
        NOCACHE
        CYCLE;
 
-- 재귀 복사
insert into board(bid, userid, btitle, bcontent, bregdate, cno, del)(select B_SEQ.nextval, userid, btitle, bcontent,  sysdate, cno, del from board);
select count(*) from board;     


--방식1
select rn, bid, btitle, bcontent, bwriter, bregdate, bupdate 
from(
        select rownum as rn, bid, btitle, bcontent, bwriter, bregdate, bupdate
 
        from board)
        
where rn between 11 and 20;
    
--방식2(카테컬럼 보이기)
select b.bid, b.btitle, b.bcontent, b.userid, b.bregdate, b.bupdate, c.cate 
from(
        select rownum as rn, bid, btitle, bcontent, userid, bregdate, bupdate, cno
 
        from board where ROWNUM <= 20) b
        
inner join category c on c.cno = b.cno
where rn > 10;        

--방식2(카테고리별로 조회)
select b.bid, b.btitle, b.bcontent, b.userid, b.bregdate, b.bupdate, c.cate 
from(
        select rownum as rn, bid, btitle, bcontent, userid, bregdate, bupdate, cno
 
        from board where ROWNUM <= 20 
        and cno='2'
        ) b
        
inner join category c on c.cno = b.cno
where rn > 10;  

--삭제한 데이터 조회
select bid, btitle, bcontent, userid, del
from board
where del='y';

update board set del='y' where bid='1800';

select b.bid, b.btitle, b.bcontent, b.userid, b.bregdate, b.bupdate 
from board b;
--inner join category c on c.cno=b.cno
--where b.cno='2';

select cno, cate from category;

--방식2
select bid, btitle, bcontent, userid, bregdate, bupdate
from(
        select rownum as rn, bid, btitle, bcontent, userid, bregdate, bupdate, cno
 
        from board where ROWNUM <= 170 )
    
where rn > 160;        

select b.bid, b.btitle, b.bcontent, b.userid, b.bregdate, b.bupdate, c.cate 
from board b
inner join category c on b.cno=c.cno;


--검색기능 추가
select rn, b.bid, b.btitle, b.bcontent, b.userid, b.bregdate, b.bupdate, c.cate 
from(        
    select rownum  as rn, b.bid, b.btitle, b.bcontent, b.userid, b.bregdate, b.bupdate, b.cno, c.cno, c.cate
    from board b
    left join category c on b.cno=c.cno
    where
        b.del='n'
        AND b.cno ='1'
        AND b.btitle LIKE '%파일%' ) 
where rn > 160 and rn <=170;

SELECT b.bid, b.userid, b.btitle, b.bcontent, c.cate
FROM board b
INNER JOIN category c ON b.cno = c.cno
WHERE b.del='n'
    AND b.cno='1';

        
    
select c.cate from category c, board b where c.cno = b.cno;

select b.bid, b.btitle, b.bcontent, b.userid, c.cate 
from board b
inner join category c on b.cno=c.cno;

--엑셀 다운(검색O, 페이징X)
select b.bid, b.btitle, b.bcontent, b.userid, b.bregdate, b.bupdate, c.cate 
from board b, category c   
where b.cno=c.cno and c.cno='1' and btitle LIKE '%파일%' and del='n';

--엑셀 다운
SELECT b.bid, b.btitle, b.bcontent, b.userid, b.bregdate, b.bupdate, c.cate
FROM (
    SELECT bid, btitle, bcontent, userid, bregdate, bupdate, cno
    FROM board 
    WHERE 
        del='n'
        AND cno ='1'
        AND btitle LIKE '%파일%' 
	) b
INNER JOIN category c ON c.cno=b.cno;

select c.cate from category c, board b where c.cno = b.cno;

select b.bid, b.btitle, b.bcontent, b.userid, c.cate 
from board b
inner join category c on b.cno=c.cno;

delete from board where userid is null;

--게시판 시퀀스 초기화
SELECT B_SEQ.CURRVAL FROM DUAL;
ALTER SEQUENCE B_SEQ INCREMENT BY -231;
SELECT B_SEQ.NEXTVAL FROM DUAL;
ALTER SEQUENCE B_SEQ INCREMENT BY 1;
SELECT * FROM USER_SEQUENCES; 

commit;

--댓글1 시퀀스 초기화
SELECT R1_SEQ.CURRVAL FROM DUAL;
ALTER SEQUENCE R1_SEQ INCREMENT BY -10;
SELECT R1_SEQ.NEXTVAL FROM DUAL;
ALTER SEQUENCE R1_SEQ INCREMENT BY 1;
SELECT * FROM USER_SEQUENCES; 

select * from board where btitle like '%수정%';
select * from board where btitle='유머1' and cno='2';
select * from board where bid='24';

 select b.bid, c.cate, b.btitle, b.bcontent, b.userid, b.bregdate, b.bupdate
 from board b, category c 
 where b.cno=c.cno and b.bid = '227';

UPDATE board SET del='y' WHERE bid='1800';

select * from reply1 where r1del='y';

drop table filetable;
create table filetable(
        bid int ,
        fileName varchar2(100) not null,
        uploadPath varchar2(200) not null,
        uuid varchar2(100)not null ,
        primary key (uuid),
        foreign key (bid) references board(bid)
    );
    
-- 테이블 객체 이름 정보
Select TABLE_NAME, COLUMN_NAME, DATA_DEFAULT from USER_TAB_COLUMNS
where TABLE_NAME = 'BOARD';

SELECT B_SEQ.CURRVAL FROM DUAL;

--선택한 카테고리에 해당하는 글만 나오게
 SELECT b.bid, b.btitle, b.bcontent, b.userid, b.bregdate, b.bupdate, c.cate
    FROM (
        SELECT bid, btitle, bcontent, userid, bregdate, bupdate, cno
        FROM board 
        WHERE 
          btitle LIKE '%파%' 
        AND del='n') b 
        INNER JOIN category c ON c.cno=b.cno
        WHERE c.cno='1';
        
-- 무한 스크롤 최신순
 SELECT b.bid, b.btitle, b.bcontent, b.userid, b.bregdate, b.bupdate, c.cate
    FROM (
        SELECT bid, btitle, bcontent, userid, bregdate, bupdate, cno
        FROM board 
        WHERE del='n') b 
        INNER JOIN category c ON c.cno=b.cno
        ORDER BY b.bid DESC;
        
SELECT count(*) FROM usertable WHERE userid = 'aaa';        

SELECT * FROM board WHERE btitle='글자수';

SELECT COUNT(*) FROM board;


