//
//  Listener.swift
//  Model
//
//  Created by Brandon Chow on 5/13/16.
//  Copyright © 2016 Brandon Chow, 2016 Daher Alfawares. All rights reserved.
//

import Foundation

public protocol ListenerDelegate : class{
    func newModel(model: Model)
}

public class Listener {
    private weak var interested : ListenerDelegate?
    private var group : ListenerGroup?
    
    internal init(group: ListenerGroup?, interested: ListenerDelegate) {
        self.interested = interested
        self.group = group
    }
    
    internal func newModel(model: Model) {
        interested?.newModel(model)
    }
    
    deinit { group?.remove(self) }
}

