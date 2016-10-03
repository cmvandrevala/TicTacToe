open class MainMenuInputReader: ConsoleInputReader {
    
    public init() {}
    
    open func getInput() -> String? {
        return readLine()
    }
    
}
