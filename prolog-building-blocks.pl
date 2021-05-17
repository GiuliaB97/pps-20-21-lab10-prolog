%1.1
%search
search(X, [X|_]).
search(X, [_|Xs]):-search(X, Xs).

%1.2
%search2
search2(X, [X,X|_]).
search2(X, [_|Xs]):- search2(X, Xs).

%1.3 search_two
%test: search_two(a, [b, g, a, a, g,h])
search_two(X, [X,_,X|_]).
search_two(X, [_|Xs]):- search_two(X, Xs).

%1.4: search_anytwo
%test: search_anytwo(a [b,a,e,c,a,b]
search_anytwo(X, [X|Xs]):- search(X, Xs).
search_anytwo(X, [_|Xs]):- search_anytwo(X, Xs).

%2.1
%size:
size([],0).
size([_|T], M) :-size(T,N), M is N+1.
%No, non credo sia fully relational ma solo reasonably relational a causa dell'operatore "is".

%2.2: size2
%test: size2([E], s(zero)).
size2([], zero).
size2([_|T], s(N)):- size2(T, N).
%Teoricamente credo potrebbe implementare un comportamento pure relational perchè in assenza di "is" non dovrebbero esserci problema di inferenza ed input ed output potrebbero essere scambiati, ma non sono certa di come si comporterebbe S( N).

%2.3: sum
%test: sum([10, 20], 30)
sum([], 0).
sum([H|T], M) :- sum(T, N), M is H+N.

%2.4: 
%average(list, count, sum,avarage).
average(L, A) :- avarage(L,0,0,A).
average([], CS,A) :- A is S/C.
average([X|Xs], C, S, A) :-
	C2 is C + 1,
	S2 is S + X,
	average(Xs, C2, S2, A).

%2.5: max
%test: max([2,3],3)
max([E], E).
max([H|T], H) :- max(T,N), H>=N.
max([H|T], N) :- max(T,N), H<N.

%min([2,3],2)
min([E], E).
min([H|T], H) :- min(T,N), H<N.
min([H|T], N) :- min(T,N), H>=N.

%2,6: minMax
%test minMax( [0,1,2, 3] , 0, 3)
%minMax idiomatic
minMax([E], E, E).
minMax([H|T],H,Max) :- minMax(T,Min,Max), H=<Min.		%Min must be updated
minMax([H|T],Min,Max) :- minMax(T,Min,Max), H>Min, H<Max.	%Min and Max must not be updated
minMax([H|T],Min,H) :- minMax(T,Min,Max), H>=Max.		%Max must be updated

%minMax not idiomatic
minMax2([E], E, E).
minMax2([H|T], OMin, OMax) :- minMax2(T, Min, Max), H=<Min, OMin=H, OMax=Max.
minMax2([H|T], OMin, OMax) :- minMax2(T, Min, Max), H>Min, H<Max.
minMax2([H|T], OMin, OMax) :- minMax2(T, Min, Max), OMin=Min,H>=OMax, OMax=H.

%3.1 same
%test: same([1, 2], [1, 2])
same([E], [E]).
same([H1| T1], [H2| T2]) :- same(T1, T2), H1==H2.
%Sì, credo implementi un comportamento pure relational.

%3.2 all_bigger: all_bigger( [3, 4], [2,3])
all_bigger([E1], [E2]):- E1>E2.
all_bigger([H1| T1], [H2| T2]):- all_bigger(T1, T2), H1>H2.

%3.3 
%test: sublist([4, 1,2,3, 5], [0,1,2,3,0]).
sublist([],_ ).
sublist([H|T1], [H|T2]) :- sublist(T1, T2). 		%positive case: H is the same element in both list
sublist([H1|T1], [_| T2]) :- sublist([H1|T1], T2). 	%intermediate case: compares all the element of the second list with the head of the first
sublist([H1|T1], [_| T2]) :- sublist(T1, T2).		%the sublist could be in the middle therefore I need to update the head of the list in the first list

%4.1 seq
seq(0,[]).
seq(N,[0|T]):- N > 0, N2 is N-1, seq(N2,T).

%4.2 seqR: 												TO FIX 
%test: seqR(4,[4,3,2,1,0]).
seqR(0,[]).
seqR(N,_):- X is N-1, append([N],_,_), seqR(X,_).

%4.2 seqR2
%test: seqL(4,[0,1,2,3,4]).
seqL(0,[]).
seqL(N,_, T):-N > 0, N2 is N-1, T2 is T+1, append([T2],_,_), seqR(N2,_, T2).

%EXTRA inv
%test: inv([0,1],[1,0])
inv(E, E).
inv([H|T], Rev):- inv(T, Rs), append(Rs, [H], Rev).

%EXTRA double												TO FIX
%test: double([0, 1],[0,1,0,1])
double([E], [E, E]).
double([_|_], Doubled) :-  append(_, [_], Doubled).

%EXTRA times
%test: times([0], 3, [0,0,0])
times(_, 0, []).								%if the list must be copied 0 times, it does not matter, which list it is taken as "input", it will always unifies with the empty list.
times(Xs, N, Ys) :- N > 0, N1 is N-1, times(Xs, N1, Ys2), append(Xs, Ys2, Ys).	%Ys2:list copied so far

%EXTRA proj
%test: proj([[a,c,d],[b]],[a,b])
proj([], []).
proj([[H|T] | Xs], [H|T2]) :-proj( Xs, T2). 
