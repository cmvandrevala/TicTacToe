import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textBox: UILabel!
    @IBOutlet weak var textButton: UIButton!


    @IBAction func changeText() {
        let b = Board()
        let p = ConsoleBoard(board: b)
        textBox.text = p.formattedBoardForConsole()
        print(p.formattedBoardForConsole())
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

