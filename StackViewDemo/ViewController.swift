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

    private let list = ["简单列表 >","嵌套使用 >","动态更新 >","case 4","case 5"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var sections = [SectionTitle]()
        list.enumerated().forEach { (index, title) in
            let section = SectionTitle().then {
                $0.title = title
                $0.index = index
                $0.heightConstraint = 50
                $0.selectedHandle { index in
                    if index == 0 {
                        
                    } else if index == 1 {
                        
                    } else if index == 2 {
                        
                    } else if index == 3 {
                        
                    } else if index == 4 {
                        
                    }
                }
            }
            sections.append(section)
        }

        vStack.addArrangedSubviewsMakeConstraint(sections)
        
        view.addSubview(vStack)
        vStack.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.top.equalToSuperview().offset(64);
        }
        
        
    }

}

