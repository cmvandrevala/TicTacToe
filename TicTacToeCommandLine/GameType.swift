public enum GameType {
    case humanVsHuman
    case humanVsComputer
    case computerVsHuman
    case computerVsComputer
    case unassigned

    init() {
        self = .unassigned
    }
}
