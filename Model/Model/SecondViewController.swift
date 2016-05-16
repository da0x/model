//
//  SecondViewController.swift
//  Model
//
//  Created by Daher Alfawares on 5/13/16.
//  Copyright © 2016 Brandon Chow, 2016 Daher Alfawares. All rights reserved.
//

import UIKit

class SecondModel : Model {
    let i = 0
}

class SecondViewModel : ViewModel {
    init(viewModelDelegate:ViewModelDelegate){
        super.init(
            viewModelDelegate: viewModelDelegate,
            models : [SecondModel(),FirstModel()] )
    }
}

class SecondViewController: UIViewController {

    private var viewModel : SecondViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel = SecondViewModel(viewModelDelegate: self)
    }
}


extension SecondViewController : ViewModelDelegate {
    
    func viewModelUpdated(viewModel: ViewModel) {
        // ..
    }
}
