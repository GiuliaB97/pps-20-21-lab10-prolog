%1.1
%search(Elem, List)
%test: Yes: search(3, [4,5 ,2, 3, 5]). 		     No:search(32, [4,5 ,2, 3, 5]).
search(X, [_|Xs]):-search(X, Xs).
search(X, [X|_]).

%1.2
%search2(Elem, List)	->	search2Consecutive
%test: Yes: search2(3, [4,5 ,2, 3,3, 5]).		No search2(3, [4,5 ,2, 3,9, 3, 5]).
search2(X, [_|Xs]):- search2(X, Xs).
search2(X, [X,X|_]).

%1.3 search_two(Elem, List)	->	search2AnyElemBetween
%test: search_two(3, [4,5 ,2, 3,0, 3, 5]).	  No: search_two(3, [4,5 ,2, 3, 3, 5]).
search_two(X, [_|Xs]):- search_two(X, Xs).
search_two(X, [X,_,X|_]).

%1.4: search_anytwo(Elem, List)		->	search2Occurence
%test: Yes: search_anytwo(3, [4,5 ,2, 3,9, 3, 5]). 		No: search_anytwo(3, [4,5 ,2, 3,9, 3, 5]).
search_anytwo(X, [_|Xs]):- search_anytwo(X, Xs).
search_anytwo(X, [X|Xs]):- search(X, Xs).

%2.1
%size(List, Size)
%test: Yes: size([1,2], 2).		No: size([1,2], 5).
size([],0).
size([_|T], N):- N2 is N-1, size(T, N2).		%size([_|T], N):- size(T, M2), N is M2+1.
%No, non credo sia fully relational ma solo reasonably relational a causa dell'operatore "is".

%2.2: size2(List,Size)		->	sizeNaturalNumber
%test: Yes: size2([1,2], s(s(zero))).		No: size2([1,2], s(zero)).
size2([], zero).
size2([_|T], s(N)):- size2(T, N).
%Teoricamente credo potrebbe implementare un comportamento pure relational perchè in assenza di "is" non dovrebbero esserci problema di inferenza ed input ed output potrebbero essere scambiati, ma non sono certa di come si comporterebbe S( N).

%2.3: sum
%test: Yes: sum([1,2], 3).		No:  sum([1,2], 6).
sum([], 0).
sum([H|T], N):- N2 is N-H, sum(T, N2). 		%sum([H|T], N):- sum(T, N2), N is N2+H.

%2.5: max
%test: Yes: max([1,2, 0], 2).		No:  max([1,2, 0], 1).
max([E], E).
max([H|T], H) :- max(T,N), H>=N.
max([H|T], N) :- max(T,N), H<N.

%min([2,3],2)
%test: Yes: min([1,2, 0], 0).		No:  min([1,2, 0], 2).
min([E], E).
min([H|T], H) :- min(T,N), H<N.
min([H|T], N) :- min(T,N), H>=N.

%2,6: minMax
%test: Yes: maxMin([1,2, 9, 0], 9, 0). 		No:maxMin([1,2, 9, 0], 3, 0).
%minMax idiomatic
minMax([E], E, E).
minMax([H|T],H,Max) :- minMax(T,Min,Max), H=<Min.		
minMax([H|T],Min,Max) :- minMax(T,Min,Max), H>Min, H<Max.	
minMax([H|T],Min,H) :- minMax(T,Min,Max), H>=Max.		

%minMax not idiomatic
minMax2([E], E, E).
minMax2([H|T], OMin, OMax) :- minMax2(T, Min, Max), H=<Min, OMin=H, OMax=Max.
minMax2([H|T], OMin, OMax) :- minMax2(T, Min, Max), H>Min, H<Max.
minMax2([H|T], OMin, OMax) :- minMax2(T, Min, Max), OMin=Min,H>=OMax, OMax=H.

%3.1 same
%test: Yes:same([1, 2], [1,2]).		No: same([1, 2], [0,1,2]).
same([], []).
same([H|T1], [H|T2]):- same(T1, T2).
%Sì, credo implementi un comportamento pure relational.

%3.2 all_bigger: all_bigger( [3, 4], [2,3])
allBigger([H1|T1], [H2|T2]):- H1>H2,allBigger(T1, T2).
allBigger([E1], [E2]):- E1>E2.

%3.3 sublist(List1,List2)
%test: yes sublist([4, 1,2,3, 5], [0,1,2,3,0]).		no: sublist([4, 5], [0,1,2,3,0]).
sublist([H|T], []).
sublist([H|T1],[H|T2]):-sublist(T1, T2),!.
sublist([H1|T1], [H2|T2]):-sublist(T1, [H2|T2]).          %sublist([H1|T1], [H2|T2]):-sublist(T1, [H2|T2]), !.

%4.1 seq(N,List)
%test: Yes: seq(2, [0,0]). 	No: seq(2, [0,0,0]).
seq(0, []).
seq(N, [0|T]):- N2 is N-1, seq(N2, T).                    %seq(N, [0|T]):-seq(N2, T), N is N2+1.

%4.2 seqR(N,List)
% test: Yes: seqR(3,[3,2,1,0]).		seqR(3, [3,2,1]).
seqR(0, [_]).
seqR(N, [N|T]):- N2 is N-1, seqR(N2, T).	%seqR(N, [N|T]):- seqR(N2, T), N is N2+1.

%4.2 seqR2
% test: Yes: seqR2(3,[0,1,2,3])		seqR2(3, [1, 2,3]).
seqR2(0, [_]).
seqR2(N, [H1, H2|T]):-H1<H2, N2 is N-1, seqR2(N2, [H2|T]). 	%seqR2(N, [H1, H2|T]):-seqL(N2, [H2|T]), H1<H2, N is N2+1.
