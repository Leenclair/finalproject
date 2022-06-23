create or replace procedure vocDelete  --���ν��� �̸� 
(
--�Ű�����
    p_groupNo number,
    p_step    number,
    p_no      number
)
is
--���������
cnt number;

begin
--ó���� ����
    --[1] �������� ���
    if p_step=0 then
        --�亯�� �����ϴ��� üũ
        select count(*) into cnt
        from board
        where b_groupno=p_groupNo;
        
        --1) �亯�� �����ϸ�
        if cnt>1 then
          update board
          set b_delflag='Y'
          where b_no = p_no;
        else --2) �亯�� ������
          delete from board
          where b_no = p_no;
        end if;
    else --[2] �亯���� ���
        delete from board
        where b_no=p_no;
        
        --�亯�� ���� �� �����ִ� ���� 1������ üũ
        select count(*) into cnt
        from board
        where b_groupno=p_groupNo;
      
        if cnt=1 then
            /*--�����ִ� ���� �������̸鼭 ������ ���̶��
            select count(*) into cnt from reboard
            where groupno=p_groupNo and delflag='Y' and step=0;
            
            if cnt=1 then
                --�����۵� delete
                delete from reboard
                where groupno=p_groupNo;
            end if;*/
            
            delete from board a
            where exists (select 1 from board b
                where a.b_no=b.b_no
                and b_groupno=p_groupNo and b_delflag='Y' and b_step=0);
        end if;        
    end if;
    
    commit;

EXCEPTION
    WHEN OTHERS THEN
   raise_application_error(-20001, ' ����!');
        ROLLBACK;
end;