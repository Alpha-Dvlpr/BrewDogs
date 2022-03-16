//
//  ViewBuilder.swift
//  BrewDogs
//
//  Created by Aarón Granado Amores on 16/3/22.
//

import UIKit

extension UIView {
    
    @discardableResult
    func align(toRightOf: UIView, constant: CGFloat = 0) -> UIView {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.leadingAnchor.constraint(equalTo: toRightOf.trailingAnchor, constant: constant).isActive = true
        
        return self
    }
    
    @discardableResult
    func align(toLeftOf: UIView, constant: CGFloat = 0) -> UIView {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.trailingAnchor.constraint(equalTo: toLeftOf.leadingAnchor, constant: -constant).isActive = true
        
        return self
    }
    
    @discardableResult
    func align(aboveTo: UIView, constant: CGFloat = 0) -> UIView {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.bottomAnchor.constraint(equalTo: aboveTo.topAnchor, constant: -constant).isActive = true
        
        return self
    }
    
    @discardableResult
    func align(belowTo: UIView, constant: CGFloat = 0) -> UIView {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.topAnchor.constraint(equalTo: belowTo.bottomAnchor, constant: constant).isActive = true
        
        return self
    }
    
    @discardableResult
    func align(leftWith: UIView, constant: CGFloat = 0) -> UIView {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.leadingAnchor.constraint(equalTo: leftWith.leadingAnchor, constant: constant).isActive = true
        
        return self
    }
    
    @discardableResult
    func align(rightWith: UIView, constant: CGFloat = 0) -> UIView {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.trailingAnchor.constraint(equalTo: rightWith.trailingAnchor, constant: constant).isActive = true
        
        return self
    }
    
    @discardableResult
    func align(topWith: UIView, constant: CGFloat = 0) -> UIView {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.topAnchor.constraint(equalTo: topWith.topAnchor, constant: constant).isActive = true
        
        return self
    }
    
    @discardableResult
    func align(bottomWith: UIView, constant: CGFloat = 0) -> UIView {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.bottomAnchor.constraint(equalTo: bottomWith.bottomAnchor, constant: -constant).isActive = true
        
        return self
    }
    
    @discardableResult
    func align(horizontallyWith: UIView, constant: CGFloat = 0) -> UIView {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.centerXAnchor.constraint(equalTo: horizontallyWith.centerXAnchor, constant: constant).isActive = true
        
        return self
    }
    
    @discardableResult
    func alignHorizontallyWithParent(constant: CGFloat = 0) -> UIView {
        self.translatesAutoresizingMaskIntoConstraints = false
        if let superview = superview {
            self.centerXAnchor.constraint(equalTo: superview.centerXAnchor, constant: constant).isActive = true
        }
        
        
        return self
    }
    
    @discardableResult
    func align(verticallyWith: UIView, constant: CGFloat = 0) -> UIView {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.centerYAnchor.constraint(equalTo: verticallyWith.centerYAnchor, constant: constant).isActive = true
        
        return self
    }
    
    @discardableResult
    func alignVerticallyWithParent(constant: CGFloat = 0) -> UIView {
        self.translatesAutoresizingMaskIntoConstraints = false
        if let superview = superview {
            self.centerYAnchor.constraint(equalTo: superview.centerYAnchor, constant: constant).isActive = true
        }
        
        return self
    }
    
    @discardableResult
    func align(toCenterOf: UIView) -> UIView {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.centerXAnchor.constraint(equalTo: toCenterOf.centerXAnchor).isActive = true
        self.centerYAnchor.constraint(equalTo: toCenterOf.centerYAnchor).isActive = true
        
        return self
    }
    
    @discardableResult
    func alignCenterWithParent(constant: CGFloat = 0) -> UIView {
        self.translatesAutoresizingMaskIntoConstraints = false
        if let superview = superview {
            self.centerXAnchor.constraint(equalTo: superview.centerXAnchor).isActive = true
            self.centerYAnchor.constraint(equalTo: superview.centerYAnchor).isActive = true
        }
        
        return self
    }
    
    @discardableResult
    func alignParentLeft(constant: CGFloat = 0) -> UIView {
        if let parent = superview {
            self.translatesAutoresizingMaskIntoConstraints = false
            self.leadingAnchor.constraint(equalTo: parent.leadingAnchor, constant: constant).isActive = true
        }
        
        return self
    }
    
    @discardableResult
    func alignParentTop(constant: CGFloat = 0) -> UIView {
        if let parent = superview {
            self.translatesAutoresizingMaskIntoConstraints = false
            self.topAnchor.constraint(equalTo: parent.topAnchor, constant: constant).isActive = true
        }
        
        return self
    }
    
    @discardableResult
    func alignParentTopSafeArea(constant: CGFloat = 0) -> UIView {
        if let parent = superview {
            self.translatesAutoresizingMaskIntoConstraints = false
            self.topAnchor.constraint(equalTo: parent.safeAreaLayoutGuide.topAnchor, constant: constant).isActive = true
        }
        
        return self
    }
    
    @discardableResult
    func alignParentRight(constant: CGFloat = 0) -> UIView {
        if let parent = superview {
            self.translatesAutoresizingMaskIntoConstraints = false
            self.trailingAnchor.constraint(equalTo: parent.trailingAnchor, constant: -constant).isActive = true
        }
        
        return self
    }
    
    @discardableResult
    func alignParentBottom(constant: CGFloat = 0) -> UIView {
        if let parent = superview {
            self.translatesAutoresizingMaskIntoConstraints = false
            self.bottomAnchor.constraint(equalTo: parent.bottomAnchor, constant: -constant).isActive = true
        }
        
        return self
    }
    
    @discardableResult
    func alignParentBottomSafeArea(constant: CGFloat = 0) -> UIView {
        if let parent = superview {
            self.translatesAutoresizingMaskIntoConstraints = false
            self.bottomAnchor.constraint(equalTo: parent.safeAreaLayoutGuide.bottomAnchor, constant: -constant).isActive = true
        }
        
        return self
    }
    
    @discardableResult
    func width(equalTo: UIView) -> UIView {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.widthAnchor.constraint(equalTo: equalTo.widthAnchor).isActive = true
        
        return self
    }
    
    @discardableResult
    func width(constant: CGFloat) -> UIView {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.widthAnchor.constraint(equalToConstant: constant).isActive = true
        
        return self
    }
    
    @discardableResult
    func widthPercentage(constant: CGFloat) -> UIView {
        if let parent = superview {
            self.translatesAutoresizingMaskIntoConstraints = false
            self.widthAnchor.constraint(
                equalToConstant: parent.safeAreaLayoutGuide.layoutFrame.width * constant / 100
            ).isActive = true
        }
        
        return self
    }
    
    @discardableResult
    func maxWidth(constant: CGFloat) -> UIView {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.widthAnchor.constraint(lessThanOrEqualToConstant: constant).isActive = true
        
        return self
    }
    
    @discardableResult
    func minWidth(constant: CGFloat) -> UIView {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.widthAnchor.constraint(greaterThanOrEqualToConstant: constant).isActive = true
        
        return self
    }
    
    @discardableResult
    func height(equalTo: UIView) -> UIView {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.widthAnchor.constraint(equalTo: equalTo.heightAnchor).isActive = true
        
        return self
    }
    
    @discardableResult
    func height(constant: CGFloat) -> UIView {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.heightAnchor.constraint(equalToConstant: constant).isActive = true
        
        return self
    }
    
    @discardableResult
    func maxHeight(constant: CGFloat) -> UIView {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.heightAnchor.constraint(lessThanOrEqualToConstant: constant).isActive = true
        
        return self
    }
    
    @discardableResult
    func minHeight(constant: CGFloat) -> UIView {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.heightAnchor.constraint(greaterThanOrEqualToConstant: constant).isActive = true
        
        return self
    }
    
    @discardableResult
    func matchParent(constant: CGFloat = 0) -> UIView {
        if let parent = superview {
            self.translatesAutoresizingMaskIntoConstraints = false
            self.topAnchor.constraint(equalTo: parent.topAnchor, constant: constant).isActive = true
            self.bottomAnchor.constraint(equalTo: parent.bottomAnchor, constant: -constant).isActive = true
            self.leadingAnchor.constraint(equalTo: parent.leadingAnchor, constant: constant).isActive = true
            self.trailingAnchor.constraint(equalTo: parent.trailingAnchor, constant: -constant).isActive = true
        }
        
        return self
    }
    
    @discardableResult
    func matchParentSafeArea(constant: CGFloat = 0) -> UIView {
        if let parent = superview {
            self.translatesAutoresizingMaskIntoConstraints = false
            self.topAnchor.constraint(equalTo: parent.safeAreaLayoutGuide.topAnchor, constant: constant).isActive = true
            self.bottomAnchor.constraint(equalTo: parent.safeAreaLayoutGuide.bottomAnchor, constant: -constant).isActive = true
            self.leadingAnchor.constraint(equalTo: parent.leadingAnchor, constant: constant).isActive = true
            self.trailingAnchor.constraint(equalTo: parent.trailingAnchor, constant: -constant).isActive = true
        }
        
        return self
    }
    
    @discardableResult
    func matchParentHorizontally(constant: CGFloat = 0) -> UIView {
        if let parent = superview {
            self.translatesAutoresizingMaskIntoConstraints = false
            self.leadingAnchor.constraint(equalTo: parent.leadingAnchor, constant: constant).isActive = true
            self.trailingAnchor.constraint(equalTo: parent.trailingAnchor, constant: -constant).isActive = true
        }
        
        return self
    }
    
    @discardableResult
    func matchParentHorizontallySafeArea(constant: CGFloat = 0) -> UIView {
        if let parent = superview {
            self.translatesAutoresizingMaskIntoConstraints = false
            self.leadingAnchor.constraint(equalTo: parent.safeAreaLayoutGuide.leadingAnchor, constant: constant).isActive = true
            self.trailingAnchor.constraint(equalTo: parent.safeAreaLayoutGuide.trailingAnchor, constant: -constant).isActive = true
        }
        
        return self
    }
    
    @discardableResult
    func matchParentVertically(constant: CGFloat = 0) -> UIView {
        if let parent = superview {
            self.translatesAutoresizingMaskIntoConstraints = false
            self.topAnchor.constraint(equalTo: parent.topAnchor, constant: constant).isActive = true
            self.bottomAnchor.constraint(equalTo: parent.bottomAnchor, constant: -constant).isActive = true
        }
        
        return self
    }
    
    @discardableResult
    func matchParentVerticallySafeArea(constant: CGFloat = 0) -> UIView {
        if let parent = superview {
            self.translatesAutoresizingMaskIntoConstraints = false
            self.topAnchor.constraint(equalTo: parent.safeAreaLayoutGuide.topAnchor, constant: constant).isActive = true
            self.bottomAnchor.constraint(equalTo: parent.safeAreaLayoutGuide.bottomAnchor, constant: -constant).isActive = true
        }
        
        return self
    }
    
    @discardableResult
    func matchParentWidth(constant: CGFloat = 0) -> UIView {
        if let parent = superview {
            self.translatesAutoresizingMaskIntoConstraints = false
            self.widthAnchor.constraint(equalTo: parent.widthAnchor, constant: constant).isActive = true
        }
        
        return self
    }
    
    @discardableResult
    func matchParentHeight(constant: CGFloat = 0) -> UIView {
        if let parent = superview {
            self.translatesAutoresizingMaskIntoConstraints = false
            self.heightAnchor.constraint(equalTo: parent.heightAnchor, constant: constant).isActive = true
        }
        
        return self
    }
}
