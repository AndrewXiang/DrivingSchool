-- 设计grade视图
CREATE VIEW grade_view
AS SELECT g.id,g.sno,s.sname,c.cname,last_time,times,grade
FROM studentInfo s,courseInfo c,gradeInfo g
WHERE g.sno=s.sno AND g.cno=c.cno;