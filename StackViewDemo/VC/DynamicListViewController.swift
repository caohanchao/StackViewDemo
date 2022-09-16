//
//  DynamicListViewController.swift
//  StackViewDemo
//
//  Created by caohanchao on 2022/9/16.
//

import UIKit

class DynamicListViewController: UIViewController {

    private lazy var vStack = VStack(spacing: 16)
    
    private let nameList = ["angle", "123", "baby", "456", "momo", "伍六七"]
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "动态更新"
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: .init(systemName: "xmark"), style: .plain, target: self, action: #selector(backAction))
        
        view.backgroundColor = .white
        
        view.addSubview(vStack)
        vStack.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(112)
            make.leading.trailing.equalToSuperview()
        }
        
        var itemList = [DynamicItem]()
        for name in nameList {
            let item = DynamicItem().then {
                $0.title.text = name
                $0.detail.text = "简介：一枚小鲜肉"
            }
            itemList.append(item)
        }
        vStack.addArrangedSubviewsMakeConstraint(itemList)
    }
    
    @objc func backAction() {
        self.dismiss(animated: true)
    }
 

}

class DynamicItem: UIView {
    
    private lazy var hStack = HStack(spacing: 8, alignment: .center, distribution: .fill)
    
    private lazy var vStack = VStack(spacing: 4, alignment: .fill, distribution: .fill)
    
    private lazy var titleHStack = HStack(spacing: 4, alignment: .center, distribution: .fill)
    
    private lazy var iconView = UIImageView(image: .init(systemName: "person.crop.circle"))
    
    lazy var title = UILabel().then {
        $0.font = .systemFont(ofSize: 18)
    }
    
    lazy var detail = UILabel().then {
        $0.font = .systemFont(ofSize: 14)
        $0.textColor = .gray
    }
    
    private lazy var followLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 12)
        $0.text = "已关注"
        $0.layer.cornerRadius = 7.5
        $0.textColor = .systemGray2
        $0.layer.borderColor = UIColor.systemGray2.cgColor
        $0.layer.borderWidth = 1
        $0.isHidden = true
        $0.textAlignment = .center
    }

    private lazy var follow = UIButton(type: .system).then {
        $0.setTitleColor(.link, for: .normal)
        $0.setTitle("+ 关注", for: .normal)
        $0.layer.cornerRadius = 15
        $0.layer.borderColor = UIColor.link.cgColor
        $0.layer.borderWidth = 1
        $0.addTarget(self, action: #selector(followAction), for: .touchUpInside)
    }
    
    private var isFollow: Bool = false {
        didSet {
            self.follow.isHidden = isFollow
            self.followLabel.isHidden = !isFollow
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension DynamicItem {
    func setupUI() {

        addSubview(hStack)
        hStack.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16))
        }
        
        /// 这里是使用的扩展方法
        iconView.sizeConstraint = CGSize(width: 50, height: 50)
        follow.sizeConstraint = CGSize(width: 60, height: 30)
        hStack.addArrangedSubviewsMakeConstraint([iconView, vStack, hStack.spacer(), follow])

        vStack.addArrangedSubviews([titleHStack,
                                    detail])
        
        followLabel.sizeConstraint = CGSize(width: 50, height: 15)
        titleHStack.addArrangedSubviewsMakeConstraint([title, followLabel, titleHStack.spacer()])
        
    }
    
    
    @objc func followAction() {
        isFollow = !isFollow
    }
}
