//
//  PauseVC.swift
//  Tetris2
//
//  Created by Sarvar Qosimov on 23/06/23.
//

import UIKit

class PauseVC: UIViewController {
   
    @IBOutlet weak var gameOver: UIButton!
    
    var appNameLogo = UILabel()
    var delegate: PauseDelegate?
    var isGameOver = false
    static var currentScore = 0
    var last10History = [Int]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        if isGameOver {
            gameOver.setTitle("Game Over", for: .normal)
            gameOver.isEnabled = false
            gameOver.setTitleColor(.red, for: .normal)
            gameOver.backgroundColor = .lightGray
        } else {
            gameOver.setTitle("Continue", for: .normal)
            gameOver.isEnabled = true
            gameOver.setTitleColor(.white, for: .normal)
            gameOver.backgroundColor = .orange
        }
        
    }

    @IBAction func continuePressed(_ sender: Any) {
        delegate?.continusGame()
        dismiss(animated: false)
    }
    
    @IBAction func restartPressed(_ sender: Any) {
        last10History = UserDefaults.standard.array(forKey: "gameHistory") as? [Int] ?? [Int]()
        
        if last10History.count == 10 {
            last10History.removeLast()
            last10History.insert(PauseVC.currentScore, at: 0)
        } else {
            last10History.insert(PauseVC.currentScore, at: 0)
        }
        
        UserDefaults.standard.set(last10History, forKey: "gameHistory")
        
        delegate?.restartGame()
        dismiss(animated: false)
    }
    
    @IBAction func homePressed(_ sender: Any) {
        last10History = UserDefaults.standard.array(forKey: "gameHistory") as? [Int] ?? [Int]()
        
        if last10History.count == 10 {
            last10History.removeLast()
            last10History.insert(PauseVC.currentScore, at: 0)
        } else {
            last10History.insert(PauseVC.currentScore, at: 0)
        }
        
        UserDefaults.standard.set(last10History, forKey: "gameHistory")
        
        delegate?.backToHome()
        let nc = UINavigationController(rootViewController: HomeVC())
        UIApplication.shared.keyWindow?.rootViewController = nc
    }
    
    func setupViews(){
        view.addSubview(appNameLogo)
        appNameLogo.translatesAutoresizingMaskIntoConstraints = false
        appNameLogo.numberOfLines = 0
        appNameLogo.text = """
                            Tetris
                                Turbo
                            """
        appNameLogo.font = UIFont(name: "Noteworthy Bold", size: 33)
        appNameLogo.textColor = #colorLiteral(red: 0.8135325313, green: 1, blue: 0, alpha: 1)
        NSLayoutConstraint.activate([
            appNameLogo.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            appNameLogo.topAnchor.constraint(equalTo: view.topAnchor, constant: 50)
        ])
    }
    
}
