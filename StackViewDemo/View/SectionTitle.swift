//
//  SectionTitle.swift
//  StackViewDemo
//
//  Created by caohanchao on 2022/9/15.
//

import UIKit
import Then
import SnapKit

typealias SectionTitleSelected = (Int) -> Void

class SectionTitle: UIView {
    
    private var selected: SectionTitleSelected?
    
    var title: String = "" {
        didSet {
            titleLabel.text = title
        }
    }
    
    var index: Int = 0
    
    private lazy var titleLabel = UILabel().then {
        $0.textColor = .link
        $0.font = .systemFont(ofSize: 26)
    }
    
    private lazy var line = UIView().then {
        $0.backgroundColor = UIColor.lightGray
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        addSubview(line)
        line.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview()
            make.height.equalTo(1)
        }
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(tapAction))
        addGestureRecognizer(tap)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func selectedHandle(_ handle: @escaping SectionTitleSelected) {
        self.selected = handle
    }
}

private extension SectionTitle {
    
    @objc func tapAction() {
        selected?(index)
    }
    
}
