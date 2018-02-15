//
//  GSCardView.swift
//  Theme
//
//  Created by Deepkak Mandwariya on 9/6/16.

//

import UIKit
@objcMembers
@IBDesignable open class GSCardView: UIView {

    
    @IBInspectable open var enableBorder : Bool = false {
        didSet{
            self.configureCardView()
        }
    }
    
    @IBInspectable var roundRectEnable : Bool = true {
        didSet{
            self.configureCardView()
        }
    }
    
    @IBInspectable open var dropShadow : Bool = true {
        didSet{
            self.configureCardView()
        }
    }
    
    
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    
    required public init(coder aDecoder: NSCoder) {
        super.init(coder:aDecoder)!
        self.configureCardView()
    }
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        self.configureCardView()
    }
    
    
    func configureCardView() {
        
        // border radius
        self.layer.cornerRadius = self.roundRectEnable ? 3.0 : 0.0
        
        
        // border
        self.layer.borderColor = UIColor.lightGray.cgColor
        self.layer.borderWidth = self.enableBorder ? 0.5 : 0
        
        
        // drop shadow
        self.layer.shadowColor = self.dropShadow ? UIColor.black.cgColor : UIColor.clear.cgColor
        self.layer.shadowOpacity = 0.2
        self.layer.shadowRadius = 6.0
        self.layer.shadowOffset = CGSize(width: 0, height: 2.0)
        
    }

}
