import Foundation
import UIKit

protocol RecommendColorViewDelegate {
    func tappedRefreshButton()
}

class RecommendColorView: UIView {
    lazy var container: UIStackView = {
        let stack = UIStackView()
        stack.distribution = .fill
        stack.axis = .vertical
        
        return stack
    }()
    
    lazy var colorSetView: UIColorSetView = {
        let view = UIColorSetView()
        
        return view
    }()
    
    lazy var refreshButton: UIButton = {
        let button = UIButton()
        button.setTitle("Referesh", for: .normal)
        
        return button
    }()
    
    lazy var loadingView: UIActivityIndicatorView = {
        let indicatorView = UIActivityIndicatorView()
        
        return indicatorView
    }()
    
    var eventDelegate: RecommendColorViewDelegate? = nil
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureView()
    }
    
    
}

extension RecommendColorView: ViewAble {
    func setInitView() {
            
    }
    
    func drawDesign() {
        self.addSubview(container)
        container.translatesAutoresizingMaskIntoConstraints = false
        let centerXOfContainer = NSLayoutConstraint(item: container, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1.0, constant: 1.0)
        let centerYOfContainer = NSLayoutConstraint(item: container, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1.0, constant: 1.0)
        let widthOfContainer = NSLayoutConstraint(item: container, attribute: .width, relatedBy: .equal, toItem: self, attribute: .width, multiplier: 1.0, constant: 1.0)
        let heightOfContainer = NSLayoutConstraint(item: container, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 1.0, constant: 1.0)
        self.addConstraints([centerXOfContainer, centerYOfContainer, widthOfContainer, heightOfContainer])
        
        container.addArrangedSubview(colorSetView)
        colorSetView.translatesAutoresizingMaskIntoConstraints = false
        let widthOfColorSetView = NSLayoutConstraint(item: colorSetView, attribute: .width, relatedBy: .equal, toItem: container, attribute: .width, multiplier: 1.0, constant: 1.0)
        let heightOfColorSetView = NSLayoutConstraint(item: colorSetView, attribute: .height, relatedBy: .equal, toItem: container, attribute: .height, multiplier: 0.8, constant: 1.0)
        self.addConstraints([widthOfColorSetView, heightOfColorSetView])

        
        container.addArrangedSubview(refreshButton)
        refreshButton.translatesAutoresizingMaskIntoConstraints = false
        let widthOfRefreshButton = NSLayoutConstraint(item: refreshButton, attribute: .width, relatedBy: .equal, toItem: container, attribute: .width, multiplier: 1.0, constant: 1.0)
        let heightOfRefreshButton = NSLayoutConstraint(item: refreshButton, attribute: .height, relatedBy: .equal, toItem: container, attribute: .height, multiplier: 0.2, constant: 1.0)
        self.addConstraints([widthOfRefreshButton, heightOfRefreshButton])

    }
    
    func setEvent() {
        refreshButton.addTarget(self, action: #selector(tappedRefreshButton), for: .touchUpInside)
    }
}

extension RecommendColorView {
    @objc
    func tappedRefreshButton() {
        if let eventDelegate = eventDelegate {
            eventDelegate.tappedRefreshButton()
        }
    }
}
