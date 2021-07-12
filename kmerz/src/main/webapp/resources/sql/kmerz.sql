create user kmerz identified by 1234;
grant connect, resource to kmerz;

-- 유저 정보 테이블
create table tbl_member (
    user_id number primary key,
    user_email varchar2(50),
    user_pw varchar2(50) not null,
    user_name varchar2(50) not null,
    user_logintime timestamp,
    user_status varchar2(15),
    constraint unique_user_email unique(user_email),
    constraint unique_user_name unique(user_name)
);
-- 유저 아이디 생성 시퀀스
create sequence seq_user_id
    minvalue 1000;
drop sequence seq_user_id;
commit;
-- 유저 로그 테이블
create table tbl_member_log (
    user_log_code varchar2(20),
    user_id number references tbl_member(user_id),
    user_request_ip varchar2(20),
    user_request_content varchar2(200),
    user_log_time timestamp default sysdate
);

-- 커뮤니티 정보 테이블
create table tbl_community (
    community_id number primary key,
    user_id number references tbl_member(user_id),
    community_tag varchar2(15),
    community_name varchar2(50),
    community_topic varchar2(50),
    community_description varchar2(300),
    community_status varchar2(15)
);
create sequence seq_comm_id
    start with 1
    minvalue 1;
drop sequence seq_comm_id;

-- 카테고리 정보 테이블
create table tbl_category(
    category_id number primary key,
    community_id number references tbl_community(community_id),
    category_name varchar2(50),
    category_description varchar2(300),
    category_status varchar2(15)
);
create sequence seq_cate_id
    start with 1
    minvalue 1;

-- 게시글 테이블
create table tbl_posts(
    post_no number primary key,
    user_id number references tbl_member(user_id),
    category_id number references tbl_category(category_id),
    post_title varchar2(100),
    post_content varchar2(500),
    post_recommandation number,
    post_lastupdate timestamp default sysdate,
    post_status varchar2(15),
    post_media varchar2(10)
);
create sequence seq_post_no
    start with 1
    minvalue 1;

-- 댓글






