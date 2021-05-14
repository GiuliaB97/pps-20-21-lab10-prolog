search(X, [X|_]).
search(X, [_|Xs]):-search(X, Xs).

search2(X, [X,X|_]).
search2(X, [_|Xs]):- search2(X, Xs).

%2.1: search_two
%test: search_two(a, [b, g, a, a, g,h])
search_two(X, [X,_,X|_]).
search_two(X, [_|Xs]):- search_two(X, Xs).

%2.2: search_anytwo
%test: search_anytwo(a [b,a,e,c,a,b]
search_anytwo(X, [X|Xs]):- search(X, Xs).
search_anytwo(X, [_|Xs]):- search_anytwo(X, Xs).

size([],0).
size([_|T], M) :-size(T,N), M is N+1.

%2.2: size2
%test: size2([E], s(zero)).
size2([], zero).
size2([_|T], s(N)):- size2(T, N).

%2.3: sum
%test: sum([10, 20], 30)
sum([], 0).
sum([H|T], M) :- sum(T, N), M is H+N.

%2.4: list, count, sum,avarage
average(L, A) :- avarage(L,0,0,A).
average([], CS,A) := A is S/C.
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
%minMax 
%test minMax( [0,1,2, 3] , 0, 3)
minMax([E], E, E).
minMax([H|T],H,Max) :- minMax(T,Min,Max), H=<Min.
minMax([H|T],Min,Max) :- minMax(T,Min,Max), H>Min, H<Max.
minMax([H|T],Min,H) :- minMax(T,Min,Max), H>=Max.

%3.1 same
%test: same([1, 2], [1, 2])
same([E], [E]).
same([H1| T1], [H2| T2]) :- same(T1, T2), H1==H2.

%3.2 all_bigger: all_bigger( [3, 4], [2,3])
all_bigger([E1], [E2]):- E1>E2.
all_bigger([H1| T1], [H2| T2]):- all_bigger(T1, T2), H1>H2.

%3.3 
%test: sublist([9,1], [ 2,1])
sublist([H1| _], [H2| _]) :- H1==H2.
sublist([H1|_], [_| T2]) :- search(H1, T2).
sublist([_| T1], [_| T2]) :- sublist(T1, T2).

%4.1 seq
seq(0,[]).
seq(N,[0|T]):- N > 0, N2 is N-1, seq(N2,T).

%4.2 seqR:  
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

%EXTRA double
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