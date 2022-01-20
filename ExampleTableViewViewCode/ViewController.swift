//
//  ViewController.swift
//  ExampleTableViewViewCode
//
//  Created by Victor Feitosa on 20/01/22.
//

import UIKit

class ViewController: UIViewController {

    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.allowsMultipleSelection = true
        tableView.dataSource = self
        tableView.delegate = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        
        view.addSubview(tableView)
        constraintTableview()
        
        getApi()
    }
    
    private var data: [String] = []
    
    private func constraintTableview(){
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func getApi(){
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(2), execute: { [weak self] in
            self?.data.append("Victor")
            self?.data.append("Wesley")
            self?.data.append("Kelvin")
            self?.data.append("Washington")
            self?.data.append("Nirene")
//            self?.tableView.reloadData()
            self?.tableView.reloadSections(IndexSet(integer: 1), with: .fade)
            
        })
    }

}

extension ViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 3
        }
        return data.count
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "UITableViewCell")
        
        if indexPath.section == 0 {
            cell.textLabel?.text = "Celula \(indexPath.section) \(indexPath.item)"
        }else{
            let model = data[indexPath.row]
            cell.textLabel?.text = model
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 1, !data.isEmpty {
            return "MInha lista"
        }
        return nil
    }
    
    
//    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
//        return "Aqui é o rodapé"
//    }
    
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(tableView.indexPathsForSelectedRows)
    }
    
    func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        return indexPath.item % 2 == 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 70
    }
    
//    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
//        return 50
//    }
}
