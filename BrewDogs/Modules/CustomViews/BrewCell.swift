//
//  BrewCell.swift
//  BrewDogs
//
//  Created by Aarón Granado Amores on 16/3/22.
//

import UIKit

class BrewCellViews {
    
    private var nameLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.font = .boldSystemFont(ofSize: 22)
        label.textAlignment = .center
        
        return label
    }()
    
    private var taglineLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.font = .boldSystemFont(ofSize: 18)
        label.textAlignment = .center
        
        return label
    }()
    
    private var descriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 8
        label.font = .systemFont(ofSize: 18)
        label.textAlignment = .justified
        
        return label
    }()
    
    private var image: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        view.layer.borderWidth = 2
        view.layer.borderColor = UIColor.systemGray.cgColor
        view.layer.cornerRadius = 8
        
        return view
    }()
    
    private var abvLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.numberOfLines = 1
        label.font = .boldSystemFont(ofSize: 16)
        label.textAlignment = .center
        label.layer.cornerRadius = 8
        
        return label
    }()
    
    init(inside view: UIView) {
        view.addSubview(self.nameLabel)
        view.addSubview(self.taglineLabel)
        view.addSubview(self.descriptionLabel)
        view.addSubview(self.image)
        view.addSubview(self.abvLabel)

        self.nameLabel
            .alignParentTop(constant: 8)
            .alignParentLeft(constant: 8)
            .alignParentRight(constant: 8)
            .height(constant: 32)
        
        self.abvLabel
            .alignParentLeft(constant: 8)
            .alignParentBottom(constant: 8)
            .height(constant: 20)
            .width(constant: 64)
        
        self.taglineLabel
            .align(belowTo: self.nameLabel, constant: 8)
            .alignParentLeft(constant: 8)
            .alignParentRight(constant: 8)
            .height(constant: 32)
        
        self.image
            .alignParentLeft(constant: 8)
            .align(belowTo: self.taglineLabel, constant: 8)
            .align(aboveTo: self.abvLabel, constant: 8)
            .width(constant: 64)
        
        self.descriptionLabel
            .align(belowTo: self.taglineLabel, constant: 8)
            .alignParentBottom(constant: 8)
            .align(toRightOf: self.abvLabel, constant: 8)
            .alignParentRight(constant: 8)
    }
    
    func setup(with brew: Brew) {
        self.nameLabel.text = brew.name
        self.taglineLabel.text = brew.tagline
        self.descriptionLabel.text = brew.brewDescription
        self.abvLabel.text = "\(brew.abv)"
        self.abvLabel.layer.backgroundColor = self.getColor(for: brew.abv).cgColor
        
        if let stringUrl = brew.imageURL, let url = URL(string: stringUrl) {
            self.image.load(url: url)
        } else {
            self.image.image = UIImage(systemName: "icloud.slash")
        }
    }
    
    private func getColor(for abv: Double) -> UIColor {
        switch abv {
        case ...1.50:
            return .systemGreen
            
        case 1.50..<4.00:
            return .systemYellow
            
        case 4.00..<8.00:
            return .systemOrange
            
        case 8.00..<11.50:
            return .systemRed
            
        case 11.50...:
            return .systemPurple
            
        default:
            return .black
        }
    }
}

class BrewCell: UITableViewCell {
    
    static let cellHeight: CGFloat = 250
    private var views: BrewCellViews?
    
    static func create(with brew: Brew) -> BrewCell {
        let cell = BrewCell()
        cell.views = BrewCellViews.init(inside: cell)
        cell.views?.setup(with: brew)
        cell.setupView()
        
        return cell
    }
    
    private func setupView() {
        self.layer.borderWidth = 4
        self.layer.borderColor = UIColor.systemGray.cgColor
        self.layer.cornerRadius = 16
    }
}
