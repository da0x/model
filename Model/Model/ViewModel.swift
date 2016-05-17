//
//  ViewModel.swift
//  Model
//
//  Created by Daher Alfawares on 5/13/16.
//  Copyright © 2016 Brandon Chow, 2016 Daher Alfawares. All rights reserved.
//

import Foundation

public protocol ViewModelDelegate : class {
    func viewModelUpdated()
}

public class ViewModel {
    
    private weak var delegate : ViewModelDelegate?
    
    //In sub-classes, make sure to declare each model that your ViewModel needs to be updated with.
    init(viewModelDelegate: ViewModelDelegate, models: [Model.Type]){
        
        delegate = viewModelDelegate
        
        for model in models {
            
            let viewModelID = String(self.dynamicType)
            let modelID = String(model.dynamicType)
            
            // create listerner for modelID.
            // ..
            // Listener().. etc
            print(viewModelID + " -> " + modelID)
        }
    }
}