//
//  NestListViewController.swift
//  StackViewDemo
//
//  Created by caohanchao on 2022/9/16.
//

import UIKit

class NestListViewController: UIViewController {

    private lazy var vStack = VStack(spacing: 16)
    
    private let nameList = ["angle", "123", "baby", "456", "momo", "789"]
       
    deinit {
        print("释放")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "嵌套使用"
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: .init(systemName: "xmark"), style: .plain, target: self, action: #selector(backAction))
        
        view.backgroundColor = .white
        
        view.addSubview(vStack)
        vStack.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(112)
            make.leading.trailing.equalToSuperview()
        }
        
        var itemList = [NestItem]()
        for name in nameList {
            let item = NestItem().then {
                $0.title.text = name
                $0.detail.text = "简介：一枚小鲜肉"
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


class NestItem: UIView {
    
    private lazy var hStack = HStack(spacing: 8, alignment: .center, distribution: .fill)
    private lazy var vStack = VStack(spacing: 4, alignment: .fill, distribution: .fill)
    private lazy var iconView = UIImageView(image: .init(systemName: "person.crop.circle"))
    
    lazy var title = UILabel().then {
        $0.font = .systemFont(ofSize: 18)
    }
    
    lazy var detail = UILabel().then {
        $0.font = .systemFont(ofSize: 14)
        $0.textColor = .gray
    }
    
    private lazy var helpView = UIImageView(image: .init(systemName: "questionmark.circle"))
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension NestItem {
    func setupUI() {

        addSubview(hStack)
        hStack.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16))
        }
        
        hStack.addArrangedSubviews([iconView, vStack, hStack.spacer(), helpView]) {
            /// 这里是使用的扩展方法
            iconView.sizeConstraint = CGSize(width: 50, height: 50)
            helpView.sizeConstraint = CGSize(width: 30, height: 30)
        }

        vStack.addArrangedSubviews([title,
                                    detail])
    }
}
