//
//  Constants.swift
//  HotelReservation
//
//  Created by Ruslan Shigapov on 15.12.2023.
//

import UIKit

enum Constants {
    // MARK: Fonts
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
    
    // MARK: Colors
    enum Colors {
        static var customBlue: UIColor {
            UIColor(red: 13/255, green: 114/255, blue: 255/255, alpha: 1)
        }
        static var backgroundBlue: UIColor {
            UIColor(red: 13/255, green: 114/255, blue: 255/255, alpha: 0.1)
        }
        static var customGold: UIColor {
            UIColor(red: 255/255, green: 168/255, blue: 0/255, alpha: 1)
        }
        static var backgroundGold: UIColor {
            UIColor(red: 255/255, green: 199/255, blue: 0/255, alpha: 0.2)
        }
        static var customGray: UIColor {
            UIColor(red: 130/255, green: 135/255, blue: 150/255, alpha: 1)
        }
        static var backgroundGray: UIColor {
            UIColor(red: 251/255, green: 251/255, blue: 252/255, alpha: 1)
        }
    }
    
    // MARK: Images
    enum Images {
        static var star: UIImage {
            UIImage(named: "Star")!
        }
        static var arrowNext: UIImage {
            UIImage(named: "ArrowNext")!
        }
        static var conveniences: UIImage {
            UIImage(named: "EmojiHappy")!
        }
        static var whatIsIncluded: UIImage {
            UIImage(named: "TickSquare")!
        }
        static var whatIsNotIncluded: UIImage {
            UIImage(named: "CloseSquare")!
        }
        static var blueArrowNext: UIImage {
            UIImage(named: "BlueArrowNext")!
        }
        static var arrowBack: UIImage {
            UIImage(named: "ArrowBack")!
        }
    }
    
    // MARK: Text
    enum Text {
        static var hotel = "Отель"
        static var conveniences = "Удобства"
        static var whatIsIncluded = "Что включено"
        static var whatIsNotIncluded = "Что не включено"
        static var mostNecessary = "Самое необходимое"
        static var roomDetails = "Подробнее о номере"
        static var booking = "Бронирование"
        
        enum CellTitle {
            static var aboutHotel = "Об отеле"
        }
        
        enum ButtonTitle {
            static var toRoomChoice = "К выбору номера"
            static var chooseRoom = "Выбрать номер"
        }
    }    
}
