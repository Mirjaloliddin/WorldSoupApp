//
//  QuizVC.swift
//  WorldApp
//
//  Created by Murtazaev Mirjaloliddin Kamolovich on 22/02/23.
//

import UIKit
import SnapKit

class QuizVC: UIViewController {
    
    
    var model = HomeModel()
    lazy var arrHome = model.homeArr
    
    let img: UIImageView = {
        let view = UIImageView ()
        view.clipsToBounds = true
        view.contentMode = .scaleAspectFill
        return view
    }()
    let name: UILabel = {
        let label = UILabel()
        label.textColor = .gray
     
        label.font = .systemFont(ofSize: 28, weight: .bold)
        label.textAlignment = .left
        return label
    }()
    let nameTwo: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.font = .systemFont(ofSize: 28, weight: .bold)
        label.textAlignment = .left
        return label
    }()
    let nameThree: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.font = .systemFont(ofSize: 28, weight: .bold)
        label.textAlignment = .left
        return label
    }()
    let nameFour: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.font = .systemFont(ofSize: 28, weight: .bold)
        label.textAlignment = .left
        return label
    }()
    let question: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.numberOfLines = 0
        label.text = "Find photo question"
        label.font = .systemFont(ofSize: 22, weight: .bold)
        label.textAlignment = .left
        return label
    }()
    let number: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.font = .systemFont(ofSize: 28, weight: .bold)
        label.textAlignment = .left
        
        return label
    }()
    let nameBtn: UIButton = {
        let btn = UIButton()
        btn.backgroundColor = .clear
        return btn
    }()
    let ansBtn: UIButton = {
        let btn = UIButton()
        btn.backgroundColor = .clear
        return btn
    }()
    let ansBtnTwo: UIButton = {
        let btn = UIButton()
        btn.backgroundColor = .clear
        return btn
    }()
    let ansBtnThree: UIButton = {
        let btn = UIButton()
        
        return btn
    }()
    
    lazy var nameNumber = 2
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemYellow
        
        view.addSubview(img)
        view.addSubview(name)
        view.addSubview(question)
        view.addSubview(number)
        view.addSubview(nameBtn)
        view.addSubview(ansBtn)
        view.addSubview(ansBtnTwo)
        view.addSubview(ansBtnThree)
        view.addSubview(nameTwo)
        view.addSubview(nameThree)
        view.addSubview(nameFour)
        
        let titleLabel = UILabel ()
        titleLabel.text = "Fun Quiz"
        titleLabel.textColor = .white
        titleLabel.font = .systemFont(ofSize: 26, weight: .bold)
        navigationItem.titleView = titleLabel
     
        img.image = UIImage(named: "\(initData(arrHome[nameNumber]))")
        name.text = "\(arrHome )"
        nameTwo.text = "\(arrHome[nameNumber]))"
        
        img.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.left.right.equalTo(0)
            make.height.equalTo(220)
        }
        question.snp.makeConstraints { make in
            make.top.equalTo(img.snp.bottom).offset(10)
            make.left.equalTo(10)
            make.right.equalTo(-10)
            
        }
        name.snp.makeConstraints { make in
            make.top.equalTo(question.snp.bottom).offset(10)
            make.left.equalTo(question)
            make.width.equalTo(250)
        }
        nameBtn.snp.makeConstraints { make in
            make.top.equalTo(question.snp.bottom).offset(10)
            make.left.equalTo(question)
            make.width.equalTo(250)
        }
        nameTwo.snp.makeConstraints { make in
            make.top.equalTo(nameBtn.snp.bottom).offset(12)
            make.right.equalTo(-10)
            make.width.equalTo(250)
        }
        ansBtn.snp.makeConstraints { make in
            make.top.equalTo(nameBtn.snp.bottom).offset(12)
            make.right.equalTo(-10)
            make.width.equalTo(250)
        }
        nameThree.snp.makeConstraints { make in
            make.top.equalTo(ansBtn.snp.bottom).offset(12)
            make.left.equalTo(name)
            make.width.equalTo(250)
        }
        ansBtnTwo.snp.makeConstraints { make in
            make.top.equalTo(ansBtn.snp.bottom).offset(12)
            make.left.equalTo(name)
            make.width.equalTo(250)
        }
        nameFour.snp.makeConstraints { make in
            make.top.equalTo(ansBtnTwo.snp.bottom).offset(12)
            make.right.equalTo(nameTwo)
            make.width.equalTo(250)
        }
        ansBtnThree.snp.makeConstraints { make in
            make.top.equalTo(ansBtnTwo.snp.bottom).offset(12)
            make.right.equalTo(nameTwo)
            make.width.equalTo(250)
        }
    }
    
    
    func initData(_ obj: Home){
        name.text = obj.name
        
        img.sd_setImage(with: URL(string: obj.img ?? "placeholder"), placeholderImage: UIImage(named: "placeholder"))
        
    }
   
    
}
