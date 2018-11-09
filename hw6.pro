
c:-['hw6.pro'].
%Possible uniderectional moves for board


moves(0,1,3).
moves(0,2,5).
moves(1,3,6).
moves(1,4,8).
moves(2,4,7).
moves(2,5,9).
moves(3,6,10).
moves(3,7,12).
moves(4,7,11).
moves(4,8,13).
moves(5,8,12).
moves(5,9,14).
moves(3,4,5).
moves(6,7,8).
moves(7,8,9).
moves(10,11,12).
moves(11,12,13).
moves(12,13,14).
%similar to generator for moves and their positions
step(F,O,T):-
	moves(F,O,T);
	moves(T,O,F).
initialize(I,Xs):-
	replace([1,1,1,1,1,1,1,1,1,1,1,1,1,1,1],I,0,Xs).
replace([_|T],0,X,[X|T]).
replace([H|T],I,X,[H|R]):-
	I>0,
	I1 is I-1,
	replace(T,I1,X,R),
	!.
replace(X,_,_,X).
move(Xs,Zs):-
	step(F,O,T),
	nth0(F,Xs,1),
	nth0(O,Xs,1),
	nth0(T,Xs,0),
	replace(Xs,F,0,Ys),
	replace(Ys,O,0,Qs),
	replace(Qs,T,1,Zs).
solveI(I):-
	initialize(I,PASS),
	solve1(PASS,14),
	!.
	%shows1(TOPRINT).
solveR:-
	initialize(_,Pass),
	solve1(Pass,14),
	!.
solveA:-
	solveA2(14).
solveA2(0):-
	solveI(1).
solveA2(I):-
	solveI(I),
	solveA2(I-1).
solve1(Xs,1):-
	show(Xs),nl,nl,nl.
solve1(Xs,I):-
	move(Xs,Next),
	I1 is I-1,
	solve1(Next,I1),
	show(Xs),nl,nl,nl,nl.
showE(0):-
	write('*').
showE(1):-
	write('x').
show(Xs):-
	%hardcoding because i tried doing it another way and ended up spending more time than had I just hardcoded
	nth0(0,Xs,X),
	tab(25),showE(X),nl,
	nth0(1,Xs,A),nth0(2,Xs,B),
	tab(20),showE(A),tab(10),showE(B),nl,
	nth0(3,Xs,C),nth0(4,Xs,D),nth0(5,Xs,E),
	tab(15),showE(C),tab(10),showE(D),tab(10),showE(E),nl,
	nth0(6,Xs,F),nth0(7,Xs,G),nth0(8,Xs,H),nth0(9,Xs,I),
	tab(10),showE(F),tab(10),showE(G),tab(10),showE(H),tab(10),showE(I),nl,
	nth0(10,Xs,J),nth0(11,Xs,K),nth0(12,Xs,L),nth0(13,Xs,M),nth0(14,Xs,N),
	tab(5),showE(J),tab(10),showE(K),tab(10),showE(L),tab(10),showE(M),tab(10),showE(N),nl.