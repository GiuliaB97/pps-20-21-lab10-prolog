% search(Elem, List)
%test: Yes: search(3, [4,5 ,2, 3, 5]). 		No:search(32, [4,5 ,2, 3, 5]).

% search2Consecutive(Elem, List)
%test: Yes: search2Consecutive(3, [4,5 ,2, 3,3, 5]).		No search2Consecutive(3, [4,5 ,2, 3,9, 3, 5]).

% search2AnyElemBetween(Elem, List)
%test: Yes search2AnyElemBetween(3, [4,5 ,2, 3,0, 3, 5]).	No: search2AnyElemBetween(3, [4,5 ,2, 3, 3, 5]).

% search2Occurence(Elem, List)
%test: Yes: search2Occurence(3, [4,5 ,2, 3,9, 3, 5]). 		No: search2Occurence(3, [4,5 ,2, 3,9, 3, 5]).

% sizeNaturalNumber(List, Size)
%test: Yes sizeNaturalNumber([1,2], s(s(zero))).		No: sizeNaturalNumber([1,2], s(zero)).

% size(List, Size)
%test: Yes: size([1,2], 2).		No: size([1,2], 5).

% sum(List, Sum)
%test: Yes: sum([1,2], 3).		No:  sum([1,2], 6).

% max(List, Max)
%test: Yes: max([1,2, 0], 2).		No:  max([1,2, 0], 1)

% maxMin(List,Max,Min)
%test: Yes: maxMin([1,2, 9, 0], 9, 0). 		No: maxMin([1,2, 9, 0], 3, 0).

% same(List1,List2)
%test: Yes:same([1, 2], [1,2]).		No: same([1, 2], [0,1,2]).

% allBigger(L, L).
%test: Yes:allBigger([11, 22, 33], [0,1,2]).	 No:allBigger([11,0, 22, 33], [0,1,2]).

% sublist(List1,List2)
%test: Yes: sublist([1,2,3,4],[2,3]).		No: sublist([1,2,3,4],[2,3, 5]).

% seq(N,List)
%test: Yes: seq(2, [0,0]). 	No: seq(2, [0,0,0]).

% seqR(N,List)
% test: Yes: seqR(3,[3,2,1,0]).		No: seqR(3, [3,2,1]).

% seqL(N,List)
% test: Yes: seqL(3,[0,1,2,3])		No: seqL(3, [1, 2,3]).

% dropAny(Elem,List,OutList)
%test: Yes: dropAny(3,[0,1,2,3,7], [0,1,2,7]).		No: dropAny( 3,[0,1,2,3,7], [0,1,2,3,7]).

% dropFirst(Elem,List,OutList)
%test: Yes: dropFirst( 3,[0,1,2,3,7,3], [0,1,2,7,3]).		No: dropFirst( 3,[0,1,2,3,7,3], [0,1,2,3,7,3]).

% dropLast(Elem,List,OutList)
%test: Yes: dropLast( 3,[0,1,2,3,7,3], [0,1,2,3,7]).		No: dropLast( 3,[0,1,2,3,7,3], [0,1,2,3,7,3]).

% dropAll(Elem,List,OutList)
%test: Yes: dropAll( 3,[0,1,2,3,7,3], [0,1,2,7]).		No: dropLast( 3,[0,1,2,3,7,3], [0,1,2,3,7,3]).

%EXTRA

%reverse(List, OutList)
%test: Yes: reverse([1,2, 3, 4],[4, 3,2,1]). No: reverse([1,2, 3, 4],[4, 2,1]).


% double
%test: yes double([0, 1],[0,1,0,1]).	double([0, 1, 5],[0,1,5, 0,1, 5]).		no: double([0, 1],[0,1,8, 0,1]).	double([0, 1, 5],[0,1,0,1]).


% times
%test: times([0], 3, [0,0,0]). 	No: times([0], 2, [0,0,0]).

%listFirsts(List1, List2, OutList)
%test: listsFirst([[a,c,d],[b]],[a,b])
