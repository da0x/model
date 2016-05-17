//
//  FakeServiceDataLoader.swift
//  Model
//
//  Created by Brandon Chow on 5/16/16.
//  Copyright © 2016 Solstice Mobile. All rights reserved.
//

import Foundation

class FakeServiceDataLoader {

    private static let delayTime = dispatch_time(DISPATCH_TIME_NOW, Int64(0.25 * Double(NSEC_PER_SEC)))

    private static func makeDelay(completion:() -> ()){
        dispatch_after(delayTime, dispatch_get_main_queue()) {
            completion()
        }
    }
    
    static func firstModelServiceCall(){
        makeDelay {
            let fakelyReturnedData = FirstModel(text: "Service updated the First Model")
            ModelNotifier.sharedInstance.notify(newModel: fakelyReturnedData)
        }
    }
    
    static func secondModelServiceCall() {
        makeDelay {
            let fakelyReturnedData = SecondModel(text: "Service updated the Second Model")
            ModelNotifier.sharedInstance.notify(newModel: fakelyReturnedData)
        }
    }
}