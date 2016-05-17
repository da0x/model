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
    
    internal func addListener(listener: Listener, forModelType modelType: Model.Type){
        let modelTypeKey = "\(modelType)"
        let group = groupFor(modelTypeKey)
        
        group.add(listener)
        listener.group = group
    }
    
    private func groupFor(modelTypeKey: String) -> ListenerGroup {
        if let group = listenerGroups[modelTypeKey]?.reference {
            return group
        } else {
            let group = ListenerGroup(key: modelTypeKey)
            listenerGroups[modelTypeKey] = WeakRef<ListenerGroup>(ref: group)
            return group
        }
    }
    
    private func addListenerToNewGroup(newListener: Listener, forModelTypeKey modelTypeKey: String){
        let group = ListenerGroup(key: modelTypeKey)
        newListener.group = group
        listenerGroups[modelTypeKey] = WeakRef<ListenerGroup>(ref: group)
        group.add(newListener)
    }
    
    internal func remove(listenerGroup : ListenerGroup) {
        listenerGroups.removeValueForKey(listenerGroup.key)
    }
}

