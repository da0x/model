//
//  ListenerGroup.swift
//  Model
//
//  Created by Brandon Chow on 5/13/16.
//  Copyright © 2016 Brandon Chow, 2016 Daher Alfawares. All rights reserved.
//

import Foundation

class ListenerGroup {
    var refs : [WeakRef<Listener>]
    let key  : String
    
    init(firstModelListener: Listener, key: String) {
        refs = [WeakRef<Listener>(ref: firstModelListener)]
        self.key = key
    }
    
    func add(ModelListenerToAdd: Listener) {
        refs.append(WeakRef<Listener>(ref: ModelListenerToAdd))
    }
    
    func notify(newModel model: Model) {
        refs.forEach{$0.reference?.newModel(model)}
    }
    
    func remove(modelListenerToRemove: Listener) {
        refs = refs.filter{ $0.reference !== modelListenerToRemove }
    }
    
    deinit { Notifier.sharedInstance.remove(self)}
}

