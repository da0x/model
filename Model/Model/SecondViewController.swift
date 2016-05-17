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
    
    var formattedText : String {
        return "SecondViewModel: \(self.model?.text)"
    }
    
    var model : SecondModel?
    
    init(viewModelDelegate:ViewModelDelegate){
        super.init(
            viewModelDelegate: viewModelDelegate,
            models : [SecondModel.self,FirstModel.self] )
    }
}

class SecondViewController: UIViewController {

    private var viewModel : SecondViewModel?
    
    @IBOutlet weak var dataLoadedText: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = SecondViewModel(viewModelDelegate: self)
    }
    
    @IBAction func loadDataFromServices(sender: AnyObject) {
        FakeServiceDataLoader.secondModelServiceCall()
    }
}


extension SecondViewController : ViewModelDelegate {
    
    func viewModelUpdated() {
        dataLoadedText.text = viewModel?.formattedText
    }
}
