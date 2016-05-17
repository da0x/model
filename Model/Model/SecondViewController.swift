//
//  SecondViewController.swift
//  Model
//
//  Created by Daher Alfawares on 5/13/16.
//  Copyright © 2016 Brandon Chow, 2016 Daher Alfawares. All rights reserved.
//

import UIKit

struct SecondModel : Model {
    var text: String
    
    init(text: String = "Initially loaded by SecondViewController.") {
        self.text = text
    }
}

class SecondViewModel : ViewModel {
    
    var formattedFirstDataModelText : String {
        return "\(firstModel?.text ?? "")"
    }
    
    var formattedSecondDataModelText : String {
        return "\(secondModel?.text ?? "")"
    }
    
    var firstModel : FirstModel? {
        return models[FirstModel.key()] as? FirstModel
    }
    
    var secondModel : SecondModel? {
        return models[SecondModel.key()] as? SecondModel
    }
    
    init(viewModelDelegate:ViewModelDelegate){
        super.init(
            viewModelDelegate: viewModelDelegate,
            modelTypes : [SecondModel.self,FirstModel.self] )
    }
}

class SecondViewController: UIViewController {

    private var viewModel : SecondViewModel?
    @IBOutlet weak var firstModelDataLoadedText: UILabel!
    @IBOutlet weak var secondModelDataLoadedText: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = SecondViewModel(viewModelDelegate: self)
    }
    
    @IBAction func loadFirstModelDataFromServices(sender: AnyObject) {
        FakeServiceDataLoader.firstModelServiceCall("Scott")
    }
    
    @IBAction func loadSecondModelDataFromServices(sender: AnyObject) {
        FakeServiceDataLoader.secondModelServiceCall("Scott")
    }
}


extension SecondViewController : ViewModelDelegate {
    
    func viewModelUpdated() {
        firstModelDataLoadedText.text = viewModel?.formattedFirstDataModelText
        secondModelDataLoadedText.text = viewModel?.formattedSecondDataModelText
    }
}
