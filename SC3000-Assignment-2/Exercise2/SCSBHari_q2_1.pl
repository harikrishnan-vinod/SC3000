/*
FOL

∀X (offspring(queen_elizabeth, X) ∧ male(X) → priority(X, male_group)).
∀X (offspring(queen_elizabeth, X) ∧ female(X) → priority(X, female_group)).
∀X, Y (older(X, Y) ∧ same_gender(X, Y) → precedes(X, Y)).
succession_order(male_group, then female_group).
succession_line = order(males by age), then (females by age).
*/


% Facts
offspring(queen_elizabeth, prince_charles).
offspring(queen_elizabeth, princess_ann).
offspring(queen_elizabeth, prince_andrew).
offspring(queen_elizabeth, prince_edward).

older(prince_charles, princess_ann).
older(prince_charles, prince_andrew).
older(prince_charles, prince_edward).
older(princess_ann, prince_andrew).
older(princess_ann, prince_edward).
older(prince_andrew, prince_edward).


male(prince_charles).
male(prince_andrew).
male(prince_edward).
female(princess_ann).

% Helper: person is child of queen
child(X) :- offspring(queen_elizabeth, X).

% Sorting by gender and birth order
succession_list(OrderedList) :-
    findall(M, (child(M), male(M)), Males),
    order_by_birth(Males, OrderedMales),
    findall(F, (child(F), female(F)), Females),
    order_by_birth(Females, OrderedFemales),
    append(OrderedMales, OrderedFemales, OrderedList).

% Custom sort using older/2
order_by_birth(List, Ordered) :-
    predsort(order_by_age, List, Ordered).

% Compare who is older
order_by_age(<, A, B) :- older(A, B), !.
order_by_age(>, A, B) :- older(B, A), !.
order_by_age(=, _, _).



