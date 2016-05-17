//3
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
    
    init(firstModelListenerDelegate: ListenerDelegate, key: String) {
        self.refs = []
        self.key = key
        refs.append(WeakRef<Listener>(ref: Listener(group: self, interested: firstModelListenerDelegate)))
    }
    
    func add(modelListenerToAdd: Listener) {
        refs.append(WeakRef<Listener>(ref: modelListenerToAdd))
    }
    
    func notify(newModel model: Model) {
        refs.forEach{$0.reference?.newModel(model)}
    }
    
    func remove(modelListenerToRemove: Listener) {
        refs = refs.filter{ $0.reference !== modelListenerToRemove }
    }
    
    deinit { ModelNotifier.sharedInstance.remove(self)}
}

