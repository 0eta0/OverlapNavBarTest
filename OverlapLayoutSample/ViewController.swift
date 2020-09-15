//
//  ViewController.swift
//  OverlapLayoutSample
//
//  Created by eita.yamaguchi on 2020/09/11.
//  Copyright © 2020 Eita Yamaguchi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    private let element = ["edgesForExtendedLayout: []", "isTranslucent: true", "isTranslucent: false", "isTranslucent: false; OpaqueBars: true"]

    private lazy var tableView: UITableView = {
        let table = UITableView(frame: .zero)
        table.backgroundColor = .white
        // ここを.neverに変えるとNavigationBarの下になる
        table.contentInsetAdjustmentBehavior = .automatic
        table.delegate = self
        table.dataSource = self
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        navigationController?.navigationBar.isTranslucent = false
        extendedLayoutIncludesOpaqueBars = true
        view = tableView
        view.backgroundColor = .white
    }
}

extension ViewController: UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let vc = NextViewController(type: ShowType.allCases[indexPath.row])
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return element.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "elementCell")
        cell.textLabel?.text = element[indexPath.row]
        cell.backgroundColor = .gray
        return cell
    }
}

enum ShowType: CaseIterable {
    case a, b, c, d
}
