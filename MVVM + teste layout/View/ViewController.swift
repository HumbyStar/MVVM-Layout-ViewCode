//
//  ViewController.swift
//  MVVM + teste layout
//
//  Created by Humberto Rodrigues on 21/01/23.
//

import UIKit

class ViewController: UIViewController {
    
    let viewModel: ViewModel = ViewModel()

    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .clear
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(MyCell.self, forCellReuseIdentifier: "Cell")
        tableView.rowHeight = 250
        tableView.estimatedRowHeight = 250
        tableView.allowsSelection = false
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewCode()
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return self.viewModel.listHuman.count // Esta inacessível porque é private
        return self.viewModel.numberOfRows
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! MyCell
        cell.backgroundColor = .clear
        cell.delegate(delegate: self)
        cell.configure(human: self.viewModel.loadCurrentUser(indexPath: indexPath))
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(self.viewModel.getUserName(indexPath: indexPath))
    }
}

extension ViewController: ViewCode {
    func buildHierarquic() {
        self.view.addSubview(tableView)
    }
    
    func extrasFeatures() {
        tableView.frame = view.frame
        view.backgroundColor = .white
    }
}

extension ViewController: CustomTableViewCellDelegate {
    func tappedButton(_ human: Human) {
        self.viewModel.changeHearthHuman(human: human)
        tableView.reloadData()
    }
    
    
}
