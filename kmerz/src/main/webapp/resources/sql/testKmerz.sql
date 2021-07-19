--------------------
-- 테스트 데이터 삽입
--------------------

-- 임시 테스트 계정 삽입
insert into tbl_member values(
    'test1@naver.com',
    '1234',
    'tester1',
    sysdate,
    'OK'
);
insert into tbl_member values(
    'test2@naver.com',
    '1234',
    'tester2',
    sysdate,
    'OK'
);
insert into tbl_member values(
    'test3@naver.com',
    '1234',
    'tester3',
    sysdate,
    'OK'
);


-- 커뮤니티 테스트 데이터 삽입
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

-- 카테고리 테스트 데이터
insert into tbl_category values(
    seq_cate_id.nextval, 'star', '공략', '스타공략임', 'accept'
);
insert into tbl_category values(
    seq_cate_id.nextval, 'lol', '공략', '롤공략임', 'accept'
);
insert into tbl_category values(
    seq_cate_id.nextval, 'overwatch', '공략', '옵치공략임', 'accept'
);

-- 게시글 테스트 데이터
insert into tbl_posts values(
    SEQ_POST_NO.nextval,
    'tester1',
    'star',
    1,
    '스타 첫번째 공략',
    '아무튼 이렇게 저렇게 하면 이김 OK?',
    0, 0, sysdate, 'accept', 'F'
);
insert into tbl_posts values(
    SEQ_POST_NO.nextval,
    'tester2',
    'lol',
    1,
    '옵치 첫번째 공략',
    '아무튼 일케 절케 하면 이김 OK?',
    0, 0, sysdate, 'accept', 'F'
);
insert into tbl_posts values(
    SEQ_POST_NO.nextval,
    'tester3',
    'overwatch',
    1,
    '롤 첫번째 공략',
    '걍 정치하셈 OK?',
    0, 0, sysdate, 'accept', 'F'
);



--------------------
-- 테스트 데이터 삽입 끝
--------------------
commit;