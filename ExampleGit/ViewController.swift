//
//  ViewController.swift
//  ExampleGit
//
//  Created by 황재현 on 6/9/25.
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa
import Then


class ViewController: UIViewController {
    
    let button = UIButton().then {
        $0.layer.cornerRadius = 8
        $0.layer.borderWidth = 0.3
        $0.layer.borderColor = UIColor.black.cgColor
        $0.setTitle("버튼", for: .normal)
        $0.setTitleColor(.black, for: .normal)
    }
    
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        
        binding()
    }
    
    
    
    func configureUI() {
        view.addSubview(button)
        
        button.snp.makeConstraints { make in
            make.centerY.equalTo(view.snp.centerY)
            make.leading.trailing.equalTo(view).inset(16)
        }
    }

    
    func binding() {
//        button.rx.tap.subscribe(onNext: { [weak self] tap in
//            guard let self = self else { return }
//            print("tap")
//        }).disposed(by: disposeBag)
        
        button.rx.tap.asSignal().emit { [weak self] tap in
            guard let self = self else { return }
            print("signal tap")
        }.disposed(by: disposeBag)
    }
}

