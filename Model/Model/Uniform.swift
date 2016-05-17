//
//  State.swift
//  Model
//
//  Created by Daher Alfawares on 5/17/16.
//  Copyright © 2016 Solstice Mobile. All rights reserved.
//

import Foundation

public protocol UniformDelegate {
    func stateChanged(state:Uniform)
}

public class Uniform {
    
    private let delegate : UniformDelegate
    //private let listener : Listener
    
    init(stateDelegate:UniformDelegate){
        delegate = stateDelegate
        
        // ..
        // listerner = Listener(self.dynamicType)
    }
}

