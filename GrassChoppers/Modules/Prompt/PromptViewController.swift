//
//  ViewController.swift
//  GrassChoppers
//
//  Created by Developer on 7/30/20.
//  Copyright © 2020 JwitApps. All rights reserved.
//

import UIKit

class PromptViewController: UIViewController {

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
    }
}

extension PromptViewController: PromptLogicControllingDelegate {
    
}
