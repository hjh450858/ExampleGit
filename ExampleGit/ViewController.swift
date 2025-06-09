//
//  ViewController.swift
//  ExampleGit
//
//  Created by 황재현 on 6/9/25.
//

import UIKit
import SnapKit
import Then
import RxSwift
import RxCocoa
import Then


class ViewController: UIViewController {
    
    let button = UIButton()
    
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        
        binding()
    }
    
    
    
    func configureUI() {
        view.addSubview(button)
    }

    
    func binding() {
        button.rx.tap.asDriver(onErrorJustReturn: ()).drive { [weak self] tap in
            guard let self = self else { return }
            print("tap")
        }
    }
}

