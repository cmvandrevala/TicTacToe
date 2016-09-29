import Quick
import Nimble
import TTTSwift

class MockInputReader: ConsoleInputReader {
    
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
    
    var hasBeenPlayed = false
    var firstPlayer: Player!
    var secondPlayer: Player!
    
    func play(_ playerOne: Player, playerTwo: Player) {
        firstPlayer = playerOne
        secondPlayer = playerTwo
        hasBeenPlayed = true
    }
    
    func clear() {
        hasBeenPlayed = false
    }
    
    func playerOne() -> Player {
        return firstPlayer
    }
    
    func playerTwo() -> Player {
        return secondPlayer
    }
    
}

class MainMenuTests: QuickSpec {
    override func spec() {
        
        describe("interpreting user input") {
            
            it("starts a new game if a user selects option 1") {
                let inputReader = MockInputReader(mockOutputString: "1")
                let menu = MainMenu(userInputReader: inputReader)
                let game = MockGame()
                
                menu.start(game)
                
                expect(game.hasBeenPlayed).to(beTrue())
            }
            
            it("plays human vs human if a user selects option 1") {
                let inputReader = MockInputReader(mockOutputString: "1")
                let menu = MainMenu(userInputReader: inputReader)
                let game = MockGame()
                
                menu.start(game)
                let p1 = Mirror(reflecting: game.playerOne())
                let p2 = Mirror(reflecting: game.playerTwo())

                expect(p1.subjectType == HumanPlayer.self).to(beTrue())
                expect(p2.subjectType == HumanPlayer.self).to(beTrue())
            }
            
            it("starts a new game if a user selects option 2") {
                let inputReader = MockInputReader(mockOutputString: "2")
                let menu = MainMenu(userInputReader: inputReader)
                let game = MockGame()
                
                menu.start(game)
                
                expect(game.hasBeenPlayed).to(beTrue())
            }
            
            it("plays human vs computer if a user selects option 2") {
                let inputReader = MockInputReader(mockOutputString: "2")
                let menu = MainMenu(userInputReader: inputReader)
                let game = MockGame()
                
                menu.start(game)
                let p1 = Mirror(reflecting: game.playerOne())
                let p2 = Mirror(reflecting: game.playerTwo())
                
                expect(p1.subjectType == HumanPlayer.self).to(beTrue())
                expect(p2.subjectType == FirstAvailableSpotComputerPlayer.self).to(beTrue())
            }
            
            it("starts a new game if a user selects option 3") {
                let inputReader = MockInputReader(mockOutputString: "3")
                let menu = MainMenu(userInputReader: inputReader)
                let game = MockGame()
                
                menu.start(game)
                
                expect(game.hasBeenPlayed).to(beTrue())
            }
            
            it("plays computer vs human if a user selects option 3") {
                let inputReader = MockInputReader(mockOutputString: "3")
                let menu = MainMenu(userInputReader: inputReader)
                let game = MockGame()
                
                menu.start(game)
                let p1 = Mirror(reflecting: game.playerOne())
                let p2 = Mirror(reflecting: game.playerTwo())
                
                expect(p1.subjectType == FirstAvailableSpotComputerPlayer.self).to(beTrue())
                expect(p2.subjectType == HumanPlayer.self).to(beTrue())
            }

            it("does not start a new game if the player no longer wants to play") {
                let inputReader = MockInputReader(mockOutputString: "4")
                let menu = MainMenu(userInputReader: inputReader)
                let game = MockGame()
                
                menu.start(game)
                
                expect(game.hasBeenPlayed).to(beFalse())
            }
            
        }
        
    }
}
