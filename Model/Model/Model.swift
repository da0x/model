//
//  Model.swift
//  Model
//
//  Created by Daher Alfawares on 5/13/16.
//  Copyright © 2016 Brandon Chow, 2016 Daher Alfawares. All rights reserved.
//

import Foundation

public protocol Model { }

extension Model {
    func key() -> String {
        return "\(self.dynamicType)"
    }
}

