import XCTest
@testable import TicTacToe

final class TicTacToeTests: XCTestCase {
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        let game = TicTacToe(firstPlayer: .cross)
        game.play(moveIndex: 1)
        print(game.allMovesInBoard)
        print(game.board)
        ConsoleDebugger.debug(game)
        game.play(moveIndex: 4)
        ConsoleDebugger.debug(game)
    }
}
