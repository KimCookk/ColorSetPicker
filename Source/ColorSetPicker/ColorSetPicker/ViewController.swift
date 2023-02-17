//
//  ViewController.swift
//  TodaySense
//
//  Created by 김태성 on 2023/02/16.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var FirstColorView: UIView!
    @IBOutlet weak var SecondsColorView: UIView!
    @IBOutlet weak var ThirdColorView: UIView!
    @IBOutlet weak var FourthColorView: UIView!
    @IBOutlet weak var FifthColorView: UIView!
    
    var networkingService: NetworkingService? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        refreshColor()
        
    }
    
    func refreshColor() {
        networkingService = NetworkingService()
        
        let randomColor = UIColor.randomColor()
        let urlString = "https://palett.es/API/v1/palette/from/\(randomColor.toHexStr())"
        print("\(randomColor.toHexStr())")
        networkingService?.requestGet(urlString: urlString, completionHandler: { (isComplete, colorSet) in
            if(isComplete) {
                guard let colorSet = colorSet as? [String] else {
                    return
                }
                self.updateColorView(colorSet: colorSet)
            }
        })
    }
    
    func updateColorView(colorSet: [String]) {
        print(colorSet)
        DispatchQueue.main.async {
            self.FirstColorView.backgroundColor = UIColor(hex: colorSet[0])
            self.SecondsColorView.backgroundColor = UIColor(hex: colorSet[1])
            self.ThirdColorView.backgroundColor = UIColor(hex: colorSet[2])
            self.FourthColorView.backgroundColor = UIColor(hex: colorSet[3])
            self.FifthColorView.backgroundColor = UIColor(hex: colorSet[4])
        }
    }

    @IBAction func tappedRefreshButton(_ sender: Any) {
        guard let networkingService = networkingService else {
            return
        }
        refreshColor()
    }
}

