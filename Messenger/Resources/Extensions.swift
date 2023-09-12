//
//  Extensions.swift
//  Messenger
//
//  Created by PDD on 07/09/2023.
//

import Foundation
import UIKit

extension UIView{
    public var width: CGFloat{
        return self.frame.size.width
    }
    
    public var height: CGFloat{
        return self.frame.size.height
    }
    
    public var top: CGFloat{
        return self.frame.origin.y
    }
    
    public var bottom: CGFloat{
        return self.frame.origin.y + self.frame.self.height
    }
    
    public var left: CGFloat{
        return self.frame.origin.x
    }
    
    public var right: CGFloat{
        return self.frame.origin.x + self.frame.self.width
    }
}
