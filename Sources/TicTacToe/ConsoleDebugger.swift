//
//  ConsoleDebugger.swift
//  
//
//  Created by Nutan Niraula on 23/7/23.
//

public enum ConsoleDebugger {
    /*
     0 | 1 | 2
    -----------
     3 | 4 | 5
    -----------
     6 | 7 | 8
    */
    
    public static func debug(_ game: TicTacToe) {
        #if DEBUG
        func getSymbol(for player: Int) -> String {
            switch player {
            case 1:
                return "X"
            case 0:
                return "O"
            default:
                return " "
            }
        }
        
        let index0 = getSymbol(for: game.board[0])
        let index1 = getSymbol(for: game.board[1])
        let index2 = getSymbol(for: game.board[2])
        let index3 = getSymbol(for: game.board[3])
        let index4 = getSymbol(for: game.board[4])
        let index5 = getSymbol(for: game.board[5])
        let index6 = getSymbol(for: game.board[6])
        let index7 = getSymbol(for: game.board[7])
        let index8 = getSymbol(for: game.board[8])
        print("******************************** \n")
        print("Turn \(game.currentMove):")
        if game.currentMove % 2 == 1 {
            print("\(game.firstPlayer == .cross ? "X" : "O") moved to \(game.allMovesInBoard.last!)")
        } else {
            print("\(game.secondPlayer == .cross ? "X" : "O") moved to \(game.allMovesInBoard.last!)")
        }
        print(
        """
        \n
             \(index0) | \(index1) | \(index2)       0 | 1 | 2
            -----------     -----------
             \(index3) | \(index4) | \(index5)       3 | 4 | 5
            -----------     -----------
             \(index6) | \(index7) | \(index8)       6 | 7 | 8
        \n
        """
        )
        print("********************************")
        #endif
    }
    
}

