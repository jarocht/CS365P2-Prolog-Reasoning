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

/* Rule: courseName
   Inputs:(courseNum, courseName)
   Description: Pairs course numbers with their names
*/
courseName(Num,Name) :- course(Num,Name,_,_,_,_,_).

/* Rule: teaches
   Inputs:(Professor, courseName)
   Description: Relates professors and the courses they teach

*/
teaches(Prof,Name):- course(_,Name,_,_,_,Prof,_).



/* Goals */
print_solution :-
        write('What does Dr. J. Leidig teach?'), nl,
	findall(X,teaches('Dr. J. Leidig',X),Z),
	write(Z),nl,nl,

	write('Does Dr. J. Leidig teach Database?'), nl,
	findall(X,teaches('Dr. J. Leidig','Database'),D),
	write(D),nl,nl,

	write('What is Dr. J. Leidigs schedule?'), nl,
	findall(Crs: Time: Day,course(_,Crs,Day,Time,_,'Dr. J. Leidig',_),Times),
	write(Times), nl,nl,

	write('Who is scheduled to teach what subject on TTH, 10am?'), nl,

	write('When do Dr. J. Leidig and Dr. El-Said teach at the same time?'), nl,

	write('Who teaches at the same time as Dr. J. Leidig?'), nl,

	write('What courses fo Jim and Pam have in common?'), nl,

	write('Who is taking CS courses?'), nl,

	write('What types of courses is Gaius Baltar taking?'), nl,

	write('Are there any scheduling conficts of professors or locations?'), nl.

