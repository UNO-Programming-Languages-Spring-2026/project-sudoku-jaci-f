% 9x9 Sudoku Solver

row(1..9).
col(1..9).
num(1..9).

% Each cell has exactly one number
1 { sudoku(X,Y,N) : num(N) } 1 :- row(X), col(Y).

% Respect initial values
sudoku(X,Y,N) :- initial(X,Y,N).
:- initial(X,Y,N1), sudoku(X,Y,N2), N1 != N2.

% Row constraint
:- sudoku(X,Y1,N), sudoku(X,Y2,N), Y1 != Y2.

% Column constraint
:- sudoku(X1,Y,N), sudoku(X2,Y,N), X1 != X2.

% Subgrid definition (3x3 blocks)
subgrid(X,Y,G) :-
    row(X), col(Y),
    G = 1 + ((X-1)/3)*3 + (Y-1)/3.

% Subgrid constraint
:- sudoku(X1,Y1,N), sudoku(X2,Y2,N),
   subgrid(X1,Y1,G), subgrid(X2,Y2,G),
   (X1,Y1) != (X2,Y2).

#show sudoku/3.