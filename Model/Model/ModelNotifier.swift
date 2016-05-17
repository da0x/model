//
//  ModelNotifier.swift
//  Model
//
//  Created by Brandon Chow on 5/13/16.
//  Copyright © 2016 Brandon Chow, 2016 Daher Alfawares. All rights reserved.
//

import Foundation

public class ModelNotifier {
    
    static let sharedInstance = ModelNotifier()
    
    private var listenerGroups = [String : WeakRef<ListenerGroup>]()
    
    public func notify(newModel model: Model) {
        listenerGroups[model.key()]?.reference?.notify(newModel: model)
    }
    
    public func addListenerWithDelegate(forModelType modelType: Model.Type, listenerDelegate: ListenerDelegate) -> Listener {
        let modelTypeKey = "\(modelType)"
        if let group = listenerGroups[modelTypeKey]?.reference {
            return addListenerToExistingGroup(group, newListenerDelegate: listenerDelegate)
        } else {
            return addListenerToNewGroup(listenerDelegate, forModelTypeKey: modelTypeKey)
        }
    }
    
    private func addListenerToExistingGroup(group: ListenerGroup, newListenerDelegate: ListenerDelegate) -> Listener{
        let listener = Listener(group: group, interested: newListenerDelegate)
        group.add(listener)
        return listener
    }
    
    private func addListenerToNewGroup(newListenerDelegate: ListenerDelegate, forModelTypeKey modelTypeKey: String) -> Listener {
        let group = ListenerGroup(key: modelTypeKey)
        let listener = Listener(group: group, interested: newListenerDelegate)
        listenerGroups[modelTypeKey] = WeakRef<ListenerGroup>(ref: group)
        group.add(listener)
        return listener
    }
    
    internal func remove(listenerGroup : ListenerGroup) {
        listenerGroups.removeValueForKey(listenerGroup.key)
    }
}