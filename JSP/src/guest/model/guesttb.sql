create table GuestTB(
    MESSAGE_ID NUMBER,
    GUEST_NAME VARCHAR2(10) NOT NULL,
    PASSWORD VARCHAR2(10) NOT NULL,
    MESSAGE VARCHAR2(1024) NOT NULL,
    CONSTRAINT guesttb_pk PRIMARY KEY(MESSAGE_ID)
);
CREATE SEQUENCE seq_messageId_guestTb;
drop table GuestTB;
drop sequence seq_messageId_guestTb;

select * from GuestTB;
-- 1. �����ϰ��� �ϴ� �÷��� PK
select rownum, empno FROM emp; 
-- �����ϰ��� �ϴ� �÷��� PK�� �ƴ� ���
select rownum, ename FROM emp; 
select rownum, MESSAGE_ID FROM guesttb;
-- 2. ���� �÷����� ����
select rownum, empno from emp order by empno;
-- �� �÷����� ����
select rownum, MESSAGE_ID from guesttb order by rownum asc, message_id asc;
-- 3. ���� �÷����� ���� �� rownum ����
select rownum, ename 
from (select ename from emp order by empno desc);


select rownum, MESSAGE_ID from guesttb order by message_id desc;
select rownum, message_id
from ( select rownum, MESSAGE_ID from guesttb order by message_id desc );
-- 4. rownum�� �κ� �˻�
select rnum, message_id
from ( select rownum as rnum, message_id from ( select rownum, MESSAGE_ID from guesttb order by message_id desc ) )
where rnum>=1 and rnum<=3;

--5. �ش� ��ȣ�� ���ڵ带 �˻�
select *
from emp
where empno in(
    select empno
    from (select rownum as rnum, empno
            from (select empno from emp order by empno desc) )
            where rnum>=1 and rnum<=3
)
order by empno desc;

/* ------------------------------------------------------------
1. �����ϰ� ���� �������� ����(message_id)
2. 1������ rownum�� ���� �̾ƿ�(1������ �ٷ� �������� rownum�� ����)
3. �̰� ���� rownum ��ȣ ���̿��� �̾ƿ�(message_id �� rownum)
4. pk�� �������� �̾ƿ��� �����ϰ� ���� �������� ����
*/ ------------------------------------------------------------
select *
from guesttb
where message_id in(
    select message_id
    from (select rownum as rnum, message_id
            from (select message_id from guesttb order by message_id desc) )
            where rnum>=1 and rnum<=3
)
order by message_id desc;

select *
from guesttb
where message_id in(
    select message_id
    from (select rownum as rnum, message_id
            from (select message_id from guesttb order by message_id desc) )
            where rnum>=1 and rnum<=3
)
order by message_id desc;


----------------------------------------------------------------------
select *
from guesttb
where message_id in(
    select message_id
    from (select rownum as rnum, message_id
            from (select message_id from guesttb order by message_id desc) )
            where rownum>=1 and rownum<=3
)
order by message_id desc;
----------------------------------------------------------------------

