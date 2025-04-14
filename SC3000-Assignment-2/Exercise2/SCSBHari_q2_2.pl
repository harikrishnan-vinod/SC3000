/*
FOL

∀X (offspring(queen_elizabeth, X) → priority(X)).
∀X, Y (older(X, Y) → precedes(X, Y)).
succession_line = order(all children by age).
*/

% Facts
offspring(queen_elizabeth, prince_charles).
offspring(queen_elizabeth, princess_ann).
offspring(queen_elizabeth, prince_andrew).
offspring(queen_elizabeth, prince_edward).

% Full birth order knowledge
older(prince_charles, princess_ann).
older(prince_charles, prince_andrew).
older(prince_charles, prince_edward).
older(princess_ann, prince_andrew).
older(princess_ann, prince_edward).
older(prince_andrew, prince_edward).

% Gender info (still useful, though not used in sorting here)
male(prince_charles).
male(prince_andrew).
male(prince_edward).
female(princess_ann).

% Helper: person is child of queen
child(X) :- offspring(queen_elizabeth, X).

% Sorting by birth order only (gender-agnostic)
new_succession_list(OrderedList) :-
    findall(C, child(C), Children),
    order_by_birth(Children, OrderedList).

% Custom sort using older/2
order_by_birth(List, Ordered) :-
    predsort(order_by_age, List, Ordered).

% Compare who is older
order_by_age(<, A, B) :- older(A, B), !.
order_by_age(>, A, B) :- older(B, A), !.
order_by_age(=, _, _).
