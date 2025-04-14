/* FOL

competitor(sumsum, appy).
boss(stevey, appy).
developed(sumsum, galactica_s3).
smart_phone_technology(galactica_s3).
stole(stevey, galactica_s3).
∀X (smart_phone_technology(X) → business(X)).
∀X, Y (competitor(X, Y) → rival(X, Y)).
∀X, Y, Z, W (boss(X, Y) ∧ competitor(W, Y) ∧ developed(W, Z) ∧ stole(X, Z) → unethical(X)).


*/

% Facts
competitor(sumsum, appy).
boss(stevey, appy).
developed(sumsum, galactica_s3).
smart_phone_technology(galactica_s3).
stole(stevey, galactica_s3).

% Rules
business(X) :- smart_phone_technology(X).
rival(X, Y) :- competitor(X, Y).
unethical(X) :- 
    boss(X, Y),
    stole(X, Z),
    business(Z),
    competitor(W, Y),
    developed(W, Z).
