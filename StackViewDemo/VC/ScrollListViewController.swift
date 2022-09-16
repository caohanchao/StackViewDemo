//
//  ScrollListViewController.swift
//  StackViewDemo
//
//  Created by caohanchao on 2022/9/16.
//

import UIKit

class ScrollListViewController: UIViewController {

    private lazy var scrollView = UIScrollView()
    
    private lazy var vStack = VStack(spacing: 16)
    
    private let nameList = ["angle", "123", "baby", "456", "momo", "伍六七八", "4567", "momo", "伍六七", "1111"]
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "动态更新"
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: .init(systemName: "xmark"), style: .plain, target: self, action: #selector(backAction))
        
        view.backgroundColor = .white
        
        view.addSubview(scrollView)
        scrollView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(64)
            make.leading.bottom.trailing.equalToSuperview()
        }
        
        scrollView.addSubview(vStack)
        vStack.snp.makeConstraints { make in
//            make.top.leading.trailing.equalToSuperview()
            make.edges.equalToSuperview();
            make.width.equalToSuperview()
        }
        
        var itemList = [UIView]()
        for name in nameList {
            let item = DynamicItem().then {
                $0.title.text = name
                $0.detail.text = "简介：一枚小鲜肉"
            }
            itemList.append(item)
        }
        
        itemList.append(vStack.spacer())
        vStack.addArrangedSubviewsMakeConstraint(itemList)
    }
    
    @objc func backAction() {
        self.dismiss(animated: true)
    }

}
