//
//  FirstViewController.swift
//  Zfben
//
//  Created by Ben on 2014-06-09.
//  Copyright (c) 2014 Ben. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
                            
  @IBOutlet var imageLogo : UIImageView = nil
  @IBOutlet var labelName : UILabel = nil
  @IBAction func buttonPostClick(sender : AnyObject) {
    tabBarController.selectedIndex = 1
  }
  @IBAction func buttonTarotClick(sender : AnyObject) {
    tabBarController.selectedIndex = 2
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    imageLogo.layer.cornerRadius = 80
    imageLogo.clipsToBounds = true
  }
  
  override func viewDidAppear(animated: Bool){
    if(UIInterfaceOrientationIsLandscape(self.interfaceOrientation)){
      didRotateFromInterfaceOrientation(self.interfaceOrientation)
    }
  }

  override func didRotateFromInterfaceOrientation(fromInterfaceOrientation: UIInterfaceOrientation) {
    if(UIInterfaceOrientationIsLandscape(self.interfaceOrientation)){
      imageLogo.layer.frame.origin.y = 20
      labelName.layer.frame.origin.y = 210
    }
  }
}