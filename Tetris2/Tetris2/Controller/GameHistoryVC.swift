//
//  GameHistoryVC.swift
//  Tetris2
//
//  Created by Sarvar Qosimov on 12/08/23.
//

import UIKit

class GameHistoryVC: UIViewController {

    var tableView: UITableView!
    var history = [Int]()
    var highesScore = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "History"
        history = UserDefaults.standard.array(forKey: "gameHistory") as? [Int] ?? [Int]()
        highesScore = UserDefaults.standard.integer(forKey: "recordUser")
        setupViews()
        }

    func setupViews(){
        tableView = UITableView(frame: CGRect(
            x: 0,
            y: 0,
            width: view.frame.width,
            height: view.frame.height
        ), style: .plain)
        
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.separatorEffect = .none
    }
    
}

extension GameHistoryVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        history.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        if indexPath.row == 0 {
            cell.textLabel?.text = "Last game: \(history[indexPath.row])"
            cell.textLabel?.textColor = .red
        } else {
            cell.textLabel?.text = "\(history[indexPath.row])"
        }
        
        if history[indexPath.row] == highesScore {
            cell.textLabel?.textColor = .systemGreen
        }
        
        cell.textLabel?.textAlignment = .center
        cell.textLabel?.font = UIFont(name: "Chalkboard SE Bold", size: 21)
        cell.selectionStyle = .none

        return cell
    }
    
}
