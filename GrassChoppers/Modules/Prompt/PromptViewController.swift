//
//  ViewController.swift
//  GrassChoppers
//
//  Created by Developer on 7/30/20.
//  Copyright © 2020 JwitApps. All rights reserved.
//

import SnapKit
import UIKit

class PromptViewController: UIViewController {

    private let titleLabel = UILabel()
    private let subtitleLabel = UILabel()
    
    private let acceptButton = UIButton()
    private let dismissButton = UIButton()
    
    private let logicController: PromptLogicControlling
    
    init(
        logicController: PromptLogicControlling
    ) {
        self.logicController = logicController
        
        super.init(nibName: nil, bundle: nil)
        
        self.logicController.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        setupAppearance()
        setupConstraints()
    }
    
    private func setupAppearance() {
        // title
        titleLabel.text = "title"
        view.addSubview(titleLabel)
                
        // subtitle
        subtitleLabel.text = "subtitle"
        view.addSubview(subtitleLabel)
        
        // accept button
        acceptButton.setTitle("accept", for: .normal)
        acceptButton.setTitleColor(.black, for: .normal)
        acceptButton.backgroundColor = .green
        view.addSubview(acceptButton)
        
        // dismiss button
        dismissButton.setTitle("dismiss", for: .normal)
        dismissButton.setTitleColor(.black, for: .normal)
        view.addSubview(dismissButton)
    }
    
    private func setupConstraints() {
        
        // title
        titleLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        
        // subtitle
        subtitleLabel.snp.makeConstraints { make in
            make.centerX.equalTo(titleLabel.snp.centerX)
            make.top.equalTo(titleLabel.snp.bottom).offset(20)
        }
        
        // accept button
        acceptButton.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(44)
            
            make.centerX.equalToSuperview()
            make.bottom.equalTo(dismissButton.snp.top).offset(-16)
        }
     
        // dismiss button
        dismissButton.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(44)
            
            make.centerX.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-16)
        }
    }
}

extension PromptViewController: PromptLogicControllingDelegate {
    
}
