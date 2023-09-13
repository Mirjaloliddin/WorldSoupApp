//
//  CardCell.swift
//  WorldApp
//
//  Created by Murtazaev Mirjaloliddin Kamolovich on 23/02/23.
//

import UIKit
import SnapKit

class CardCell: UITableViewCell {
    
    let type: UILabel = {
    let label = UILabel()
        label.textColor = .darkGray
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 18)
        return label
    }()
    let name: UILabel = {
       let label = UILabel()
        label.textColor = .black
        label.numberOfLines = 2
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 24, weight: .semibold)
        return label
    }()
    let img: UIImageView = {
       let img = UIImageView()
        img.clipsToBounds = true
        img.layer.cornerRadius = 12
        return img
    }()
    let locImg: UIImageView = {
        let img = UIImageView()
        img.clipsToBounds = true
        return img
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(img)
        contentView.addSubview(name)
        contentView.addSubview(type)
        contentView.addSubview(locImg)
        
        img.snp.makeConstraints { make in
            make.top.equalTo(5)
            make.left.equalTo(5)
            make.bottom.equalTo(-5)
            make.width.equalTo(130)
            make.height.equalTo(100)
        }
        locImg.snp.makeConstraints { make in
            make.top.equalTo(img)
            make.right.equalTo(-5)
            make.centerY.equalTo(img.snp.centerY)
            make.width.height.equalTo(100)
        }
        name.snp.makeConstraints { make in
            make.top.equalTo(20)
            make.left.equalTo(img.snp.right).offset(12)
            make.right.equalTo(locImg.snp.left).offset(10)
            
        }
        type.snp.makeConstraints { make in
            make.top.equalTo(name.snp.bottom).offset(8)
            make.left.equalTo(img.snp.right).offset(12)
           
        }
   
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func initData(_ obj: Home){
        name.text = obj.name
        type.text = obj.type
        img.sd_setImage(with: URL(string: obj.img ?? "placeholder"), placeholderImage: UIImage(named: "placeholder"))
        locImg.sd_setImage(with: URL(string: obj.locImg ?? "placeholder"), placeholderImage: UIImage(named: "placeholder"))
    }
    
}
