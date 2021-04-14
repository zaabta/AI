
boolean solveNQUtil(Board board, int col){
        /* base case: If all queens are placed
           then return true */
        if (col >= board.size)
            return true;
  
        /* Consider this column and try placing
           this queen in all rows one by one */
        for (int i = 0; i < board.size; i++) {
            /* Check if the queen can be placed on
               board[i][col] */
            if (board.isSafe(i, col)) {
                /* Place this queen in board[i][col] */
                board.setQueen(i, col);
  
                /* recur to place rest of the queens */
                if (solveNQUtil(board, col + 1) == true)
                    return true;
  
                /* If placing queen in board[i][col]
                   doesn't lead to a solution then
                   remove queen from board[i][col] */
               board.setQueen(i, col);; // BACKTRACK
            }
        }
  
        /* If the queen can not be placed in any row in
           this colum col, then return false */
        return false;
    }
