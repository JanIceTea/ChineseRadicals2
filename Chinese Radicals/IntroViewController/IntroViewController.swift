//
//  IntroViewController.swift
//  Chinese Radicals
//
//  Created by Jan T on 14/10/2018.
//  Copyright © 2018 teatracks. All rights reserved.
//

import UIKit

class IntroViewController: UIViewController {
    
    
    @IBAction func didPressNextButton(_ sender: Any) {
        show(OverViewViewController(), sender: self)
    }
    
}
