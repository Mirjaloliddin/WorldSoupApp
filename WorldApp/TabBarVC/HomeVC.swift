//
//  HomeVC.swift
//  WorldApp
//
//  Created by Murtazaev Mirjaloliddin Kamolovich on 22/02/23.
//

import UIKit

class HomeVC: UIViewController {
    
    let homeTableView = UITableView()
    var homeModel = HomeModel()
    lazy var arrHome = homeModel.homeArr
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .orange
        
        let titleLabel = UILabel ()
        titleLabel.text = "World Top Breads List"
        titleLabel.textColor = .white
        titleLabel.font = .systemFont(ofSize: 26, weight: .bold)
        navigationItem.titleView = titleLabel
     
        homeTableView.delegate = self
        homeTableView.dataSource = self
        homeTableView.separatorStyle = .none
        homeTableView.register(HomeCell.self, forCellReuseIdentifier: "home")
        
        view.addSubview(homeTableView)
        
        homeTableView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.right.left.bottom.equalTo(0)
        }
    }
}
extension HomeVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrHome.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = homeTableView.dequeueReusableCell(withIdentifier: "home") as! HomeCell
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
