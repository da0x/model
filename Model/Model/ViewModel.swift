//
//  ViewModel.swift
//  Model
//
//  Created by Daher Alfawares on 5/13/16.
//  Copyright © 2016 Brandon Chow, 2016 Daher Alfawares. All rights reserved.
//

import Foundation

public protocol ViewModelDelegate : class {
    func viewModelUpdated( viewModel : ViewModel )
}

public class ViewModel {
    
    private weak var delegate : ViewModelDelegate?
    
    init(viewModelDelegate: ViewModelDelegate, models: [Model]){
        // ..
        // Listener().. etc
        
        delegate = viewModelDelegate
        print("\(models)")
    }
}