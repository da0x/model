//
//  WeakRef.swift
//  Model
//
//  Created by Brandon Chow on 5/13/16.
//  Copyright © 2016 Brandon Chow, 2016 Daher Alfawares. All rights reserved.
//

import Foundation

struct WeakRef <T : AnyObject> {
    weak var reference : T?
    
    init(ref: T) {
        self.reference = ref
    }
}