//
//  NextViewController.swift
//  OverlapLayoutSample
//
//  Created by eita.yamaguchi on 2020/09/11.
//  Copyright © 2020 Eita Yamaguchi. All rights reserved.
//

import UIKit

final class NextViewController: UIViewController {
    
    private let type: ShowType
    private lazy var labelA: UILabel = {
        
        let l = UILabel(frame: CGRect(x: 0, y: 0, width: 160, height: 80))
        l.backgroundColor = .lightGray
        view.addSubview(l)
        l.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: l.topAnchor, constant: 0),
            l.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
        
        return l
    }()

    private lazy var labelB: UILabel = {
        
        let l = UILabel(frame: CGRect(x: 0, y: 0, width: 160, height: 80))
        l.backgroundColor = .lightGray
        view.addSubview(l)
        l.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            l.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            l.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
        
        return l
    }()

    private lazy var labelC: UILabel = {
        
        let l = UILabel(frame: CGRect(x: 0, y: 0, width: 160, height: 80))
        l.backgroundColor = .lightGray
        view.addSubview(l)
        l.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            view.bottomAnchor.constraint(equalTo: l.bottomAnchor, constant: 0),
            l.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
        
        return l
    }()

    init(type: ShowType) {
        self.type = type
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        
        view.backgroundColor = .white

        switch type {
        case .a:
            edgesForExtendedLayout = []
        case .b:
            navigationController?.navigationBar.isTranslucent = true
        case .c:
            navigationController?.navigationBar.isTranslucent = false
        case .d:
            navigationController?.navigationBar.isTranslucent = false
            // default is false
            extendedLayoutIncludesOpaqueBars = true
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        labelA.text = "TOP LABEL"
        labelB.text = "CENTER LABEL"
        labelC.text = "BOTTOM LABEL"
        
    }
    
    @objc func tapped() {
        self.dismiss(animated: true, completion: nil)
    }
}
