/*
*Project 2: Prolog Database
*Authors: Scott Bell and Tim Jaroch
*
*/

/*---Facts---*/
course(467,'CS Project','10:00am-10:50am','MWF','MAK B1118','Dr. Engelsma','CS').
course(463,'IS project','2:00pm-2:50pm','MWF','MAK D2123','Mr. Lange','IS').
course(460,'MIS','10:00am-11:15am','TR','MAK B1116','Dr. P. Leidig','IS').
course(457,'Data Communications','2:00pm-2:50pm','MWF','MAK D1117','Dr. Kalafut','CS').
course(452,'OS Concepts','1:00pm-1:50pm','MWF','MAK D1117','Dr. Wolffe','CS').
course(451,'Computer Architecture','10:00am-10:50am','MWF','MAK B1118','Dr. Kurmas','CS').
course(450,'IS Project Management','12:00pm-12:50pm','MWF','MAK D1117','Dr. Schymik','IS').
course(443,'Software Development Tools','11:00am-11:50am','MWF','MAK B1124','Ms. Peterman','IS').
course(437,'Distributed Computing','10:00am-10:50am','MWF','MAK B1118','Dr. Engelsma','CS').
course(375,'Wireless Networking Systems','6:00pm-8:50pm','R','EC 612','Dr. El-Said','IS').
course(371,'Web Application Programming','4:00pm-5:15pm','MW','MAK D1117','Dr. Scripps','CS').
course(365,'AI','10:00am-11:15am','TR','MAK D1117','Dr. J. Leidig','CS').
course(361,'System Programming','4:00pm-5:15pm','TR','MAK B1116','Dr. Trefftz','CS').
course(358,'Information Insurance','3:00pm-3:50pm','MWF','MAK A1105','Dr. Kalafut','CS').
course(353,'Database','12:00pm-12:50pm','MWF','MAK B1118','Dr. Alsabbagh','CS').
course(350,'Software Engineering','10:00am-10:50am','MWF','MAK D1117','Dr. Jorgensen','CS').
course(343,'Structure of Programming Languages','1:00pm-1:50pm','MWF','MAK B1124','Dr. Nandigam','CS').
course(339,'IT Project Management','1:00pm-2:15pm','TR','MAK A1105','Mr. Lange','IS').
course(337,'Network Systems Management','3:00pm-3:50pm','TR','MAK B1124','Dr. El-Said','IS').
course(333,'DB Management and Implementation','6:00pm-8:50pm','W','MAK D1117','Ms. Posada','IS').
course(330,'Systems Analysis and Design','9:00am-9:50am','MWF','MAK D1117','Dr. Du','IS').
course(661,'Medical and Bioinformatics','6:00pm-8:50pm','T','EC 612','Dr. J. Leidig','CIS').
course(671,'Information Visualization','6:00pm-8:50pm','R','EC 612','Dr. J. Leidig','CIS').
course(691,'MBI Capstone','6:00pm-8:50pm','M','EC 612','Dr. J. Leidig','CIS').

studentEnrolled('Jim',467).
studentEnrolled('Jim',452).
studentEnrolled('Jim',457).
studentEnrolled('Pam',437).
studentEnrolled('Pam',457).
studentEnrolled('Pam',452).
studentEnrolled('Kara Thrace',467).
studentEnrolled('Kara Thrace',452).
studentEnrolled('Kara Thrace',365).
studentEnrolled('Gaius Baltar',463).
studentEnrolled('Gaius Baltar',460).
studentEnrolled('Gaius Baltar',375).


/* Rules */

/* Rule: teaches
   Inputs:(Professor, Name)
   Description: Relates professors and the courses they teach

*/
teaches(Prof,Name):- course(_,Name,_,_,_,Prof,_).

/* Rule: courseTime
   Inputs:(Name, Time, Day, Prof)
   Description: Relates courses by course name, time, day of week, and Prof.
		Time needs to be an Atom list to allow partial matches within the "Time" Field.

*/
courseTime(Name, Time, Day, Prof):-
		course(_,Name,X,Day,_,Prof,_), atom_codes(X,Y),
		subset(Time,Y).

/* Rule: courseT
   Inputs:(Name, Time, Day, Prof)
   Description: Relates courses by course name, time, day of week, and Prof.

*/
courseT(Name, Time, Day, Prof):- course(_,Name,Time,Day,_,Prof,_).

/* Rule: roomTime
   Inputs:(Room, Time, Day)
   Description: Relates rooms by room name, time and day of week.

*/
roomTime(Room,Time,Day,Course):- course(Course,_,Time,Day,Room,_,_).

/* Rule: courseType
   Inputs:(Num, Type)
   Description: Relates course number by course type.

*/
courseType(Num,Type):-course(Num,_,_,_,_,_,Type).

/*--- Goals ---*/

/*
Goal:     What does Dr. J. Leidig teach?
Approach: Find every course name that Dr. J. Leidig teaches
*/
:- write('What does Dr. J. Leidig teach?'), nl,
		findall(X,teaches('Dr. J. Leidig',X),Z),
		write(Z),nl,nl.

/*
Goal:     Does Dr. J. Leidig teach Database?
Approach: Checks if Dr. J. Leidig teaches Database.  If true, writes 'true', otherwise writes 'false'
*/
:- write('Does Dr. J. Leidig teach Database?'), nl,
		teaches('Dr. J. Leidig','Database') -> write('true'), nl, nl ; write('false'), nl, nl.

/*
Goal:     What is Dr. J. Leidigs schedule?
Approach: Find every course with Dr. J. Leidig as the professor.
          Displays course name, time, and day.
*/
:- write('What is Dr. J. Leidigs schedule?'), nl,
		findall(Crs: Time: Day,course(_,Crs,Day,Time,_,'Dr. J. Leidig',_),Times),
		write(Times),nl,nl.

/*
Goal:     Who is scheduled to teach what subject on TTH, 10am?
Approach: Find every professor who teaches a subject on TTH at 10am
          using the courseTime rule for beginning time.
*/
:- write('Who is scheduled to teach what subject on TTH, 10am?'), nl,
		findall(Name:Prof,courseTime(Name,"10:00am",'TR',Prof),L),
		write(L),nl,nl.

/*
Goal:     When do Dr. J. Leidig and Dr. El-Said teach at the same time?
Approach: Find matching pairs of days and time for courses both Dr. J.
          Leiding and Dr. El-Said teach.
*/
:- write('When do Dr. J. Leidig and Dr. El-Said teach at the same time?'), nl,
		course(_,_,X,A,_,'Dr. J. Leidig',_), course(_,_,Y,B,_,'Dr. El-Said',_), X=Y, A=B, write(Y),write(' on '), write(A),nl,nl.

/*
Goal:     Who teaches at the same time as Dr. J. Leidig?
Approach: Find every course with the same time and day offered as the
          courses taught by Dr. J. Leidig, excluding the same course
	  taught by him.
*/
:- write('Who teaches at the same time as Dr. J. Leidig?'), nl,
		findall(N,(course(_,_,X,Y,_,'Dr. J. Leidig',_),course(_,_,A,B,_,N,_),X=A,Y=B,N\='Dr. J. Leidig'),L),
		write(L),nl,nl.

/*
Goal:     What courses do Jim and Pam have in common?
Approach: Search through the courses Jim and Pam are enrolled in and
          find all similarities.
*/
:- write('What courses do Jim and Pam have in common?'), nl,
		findall(N, (studentEnrolled('Jim',N), studentEnrolled('Pam', Y), N=Y),L),
		write(L),nl,nl.

/*
Goal:     Who is taking CS courses?
Approach: Search through the courses all students are taking and check
          if the courses are CS courses. Only one instance of a CS
	  course is needed for each student.
*/
:- write('Who is taking CS courses?'), nl,
		setof(N, Y^(studentEnrolled(N,Y),courseType(Y,'CS')),L),
		write(L),nl,nl.

/*
Goal:     What types of courses is Gaius Baltar taking?
Approach: Find all courses Gaius Baltar is enrolled in an check the
          types of those courses.
*/
:- write('What types of courses is Gaius Baltar taking?'), nl,
		setof(T, (studentEnrolled('Gaius Baltar',X),courseType(X,T)),L),
		write(L),nl,nl.

/*
Goal:     Are there any scheduling conflicts of professors or locations?
Approach: For professors, check courses with the same time, day, and professor but different course names.
	  For locations, check rooms with the same room, time, and day, but different professors.
*/
:- write('Are there any scheduling conflicts of professors or locations?'), nl,
		setof(Prof:Time,(courseT(Name1,Time,Day,Prof),courseT(Name2,Time,Day,Prof), Name1\=Name2),L),
		write(L),nl,
		setof(Room:Time,(roomTime(Room,Time,Day,X),roomTime(Room,Time,Day,Y),X\=Y),R),
		write(R),nl,nl.

