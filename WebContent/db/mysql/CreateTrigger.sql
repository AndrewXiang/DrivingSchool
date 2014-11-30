-- 1.设计INSERT触发器
-- 说明:如果向licenseInfo表中插入记录，说明这个学员已经结业。那么studentInfo表中
-- scondition字段的值应该更新为“结业”
DELIMITER $$
CREATE TRIGGER license_stu AFTER INSERT
          ON licenseInfo FOR EACH ROW
          BEGIN 
              UPDATE studentInfo SET leave_time=NEW.receive_time,scondition='结业'
			  WHERE sno=NEW.sno;
		  END
		  $$
DELIMITER;

-- 2.设计UPDATE触发器
-- 说明:如果studentInfo表中sname字段的值更新了,那么healthInfo表和licenseInfo表中
-- sname字段的值也应该同时更新
DELIMITER &&
CREATE TRIGGER update_sname AFTER UPDATE
          ON studentInfo FOR EACH ROW
          BEGIN
              UPDATE healthInfo SET sname=NEW.sname WHERE sno=NEW.sno;
			  UPDATE courseInfo SET sname=NEW.sname WHERE sno=NEW.sno;
          END
          &&

-- 3.设计DELETE触发器
-- 说明:如果从studentInfo表中删除一个学员的学籍信息，那么这个学员在healthInfo表、
-- gradeInfo表和licenseInfo表中的信息也必须同时删掉
DELIMITER &&
CREATE TRIGGER delete_stu AFTER DELETE
		  ON studentInfo FOR EACH ROW
          BEGIN 
            DELETE FROM gradeInfo   WHERE sno=OLD.sno;
            DELETE FROM healthInfo  WHERE sno=OLD.sno;
            DELETE FROM licenseInfo WHERE sno=OLD.sno;
          END 
          &&
