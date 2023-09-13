//
//  SearchVC.swift
//  WorldApp
//
//  Created by Murtazaev Mirjaloliddin Kamolovich on 23/02/23.
//
import UIKit
import SnapKit

class SearchVC: UIViewController {
    
    let searchBar = UISearchBar()
    let cardTableView = UITableView()
    
    var model = HomeModel()
    lazy var allDataArr = model.homeArr
    
    lazy var resultArr = allDataArr {
        didSet{
            cardTableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .orange
        
        setSeachBar()

        cardTableView.delegate = self
        cardTableView.dataSource = self
        cardTableView.register(CardCell.self, forCellReuseIdentifier: "card")
        
        view.addSubview(cardTableView)
        
        cardTableView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.left.right.bottom.equalTo(0)
        }
    }
    
    func setSeachBar(){
        searchBar.sizeToFit()
        searchBar.searchTextField.backgroundColor = .white
        searchBar.searchTextField.textColor = .black
        searchBar.searchTextField.placeholder = "Any..."
        searchBar.searchTextField.leftView?.tintColor = .black
        searchBar.delegate = self
        showBtn(isShow: true)
    }
    
    @objc func searchClicked(_ sender: UIBarButtonItem){
        search(shouldShow: true)
        searchBar.becomeFirstResponder()
    }
    func showBtn(isShow: Bool){
        if isShow == true {
            let search = UIBarButtonItem(image: UIImage(systemName: "magnifyingglass"), style: .plain, target: self, action: #selector(searchClicked))
            navigationItem.rightBarButtonItem = search
        } else {
            navigationItem.rightBarButtonItem = nil
        }
    }
    
    func search(shouldShow: Bool){
        showBtn(isShow: !shouldShow)
        searchBar.showsCancelButton = shouldShow
        navigationItem.titleView = shouldShow ? searchBar : nil
        
    }
}

extension SearchVC: UISearchBarDelegate {
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        search(shouldShow: false)
        searchBar.text = ""
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        resultArr = allDataArr.filter({
         $0.name?.range(of: searchText, options: .caseInsensitive) != nil
        })
        if searchText == ""{
            resultArr = allDataArr
        }
    }
    
    
    
}
extension SearchVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return resultArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = cardTableView.dequeueReusableCell(withIdentifier: "card") as! CardCell
        cell.initData(resultArr[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = OneViewController()
        vc.oneItem = resultArr[indexPath.row]
        vc.initData(resultArr[indexPath.row])
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
}
//resultArr[indexPath.row]
