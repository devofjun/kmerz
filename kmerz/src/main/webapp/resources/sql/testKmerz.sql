----------------------------------------------------
-- 테스트 데이터 삽입(유저 테이블)
----------------------------------------------------
BEGIN
FOR i IN 1..10 LOOP
    insert into tbl_member values(
        seq_user_no.nextval,
        'test'||i||'@naver.com',
        '1234',
        '테스터'||i,
        sysdate-i, 0, null, 100, 100
    );
    insert into tbl_point_log values(
        SEQ_POINTLOG_ID.nextval,
        1000+i,
        '회원가입',
        100,
        100,
        100,
        sysdate-i
    );
END LOOP;
END;
/

select * from tbl_point_log where user_no = 1005 order by point_datetime desc;
select * from
	(select * from tbl_point_log
	where user_no = 1005
	order by point_datetime desc)
	where rownum = 1;


--select * from tbl_member;
/*
update tbl_member set user_currentlogin = sysdate
	where user_no = 1001;
    commit;
    */
select * from tbl_declared;

----------------------------------------------------
-- 테스트 데이터 삽입(커뮤니티 테이블)
----------------------------------------------------
insert into tbl_community values(
    'star',
    1001,
    '스타크래프트',
    'starcraft',
    '스타크래프트 커뮤니티입니다.',
    'accept',
    sysdate-7
);
insert into tbl_community values(
    'lol',
    1002,
    '리그오브레전드',
    'League of Legends',
    '롤 커뮤니티입니다.',
    'accept',
    sysdate-6
);
insert into tbl_community values(
    'overwatch',
    1003,
    '오버워치',
    'overwatch',
    '오버워치 커뮤니티입니다.',
    'accept',
    sysdate-5
);
-- select * from tbl_community;

----------------------------------------------------
-- 테스트 데이터 삽입(카테고리 테이블)
----------------------------------------------------
insert into tbl_category values(
    seq_category_id.nextval, 'star', '공략', '스타공략임돠', 'accept'
);
insert into tbl_category values(
    seq_category_id.nextval, 'lol', '팬아트', '롤팬아트임돠', 'accept'
);
insert into tbl_category values(
    seq_category_id.nextval, 'overwatch', '망겜', '망겜임', 'accept'
);


----------------------------------------------------
-- 테스트 데이터 삽입(게시글 테이블)
----------------------------------------------------
BEGIN
FOR i IN 1..10 LOOP
    insert into tbl_posts values(
    seq_post_no.NEXTVAL, 1000+i, 'star', 100, '제목: 스타크래프트', 
    'D:\kmerz\repository\post\2021\7\26\1_e3166fc9-3687-4e3c-9dc3-e4431239284a.txt',
    0,0,sysdate-(31-i),null,0
    );
    insert into tbl_posts values(
    seq_post_no.NEXTVAL, 1000+i, 'lol', 101, '제목: 리그오브레전드', 
    'D:\kmerz\repository\post\2021\7\26\1_e3166fc9-3687-4e3c-9dc3-e4431239284a.txt',
    0,0,sysdate-(31-i),null,0
    );
    insert into tbl_posts values(
    seq_post_no.NEXTVAL, 1000+i, 'overwatch', 102, '제목: 오버워치', 
    'D:\kmerz\repository\post\2021\7\26\1_e3166fc9-3687-4e3c-9dc3-e4431239284a.txt',
    0,0,sysdate-(31-i),null,0
    );
END LOOP;
END;
/

--select * from tbl_posts where post_status >= 0;

/* 이게 맞는 쿼리지만 이게 되려면 두개의 테이블에서 겹치는 칼럼명이 없어야한다.
select * from
    (select rownum rnum, a.* from
        (select * from tbl_posts, tbl_member
            where tbl_member.user_name like '테스터1'
            and tbl_member.user_no = tbl_posts.user_no
        order by tbl_posts.post_no desc)a)
    where rnum between 1 and 10;
그래서 서브 쿼리로 대체함*/
/*
select * from
    (select rownum rnum, a.* from
        (select * from tbl_posts
        where user_no in (select user_no from tbl_member
                    where user_name like '%' || '테스터' || '%')
        order by post_no desc)a)
where rnum between 1 and 10;
*/

--select * from tbl_posts where post_status >= 0;


----------------------------------------------------
-- 테스트 데이터 삽입(댓글 테이블)
----------------------------------------------------

----------------------------------------------------
-- 테스트 데이터 삽입(답글 테이블)
----------------------------------------------------
--select * from tbl_member;
--select user_point from tbl_member;
--select * from tbl_point_log;


----------------------------------------------------
-- 테스트 데이터 삽입(스팀 앱 테이블)
----------------------------------------------------
insert into tbl_steamapp values(
    322330,
    'game',
    'Don''t Starve Together',
    'Don''t Starve Together는 혹독한 생존 게임인 Don''t Starve의 독립형 멀티플레이어 익스팬션입니다.',
    'https://cdn.akamai.steamstatic.com/steam/apps/322330/header_alt_assets_23.jpg?t=1624553984',
    '₩ 15,500',
    'http://cdn.akamai.steamstatic.com/steam/apps/256840376/movie480_vp9.webm?t=1624553869',
    'https://cdn.akamai.steamstatic.com/steam/apps/322330/page_bg_generated_v6b.jpg?t=1624553984'
);
insert into tbl_steamapp values(
    1097150,
    'game',
    'Fall Guys: Ultimate Knockout',
    'Fall Guys는 한 명의 승자가 남을 때까지 계속되는 혼란스러운 60인 난투극 멀티플레이 파티 게임입니다!',
    'https://cdn.akamai.steamstatic.com/steam/apps/1097150/header.jpg?t=1626868819',
    '₩ 20,500',
    'http://cdn.akamai.steamstatic.com/steam/apps/256843619/movie480_vp9.webm?t=1626803194',
    'https://cdn.akamai.steamstatic.com/steam/apps/1097150/page_bg_generated_v6b.jpg?t=1626868819'
);
insert into tbl_steamapp values(
    578080,
    'game',
    'PUBG: BATTLEGROUNDS',
    'PLAYERUNKNOWN’S BATTLEGROUNDS는 배틀로얄 게임으로, 외딴 섬에서 총 100명의 플레이어가 다양한 무기와 전략을 이용하여 마지막 1명이 살아남는 순간까지 전투를 하게 됩니다.',
    'https://cdn.akamai.steamstatic.com/steam/apps/578080/header.jpg?t=1626232783',
    '₩ 32,000',
    'http://cdn.akamai.steamstatic.com/steam/apps/256814351/movie480_vp9.webm?t=1626232779',
    'https://cdn.akamai.steamstatic.com/steam/apps/578080/page_bg_generated_v6b.jpg?t=1626232783'
);
insert into tbl_steamapp values(
    1049590,
    'game',
    '이터널 리턴',
    '이터널 리턴은 전략, 컨트롤, 그리고 멋진 캐릭터들을 경험하실 수 있는 쿼터뷰 스타일의 독특한 배틀로얄 게임입니다. 지속적으로 추가되는 캐릭터들과 함께 루미아섬에서 다른 17명의 플레이어들과 경쟁을 즐겨보세요. 솔로플레이와 듀오/스쿼드의 팀플레이 모두 가능합니다.',
    'https://cdn.akamai.steamstatic.com/steam/apps/1049590/header.jpg?t=1626949132',
    null,
    'http://cdn.akamai.steamstatic.com/steam/apps/256805055/movie480_vp9.webm?t=1602985982',
    'https://cdn.akamai.steamstatic.com/steam/apps/1049590/page_bg_generated_v6b.jpg?t=1626949132'
);
--select * from tbl_steamapp;

----------------------------------------------------
-- 테스트 데이터 삽입(스팀 앱 테이블)
----------------------------------------------------
insert into tbl_banner values(1, 1049590);
insert into tbl_banner values(2, 578080);
insert into tbl_banner values(3, 1097150);
insert into tbl_banner values(4, 322330);

--select * from tbl_steamapp
--where app_id in (1049590, 578080, 1097150, 322330);


--select * from tbl_banner;

/*
insert into tbl_point_log values(
    seq_pointlog_id.nextval,
	1000,
	'매일 첫로그인 포인트 지급',
	10,
	,
	sysdate
);
*/

select * from tbl_member_log
where member_logtype = 3 and to_char(user_log_time, 'YYYYMMDD') =
    to_char(sysdate,'YYYYMMDD');
    
    select * from tbl_member_log where member_logtype = 3 
    and to_char(user_log_time, 'YYYYMMDD') 
    = to_char(sysdate, 'YYYYMMDD'); 
--------------------
-- 테스트 데이터 삽입 끝
--------------------
commit;

select * from tbl_declared;
delete from tbl_declared
where declared_id = 4;