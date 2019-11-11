//
//  ViewController.swift
//  RXSwift_Basic
//
//  Created by Praveenkumar on 11/11/19.
//  Copyright © 2019 Praveen. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {
    
    @IBOutlet weak var personTableView: UITableView!
    
    fileprivate let people: BehaviorRelay<[Person]> = BehaviorRelay(value: [
        Person(name: "Spiderman", title: "Marvel"),
        Person(name: "Batman", title: "DC"),
        Person(name: "Mickey", title: "Disney")
    ])
    
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        people.bind(to: personTableView.rx.items(cellIdentifier: "PersonCell")) { row, model, cell in
            cell.textLabel?.text = "\(model.name) from \(model.title)"
        }.disposed(by: disposeBag)
        
        print(isPalindrome(inputString: "12321"))
    }
    
    //TODO: Functions
    func isPalindrome(inputString: String) -> Bool {
        let stringLength = inputString.count
        var position = 0
        
        while position < stringLength / 2 {
            let startIndex = inputString.index(inputString.startIndex, offsetBy: position)
            let endIndex = inputString.index(inputString.endIndex, offsetBy: -position - 1)
            
            if inputString[startIndex] == inputString[endIndex] {
                position += 1
            } else {
                return false
            }
        }
        
        return true
    }
}


struct Person {
    var name: String
    var title: String
}
