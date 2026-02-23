% 4x4 Sudoku with subgrid facts

row(1..4).
col(1..4).
num(1..4).

% Each cell has exactly one number
1 { sudoku(X,Y,N) : num(N) } 1 :- row(X), col(Y).

% Respect initial values
sudoku(X,Y,N) :- initial(X,Y,N).
:- initial(X,Y,N1), sudoku(X,Y,N2), N1 != N2.

% Row constraint
:- sudoku(X,Y1,N), sudoku(X,Y2,N), Y1 != Y2.

% Column constraint
:- sudoku(X1,Y,N), sudoku(X2,Y,N), X1 != X2.

% --- Subgrid definitions (2x2 blocks) ---
subgrid(X,Y,1) :- row(X), col(Y), X <= 2, Y <= 2.
subgrid(X,Y,2) :- row(X), col(Y), X <= 2, Y >= 3.
subgrid(X,Y,3) :- row(X), col(Y), X >= 3, Y <= 2.
subgrid(X,Y,4) :- row(X), col(Y), X >= 3, Y >= 3.

#show sudoku/3.
#show subgrid/3.