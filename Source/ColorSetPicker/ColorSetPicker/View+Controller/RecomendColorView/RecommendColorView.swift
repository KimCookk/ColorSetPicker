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
    
    lazy var refreshButtonView: UIView = {
        let view = UIView()
        
        return view
    }()
    
    lazy var refreshButton: UIButton = {
        let button = UIButton()
        button.setTitle("Referesh", for: .normal)
        button.backgroundColor = .systemGray
        button.layer.cornerRadius = 10
        return button
    }()
    
    lazy var loadingView: UIActivityIndicatorView = {
        let indicatorView = UIActivityIndicatorView()
        indicatorView.backgroundColor = .darkGray.withAlphaComponent(0.5)
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
        let centerXOfContainer = NSLayoutConstraint(item: container, attribute: .centerX, relatedBy: .equal, toItem: self.safeAreaLayoutGuide, attribute: .centerX, multiplier: 1.0, constant: 1.0)
        let centerYOfContainer = NSLayoutConstraint(item: container, attribute: .centerY, relatedBy: .equal, toItem: self.safeAreaLayoutGuide, attribute: .centerY, multiplier: 1.0, constant: 1.0)
        let widthOfContainer = NSLayoutConstraint(item: container, attribute: .width, relatedBy: .equal, toItem: self.safeAreaLayoutGuide, attribute: .width, multiplier: 1.0, constant: 1.0)
        let heightOfContainer = NSLayoutConstraint(item: container, attribute: .height, relatedBy: .equal, toItem: self.safeAreaLayoutGuide, attribute: .height, multiplier: 1.0, constant: 1.0)
        self.addConstraints([centerXOfContainer, centerYOfContainer, widthOfContainer, heightOfContainer])
        
        container.addArrangedSubview(colorSetView)
        colorSetView.translatesAutoresizingMaskIntoConstraints = false
        let widthOfColorSetView = NSLayoutConstraint(item: colorSetView, attribute: .width, relatedBy: .equal, toItem: container, attribute: .width, multiplier: 1.0, constant: 1.0)
        let heightOfColorSetView = NSLayoutConstraint(item: colorSetView, attribute: .height, relatedBy: .equal, toItem: container, attribute: .height, multiplier: 0.9, constant: 1.0)
        self.addConstraints([widthOfColorSetView, heightOfColorSetView])

        
        container.addArrangedSubview(refreshButtonView)
        refreshButtonView.translatesAutoresizingMaskIntoConstraints = false
        let widthOfRefreshButtonView = NSLayoutConstraint(item: refreshButtonView, attribute: .width, relatedBy: .equal, toItem: container, attribute: .width, multiplier: 1.0, constant: 1.0)
        let heightOfRefreshButtonView = NSLayoutConstraint(item: refreshButtonView, attribute: .height, relatedBy: .equal, toItem: container, attribute: .height, multiplier: 0.1, constant: 1.0)
        self.addConstraints([widthOfRefreshButtonView, heightOfRefreshButtonView])
        
        refreshButtonView.addSubview(refreshButton)
        refreshButton.translatesAutoresizingMaskIntoConstraints = false
        let centerXOfRefreshButton = NSLayoutConstraint(item: refreshButton, attribute: .centerX, relatedBy: .equal, toItem: refreshButtonView, attribute: .centerX, multiplier: 1.0, constant: 1.0)
        let centerYOfRefreshButton = NSLayoutConstraint(item: refreshButton, attribute: .centerY, relatedBy: .equal, toItem: refreshButtonView, attribute: .centerY, multiplier: 1.0, constant: 1.0)
        let widthOfRefreshButton = NSLayoutConstraint(item: refreshButton, attribute: .width, relatedBy: .equal, toItem: refreshButtonView, attribute: .width, multiplier: 0.5, constant: 1.0)
        let heightOfRefreshButton = NSLayoutConstraint(item: refreshButton, attribute: .height, relatedBy: .equal, toItem: refreshButtonView, attribute: .height, multiplier: 0.5, constant: 1.0)
        refreshButtonView.addConstraints([centerXOfRefreshButton, centerYOfRefreshButton, widthOfRefreshButton, heightOfRefreshButton])
        
        self.addSubview(loadingView)
        loadingView.translatesAutoresizingMaskIntoConstraints = false
        let centerXOfLoadingView = NSLayoutConstraint(item: loadingView, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1.0, constant: 1.0)
        let centerYOfLoadingView = NSLayoutConstraint(item: loadingView, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1.0, constant: 1.0)
        let widthOfLoadingView = NSLayoutConstraint(item: loadingView, attribute: .width, relatedBy: .equal, toItem: self, attribute: .width, multiplier: 1.0, constant: 1.0)
        let heightOfLoadingView = NSLayoutConstraint(item: loadingView, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 1.0, constant: 1.0)
        self.addConstraints([centerXOfLoadingView, centerYOfLoadingView, widthOfLoadingView, heightOfLoadingView])
       
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

extension RecommendColorView {
    
    func setColorOfColorView(colors: [UIColor]) {
        colorSetView.updateColorSetView(colors: colors)
    }
    
    func startLoading() {
        loadingView.startAnimating()
    }
    
    func completeLoading() {
        loadingView.stopAnimating()
    }
}
