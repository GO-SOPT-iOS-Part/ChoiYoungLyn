//
//  MyPageTableView.swift
//  TVING_CloneCoding
//
//  Created by 최영린 on 2023/04/27.
//

import UIKit

import SnapKit
import Then

final class MyPageTableView: UITableView {
    
    private typealias SectionType = AboutSection

    @frozen
    private enum AboutSection: CaseIterable {
        case aboutUser, aboutTving
    }
    
    // MARK: - Life Cycles
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: .grouped)
        registerCell()
        setUI()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Extensions

extension MyPageTableView{
    
    private func setUI() {
        backgroundColor = .tvingBlack
        separatorStyle = .none
        showsVerticalScrollIndicator = false
        rowHeight = 54
        delegate = self
        dataSource = self
    }
    
    private func registerCell() {
        MyPageTableViewCell.register(target: self)
        MyPageHeaderView.register(target: self)
        LineFooterView.register(target: self)
        MyPageFooterView.register(target: self)
    }
}

extension MyPageTableView: UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return AboutSection.allCases.count
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        let sectionType = SectionType.allCases[section]
        switch sectionType {
        case .aboutUser:
            return 300
        case .aboutTving:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        let sectionType = SectionType.allCases[section]
        switch sectionType {
        case .aboutUser:
            return 30
        case .aboutTving:
            return 100
        }
    }
}

extension MyPageTableView: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let sectionType = SectionType.allCases[section]
        switch sectionType {
        case .aboutUser:
            return I18N.MyPage.aboutUserArray.count
        case .aboutTving:
            return I18N.MyPage.aboutTvingArray.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = MyPageTableViewCell.dequeueReusableCell(tableView: tableView, indexPath: indexPath)
        let sectionType = SectionType.allCases[indexPath.section]
        switch sectionType {
        case .aboutUser:
            cell.cellLabel.text = I18N.MyPage.aboutUserArray[indexPath.row]
        case .aboutTving:
            cell.cellLabel.text = I18N.MyPage.aboutTvingArray[indexPath.row]
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let sectionType = SectionType.allCases[section]
        switch sectionType {
        case .aboutUser:
            let profileView = MyPageHeaderView.dequeueReusableHeaderFooterView(tableView: tableView)
            return profileView
        case .aboutTving:
            return nil
        }
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let sectionType = SectionType.allCases[section]
        switch sectionType {
        case .aboutUser:
            let lineView = LineFooterView.dequeueReusableHeaderFooterView(tableView: tableView)
            return lineView
        case .aboutTving:
            let logoutView = MyPageFooterView.dequeueReusableHeaderFooterView(tableView: tableView)
            return logoutView
        }
    }
}



