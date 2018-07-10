//
//  ViewController.swift
//  headtTest
//
//  Created by Jay Kumar on 7/10/18.
//  Copyright © 2018 Jay Kumar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        ServiceClass.getShoping({(catList,rankList)in
            print("cat list : \(catList),\n RankList: \(rankList)")
        })
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

