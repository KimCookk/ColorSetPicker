//
//  ViewController.swift
//  TodaySense
//
//  Created by 김태성 on 2023/02/16.
//

import UIKit

class RecommendColorViewController: UIViewController {

    lazy var recommendColorView: RecommendColorView = {
        let view = RecommendColorView()
        
        return view
    }()
    
    var networkingService: NetworkingService? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
}

extension RecommendColorViewController: ViewAble {
    func setInitView() {
        
    }
    
    func drawDesign() {
        view.backgroundColor = .white
        view.addSubview(recommendColorView)
        
        recommendColorView.translatesAutoresizingMaskIntoConstraints = false
        let centerXOfRecommendColorView = NSLayoutConstraint(item: recommendColorView, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1.0, constant: 0.0)
        let centerYOfRecommendColorView = NSLayoutConstraint(item: recommendColorView, attribute: .centerY, relatedBy: .equal, toItem: view, attribute: .centerY, multiplier: 1.0, constant: 0.0)
        let widthOfRecommendColorView = NSLayoutConstraint(item: recommendColorView, attribute: .width, relatedBy: .equal, toItem: view, attribute: .width, multiplier: 1.0, constant: 0.0)
        let heightOfRecommendColorView = NSLayoutConstraint(item: recommendColorView, attribute: .height, relatedBy: .equal, toItem: view, attribute: .height, multiplier: 1.0, constant: 0.0)
        view.addConstraints([centerXOfRecommendColorView, centerYOfRecommendColorView, widthOfRecommendColorView, heightOfRecommendColorView])
        
        refreshColor()
    }
    
    func setEvent() {
        recommendColorView.eventDelegate = self
    }
}

extension RecommendColorViewController: RecommendColorViewDelegate {
    func tappedRefreshButton() {
        refreshColor()
    }
    
    func refreshColor() {
        networkingService = NetworkingService()

        let randomColor = UIColor.randomColor()
        let urlString = "https://palett.es/API/v1/palette/from/\(randomColor.toHexStr())"

        print("\(randomColor.toHexStr())")
        
        recommendColorView.startLoading()
        networkingService?.requestGet(urlString: urlString, completionHandler: { (isComplete, colorSet) in
            if(isComplete) {
                guard let colorSet = colorSet as? [String] else {
                    return
                }
                self.updateColorView(colors: colorSet)
            }
        })
    }
    
    func updateColorView(colors: [String]) {
        print(colors)
        var uiColors: [UIColor] = []
        colors.forEach{ colorString in
            if let color = UIColor(hex: colorString) {
                uiColors.append(color)
            }
        }
        DispatchQueue.main.async {
            self.recommendColorView.setColorOfColorView(colors: uiColors)
            self.recommendColorView.completeLoading()
        }
    }
}
