//
//  ViewController.swift
//  SingleDogDaily
//
//  Created by Tommy on 2016/10/31.
//  Copyright © 2016年 Tommy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // default value type assign
        let label = "label width is "
        // visible value type assign
        let width:Double = 70.0
        let widthLabel = label + String(width)
        print(widthLabel)
        
        let dataArray = [1,2,3,4,5]
        var total = 0
        for item in dataArray {
            total += item;
            if item > 3 {
                print(String(item) + " is larger than 3.")
            } else {
                print(String(item) + "not!")
            }
        }
        
        var n = 2
        while n < 150 {
            n = n * 2
            print(String(n))
        }
        
        // traversal
        for item in 1...5 {
            print(item)
        }
        
        print(meet(name: "Bob", launch: "dumpling"))
        
        // use function as return value
        func makeIncrementer() -> ((Int) -> Int) {
            func addOne (number : Int) -> Int {
                return number + 1
            }
            return addOne
        }
        let incrementer = makeIncrementer()
        print(incrementer(7))
        
        // call another swift file
        let networkMananger = NetworkManager()
        networkMananger.login(userName: "Tommy", password: "xxxxxx")
        
        // enum could has its own public method
        enum Rank: Int {
            case Ace = 1
            case Two, Three, Four, Five, Six, Seven, Eight, Nine, Ten
            case Jack, Queen, King
            func simpleDescription() -> String {
                switch self {
                case .Ace:
                    return "Rank." + "Ace"
                case .Jack:
                    return "Rank." + "Jack"
                case .Queen:
                    return "Rank." + "Queen"
                case .King:
                    return "Rank." + "King"
                default:
                    return "Rank." + String(self.rawValue)
                }
            }
        }
        
        let ace = Rank.Ace
        print(ace.simpleDescription())
        
        // optional unwrapped && implicitly unwrapped optionals
        let visiableValue: String? = "asdf"
        print("visiableValue : \(visiableValue!)")
        
        // assert
        let age = 1
        assert(age >= 0, "A person's age can't be less than zero.")
        
        // collection enumerate
        let names:[String] = ["one", "two", "three", "four", "five"]
        for (index, value) in names.enumerated() {
            print("index:\(index), value:\(value)")
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func meet(name:String, launch:String) -> String {
        return "hello \(name), would you like to eat \(launch) today?"
    }
    
}
