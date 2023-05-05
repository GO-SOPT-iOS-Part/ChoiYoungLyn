//
//  MainViewController.swift
//  TVING_CloneCoding
//
//  Created by 최영린 on 2023/05/03.
//

import UIKit

import SnapKit
import Then

final class MainViewController: BaseViewController {
    
    // MARK: - Properties
    
    var currentPage: Int = 0 {
        didSet {
            bind(oldValue: oldValue, newValue: currentPage)
        }
    }
    
    // MARK: - UI Components
    
    private let tvingNavigationView = TvingNavigationView()
    private lazy var menuCollectionView = UICollectionView(frame: .zero,
                                                           collectionViewLayout: flowLayout)
    private let flowLayout = UICollectionViewFlowLayout()
    private let menuBarView = UIView()
    private lazy var pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
    private let page = [HomeViewController(), LiveViewController(), TvProgramViewController(),
                        MovieViewController(), ParamountViewController(), KidsViewController()]
    
    // MARK: - Life Cycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerCell()
        setAddTarget()
        setViewControllersInPageVC()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        currentPage = 0
    }
    
    override func setUI() {
        view.backgroundColor = .tvingBlack
        
        menuCollectionView.do {
            $0.showsHorizontalScrollIndicator = false
            $0.backgroundColor = .clear
            $0.dataSource = self
            $0.delegate = self
        }
        
        menuBarView.do {
            $0.backgroundColor = .tvingWhite
        }
        
        flowLayout.do {
            $0.estimatedItemSize = CGSize(width: 150, height: 30)
            $0.scrollDirection = .horizontal
        }
        
        pageViewController.do {
            $0.delegate = self
            $0.dataSource = self
        }
    }
    
    override func setLayout() {
        addChild(pageViewController)
        view.addSubviews(pageViewController.view, tvingNavigationView, menuCollectionView, menuBarView)
        
        tvingNavigationView.snp.makeConstraints {
            $0.top.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(40)
        }
        
        menuCollectionView.snp.makeConstraints {
            $0.top.equalTo(tvingNavigationView.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(30)
        }
        
        pageViewController.view.snp.makeConstraints {
            $0.top.leading.trailing.bottom.equalToSuperview()
        }
        
        pageViewController.didMove(toParent: self)
    }
}

// MARK: - Extensions

private extension MainViewController {
    func registerCell() {
        MenuCollectionViewCell.register(target: menuCollectionView)
    }
    
    func setAddTarget() {
        tvingNavigationView.myPageButton.addTarget(self, action: #selector(myPageButtonTapped), for: .touchUpInside)
    }
    
    @objc func myPageButtonTapped() {
        self.navigationController?.pushViewController(MyPageViewController(), animated: false)
        self.navigationController?.isNavigationBarHidden = false
    }
    
    func setViewControllersInPageVC() {
        if let homeVC = page.first {
            pageViewController.setViewControllers([homeVC], direction: .forward, animated: true, completion: nil)
        }
    }
    
    func bind(oldValue: Int, newValue: Int) {
        let direction: UIPageViewController.NavigationDirection = oldValue < newValue ? .forward : .reverse
        pageViewController.setViewControllers([page[currentPage]], direction: direction, animated: true, completion: nil)
        menuCollectionView.selectItem(at: IndexPath(item: currentPage, section: 0), animated: true, scrollPosition: .centeredHorizontally)
    }
    
    func didTapCell(at indexPath: IndexPath) {
        currentPage = indexPath.item
    }
}

extension MainViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.reloadData()
        self.didTapCell(at: indexPath)
    }
}

extension MainViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return I18N.Main.menuArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = menuCollectionView.dequeueReusableCell(withReuseIdentifier: MenuCollectionViewCell.className, for: indexPath) as? MenuCollectionViewCell else { return UICollectionViewCell() }
        cell.menuLabel.text = I18N.Main.menuArray[indexPath.row]
        return cell
    }
}

extension MainViewController: UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let index = page.firstIndex(of: viewController) else { return nil }
        let previousIndex = index - 1
        if previousIndex < 0 {
            return nil
        }
        return page[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let index = page.firstIndex(of: viewController) else { return nil }
        let nextIndex = index + 1
        if nextIndex == page.count {
            return nil
        }
        return page[nextIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        guard let currentVC = pageViewController.viewControllers?.first,
              let currentIndex = page
            .firstIndex(of: currentVC) else { return }
        currentPage = currentIndex
        print(currentIndex)
    }
}
