//
//  SettingsVC.swift
//  WorldApp
//
//  Created by Murtazaev Mirjaloliddin Kamolovich on 22/02/23.
//

import UIKit
import SnapKit

class SettingsVC: UIViewController {
    
    let share = CustomView()
    let searchItem = CustomView()
    @objc let rateApp = CustomView()
    let quit = CustomView()
    
    let shareBtn = UIButton()
    let searchBtn = UIButton()
    let rateBtn = UIButton()
    let quitBtn = UIButton()
    
    let text = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        let titleLabel = UILabel()
        titleLabel.text = "Main Settings"
        titleLabel.textColor = .white
        titleLabel.font = .systemFont(ofSize: 26, weight: .bold)
        navigationItem.titleView = titleLabel
       
        
        shareBtn.backgroundColor = .clear
        searchBtn.backgroundColor = .clear
        rateBtn.backgroundColor = .clear
        quitBtn.backgroundColor = .clear
        
        shareBtn.addTarget(self, action: #selector(shareClicked), for: .touchUpInside)
        searchBtn.addTarget(self, action: #selector(searchClicked), for: .touchUpInside)
        rateBtn.addTarget(self, action: #selector(rateApp2), for: .touchUpInside)
        quitBtn.addTarget(self, action: #selector(quitClicked), for: .touchUpInside)
        
        
        text.text = "This application is called Learning World Breads and contains very interesting and useful information. In the Home section of this application, you can get acquainted with the hundred most famous breads in the world, as well as their type, origin, bright image,breads in the world, as well as their type, origin, bright image."
        text.textColor = .purple
        text.textAlignment = .center
        text.font = UIFont.systemFont(ofSize: 22,weight: .bold)
        text.numberOfLines = 0
        
        share.changeContent(imageName: "share", text: "Share", color: .purple.withAlphaComponent(0.1), titlecolor: .purple,tinColor: .purple)
        searchItem.changeContent(imageName: "search", text:"Search item", color: .green.withAlphaComponent(0.1), titlecolor: .systemGreen, tinColor: .systemGreen)
        rateApp.changeContent(imageName: "rating", text: "Rate app", color: .orange.withAlphaComponent(0.1), titlecolor: .orange, tinColor: .orange)
        quit.changeContent(imageName: "quit", text: "Quit app", color: .red.withAlphaComponent(0.1), titlecolor: .systemRed, tinColor: .systemRed)
        
        view.addSubview(share)
        view.addSubview(searchItem)
        view.addSubview(rateApp)
        view.addSubview(quit)
        view.addSubview(shareBtn)
        view.addSubview(searchBtn)
        view.addSubview(rateBtn)
        view.addSubview(quitBtn)
        view.addSubview(text)
        
        
        share.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(20)
            make.left.equalTo(20)
        }
        shareBtn.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(20)
            make.left.equalTo(20)
            make.width.height.equalTo(150)
        }
        searchItem.snp.makeConstraints { make in
            make.top.equalTo(share)
            make.right.equalTo(-170)
            
        }
        searchBtn.snp.makeConstraints { make in
            make.top.equalTo(share)
            make.right.equalTo(-20)
            make.width.height.equalTo(150)
        }
        
        rateApp.snp.makeConstraints { make in
            make.top.equalTo(share.snp.bottom).offset(180)
            make.left.equalTo(20)
        }
        rateBtn.snp.makeConstraints { make in
            make.top.equalTo(share.snp.bottom).offset(180)
            make.left.equalTo(20)
            make.width.height.equalTo(150)
        }
        quit.snp.makeConstraints { make in
            make.top.equalTo(rateApp)
            make.right.equalTo(-170)
        }
        quitBtn.snp.makeConstraints { make in
            make.top.equalTo(rateApp)
            make.right.equalTo(-20)
            make.width.height.equalTo(150)
        }
        text.snp.makeConstraints { make in
            make.top.equalTo(quit.snp.bottom).offset(190)
            make.left.equalTo(15)
            make.right.equalTo(-15)
//            make.bottom.equalTo(-100)
        }
    }

    @objc func shareClicked(){
            
            let vc = UIActivityViewController(activityItems: ["https://apps.apple.com/"], applicationActivities: nil)
            vc.popoverPresentationController?.sourceView = self.view
            self.present(vc, animated: true, completion: nil)
        }
    @objc func searchClicked(_ sender: UIButton){

        navigationController?.pushViewController(SearchVC(), animated: true)
        print("search")
    }
    
    @objc func rateApp2(_ sender: UIButton){
            let url = URL(string: "https://apps.apple.com/")!
            UIApplication.shared.open(url)
        }
    
    @objc func quitClicked(_ sender: UIButton){
        showAlert()
        func showAlert() {
            let alertVC = UIAlertController(title: "Quit App?", message: "If you want to exit the app, click theClose Now button. This will stop the application from working. Do you want to quit now?", preferredStyle: .alert)
            alertVC.addAction(UIAlertAction(title: "Quit now", style: .destructive, handler: { _ in
                return exit(0)
            }))
            alertVC.addAction(UIAlertAction(title: "Later", style: .cancel, handler: { _ in
                print("Cancel")
            }))
            present(alertVC, animated: true)
        }
        print("quit")
    }
    
    
}
