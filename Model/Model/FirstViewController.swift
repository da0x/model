//
//  FirstViewController.swift
//  Model
//
//  Created by Daher Alfawares on 5/13/16.
//  Copyright © 2016 Brandon Chow, 2016 Daher Alfawares. All rights reserved.
//

import UIKit

class FirstModel : Model {
    
    
}

class FirstViewModel : ViewModel {
    
    init(viewModelDelegate: ViewModelDelegate){
        super.init(viewModelDelegate:viewModelDelegate, models : [FirstModel()])
    }
}

class FirstViewController: UIViewController {

    private var viewModel : FirstViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel = FirstViewModel(viewModelDelegate:self)
    }
}


extension FirstViewController : ViewModelDelegate {
    func viewModelUpdated(viewModel: ViewModel) {
        if viewModel is FirstViewModel {
            
           // ...
        }
    }
}

