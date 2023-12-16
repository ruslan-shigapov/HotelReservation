//
//  Constants.swift
//  HotelReservation
//
//  Created by Ruslan Shigapov on 15.12.2023.
//

import UIKit

enum Constants {
    enum Fonts {
        static var sf14Medium: UIFont {
            UIFont(name: "SFProDisplay-Medium", size: 14)!
        }
        
        static var sf16Medium: UIFont {
            UIFont(name: "SFProDisplay-Medium", size: 16)!
        }
        
        static var sf18Medium: UIFont {
            UIFont(name: "SFProDisplay-Medium", size: 18)!
        }
        
        static var sf22Medium: UIFont {
            UIFont(name: "SFProDisplay-Medium", size: 22)!
        }
        
        static var sf16Regular: UIFont {
            UIFont(name: "SFProDisplay-Regular", size: 16)!
        }
        
        static var sf30Semibold: UIFont {
            UIFont(name: "SFProDisplay-Semibold", size: 30)!
        }
    }
    
    enum Colors {
        static var customBlue: UIColor {
            UIColor(red: 13/255, green: 114/255, blue: 255/255, alpha: 1)
        }
        
        static var gold: UIColor {
            UIColor(red: 255/255, green: 168/255, blue: 0/255, alpha: 1)
        }
        
        static var lightGold: UIColor {
            UIColor(red: 255/255, green: 199/255, blue: 0/255, alpha: 0.2)
        }
        
        static var customGray: UIColor {
            UIColor(red: 130/255, green: 135/255, blue: 150/255, alpha: 1)
        }
    }
    
    enum Images {
        static var star: UIImage {
            UIImage(named: "Star")!
        }
    }
}
