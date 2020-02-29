//
//  ColorWheelViewController.swift
//  PopupWindows
//
//  Created by Gene Backlin on 2/28/20.
//  Copyright © 2020 Gene Backlin. All rights reserved.
//

import UIKit

protocol ColorWheelViewControllerDelegate {
    func didSelectColor(color: UIColor)
}

class ColorWheelViewController: UIViewController {
    @IBOutlet weak var colorImageView: UIImageView!
    
    var delegate: ColorWheelViewControllerDelegate?
    var colorView: UIView?

    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func viewWillLayoutSubviews() {
        preferredContentSize = CGSize(width: 200, height: 200)
    }

    // MARK: - @IBAction
    
    @IBAction func selectColorFromColorWheel(_ sender: UIPanGestureRecognizer) {
        let position = sender.location(in: colorImageView)
        if let color = colorImageView.image?.getPixelColor(pos: position) {
            switch sender.state {
            case .ended:
                dismiss(animated: true, completion: nil)
            default:
                colorView?.backgroundColor = color
            }
        }
    }
}

// MARK: - UIImage

extension UIImage {
    func getPixelColor(pos: CGPoint) -> UIColor {

        let pixelData = self.cgImage!.dataProvider!.data
        let data: UnsafePointer<UInt8> = CFDataGetBytePtr(pixelData)

        let pixelInfo: Int = ((Int(self.size.width) * Int(pos.y)) + Int(pos.x)) * 4

        let r = CGFloat(data[pixelInfo]) / CGFloat(255.0)
        let g = CGFloat(data[pixelInfo+1]) / CGFloat(255.0)
        let b = CGFloat(data[pixelInfo+2]) / CGFloat(255.0)
        let a = CGFloat(data[pixelInfo+3]) / CGFloat(255.0)

        return UIColor(red: r, green: g, blue: b, alpha: a)
    }
}
