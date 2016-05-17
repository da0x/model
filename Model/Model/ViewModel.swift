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

protocol ViewModelProtocol : ListenerDelegate {
    var delegate : ViewModelDelegate? { get }
    
    func newModel(model: Model)
}

class ViewModel : ViewModelProtocol {
    private(set) var delegate : ViewModelDelegate?
    private(set) var listeners : [String : Listener]
    private(set) var models : [String : Model]
    init(viewModelDelegate: ViewModelDelegate, modelTypes: [Model.Type]){
        delegate = viewModelDelegate
        self.listeners = [:]
        self.models = [:]
        for model in modelTypes {
            listeners[model.key()] = Listener(interested: self, forModel: model)
        }
    }
    
    func newModel(model: Model) {
        models[model.key()] = model
        delegate?.viewModelUpdated()
    }
}