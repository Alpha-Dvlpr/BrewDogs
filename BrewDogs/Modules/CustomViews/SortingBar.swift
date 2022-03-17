//
//  SortingBar.swift
//  BrewDogs
//
//  Created by Aarón Granado Amores on 17/3/22.
//

import UIKit

class SortingBarViews {
    
    private var title: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.font = .boldSystemFont(ofSize: 22)
        label.textAlignment = .center
        
        return label
    }()
    
    private var options: UIStackView = {
        let stack = UIStackView()
        stack.distribution = .fillEqually
        stack.spacing = 8
        stack.axis = .horizontal
        
        return stack
    }()
    
    private var sortingCallback: ((SortingOrder) -> Void)?
    
    init(inside view: UIView) {
        view.addSubview(self.title)
        view.addSubview(self.options)
        
        self.title
            .alignParentTop(constant: 8)
            .alignParentLeft(constant: 8)
            .alignParentRight(constant: 8)
        
        self.options
            .align(belowTo: self.title, constant: 8)
            .alignParentLeft(constant: 8)
            .alignParentRight(constant: 8)
            .alignParentBottom(constant: 8)
    }
    
    func set(title: String) { self.title.text = title }
    
    func set(options: [String]) { self.options.addArrangedSubviews( options.map { self.button(with: $0) } ) }
    
    func set(sortingCallback: ((SortingOrder) -> Void)?) { self.sortingCallback = sortingCallback }
    
    func set(actual: SortingOrder?) {
        if let actual = actual {
            let code = actual.display
            let options = self.options.arrangedSubviews.compactMap { return $0 as? UILabel }
            
            options.forEach { label in
                label.layer.borderColor = label.text == code ? UIColor.systemBlue.cgColor : UIColor.black.cgColor
            }
        }
    }
    
    private func button(with text: String) -> UILabel {
        let tapGesture = SortingGesture(target: self, action: #selector(self.optionTapped(_:)))
        tapGesture.display = text
        
        let label = UILabel()
        label.text = text
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 18)
        label.layer.borderWidth = 2
        label.layer.borderColor = UIColor.black.cgColor
        label.layer.cornerRadius = 8
        label.isUserInteractionEnabled = true
        label.addGestureRecognizer(tapGesture)
        
        return label
    }
    
    @objc private func optionTapped(_ sender: SortingGesture) {
        guard let text = sender.display else { return }
        
        self.sortingCallback?(SortingOrder.init(from: text))
    }
}

class SortingBar: UIView {

    var views: SortingBarViews?
    
    static func create() -> SortingBar {
        let view = SortingBar()
        view.views = SortingBarViews.init(inside: view)
        view.configureView()
        
        return view
    }
    
    func configureView() {
        self.layer.borderWidth = 2
        self.layer.borderColor = UIColor.systemBrown.cgColor
        self.layer.cornerRadius = 8
        
        self.views?.set(title: "Orden del listado".uppercased())
        self.views?.set(options: SortingOrder.allCases.map { return $0.display })
    }
    
    func set(callback: @escaping ((SortingOrder) -> Void)) { self.views?.set(sortingCallback: callback) }
    
    func set(actual: SortingOrder?) { self.views?.set(actual: actual) }
}
