-- 1.在studentInfo表上建立索引
CREATE INDEX index_stu_name ON studentInfo(sname);-- 在sname字段上创建索引

CREATE INDEX index_car ON studentInfo(car_type);-- 在car_type字段上创建索引

ALTER TABLE studentInfo ADD INDEX index_con(scondition);-- 采用ALTER来在scondition字段上创建索引

-- 2.在healthInfo表上建立索引
CREATE INDEX index_h_name ON healthinfo(sname);-- 在sname字段上创建索引

-- 3.在licenseInfo表上建立索引
ALTER TABLE licenseInfo ADD INDEX index_license_name(sname);       -- 采用ALTER来在sname字段上创建索引
ALTER TABLE licenseInfo ADD INDEX index_receive_name(receive_name);-- 采用ALTER来在receive_name字段上创建索引