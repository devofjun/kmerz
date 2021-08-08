--create user kmerz identified by 1234;
--grant connect, resource to kmerz;
select SEQ_POST_NO.CURRVAL from dual;
SELECT LAST_NUMBER FROM USER_SEQUENCES  WHERE SEQUENCE_NAME = 'SEQ_POST_NO';
--==================================================
-- 유저 정보 테이블
--==================================================
drop table tbl_member CASCADE CONSTRAINTS;
--truncate table tbl_member;
create table tbl_member (
    user_no number primary key,
    user_id varchar2(50) not null,
    user_pw varchar2(50) not null,
    user_name varchar2(50) not null,
    user_currentlogin timestamp,
    user_status number default 0,
    user_profileImage varchar2(500),
    user_point number default 100,
    user_totalpoint number default 100,
    constraint unique_user_id unique(user_id),
    constraint unique_user_name unique(user_name)
);  
drop sequence seq_user_no;
create sequence seq_user_no
    start with 1001;

--==================================================
-- 포인트 로그 테이블
--==================================================
drop table tbl_point_log;
create table tbl_point_log(
    point_id number primary key,
    user_no number references tbl_member(user_no),
    point_content varchar2(100),
    point_now number not null,
    point_score number not null,
    point_total number not null,
    point_datetime timestamp default sysdate
);
drop sequence seq_pointlog_id;
create sequence seq_pointlog_id
    start with 1;


--==================================================
-- 커뮤니티 정보 테이블
--==================================================
drop table tbl_community CASCADE CONSTRAINTS;
--truncate table tbl_community;
create table tbl_community (
    community_id varchar2(30) primary key,
    user_no number references tbl_member(user_no),
    community_name varchar2(50) not null,
    community_topic varchar2(50) not null,
    community_description varchar2(300),
    community_status varchar2(15) not null,
    community_createtime timestamp default sysdate,
    constraint uq_comm_name UNIQUE(community_name)
);



--==================================================
-- 카테고리 정보 테이블
--==================================================
drop table tbl_category CASCADE CONSTRAINTS;
create table tbl_category(
    category_no number primary key,
    community_id varchar2(30) references tbl_community(community_id),
    category_name varchar2(50),
    category_description varchar2(300),
    category_status varchar2(15)
);
drop sequence seq_category_id;
create sequence seq_category_id
    start with 100;



--==================================================
-- 게시글 테이블
--==================================================
drop table tbl_posts CASCADE CONSTRAINTS;
create table tbl_posts(
    post_no number primary key,
    user_no number references tbl_member(user_no),
    community_id varchar2(50) references tbl_community(community_id),
    category_no number references tbl_category(category_no),
    post_title varchar2(100),
    post_content_file varchar2(500),
    post_readcount number default 0,
    post_recommand number default 0,
    post_createtime timestamp default sysdate,
    post_updatetime timestamp,
    post_status number default 0
);
drop sequence seq_post_no;
create sequence seq_post_no
    start with 100 nocache;


--==================================================
-- 댓글 테이블
--==================================================
drop table tbl_comment CASCADE CONSTRAINTS;
create table tbl_comment(
    comment_no number primary key,
    post_no number references tbl_posts(post_no),
    user_no number references tbl_member(user_no),
    comment_content varchar2(200) not null,
    comment_regroup number,
    comment_retag number references tbl_member(user_no),
    comment_regist_date timestamp default sysdate
);
-- 댓글 시퀀스 생성
drop sequence seq_comment_no;
create sequence seq_comment_no
    start with 100;


--==================================================
-- 미디어 테이블
--==================================================
drop table tbl_media CASCADE CONSTRAINTS;
create table tbl_media(
    media_no number references tbl_posts(post_no),
    media_id varchar2(100),
    media_path varchar2(100),
    upload_time timestamp default sysdate,
    delete_time timestamp default null
);
drop sequence seq_media_no;
create sequence seq_media_no
    start with 100;


--==================================================
-- 신고 테이블
--==================================================
drop table tbl_declared;
create table tbl_declared(
    declared_id number primary key,
    target_id number,
    target_type number,
    user_no number references tbl_member(user_no),
    target_user_no number references tbl_member(user_no),
    declared_datetime timestamp default sysdate
);
drop sequence seq_dcl_id;
create sequence seq_dcl_id
    start with 1;


--==================================================
-- 스팀 앱 테이블
--==================================================
drop table tbl_steamapp CASCADE CONSTRAINTS;
create table tbl_steamapp(
    app_id number primary key,
    app_type varchar2(20) not null,
    app_name varchar2(255) not null,
    app_description varchar2(1000),
    app_header varchar2(255),
    app_price varchar2(50),
    app_movie varchar2(255),
    app_background varchar2(255)
);


--==================================================
-- 배너 테이블
--==================================================
drop table tbl_banner cascade constraints;
create table tbl_banner(
    banner_no number primary key,
    app_id number not null references tbl_steamapp(app_id)
);


--==================================================
-- 관리자 계정 테이블
--==================================================
drop table tbl_admin CASCADE CONSTRAINTS;
create table tbl_admin(
    admin_id varchar(30) primary key,
    admin_pw varchar(50) not null,
    admin_name varchar(30) not null,
    admin_pic varchar(1) default 'F'
);
-- 관리자 계정 추가
insert into tbl_admin
(admin_id, admin_pw, admin_name)
values
('admin', '1234', '관리자');

--==================================================
-- 관리자 메시지 테이블
--==================================================
drop table tbl_adminmessage CASCADE CONSTRAINTS;
create table tbl_adminmessage(
    message_no number primary key,
    admin_id varchar(30) not null references tbl_admin(admin_id),
    message_title varchar(100) not null,
    message_content varchar(300),
    message_level number(1) 
);

--==================================================
-- 유저 로그 테이블
--==================================================
drop table tbl_member_log CASCADE CONSTRAINTS;
create table tbl_member_log (
    member_logid number primary key,
    member_logtype number not null,
    user_no number references tbl_member(user_no),
    user_id varchar2(50),
    user_name varchar2(50),
    request_ip varchar2(20),
    user_log_time timestamp default sysdate
);
drop sequence seq_member_logid;
create sequence seq_member_logid
    start with 1;




commit;
