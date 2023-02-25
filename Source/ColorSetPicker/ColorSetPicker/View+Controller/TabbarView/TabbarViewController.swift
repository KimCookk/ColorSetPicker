//
//  TabbarViewController.swift
//  ColorSetPicker
//
//  Created by 김태성 on 2023/02/25.
//

import UIKit

class TabbarViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let firstNavigationController = UINavigationController()
        let firstTabController = RecommendColorViewController()
        firstNavigationController.addChild(firstTabController)
        ///기본으로 보여질 이미지
        firstNavigationController.tabBarItem.image = UIImage(named: "")
        ///선택되었을 때 보여질 이미지
        firstNavigationController.tabBarItem.selectedImage = UIImage(named: "")
        ///탭바 아이템 타이틀
        firstNavigationController.tabBarItem.title = "홈1"
        
        let secondsNavigationController = UINavigationController()
        let secondsTabController = RecommendColorViewController()
        secondsNavigationController.addChild(secondsTabController)
        ///기본으로 보여질 이미지
        secondsNavigationController.tabBarItem.image = UIImage(named: "")
        ///선택되었을 때 보여질 이미지
        secondsNavigationController.tabBarItem.selectedImage = UIImage(named: "")
        ///탭바 아이템 타이틀
        secondsNavigationController.tabBarItem.title = "홈2"
        
        let viewControllers = [firstNavigationController, secondsNavigationController]
        self.setViewControllers(viewControllers, animated: true)
    }
}
