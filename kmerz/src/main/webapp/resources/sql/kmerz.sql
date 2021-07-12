create user kmerz identified by 1234;
grant connect, resource to kmerz;

-- 유저 정보 테이블
create table tbl_member (
    user_email varchar2(50) primary key,
    user_pw varchar2(50) not null,
    user_name varchar2(50) not null,
    user_logintime timestamp,
    user_status varchar2(15),
    constraint unique_user_email unique(user_email),
    constraint unique_user_name unique(user_name)
);

-- 유저 로그 테이블
create table tbl_member_log (
    user_log_code varchar2(20),
    user_email varchar2(50) reference tbl_member(user_email),
    user_request_ip varchar2(20),
    user_request_content varchar2(200),
    user_log_time timestamp default sysdate
);

-- 커뮤니티 정보 테이블
create table tbl_community (
    community_id number primary key,
    user_email varchar2(50) reference tbl_member(user_email),
    community_tag varchar2(15),
    community_name varchar2(50),
    community_topic varchar2(50),
    community_description varchar2(300),
    community_status varchar2(15)
);

-- 카테고리 정보 테이블
create table tbl_category(
    category_id number primary key,
    community_id number reference tbl_community(community_id),
    category_name varchar2(50),
    category_description varchar2(300),
    category_status varchar2(15)
);

-- 게시글 테이블
create table tbl_posts(
    post_no number primary key,
    user_email varchar2(50) reference tbl_member(user_email),
    category_id number reference tbl_category(category_id),
    post_title varchar2(100),
    post_content varchar2(500),
    post_recommandation number,
    post_lastupdate timestamp default sysdate,
    post_status varchar2(15)
);

-- 미디어 테이블
create table tbl_media(
    post_no number reference tbl_posts(post_no),
    media_type varchar2(),
    file_name varchar2(),
    upload_time timestamp default sysdate,
    delete_time timestamp default null
);

-- 게시글변경 로그 테이블
create table tbl_change_log(
    post_no number reference tbl_posts(post_no),
    -- 로그 코드 이름 해야합니다.
    defore_content varchar2(500),
    before_title varchar2(100),
    before_media ,
    change_log_time timestamp default sysdate,
    post_version number not null;
);

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





