//
//  BaseVC.swift
//  BrewDogs
//
//  Created by Aarón Granado Amores on 16/3/22.
//

import UIKit

class BaseVC: UIViewController {

    private static let overlayID = 1_000_000
    
    func startLoading() {
        self.view.endEditing(true)
        self.view.isUserInteractionEnabled = false
        self.addOverlay()
    }
    
    func stopLoading() {
        self.view.isUserInteractionEnabled = true
        self.removeOverlay()
    }
    
    private func addOverlay() {
        self.removeOverlay()
        
        self.view.layer.zPosition = 10
        
        let overlay: UIView = {
            let view = UIView()
            view.backgroundColor = .systemGray
            view.alpha = 0.8
            view.tag = BaseVC.overlayID
            view.layer.zPosition = 100
            
            return view
        }()
        
        let indicator: UIActivityIndicatorView = {
            let view = UIActivityIndicatorView()
            view.style = UIActivityIndicatorView.Style.large
            view.color = .systemBlue
            view.layer.zPosition = 1_000
            
            return view
        }()
        
        overlay.addSubview(indicator)
        self.view.addSubview(overlay)
        
        overlay
            .alignParentTop()
            .alignParentBottom()
            .alignParentLeft()
            .alignParentRight()
        
        indicator.alignCenterWithParent()
        indicator.startAnimating()
    }
    
    private func removeOverlay() {
        let overlay = self.view.viewWithTag(BaseVC.overlayID)
        overlay?.removeFromSuperview()
    }
}
