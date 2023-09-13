//
//  OneViewController.swift
//  WorldApp
//
//  Created by Murtazaev Mirjaloliddin Kamolovich on 23/02/23.
//

import UIKit
import SnapKit

class OneViewController: UIViewController {
    
    var oneItem: Home?
    
    let name: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.font = .systemFont(ofSize: 28, weight: .bold)
        label.textAlignment = .center
        return label
    }()
    let rank: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.font = .systemFont(ofSize: 28, weight: .bold)
        label.textAlignment = .center
        return label
    }()
    let loc: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.textAlignment = .center
        return label
    }()
    let desc: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.textAlignment = .center
        return label
    }()
    let type: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.textAlignment = .center
        return label
    }()
    let rang: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.text = "RANK"
        label.font = .systemFont(ofSize: 14, weight: .bold)
        label.textAlignment = .center
        return label
    }()
    let rating: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.font = .systemFont(ofSize: 24, weight: .bold)
        label.textAlignment = .center
        return label
    }()
    let img: UIImageView = {
        let view = UIImageView ()
        view.clipsToBounds = true
        view.contentMode = .scaleAspectFill
        return view
    }()
    let locImg: UIImageView = {
        let view = UIImageView ()
        view.clipsToBounds = true
        view.contentMode = .scaleAspectFit
        return view
    }()
    let flag: UIImageView = {
        let view = UIImageView ()
        view.clipsToBounds = true
        view.contentMode = .scaleAspectFit
        return view
    }()
    let views = UIView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        views.backgroundColor = .darkGray
        
        view.addSubview(rank)
        view.addSubview(views)
        view.addSubview(type)
        view.addSubview(name)
        view.addSubview(flag)
        view.addSubview(loc)
        view.addSubview(locImg)
        view.addSubview(img)
        view.addSubview(desc)
        view.addSubview(rang)
        view.addSubview(rating)
        
        rank.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(40)
            make.left.equalTo(10)
            
        }
        rang.snp.makeConstraints { make in
            make.top.equalTo(rank.snp.bottom).offset(8)
            make.left.equalTo(10)
        }
        views.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(5)
            make.left.equalTo(rank.snp.right).offset(10)
            make.width.equalTo(2)
            make.height.equalTo(120)
            make.bottom.equalTo(flag)
        }
        
        type.snp.makeConstraints { make in
            make.top.equalTo(views)
            make.left.equalTo(views.snp.right).offset(10)
        }
        name.snp.makeConstraints { make in
            make.top.equalTo(type.snp.bottom).offset(12)
            make.left.equalTo(views.snp.right).offset(10)
        }
        flag.snp.makeConstraints { make in
            make.top.equalTo(name.snp.bottom).offset(10)
            make.left.equalTo(views.snp.right).offset(10)
            make.height.equalTo(20)
            make.width.equalTo(28)
            make.bottom.equalTo(img.snp.top).offset(-10)
            //            make.width.equalTo(12)
            //            make.height.equalTo(8)
        }
        loc.snp.makeConstraints { make in
            make.top.equalTo(name.snp.bottom).offset(10)
            make.left.equalTo(flag.snp.right).offset(7)
            make.right.lessThanOrEqualTo(locImg.snp.left).offset(-5)
        }
        locImg.snp.makeConstraints { make in
            //            make.top.equalTo(10)
            make.centerY.equalTo(name.snp.centerY)
            make.right.equalTo(-10)
            make.width.height.equalTo(60)
        }
        img.snp.makeConstraints { make in
            make.top.equalTo(loc.snp.bottom).offset(10)
            make.width.equalTo(UIScreen.main.bounds.width)
            make.height.equalTo(225)
        }
        rating.snp.makeConstraints { make in
            make.top.equalTo(img.snp.bottom).offset(10)
            make.left.equalTo(10)
        }
        desc.snp.makeConstraints { make in
            make.top.equalTo(rating.snp.bottom).offset(10)
            make.left.equalTo(10)
            make.right.equalTo(-10)
           // make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-20)
            
        }
        print(oneItem?.name ?? "")
    }
    
    func initData(_ obj: Home){
        name.text = obj.name
        desc.text = obj.desc
        rank.text = obj.rank
        type.text = obj.type
        loc.text = obj.loc
        rating.text = obj.rating
        img.sd_setImage(with: URL(string: obj.img ?? "placeholder"), placeholderImage: UIImage(named: "placeholder"))
        flag.sd_setImage(with: URL(string: obj.flag ?? "placeholder"), placeholderImage: UIImage(named: "placeholder"))
        locImg.sd_setImage(with: URL(string: obj.locImg ?? "placeholder"), placeholderImage: UIImage(named: "placeholder"))
        
    }
    
}
