//
//  ModelNotifier.swift
//  Model
//
//  Created by Brandon Chow on 5/13/16.
//  Copyright © 2016 Brandon Chow, 2016 Daher Alfawares. All rights reserved.
//

import Foundation

class Notifier {
    
    static let sharedInstance = Notifier()
    
    private var listenerGroups = [String : WeakRef<ListenerGroup>]()
    
    func notify(keyForListeners: String, newModel model: Model) {
        listenerGroups[keyForListeners]?.reference?.notify(newModel: model)
    }
    
    func addListener(
        listener: Listener,
        forModelIdentifier modelIdentifier: String) {
        
        if let group = listenerGroups[modelIdentifier]?.reference {
            group.add(listener)
        } else {
            listenerGroups[modelIdentifier] = initWeakListenerGroup(listener,
                modelIdentifier:  modelIdentifier)
        }
    }
    
    private func initWeakListenerGroup(
        listener: Listener,
        modelIdentifier: String)
        -> WeakRef<ListenerGroup> {
            
        let modelListenerGroup = ListenerGroup(
            firstModelListener: listener,
            key: modelIdentifier)
            
        return WeakRef<ListenerGroup>(ref: modelListenerGroup)
    }
    
    func remove(listenerGroup : ListenerGroup) {
        listenerGroups.removeValueForKey(listenerGroup.key)
    }
}