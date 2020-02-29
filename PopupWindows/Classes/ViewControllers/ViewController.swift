//
//  ViewController.swift
//  PopupWindows
//
//  Created by Gene Backlin on 2/28/20.
//  Copyright © 2020 Gene Backlin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var colorView: UIView!
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowColorWheel" {
            // All menus should be popovers (even on iPhone).
            if let popoverController = segue.destination.popoverPresentationController, let button = sender as? UIButton {
                popoverController.delegate = self
                popoverController.sourceView = button
                popoverController.sourceRect = button.bounds
            }

            let controller: ColorWheelViewController = segue.destination as! ColorWheelViewController
            controller.colorView = colorView
        }
    }

}

extension ViewController: UIPopoverPresentationControllerDelegate {
    
    // MARK: - UIPopoverPresentationControllerDelegate

    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return .none
    }
    func popoverPresentationControllerDidDismissPopover(_ popoverPresentationController: UIPopoverPresentationController) {
    }
}
