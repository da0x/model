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
    
    public func addListenerDelegate(forModelType modelType: Model.Type, delegate: ListenerDelegate) {
        
        if let group = listenerGroups["\(modelType)"]?.reference {
            group.add(Listener(group: group, interested: delegate))
        } else {
            listenerGroups["\(modelType)"] = initWeakListenerGroup(delegate,
                modelTypeString:  "\(modelType)")
        }
    }
    
    
    internal func remove(listenerGroup : ListenerGroup) {
        listenerGroups.removeValueForKey(listenerGroup.key)
    }
    
    private func initWeakListenerGroup(
        listenerDelegate: ListenerDelegate,
        modelTypeString: String)
        -> WeakRef<ListenerGroup> {
            
        let modelListenerGroup = ListenerGroup(
            firstModelListenerDelegate: listenerDelegate,
            key: modelTypeString)
            
        return WeakRef<ListenerGroup>(ref: modelListenerGroup)
    }
}