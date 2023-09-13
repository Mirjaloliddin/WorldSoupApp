//
//  CustomView.swift
//  WorldApp
//
//  Created by Murtazaev Mirjaloliddin Kamolovich on 23/02/23.
//

import UIKit

class CustomView: UIView {
    
    let view = UIView()
    let image = UIImageView()
    let title = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        view.frame = CGRect(x: 0, y: 0, width: 150, height: 150)
        view.layer.cornerRadius = 15
        self.addSubview(view)
        
        image.frame = CGRect(x: 20, y: 15, width: 110, height: 100)
        image.backgroundColor = .clear
        view.addSubview(image)
        
        title.frame = CGRect(x: 20, y: 125, width: 110, height: 25)
        title.textAlignment = .center
        view.addSubview(title)
        
    }
    func changeContent( imageName:String, text:String, color:UIColor, titlecolor:UIColor, tinColor: UIColor ){
        image.image = UIImage(named: imageName)?.withRenderingMode(.alwaysTemplate)
        image.tintColor = tinColor
        title.text = text
        title.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        title.textColor = titlecolor
        view.backgroundColor = color
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
