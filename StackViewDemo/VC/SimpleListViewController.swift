//
//  SimpleListViewController.swift
//  StackViewDemo
//
//  Created by caohanchao on 2022/9/15.
//

import UIKit
import Then
import SnapKit

class SimpleListViewController: UIViewController {

    private lazy var vStack = VStack(spacing: 16)
    
    private let nameList = ["angle", "123", "baby", "456", "momo", "789"]
       
    deinit {
        print("释放")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "简单列表"
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: .init(systemName: "xmark"), style: .plain, target: self, action: #selector(backAction))
        
        view.backgroundColor = .white
        
        view.addSubview(vStack)
        vStack.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(112)
            make.leading.trailing.equalToSuperview()
        }
        
        var itemList = [SimpleItem]()
        for name in nameList {
            let item = SimpleItem().then {
                $0.title.text = name
            }
            itemList.append(item)
        }
        vStack.addArrangedSubviews(itemList) {
            
        }
    }
    
    @objc func backAction() {
        self.dismiss(animated: true)
    }
}

class SimpleItem: UIView {
    
    private lazy var hStack = HStack(spacing: 8, alignment: .center, distribution: .fill)
    
    private lazy var iconView = UIImageView(image: .init(systemName: "person.crop.circle"))
    
    lazy var title = UILabel().then {
        $0.font = .systemFont(ofSize: 18)
    }

    private lazy var follow = UIButton(type: .system).then {
        $0.setTitleColor(.link, for: .normal)
        $0.setTitle("+ 关注", for: .normal)
        $0.layer.cornerRadius = 15
        $0.layer.borderColor = UIColor.link.cgColor
        $0.layer.borderWidth = 1
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        initUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension SimpleItem {
    func initUI() {
        addSubview(hStack)
        hStack.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16))
        }
        
        /// 这里是使用的扩展方法
        
//        hStack.addArrangedSubviewsMakeConstraint([iconView, title, hStack.spacer(), follow])
//        
        hStack.addArrangedSubviews([iconView, title, hStack.spacer(), follow]) {
            iconView.sizeConstraint = CGSize(width: 40, height: 40)
            title.heightConstraint = 30
            follow.sizeConstraint = CGSize(width: 60, height: 30)
        }
        
    }
}
