import Quick
import Nimble
import TTTSwift

class MockInputReader: ConsoleInputReader {
    
    var mockValue: String
    
    init(mockOutputString: String) {
        mockValue = mockOutputString
    }
    
    func getInput() -> String? {
        return mockValue
    }
    
}

class MainMenuTests: QuickSpec {
    override func spec() {
        
        describe("interpreting user input") {
            
            it("ends the game if the player no longer wants to play") {
                let inputReader = MockInputReader(mockOutputString: "4")
                let menu = MainMenu(userInputReader: inputReader)

                menu.start()
                
                expect(menu.humanPlayer.wantsToContinuePlaying).to(beFalse())
            }
            
        }
        
    }
}
