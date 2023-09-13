//
//  InfoVC.swift
//  WorldApp
//
//  Created by Murtazaev Mirjaloliddin Kamolovich on 22/02/23.
//

import UIKit
import SnapKit

class InfoVC: UIViewController {
    
    lazy var aboutView = UIView()
    
    lazy var textView: UITextView = {
        let text = UITextView()
        text.text = "Brief information about bread Bread is a staple food prepared from a dough of flour (usually wheat) and water, usually by baking. Throughout recorded history and around the world, it has been an important part of many cultures' diet. It is one of the oldest human-made foods, having been of significance since the dawn of agriculture, and plays an essential role in both religious rituals and secular culture.Bread may be leavened by naturally occurring microbes (e.g. sourdough), chemicals (e.g. baking soda), industrially produced yeast, or high-pressure aeration, which creates the gas bubbles that fluff up bread. In many countries, commercial bread often contains additives to improve flavor, texture, color, shelf life, nutrition, and ease of production."
        text.backgroundColor = .clear
        text.font = UIFont.systemFont(ofSize: 24)
        return text
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        aboutView.backgroundColor = .red
     
        let titleLabel = UILabel ()
        
        titleLabel.text = "About Breads"
        titleLabel.textColor = .white
        titleLabel.font = .systemFont(ofSize: 26, weight: .bold)
        navigationItem.titleView = titleLabel;
       
        view.addSubview(textView)
        view.addSubview(aboutView)
        
        aboutView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.right.left.equalTo(0)
            make.height.equalTo(60)
        }
        
        textView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(50)
            make.right.left.equalTo(0)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(200)
        }
        
    }
    
}
