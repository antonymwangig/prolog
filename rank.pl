list([]).

start:-open('average.pl',write,Stream),
write(Stream,"list(["),
close(Stream),
open('marks.pl',write,Stream1),
write(Stream1,"\n"),
close(Stream1),
open('result.pl',write,Stream2),
write(Stream2,"NAME ODE VECTOR WEB JAVA AVER TOTAL GRADE"),
close(Stream2).


stop:-open('average.pl',append,Stream),
write(Stream,"0])."),
close(Stream).

student:-
write("enter student name"),nl,                            
read(Name),
format("hello ~w",[Name]),nl,
write("enter ODE marks"),nl,
read(Ode),
write("enter vector analysis"),nl,
read(Vector),
write("enter Web programming marks"),nl,
read(Web),
write("enter object oriented [II] marks"),nl,
read(Java),
Total is (Ode+Vector+Web+Java),
Average is ((Ode+Vector+Web+Java)/4),
write_database(Name,Ode,Vector,Web,Java,Average,Total),

write("the average marks are"),write(Average).




write_database(Name,Ode,Vector,Web,Java,Average,Total):-
open('average.pl',append,Stream),
string_concat(Average,",",P),
write(Stream,P),
close(Stream),
open('marks.pl',append,Stream2),
string_concat("\ndetail(",Name,Part1),
string_concat(Part1,",",Part2),
string_concat(Part2,Ode,Part3),
string_concat(Part3,",",Part4),
string_concat(Part4,Vector,Part5),
string_concat(Part5,",",Part6),
string_concat(Part6,Web,Part7),
string_concat(Part7,",",Part8),
string_concat(Part8,Java,Part9),
string_concat(Part9,",",Part10),
string_concat(Part10,Average,Part11),
string_concat(Part11,",",Part12),
string_concat(Part12,Total,Part13),
string_concat(Part13,").",Data),
write(Stream2,Data),nl,
close(Stream2).

position:-
['average.pl'],
list(L),
order(L),
open('result.pl',read,Stream),
read(Stream,Data),
write(Data),
close(Stream),

order([0]).
order(L):-
max_member(X,L),
['ass.pl'],
ordermarks(X),
select(X,L,L1),
order(L1).


ordermarks(M):-
['marks.pl'],
detail(Name,Ode,Vector,Web,Java,M,Total),
grade(M,Grade),
open('result.pl',append,Stream),
string_concat(" \n",Name,Part1),
string_concat(Part1,'   ',Part2),
string_concat(Part2,Ode,Part3),
string_concat(Part3,'   ',Part4),
string_concat(Part4,Vector,Part5),
string_concat(Part5,'   ',Part6),
string_concat(Part6,Web,Part7),
string_concat(Part7,'   ',Part8),
string_concat(Part8,Java,Part9),
string_concat(Part9,'   ',Part10),
string_concat(Part10,M,Part11),
string_concat(Part11,'   ',Part12),
string_concat(Part12,Total,Part13),
string_concat(Part13,'   ',Part14),
string_concat(Part14,Grade,Data),
write(Stream,Data),nl,
close(Stream).

grade(Average,GRADE):-
((Average>70,Average<100,GRADE = 'A');
(Average>60,Average<70,GRADE ='B');
(Average>50,Average<60,GRADE ='C');
(Average>40,Average<50,GRADE = 'D');
(Average<40,GRADE ='F')).










