-- 고객 정보 테이블
create table customer (
	custid		varchar2(20) primary key,	--고객 아이디 <회원가입시 아이디는 겹치면 안되게>
	password	varchar2(20) not null,		--비밀번호
	name		varchar2(30) not null,		--고객 이름
	email		varchar2(30),			--고객 이메일
	division	varchar2(30) not null,		--고객구분 : personal(개인), company(기업)  <라디오>
	idno		varchar2(20) unique,	 	--식별번호 (개인: 주민번호, 법인: 사업자 번호)	
	address		varchar2(100)			--주소
);


-- 게시판 본문 글      <사용자가 입력하는 것은 글 제목과 내용뿐, 나머지는 자동 입력>
create table board (
	boardnum		number	primary key,		--글번호
	id				varchar2(20) not null,	--작성자 ID
	title			varchar2(100) not null,		--글제목
	content			varchar2(2000) not null,	--글내용
	inputdate		date	default sysdate,	--작성날짜,시간
	hits			number 	default 0,		--조회수
	originalfile		varchar2(200),			--첨부파일명 (원래 이름)                 <글 하나당 파일 하나>
	savedfile		varchar2(100)			--첨부파일명 (실제 저장된 이름)     <db에 저장되는 파일명들이 겹치지 않게 서버에서 임의로 파일명 설정>
);                                                                                                                    --<다운로드 받을땐 원래 파일명으로 다운되게 코딩>
--시퀀스
create sequence board_seq start with 1 increment by 1;



-- 리플 내용
create table reply (
	replynum		number	primary key,		--리플번호
	boardnum		number not null,			--본문 글번호
	id				varchar2(20) not null,		--작성자 ID
	text			varchar2(200) not null,		--리플내용
	inputdate		date 	default sysdate,	--작성날짜
	constraint reply_fk foreign key(boardnum) --<이 테이블의 reply_fk는 보드넘버를 가지고 있을때만 생성. 없는 글에는 댓글 못담>
		references board(boardnum) on delete cascade--<cascade: 3번글이 지워지면 3번글의 댓글도 같이 지워짐>
);
-- 리플에 사용할 시퀀스
create sequence reply_seq start with 1 increment by 1;
