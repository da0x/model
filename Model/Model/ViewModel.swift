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

protocol ViewModel : ListenerDelegate {
    var delegate : ViewModelDelegate? { get }
    
    func newModel(model: Model)
}

class DefaultViewModel : ViewModel {
    private(set) var delegate : ViewModelDelegate?
    private(set) var models : [String : Model]
    init(viewModelDelegate: ViewModelDelegate, modelTypes: [Model.Type]){
        delegate = viewModelDelegate
        self.models = [:]
        for model in modelTypes {
            ModelNotifier.sharedInstance.addListenerDelegate(forModelType: model, delegate: self)
        }
    }
    
    func newModel(model: Model) {
        models[model.key()] = model
    }
}