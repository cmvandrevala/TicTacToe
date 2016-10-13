import UIKit

public class MainMenuViewController: UIViewController {

    override public func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let viewController = segue.destination as! GameViewController
        if segue.identifier == "HumanVsHuman" {
            viewController.gameType = .humanVsHuman
        } else if segue.identifier == "HumanVsComputer" {
            viewController.gameType = .humanVsComputer
        } else if segue.identifier == "ComputerVsHuman" {
            viewController.gameType = .computerVsHuman
        }
    }

}

