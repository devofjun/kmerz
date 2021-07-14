create user kmerz identified by 1234;
grant connect, resource to kmerz;

commit;
-- 유저 정보 테이블
drop table tbl_member CASCADE CONSTRAINTS;
truncate table tbl_member;
create table tbl_member (
    user_id number primary key,
    user_email varchar2(50),
    user_pw varchar2(50) not null,
    user_name varchar2(50) not null,
    user_currentlogin timestamp,
    user_status varchar2(15),
    constraint unique_user_email unique(user_email),
    constraint unique_user_name unique(user_name)
);
drop sequence seq_user_id;
create sequence seq_user_id
    minvalue 1000;
commit;

select * from tbl_member;

-- 유저 로그 테이블
drop table tbl_member_log CASCADE CONSTRAINTS;
truncate table tbl_member_log;
create table tbl_member_log (
    user_log_code varchar2(20),
    user_id number references tbl_member(user_id),
    user_request_ip varchar2(20),
    user_request_content varchar2(200),
    user_log_time timestamp default sysdate
);

-- 커뮤니티 정보 테이블
drop table tbl_community CASCADE CONSTRAINTS;
truncate table tbl_community;
create table tbl_community (
    community_id number primary key,
    user_id number references tbl_member(user_id),
    community_tag varchar2(15),
    community_name varchar2(50),
    community_topic varchar2(50),
    community_description varchar2(300),
    community_status varchar2(15)
);
drop sequence seq_comm_id;
create sequence seq_comm_id
    start with 1
    minvalue 1;

select * from tbl_community;

-- 카테고리 정보 테이블
drop table tbl_category CASCADE CONSTRAINTS;
create table tbl_category(
    category_id number primary key,
    community_id number references tbl_community(community_id),
    category_name varchar2(50),
    category_description varchar2(300),
    category_status varchar2(15)
);
drop sequence seq_cate_id;
create sequence seq_cate_id
    start with 1
    minvalue 1;

-- 게시글 테이블
drop table tbl_posts CASCADE CONSTRAINTS;
drop table tbl_posts;
create table tbl_posts(
    post_no number primary key,
    user_id number references tbl_member(user_id),
    category_id number references tbl_category(category_id),
    post_title varchar2(100),
    post_content varchar2(500),
    post_recommand number,
    post_lastupdate timestamp default sysdate,
    post_status varchar2(15),
    post_media varchar2(10)
);
drop sequence seq_post_no;
create sequence seq_post_no
    start with 1
    minvalue 1;

-- 댓글

-- 게시글변경 버전 시퀀스
creat sequence seq_post_version
increment by 1
start with 1;

-- 댓글 테이블
create table tbl_comment(
    comment_no number primary key,
    post_no number reference tbl_posts(post_no),
    user_email varchar2(50) reference tbl_member(user_email),
    comment_content varchar2(200) not null,
    comment_regist_date timestamp default sysdate
);

-- 댓글 시퀀스 생성
create sequence seq_comment_no;

-- 답글 테이블
create table tbl_reply(
    reply_no primary key,
    comment_no reference tbl_comment(comment_no),
    user_email reference tbl_member(user_email),
    reply_content varchar2(200) not null,
    reply_regist_date timestamp default sysdate
);

-- 미디어 테이블
create table tbl_media(
    post_no number reference tbl_posts(post_no),
    media_type varchar2(), -- 미디어 타입??
    file_name varchar2(), -- 몇자까지??
    upload_time timestamp default sysdate,
    delete_time timestamp default null
);

-- 게시글변경 로그 테이블
create table tbl_change_log(
    post_no number reference tbl_posts(post_no),
    -- 로그 코드 이름 해야합니다.
    defore_content varchar2(500),
    before_title varchar2(100),
    before_media , -- 미디어 타입??
    change_log_time timestamp default sysdate,
    post_version number not null;
);









-- 관리자 계정 테이블
create table tbl_management(
    admin_id varchar(30) primary key,
    admin_pw varchar(50) not null,
    admin_name varchar(30) not null,
    admin_pic varchar(1) default 'F'
);

-- 관리자 메시지 테이블
carete table tbl_mngmessage(
    message_no number primary key,
    admin_id varchar(30) not null references tbl_management(admin_id),
    message_title varchar(100) not null,
    message_content varchar(300),
    message_level number(1) 
);

