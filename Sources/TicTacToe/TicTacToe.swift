public enum Player: Int {
    case cross = 1
    case circle = 0
}

public enum GameState {
    case win(_ winner: Player)
    case draw
    case nextMove
}

/*
 Core idea: Board will be an array
 
 Board with array index
 
 0 | 1 | 2
 -----------
 3 | 4 | 5
 -----------
 6 | 7 | 8
 
 Faster solution: Each move can be represented with binary number for X and O and we can AND the possible win case
 X = 0b100001111
 W = 0b000000111 // Win case for all same across last row.
 ----------------
 & = 0b000000111
 
 Set solution is more readable and more easy to manipulate so, let's keep it that way
 */

public class TicTacToe {
    
    let minimumWinMoves = 4
    let totalMoves = 9
    
    // let's assume 0 is circle and 1 is cross in array, -1 is empty
    public private(set) var board = Array(repeating: -1, count: 9)
    
    private let winIndicesSet: Set<Set<Int>> = [
        [0, 1, 2], [3, 4, 5], [6, 7, 8], // horizontal match indices
        [0, 3, 6], [1, 4, 7], [2, 5, 8], // vertical match indices
        [0, 4, 8], [2, 4, 6] // diagonal match indices
    ]
    
    private(set) var currentMove = 0
    
    public private(set) var crossMoveIndices = Set<Int>()
    public private(set) var circleMoveIndices = Set<Int>()
    public private(set) var allMovesInBoard: [Int] = []
    
    public let firstPlayer: Player
    public let secondPlayer: Player
    
    public init(firstPlayer: Player) {
        self.firstPlayer = firstPlayer
        self.secondPlayer = firstPlayer == .circle ? .cross : .circle
    }
    
    // CORE LOGIC
    public func play(moveIndex: Int) -> GameState {
        // update only if place is empty, -1 is empty, 1 is cross, 0 is circle
        guard board[moveIndex] == -1 else { return .nextMove }
        
        let player =  currentMove % 2 == 0 ? firstPlayer : secondPlayer
        updateBoard(with: moveIndex, player: player)
        guard currentMove > minimumWinMoves else { return .nextMove }
        
        if isWinner(player) { return .win(player) }
        else if currentMove == totalMoves { return .draw }
        else { return .nextMove }
    }
    
    public func reset() -> [Int] {
        board = Array(repeating: -1, count: 9)
        allMovesInBoard.removeAll()
        crossMoveIndices.removeAll()
        circleMoveIndices.removeAll()
        currentMove = 0
        return board
    }
    
    private func updateBoard(with index: Int, player: Player) {
        // update board
        currentMove += 1
        board[index] = player.rawValue
        allMovesInBoard.append(index)
        _ = player == .cross ? crossMoveIndices.insert(index) : circleMoveIndices.insert(index)
    }
    
    private func isWinner(_ player: Player) -> Bool {
        switch player {
        case .cross:
            for winSet in winIndicesSet {
                if winSet.isSubset(of: crossMoveIndices) { return true }
            }
        case .circle:
            for winSet in winIndicesSet {
                if winSet.isSubset(of: circleMoveIndices) { return true }
            }
        }
        return false
    }
    
}
