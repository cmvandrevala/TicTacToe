public enum GameType {
    case humanVsHuman
    case humanVsComputer
    case computerVsHuman
    case computerVsComputer

    init() {
        self = .computerVsComputer
    }
}
