import Quick
import Nimble
import TicTacToeCommandLine

class MockInputReader: InputReader {
    
    var mockValue: String
    var playerWantsToPlay = true
    
    init(mockOutputString: String) {
        mockValue = mockOutputString
    }
    
    func getInput() -> String? {
        if playerWantsToPlay {
            playerWantsToPlay = false
            return mockValue
        } else {
            return "4"
        }
    }
    
}

class MockGame: TwoPlayerGame {
    
    public var playCount = 0

    public var firstPlayerType: Player = FirstAvailableSpotComputerPlayer()
    public var secondPlayerType: Player = FirstAvailableSpotComputerPlayer()

    func play() {
        playCount += 1
    }

    func clear() {}

    func isInProgress() -> Bool {
        return true
    }
    
}

class MainMenuTests: QuickSpec {
    override func spec() {
        
        describe("interpreting user input") {

            var game: TwoPlayerGame!

            beforeEach {
                game = MockGame()
            }

            it("starts a new game if a user selects option 1") {
                let inputReader = MockInputReader(mockOutputString: "1")
                let menu = MainMenu(userInputReader: inputReader)

                menu.start(game: game)
                
                expect(game.playCount).to(equal(1))
            }
            
            it("plays human vs human if a user selects option 1") {
                let inputReader = MockInputReader(mockOutputString: "1")
                let menu = MainMenu(userInputReader: inputReader)
                
                menu.start(game: game)
                let p1 = Mirror(reflecting: game.firstPlayerType)
                let p2 = Mirror(reflecting: game.secondPlayerType)

                expect(p1.subjectType == HumanPlayer.self).to(beTrue())
                expect(p2.subjectType == HumanPlayer.self).to(beTrue())
            }
            
            it("starts a new game if a user selects option 2") {
                let inputReader = MockInputReader(mockOutputString: "2")
                let menu = MainMenu(userInputReader: inputReader)
                
                menu.start(game: game)
                
                expect(game.playCount).to(equal(1))
            }
            
            it("plays human vs computer if a user selects option 2") {
                let inputReader = MockInputReader(mockOutputString: "2")
                let menu = MainMenu(userInputReader: inputReader)
                
                menu.start(game: game)
                let p1 = Mirror(reflecting: game.firstPlayerType)
                let p2 = Mirror(reflecting: game.secondPlayerType)
                
                expect(p1.subjectType == HumanPlayer.self).to(beTrue())
                expect(p2.subjectType == FirstAvailableSpotComputerPlayer.self).to(beTrue())
            }
            
            it("starts a new game if a user selects option 3") {
                let inputReader = MockInputReader(mockOutputString: "3")
                let menu = MainMenu(userInputReader: inputReader)
                
                menu.start(game: game)
                
                expect(game.playCount).to(equal(1))
            }
            
            it("plays computer vs human if a user selects option 3") {
                let inputReader = MockInputReader(mockOutputString: "3")
                let menu = MainMenu(userInputReader: inputReader)
                
                menu.start(game: game)
                let p1 = Mirror(reflecting: game.firstPlayerType)
                let p2 = Mirror(reflecting: game.secondPlayerType)
                
                expect(p1.subjectType == FirstAvailableSpotComputerPlayer.self).to(beTrue())
                expect(p2.subjectType == HumanPlayer.self).to(beTrue())
            }

            it("does not start a new game if the player no longer wants to play") {
                let inputReader = MockInputReader(mockOutputString: "4")
                let menu = MainMenu(userInputReader: inputReader)
                
                menu.start(game: game)
                
                expect(game.playCount).to(equal(0))
            }
            
        }
        
    }
}
