//
//  MainVC.swift
//  BrewDogs
//
//  Created by Aarón Granado Amores on 16/3/22.
//

import UIKit

class MainVCViews {
    
    var searchBar: UISearchBar = {
        let view = UISearchBar()
        view.searchTextField.clearButtonMode = .whileEditing
        
        return view
    }()
    
    var errorLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.textColor = .systemRed
        label.textAlignment = .left
        label.font = .boldSystemFont(ofSize: 16)
        
        return label
    }()
    
    var table = UITableView()
    
    private var closeCallback: (() -> Void)?
    
    init(inside view: UIView) {
        view.addSubview(self.searchBar)
        view.addSubview(self.errorLabel)
        view.addSubview(self.table)
        
        self.searchBar
            .alignParentTopSafeArea()
            .alignParentLeft()
            .alignParentRight()
        
        self.errorLabel
            .alignParentLeft(constant: 8)
            .alignParentRight(constant: 8)
            .align(belowTo: self.searchBar, constant: 8)
        
        self.table
            .alignParentBottomSafeArea()
            .alignParentLeft()
            .alignParentRight()
            .align(belowTo: self.errorLabel, constant: 8)
    }
    
    func setField(delegate: UITextFieldDelegate, closeCallback: @escaping (() -> Void)) {
        self.closeCallback = closeCallback
        
        let closeButton = UIBarButtonItem(
            title: "Cerrar",
            style: .plain,
            target: self,
            action: #selector(self.closeButtonAction(_:))
        )
        let bar = UIToolbar()
        bar.items = [closeButton]
        bar.sizeToFit()
        
        self.searchBar.searchTextField.delegate = delegate
        self.searchBar.searchTextField.inputAccessoryView = bar
    }
    
    func setTable(delegate: UITableViewDelegate, dataSource: UITableViewDataSource) {
        self.table.delegate = delegate
        self.table.dataSource = dataSource
    }
    
    func setError(string: String?) {
        if let error = string {
            self.errorLabel.text = error
            self.errorLabel.isHidden = false
        } else {
            self.errorLabel.text = ""
            self.errorLabel.isHidden = true
        }
    }
    
    @objc private func closeButtonAction(_ sender: UIBarButtonItem) { self.closeCallback?() }
}

class MainVC: BaseVC {
    
    private var views: MainVCViews?
    private var viewModel: MainVM?
    
    static func create() -> MainVC {
        let controller = MainVC()
        controller.views = MainVCViews.init(inside: controller.view)
        controller.viewModel = MainVM()
        controller.setupViews()
        
        return controller
    }
    
    func setupViews() {
        self.views?.setField(delegate: self) { self.view.endEditing(true) }
        self.views?.setTable(delegate: self, dataSource: self)
        
        self.viewModel?.observer = { [ weak self ] empty in
            guard let wSelf = self else { return }
            
            if empty { wSelf.views?.setError(string: "No se han encontrado cervezas para la comida introducida") }
            wSelf.views?.table.reloadData()
        }
    }
}

extension MainVC: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        guard let text = textField.text, !text.isEmpty
        else {
            self.views?.setError(string: "Debes introducir una comida para buscar")
            return false
        }
        
        self.views?.setError(string: nil)
        
        self.viewModel?.fetchBrews(for: text)
        self.view.endEditing(true)
        
        return true
    }
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        self.viewModel?.clearSearch()
        
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        
        return true
    }
}

extension MainVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel?.sortedBrews.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let brew = self.viewModel?.sortedBrews[indexPath.row]
        let cell = UITableViewCell()
        cell.textLabel?.text = brew ?? "-"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
