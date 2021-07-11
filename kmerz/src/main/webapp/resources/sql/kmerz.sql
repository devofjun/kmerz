create user kmerz identified by 1234;
grant connect, resource to kmerz;

create table tbl_community(
    comm_path
    comm_name varchar2(50),
);