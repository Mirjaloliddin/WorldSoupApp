//
//  TextViewVC.swift
//  WorldApp
//
//  Created by Murtazaev Mirjaloliddin Kamolovich on 25/02/23.
//

import UIKit
import SnapKit

class TextViewVC: UIViewController{
    
    lazy var myTextView: UITextView = {
        let text = UITextView()
        text.backgroundColor = .green
        text.font = .systemFont(ofSize: 24, weight: .heavy)
        text.autocorrectionType = .default
        
       // text.isEditable = false
        text.keyboardType = .namePhonePad
        text.textContainerInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        return text
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray
        
        view.addSubview(myTextView)
        myTextView.delegate = self
        
        myTextView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.left.right.equalTo(0)
            make.bottom.equalTo(view.snp.centerY)
        }
    }
}
extension TextViewVC: UITextViewDelegate {
    
    
    
}
