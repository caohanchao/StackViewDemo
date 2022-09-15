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
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "简单列表页"
        
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
        vStack.addArrangedSubviewsMakeConstraint(itemList)
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
    
    private lazy var helpView = UIImageView(image: .init(systemName: "questionmark.circle"))
    
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
        
        /// 这里是使用的扩展方法
        iconView.sizeConstraint = CGSize(width: 40, height: 40)
        title.heightConstraint = 30
        helpView.sizeConstraint = CGSize(width: 30, height: 30)
        hStack.addArrangedSubviewsMakeConstraint([iconView, title, hStack.spacer(), helpView])
        
        addSubview(hStack)
        hStack.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16))
        }
    }
}
