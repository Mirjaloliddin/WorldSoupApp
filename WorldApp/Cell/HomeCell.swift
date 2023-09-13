//
//  HomeCell.swift
//  WorldApp
//
//  Created by Murtazaev Mirjaloliddin Kamolovich on 23/02/23.
//

import UIKit

class HomeCell: UITableViewCell {
    
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
        label.numberOfLines = 3
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
    let rating: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.text = "RANK"
        label.font = .systemFont(ofSize: 14, weight: .bold)
        label.textAlignment = .center
        return label
    }()
    let img: UIImageView = {
        let view = UIImageView ()
        view.clipsToBounds = true
        view.contentMode = .scaleAspectFit
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
    let view = UIView()

    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        view.backgroundColor = .gray
        
        contentView.addSubview(rank)
        contentView.addSubview(view)
        contentView.addSubview(type)
        contentView.addSubview(name)
        contentView.addSubview(flag)
        contentView.addSubview(loc)
        contentView.addSubview(locImg)
        contentView.addSubview(img)
        contentView.addSubview(desc)
        contentView.addSubview(rating)
        
        rank.snp.makeConstraints { make in
            make.top.equalTo(40)
            make.left.equalTo(10)
            
        }
        rating.snp.makeConstraints { make in
            make.top.equalTo(rank.snp.bottom).offset(8)
            make.left.equalTo(10)
        }
        view.snp.makeConstraints { make in
            make.top.equalTo(5)
            make.left.equalTo(rank.snp.right).offset(10)
            make.width.equalTo(2)
            make.bottom.equalTo(flag)
        }
        
        type.snp.makeConstraints { make in
            make.top.equalTo(view)
            make.left.equalTo(view.snp.right).offset(10)
        }
        name.snp.makeConstraints { make in
            make.top.equalTo(type.snp.bottom).offset(12)
            make.left.equalTo(view.snp.right).offset(10)
        }
        flag.snp.makeConstraints { make in
            make.top.equalTo(name.snp.bottom).offset(10)
            make.left.equalTo(view.snp.right).offset(10)
            make.height.equalTo(20)
            make.width.equalTo(28)
            make.bottom.equalTo(img.snp.top).offset(-10)
//            make.width.equalTo(12)
//            make.height.equalTo(8)
        }
        loc.snp.makeConstraints { make in
            make.top.equalTo(name.snp.bottom).offset(10)
            make.left.equalTo(flag.snp.right).offset(7)
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
        desc.snp.makeConstraints { make in
            make.top.equalTo(img.snp.bottom).offset(10)
            make.left.equalTo(10)
            make.right.equalTo(-10)
            make.bottom.equalTo(-5)
            
        }

        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func initData(_ obj: Home){
        name.text = obj.name ?? ""
        desc.text = obj.desc
        rank.text = obj.rank
        type.text = obj.type
        loc.text = obj.loc
        img.sd_setImage(with: URL(string: obj.img ?? "placeholder"), placeholderImage: UIImage(named: "placeholder"))
        flag.sd_setImage(with: URL(string: obj.flag ?? "placeholder"), placeholderImage: UIImage(named: "placeholder"))
        locImg.sd_setImage(with: URL(string: obj.locImg ?? "placeholder"), placeholderImage: UIImage(named: "placeholder"))
        
    }
    
}


