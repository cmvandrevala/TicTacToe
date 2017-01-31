import Foundation

open class NetworkComputerPlayer: Player {
    
    public init() {}
    
    public let urlString = "https://dry-wave-85958.herokuapp.com/api/get_move"
    public let boardKey = "board"
    
    public func makeMove(game: Game) {
        if(game.isInProgress()) {
            let url = createUrl(game: game)
            print(url)
            let config = URLSessionConfiguration.default
            let session = URLSession(configuration: config)
            
            let task = session.dataTask(with: url, completionHandler: {
                (data, response, error) in
                if error != nil {
                    print(error!.localizedDescription)
                } else {
                    do {
                        if let json = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? [String: Any] {
                            let cellIndex = json["move"] as! Int
                            print("XXXXXXXXXXXX")
                            print(cellIndex)
                            print("XXXXXXXXXXXX")
                            game.takeTurn(cellIndex: cellIndex)
                        }
                    } catch {
                        print("Error in JSONSerialization")
                    }
                }
            })
            
            task.resume()
        }
    }
    
    fileprivate func createUrl(game: Game) -> URL {
        let boardValue = game.gameBoard.currentBoardJSON()
        var urlComponents = URLComponents(string: urlString)!
        urlComponents.queryItems = [URLQueryItem(name: boardKey, value: boardValue)]
        return urlComponents.url!
    }
    
}
