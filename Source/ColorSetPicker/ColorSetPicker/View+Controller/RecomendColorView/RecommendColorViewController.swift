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
    
    func refreshColor() {
//        networkingService = NetworkingService()
//
//        let randomColor = UIColor.randomColor()
//        let urlString = "https://palett.es/API/v1/palette/from/\(randomColor.toHexStr())"
//
//        print("\(randomColor.toHexStr())")
//        networkingService?.requestGet(urlString: urlString, completionHandler: { (isComplete, colorSet) in
//            if(isComplete) {
//                guard let colorSet = colorSet as? [String] else {
//                    return
//                }
//                self.updateColorView(colorSet: colorSet)
//            }
//        })
    }
    
    func updateColorView(colorSet: [String]) {
        print(colorSet)
//        DispatchQueue.main.async {
//            self.FirstColorView.backgroundColor = UIColor(hex: colorSet[0])
//            self.SecondsColorView.backgroundColor = UIColor(hex: colorSet[1])
//            self.ThirdColorView.backgroundColor = UIColor(hex: colorSet[2])
//            self.FourthColorView.backgroundColor = UIColor(hex: colorSet[3])
//            self.FifthColorView.backgroundColor = UIColor(hex: colorSet[4])
//        }
    }

//    @IBAction func tappedRefreshButton(_ sender: Any) {
//        guard let networkingService = networkingService else {
//            return
//        }
//        refreshColor()
//    }
}

extension RecommendColorViewController: ViewAble {
    func setInitView() {
        
    }
    
    func drawDesign() {
          view.addSubview(recommendColorView)
        
        recommendColorView.translatesAutoresizingMaskIntoConstraints = false
        let centerXOfRecommendColorView = NSLayoutConstraint(item: recommendColorView, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1.0, constant: 0.0)
        let centerYOfRecommendColorView = NSLayoutConstraint(item: recommendColorView, attribute: .centerY, relatedBy: .equal, toItem: view, attribute: .centerY, multiplier: 1.0, constant: 0.0)
        let widthOfRecommendColorView = NSLayoutConstraint(item: recommendColorView, attribute: .width, relatedBy: .equal, toItem: view, attribute: .width, multiplier: 1.0, constant: 0.0)
        let heightOfRecommendColorView = NSLayoutConstraint(item: recommendColorView, attribute: .height, relatedBy: .equal, toItem: view, attribute: .height, multiplier: 1.0, constant: 0.0)
        view.addConstraints([centerXOfRecommendColorView, centerYOfRecommendColorView, widthOfRecommendColorView, heightOfRecommendColorView])
        
        
    }
    
    func setEvent() {
        recommendColorView.eventDelegate = self
    }
}

extension RecommendColorViewController: RecommendColorViewDelegate {
    func tappedRefreshButton() {
        print("tapped Refresh Button ")
    }
}
