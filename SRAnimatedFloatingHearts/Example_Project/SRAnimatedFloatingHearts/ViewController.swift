//
//  ViewController.swift
//  SRAnimatedFloatingHearts
//
//  Created by coldfin_lb on 2/24/18.
//  Copyright © 2018 coldfin_lb. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var btnFave: UIButton!
    @IBOutlet weak var viewHearts: favouriteHearts!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        btnFave.setImage(#imageLiteral(resourceName: "ic_red"), for: .selected)
        btnFave.setImage(#imageLiteral(resourceName: "ic_white"), for: .normal)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func onClick_Favourite(_ sender: Any) {
        if !btnFave.isSelected{
            //To start heart Animation
            viewHearts.startAnimation()
            btnFave.isSelected = true
        }else{
             //To stop heart Animation
            viewHearts.stopAnimation()
            btnFave.isSelected = false
        }
    }
    

}

