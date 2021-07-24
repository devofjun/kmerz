----------------------------------------------------
-- 테스트 데이터 삽입(유저 테이블)
----------------------------------------------------
insert into tbl_member values(
    seq_user_no.nextval,
    'test1@naver.com',
    '1234',
    '테스터1',
    sysdate,
    'OK'
);
insert into tbl_member values(
    SEQ_USER_NO.nextval,
    'test2@naver.com',
    '1234',
    '테스터2',
    sysdate,
    'OK'
);
insert into tbl_member values(
    SEQ_USER_NO.nextval,
    'test3@naver.com',
    '1234',
    '테스터3',
    sysdate,
    'OK'
);
--select * from tbl_member;


----------------------------------------------------
-- 테스트 데이터 삽입(커뮤니티 테이블)
----------------------------------------------------
insert into tbl_community values(
    'star',
    'test1@naver.com',
    '스타크래프트',
    'starcraft',
    '스타크래프트 임시 커뮤니티입니다.',
    'accept'
);
insert into tbl_community values(
    'lol',
    'test2@naver.com',
    '리그오브레전드',
    'League of Legends',
    '롤 임시 커뮤니티입니다.',
    'accept'
);
insert into tbl_community values(
    'overwatch',
    'test3@naver.com',
    '오버워치',
    'overwatch',
    '오버워치 임시 커뮤니티입니다.',
    'wait'
);
-- select * from tbl_community;

----------------------------------------------------
-- 테스트 데이터 삽입(카테고리 테이블)
----------------------------------------------------
insert into tbl_category values(
    seq_category_id.nextval, 'star', '공략', '스타공략임', 'accept'
);
insert into tbl_category values(
    seq_category_id.nextval, 'lol', '공략', '롤공략임', 'accept'
);
insert into tbl_category values(
    seq_category_id.nextval, 'overwatch', '공략', '옵치공략임', 'accept'
);

----------------------------------------------------
-- 테스트 데이터 삽입(게시글 테이블)
----------------------------------------------------
insert into tbl_posts values(
    SEQ_POST_NO.nextval,
    '테스터1',
    'star',
    100,
    '스타 첫번째 공략',
    '전략게임이다 전략이 중요해!',
    0, 0, sysdate, 'accept'
);
insert into tbl_posts values(
    SEQ_POST_NO.nextval,
    '테스터2',
    'lol',
    101,
    '롤 첫번째 공략',
    '정치 잘하면 됨',
    0, 0, sysdate, 'accept'
);
insert into tbl_posts values(
    SEQ_POST_NO.nextval,
    '테스터3',
    'overwatch',
    102,
    '옵치 첫번째 공략',
    '말로 하는 게임임',
    0, 0, sysdate, 'accept'
);

----------------------------------------------------
-- 테스트 데이터 삽입(댓글 테이블)
----------------------------------------------------
update tbl_comment set
    comment_reply_count = comment_reply_count+1
    where comment_no = 100;
insert into tbl_comment values(
    SEQ_COMMENT_NO.nextval,
    100,
    '테스터3',
    '와.그.렇.군.요.',
    0,
    sysdate
);
update tbl_comment set
    comment_reply_count = comment_reply_count+1
    where comment_no = 101;
insert into tbl_comment values(
    SEQ_COMMENT_NO.nextval,
    101,
    '테스터1',
    '정치질하려고 겜하냐?',
    0,
    sysdate
);
update tbl_comment set
    comment_reply_count = comment_reply_count+1
    where comment_no = 102;
insert into tbl_comment values(
    SEQ_COMMENT_NO.nextval,
    102,
    '테스터2',
    '님 마이크 냄새남',
    0,
    sysdate
);


----------------------------------------------------
-- 테스트 데이터 삽입(답글 테이블)
----------------------------------------------------
update tbl_comment set
    comment_reply_count = comment_reply_count+1
    where comment_no = 100;
insert into tbl_reply values(
    seq_reply_no.nextval,
    100,
    '테스터1',
    '^^',
    sysdate
);
update tbl_comment set
    comment_reply_count = comment_reply_count+1
    where comment_no = 101;
insert into tbl_reply values(
    seq_reply_no.nextval,
    101,
    '테스터2',
    'ㅇㅇ 꿀잼임',
    sysdate
);
update tbl_comment set
    comment_reply_count = comment_reply_count+1
    where comment_no = 102;
insert into tbl_reply values(
    seq_reply_no.nextval,
    102,
    '테스터3',
    'ㅗ',
    sysdate
);



----------------------------------------------------
-- 테스트 데이터 삽입(스팀 앱 테이블)
----------------------------------------------------

select * from tbl_steamapp
where app_id = 245850;

update tbl_steamapp set
    app_type = 'empty'
    where app_id = 245850;

--------------------
-- 테스트 데이터 삽입 끝
--------------------
commit;