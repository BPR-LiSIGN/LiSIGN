//
//  RoundedButton.swift - A custom button that stands out over the camera view.
//  LiSIGN
//

/**
# REFERENCE
 The Swift Class is taken from the sample code from the official documentation of Apple (https://developer.apple.com/documentation/arkit/content_anchors/visualizing_and_interacting_with_a_reconstructed_scene)

 The proper reference is done in the Sources of information inside the Project Report.
 */

import UIKit

@IBDesignable
class RoundedButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    func setup() {
        backgroundColor = tintColor
        layer.cornerRadius = 8
        clipsToBounds = true
        setTitleColor(.white, for: [])
        titleLabel?.font = UIFont.boldSystemFont(ofSize: 17)
    }
    
    override var isEnabled: Bool {
        didSet {
            backgroundColor = isEnabled ? tintColor : .gray
        }
    }
}
