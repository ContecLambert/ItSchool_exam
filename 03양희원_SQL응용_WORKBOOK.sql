--1��
select department_name "�а� ��",category "�迭" from tb_department;
--2��
select department_name ||'�� ������ '||capacity||'�� �Դϴ�.' "�а��� ����"
from  tb_department;
--3��
select * from tb_student;
select student_name from tb_student
where department_no = 001 and absence_yn = 'Y'
AND SUBSTR(STUDENT_SSN,7,1) = 2;
--4��
select student_name from tb_student
where student_no in ('A241053','A547038','A650002', 'A250028', 'A547060');
--5��
select department_name,category from tb_department
where capacity between 20 and 30;
--6��
select professor_name from tb_professor
where department_no IS null;
--7��
desc tb_student;
select student_name,department_no from tb_student
where department_no IS null;
--8��
desc tb_class
select * from tb_class;
select class_no from tb_class
where preattending_class_no is not null;
--9��
select distinct category from tb_department;
--10��
desc tb_student;
select entrance_date,absence_yn,STUDENT_ADDRESS from tb_student;
select student_no,student_name,student_ssn from tb_student
where absence_yn = 'N' and entrance_date like '02%' 
and student_address like '����%';

--Additional select �Լ�
--1��
select student_no "�й�", student_name "�̸�", entrance_date "���г⵵"
from tb_student
order by entrance_date;
--2��
select professor_name, professor_ssn from tb_professor
where length(professor_name) != 3;
--3��
select professor_name "�����̸�", 
(substr(to_char(sysdate, 'YYMMDD'), 0, 2) 
        - to_char(substr(professor_ssn, 0, 2)) + 100) "����"
from tb_professor
WHERE SUBSTR(PROFESSOR_SSN,8,1) = 1
order by "����";
--4��
select substr(professor_name, 2, 3) "�̸�" from tb_professor;
--5��
select student_no, student_name from tb_student
where (substr(to_char(sysdate, 'YYMMDD'), 0, 2) 
        - to_char(substr(student_ssn, 0, 2)) + 100) > 19;
--6��
select to_char(to_date('20201225', 'YYYYMMDD'), 'day')"2020 ũ��������"
from dual;
--7��
--1999/10/11, 1949/10/11
select TO_DATE('99/10/11','YY/MM/DD'), TO_DATE('49/10/11','YY/MM/DD')
from dual;
--1999/10/11, 1949/10/11
select TO_DATE('99/10/11','RR/MM/DD'), TO_DATE('49/10/11','RR/MM/DD')
from dual;
--8��
select student_no, student_name from tb_student
where student_no not like 'A%';
--9��
select round(avg(point), 1) "����" from tb_grade
where student_no = 'A241053';
--10��
select department_no "�а���ȣ", count(*) "�л���(��)" from tb_student
group by department_no
order by department_no;
--11��
select count(*) from tb_student
where coach_professor_no is null;
--12��
select substr(term_no, 1, 4) "�⵵" , avg(point) "�⵵ �� ����"
from tb_grade
--WHERE STUDENT_NO = 'A112113'
group by substr(term_no, 1, 4);

--13��
select department_no "�а��ڵ��", count(*) "���л� ��"
from tb_student
where absence_yn = 'Y'
group by department_no;
--14��
SELECT STUDENT_NAME "�����̸�", COUNT(STUDENT_NAME) "�������� ��" 
FROM TB_STUDENT GROUP BY STUDENT_NAME HAVING COUNT(STUDENT_NAME) > 1;
--15��
SELECT SUBSTR(TERM_NO,0,4) "�⵵", SUBSTR(TERM_NO,5,2) "�б�", round(AVG(POINT),1) "����"
FROM TB_GRADE group by rollup (substr(term_no,1,4),substr(term_no,5,2));
--Additional select -option
--1��
SELECT STUDENT_NAME "�л� �̸�", STUDENT_ADDRESS "�ּ���" FROM TB_STUDENT
ORDER BY STUDENT_NAME ASC;
--2��
SELECT STUDENT_NAME, STUDENT_SSN FROM TB_STUDENT
WHERE ABSENCE_YN = 'Y'
ORDER BY SUBSTR(STUDENT_SSN,0,4) DESC;
--3��
SELECT STUDENT_NO FROM TB_STUDENT;
SELECT STUDENT_NAME "�л��̸�", STUDENT_NO "�й�", STUDENT_ADDRESS "������ �ּ�"
FROM TB_STUDENT 
WHERE STUDENT_NO NOT LIKE '9%' AND STUDENT_ADDRESS LIKE '����%' AND
STUDENT_ADDRESS LIKE '���%';
--4��
SELECT DEPARTMENT_NO,DEPARTMENT_NAME FROM TB_DEPARTMENT;
SELECT PROFESSOR_NAME,PROFESSOR_SSN FROM TB_PROFESSOR
WHERE DEPARTMENT_NO = (
SELECT DEPARTMENT_NO FROM TB_DEPARTMENT 
WHERE DEPARTMENT_NAME = '���а�')
ORDER BY SUBSTR(PROFESSOR_SSN,0,2) ASC;
--5��
SELECT CLASS_NO,CLASS_NAME FROM TB_cLASS;
SELECT * FROM TB_GRADE;
SELECT STUDENT_NO, POINT FROM TB_GRADE
WHERE TERM_NO = '200402' AND CLASS_NO = 'C3118100'
ORDER BY POINT DESC,STUDENT_NO ASC ;
--6��
SELECT * FROM TB_STUDENT;
SELECT STUDENT_NO,STUDENT_NAME,DEPARTMENT_NAME 
FROM TB_STUDENT S,TB_DEPARTMENT D WHERE S.DEPARTMENT_NO = D.DEPARTMENT_NO
ORDER BY STUDENT_NAME ASC;
--7��
SELECT CLASS_NAME, DEPARTMENT_NAME FROM TB_CLASS C,TB_DEPARTMENT D
WHERE C.DEPARTMENT_NO = D.DEPARTMENT_NO;
--8��
SELECT CLASS_NAME,PROFESSOR_NAME FROM TB_CLASS C,TB_PROFESSOR P
WHERE C.DEPARTMENT_NO = P.DEPARTMENT_NO;
--9��
--SELECT * FROM TB_CLASS_PROFESSOR;
--SELECT * FROM TB_PROFESSOR;
--SELECT * FROM TB_CLASS;
--SELECT * FROM TB_DEPARTMENT;
SELECT C.CLASS_NAME,P.PROFESSOR_NAME 
FROM TB_PROFESSOR P,TB_CLASS C, TB_CLASS_PROFESSOR CP,TB_DEPARTMENT D
WHERE D.CATEGORY = '�ι���ȸ' AND D.DEPARTMENT_NO = P.DEPARTMENT_NO
AND CP.PROFESSOR_NO = P.PROFESSOR_NO AND C.CLASS_NO = CP.CLASS_NO;
--10��
SELECT * FROM TB_GRADE;
SELECT * FROM TB_DEPARTMENT;
SELECT * FROM TB_STUDENT;
--�����а� => ������а��� ����
SELECT S.STUDENT_NO "�й�", S.STUDENT_NAME "�л� �̸�",ROUND(AVG(G.POINT),1) "��ü ����"
FROM TB_STUDENT S ,TB_DEPARTMENT D,TB_GRADE G
WHERE S.STUDENT_NO = G.STUDENT_NO AND D.DEPARTMENT_NO = S.DEPARTMENT_NO
AND D.DEPARTMENT_NO = 001;

--11��
--SELECT * FROM TB_STUDENT;
SELECT D.DEPARTMENT_NAME "�а��̸�", S.STUDENT_NAME "�л��̸�", P.PROFESSOR_NAME "���������̸�"
FROM TB_DEPARTMENT D,TB_STUDENT S,TB_PROFESSOR P
WHERE S.STUDENT_NO = 'A241053' AND S.COACH_PROFESSOR_NO = P.PROFESSOR_NO
AND D.DEPARTMENT_NO = S.DEPARTMENT_NO;
--12��
--SELECT * FROM TB_CLASS;
--SELECT * FROM TB_GRADE;
SELECT S.STUDENT_NAME,G.TERM_NO "TERM_NAME" FROM TB_STUDENT S,TB_CLASS C,TB_GRADE G
WHERE SUBSTR(G.TERM_NO,0,4) = 2003 AND C.CLASS_NAME = '�����ð���Ư��'
AND G.STUDENT_NO = S.STUDENT_NO AND C.CLASS_NO = G.CLASS_NO;
--13��
SELECT * FROM TB_CLASS;
SELECT * FROM TB_DEPARTMENT;
SELECT C.CLASS_NAME, D.DEPARTMENT_NAME
FROM TB_CLASS C, TB_DEPARTMENT D,TB_CLASS_PROFESSOR CP
WHERE D.CATEGORY = '��ü��' AND CP.PROFESSOR_NO = NULL;
--14��
SELECT * FROM TB_DEPARTMENT;
SELECT * FROM TB_STUDENT;
SELECT * FROM TB_PROFESSOR;
SELECT S.STUDENT_NAME "�л��̸�", P.PROFESSOR_NAME "��������" 
FROM TB_STUDENT S, TB_PROFESSOR P, TB_DEPARTMENT D
WHERE D.DEPARTMENT_NAME = '������а�'
AND P.DEPARTMENT_NO = 001
AND S.COACH_PROFESSOR_NO = P.PROFESSOR_NO
AND S.DEPARTMENT_NO = P.DEPARTMENT_NO
ORDER BY SUBSTR(S.ENTRANCE_DATE,1,2) ASC;
--15��
--SELECT * FROM TB_DEPARTMENT;
--SELECT * FROM TB_STUDENT;
--SELECT * FROM TB_PROFESSOR;
--SELECT * FROM TB_GRADE;
SELECT S.STUDENT_NO, S.STUDENT_NAME,D.DEPARTMENT_NAME, AVG(G.POINT)
FROM TB_STUDENT S,TB_DEPARTMENT D,TB_GRADE G
WHERE S.ABSENCE_YN = 'N' 
GROUP BY S.STUDENT_NO,S.STUDENT_NAME,D.DEPARTMENT_NAME 
HAVING AVG(G.POINT)>= 4;
--16��
--SELECT * FROM TB_GRADE;
--SELECT * FROM TB_CLASS;
SELECT C.CLASS_NO, C.CLASS_NAME, AVG(G.POINT) "AVG(POINT)" 
FROM TB_CLASS C, TB_GRADE G
WHERE C.CLASS_NAME = 'ȯ�������а�'
GROUP BY C.CLASS_NO, C.CLASS_NAME;
--17��
--SELECT * FROM TB_DEPARTMENT;
--SELECT * FROM TB_STUDENT;
--SELECT * FROM TB_PROFESSOR;
--SELECT * FROM TB_GRADE;
--SELECT * FROM TB_CLASS;
SELECT S.STUDENT_NAME, S.STUDENT_ADDRESS
FROM TB_STUDENT S
WHERE S.DEPARTMENT_NO = (
SELECT DEPARTMENT_NO 
FROM TB_STUDENT 
WHERE STUDENT_NAME = '�ְ���');
--18��
SELECT S.STUDENT_NO, S.STUDENT_NAME
FROM TB_STUDENT S, TB_GRADE G
WHERE G.POINT = (SELECT MAX(AVG(POINT)) A FROM TB_GRADE GROUP BY STUDENT_NO)
GROUP BY S.STUDENT_NO, S.STUDENT_NAME;
--19��
SELECT * FROM TB_DEPARTMENT;
SELECT D.DEPARTMENT_NAME "�迭 �а���", AVG(G.POINT) "��������"
FROM TB_DEPARTMENT D, TB_GRADE G
WHERE CATEGORY = (
SELECT CATEGORY FROM TB_DEPARTMENT
WHERE DEPARTMENT_NAME = 'ȯ�������а�')
GROUP BY D.DEPARTMENT_NAME;
