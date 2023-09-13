//
//  CardVC.swift
//  WorldApp
//
//  Created by Murtazaev Mirjaloliddin Kamolovich on 22/02/23.
//

import UIKit
import SnapKit

class CardVC: UIViewController {
    
    let cardTableView = UITableView()
    
    var model = HomeModel()
    lazy var arrHome = model.homeArr
    let searchBtn = UISearchBar()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .orange
        
        
        let search = UIBarButtonItem(image: UIImage(systemName: "magnifyingglass"), style: .plain, target: self, action: #selector(SearchClicked))
        
//        let searchBtn = UISearchBar()
        searchBtn.barTintColor = .systemGray
//      searchBtn.backgroundColor = .gray
        searchBtn.tintColor = .black
        searchBtn.keyboardType = .webSearch
        searchBtn.placeholder = "Search"
        searchBtn.accessibilityIgnoresInvertColors = true
        searchBtn.showsScopeBar = true
        searchBtn.isHidden = true
        navigationItem.titleView = searchBtn
        navigationItem.rightBarButtonItem = search
        
        cardTableView.delegate = self
        cardTableView.dataSource = self
        cardTableView.register(CardCell.self, forCellReuseIdentifier: "card")
        
        view.addSubview(cardTableView)
        
        cardTableView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.left.right.bottom.equalTo(0)
        }
        
    }
    @objc func SearchClicked(_ sender: UIBarButtonItem){
        
        searchBtn.isHidden = false
        print("search")
    }
}
extension CardVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrHome.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = cardTableView.dequeueReusableCell(withIdentifier: "card") as! CardCell
        cell.initData(arrHome[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = OneViewController()
        vc.oneItem = arrHome[indexPath.row]
        vc.initData(arrHome[indexPath.row])
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
}
