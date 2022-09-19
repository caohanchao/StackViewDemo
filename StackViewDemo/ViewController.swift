//
//  ViewController.swift
//  StackViewDemo
//
//  Created by caohanchao on 2022/9/15.
//

import UIKit
import Then
import SnapKit

class ViewController: UIViewController {
  
    private lazy var vStack = VStack()

    private let list = ["case1  简单列表 >","case2 嵌套使用 >","case3 动态更新 >","case 4 滚动列表","case 5"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var sections = [SectionTitle]()
        list.enumerated().forEach { (index, title) in
            let section = SectionTitle().then {
                $0.title = title
                $0.index = index
                $0.heightConstraint = 64
                $0.selectedHandle { index in
                    if index == 0 {
                        let nav = UINavigationController.init(rootViewController: SimpleListViewController())
                        nav.modalPresentationStyle = .fullScreen
                        self.present(nav, animated: true)
                    } else if index == 1 {
                        let nav = UINavigationController.init(rootViewController: NestListViewController())
                        nav.modalPresentationStyle = .fullScreen
                        self.present(nav, animated: true)
                    } else if index == 2 {
                        let nav = UINavigationController.init(rootViewController: DynamicListViewController())
                        nav.modalPresentationStyle = .fullScreen
                        self.present(nav, animated: true)
                    } else if index == 3 {
                        let nav = UINavigationController.init(rootViewController: ScrollListViewController())
                        nav.modalPresentationStyle = .fullScreen
                        self.present(nav, animated: true)
                        
                    } else if index == 4 {
                        
                    }
                }
            }
            sections.append(section)
        }

//        vStack.addArrangedSubviewsMakeConstraint(sections)
        vStack.addArrangedSubviews(sections) {
            
        }
        
        view.addSubview(vStack)
        vStack.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.top.equalToSuperview().offset(88);
        }
    }
}

