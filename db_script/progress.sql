create table grade_listing (
    idnumber text,
    prelim numeric,
    midterm numeric,
    final numeric,
    semid text,
    subject text,
    section text,
    constraint grade_listing_pk primary key (idnumber, semid, subject, section)
);


insert into grade_listing(idnumber, prelim, midterm, final, semid, subject, section) 
   values ('2014-0001', 1.25, 1.75, 1.5, '2014-2015 1st', 'CSC 1', 'CS');
insert into grade_listing(idnumber, prelim, midterm, final, semid, subject, section) 
   values ('2014-0002', 1, 1.5, 1.5, '2014-2015 1st', 'CSC 1', 'CS');
insert into grade_listing(idnumber, prelim, midterm, final, semid, subject, section) 
   values ('2014-0003', 1.5, 1.5, 1.25, '2014-2015 1st', 'CSC 1', 'CS');
insert into grade_listing(idnumber, prelim, midterm, final, semid, subject, section) 
   values ('2014-0004', 2, 1.75, 1.5, '2014-2015 1st', 'CSC 1', 'CS');
insert into grade_listing(idnumber, prelim, midterm, final, semid, subject, section) 
   values ('2014-0005', 2.25, 2.75, 2.5, '2014-2015 1st', 'CSC 1', 'CS');
   

create or replace function get_listing(in text, in text, in text, 
        out text, out numeric, out numeric, out numeric) returns setof record as
$$
   
      select idnumber, prelim, midterm, final from grade_listing where
          subject = $1 and section = $2 and semid = $3;
  
$$
  language 'sql';
  
--HOW TO USE:
select * from get_listing('CSC 1', 'CS', '2014-2015 1st');
--returns
--2014-0001	1.25	1.75	1.5
--2014-0002	1	1.5	1.5
--2014-0003	1.5	1.5	1.25
--2014-0004	2	1.75	1.5
--2014-0005	2.25	2.75	2.5
