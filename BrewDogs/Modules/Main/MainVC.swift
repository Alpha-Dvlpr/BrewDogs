//
//  MainVC.swift
//  BrewDogs
//
//  Created by Aarón Granado Amores on 16/3/22.
//

import UIKit

class MainVCViews {
    
    private var sortingBar = SortingBar.create()
    
    private var searchBar: UISearchBar = {
        let view = UISearchBar()
        view.searchTextField.clearButtonMode = .whileEditing
        
        return view
    }()
    
    private var errorLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = .systemRed
        label.textAlignment = .left
        label.font = .boldSystemFont(ofSize: 16)
        
        return label
    }()
    
    private var table = UITableView()
    
    private var closeCallback: (() -> Void)?
    
    init(inside view: UIView) {
        view.addSubview(self.sortingBar)
        view.addSubview(self.searchBar)
        view.addSubview(self.errorLabel)
        view.addSubview(self.table)
        
        self.sortingBar
            .alignParentTopSafeArea()
            .alignParentLeft(constant: 8)
            .alignParentRight(constant: 8)
            .height(constant: 64)
        
        self.searchBar
            .align(belowTo: self.sortingBar, constant: 8)
            .alignParentLeft()
            .alignParentRight()
        
        self.errorLabel
            .alignParentLeft(constant: 8)
            .alignParentRight(constant: 8)
            .align(belowTo: self.searchBar, constant: 8)
        
        self.table
            .alignParentBottomSafeArea()
            .alignParentLeft(constant: 8)
            .alignParentRight(constant: 8)
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
    
    func setSorting(callback: @escaping ((SortingOrder) -> Void)) { self.sortingBar.set(callback: callback) }
    
    func set(actual: SortingOrder?) { self.sortingBar.set(actual: actual) }
    
    func reload(actual: SortingOrder?) {
        self.table.reloadData()
        self.sortingBar.set(actual: actual)
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
        self.views?.setField(delegate: self) { [ weak self ] in
            guard let wSelf = self else { return }
            wSelf.view.endEditing(true)
        }
        self.views?.setTable(delegate: self, dataSource: self)
        self.views?.setSorting { [ weak self ] newSorting in
            guard let wSelf = self else { return }
            wSelf.viewModel?.sortingOrder = newSorting
        }
        self.views?.set(actual: self.viewModel?.sortingOrder)
        
        self.viewModel?.observer = { [ weak self ] (empty, error) in
            DispatchQueue.main.async {
                guard let wSelf = self else { return }
                wSelf.stopLoading()
                
                if let error = error {
                    wSelf.views?.setError(string: error)
                } else {
                    if empty { wSelf.views?.setError(string: "No se han encontrado cervezas para la comida introducida") }
                    wSelf.views?.reload(actual: wSelf.viewModel?.sortingOrder)
                }
            }
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
        
        self.startLoading()
        self.views?.setError(string: nil)
        self.viewModel?.fetchBrews(for: text)
        self.view.endEditing(true)
        
        return true
    }
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        self.viewModel?.clearSearch()
        
        return true
    }
}

extension MainVC: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.viewModel?.sortedBrews.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 8
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = .clear
        
        return view
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let brew = self.viewModel?.sortedBrews[indexPath.section]
        else {
            let cell = UITableViewCell()
            cell.textLabel?.text = "Template cell"
            
            return cell
        }
        
        return BrewCell.create(with: brew)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return BrewCell.cellHeight
    }
}
