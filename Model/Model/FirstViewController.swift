//
//  FirstViewController.swift
//  Model
//
//  Created by Daher Alfawares on 5/13/16.
//  Copyright © 2016 Brandon Chow, 2016 Daher Alfawares. All rights reserved.
//

import UIKit

struct FirstModel : Model {
    var text: String
    
    init(text: String = "Initially loaded by FirstViewController.") {
        self.text = text
    }
}

class FirstViewModel : ViewModel {
    
    var formattedText : String {
        return "FirstViewModel: \(self.model?.text ?? "")"
    }
    
    var model : FirstModel? {
        return models[FirstModel.key()] as? FirstModel
    }
    
    init(viewModelDelegate:ViewModelDelegate){
        super.init(
            viewModelDelegate: viewModelDelegate,
            modelTypes : [FirstModel.self] )
    }
}

class FirstViewController: UIViewController {
    
    private var viewModel : FirstViewModel?
    
    @IBOutlet weak var dataLoadedText: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = FirstViewModel(viewModelDelegate: self)
    }
    
    @IBAction func loadFirstModelDataFromServices(sender: AnyObject) {
        FakeServiceDataLoader.firstModelServiceCall("Daher")
    }
    
    @IBAction func loadSecondModelDataFromServices(sender: AnyObject) {
        FakeServiceDataLoader.secondModelServiceCall("Daher")
    }
}


extension FirstViewController : ViewModelDelegate {
    
    func viewModelUpdated() {
        dataLoadedText.text = viewModel?.formattedText
    }
}

