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
        static var sf12Regular: UIFont {
            UIFont(name: "SFProDisplay-Regular", size: 12)!
        }
        static var sf14Regular: UIFont {
            UIFont(name: "SFProDisplay-Regular", size: 14)!
        }
        static var sf16Regular: UIFont {
            UIFont(name: "SFProDisplay-Regular", size: 16)!
        }
        static var sf17Regular: UIFont {
            UIFont(name: "SFProDisplay-Regular", size: 17)!
        }
        static var sf16Semibold: UIFont {
            UIFont(name: "SFProDisplay-Semibold", size: 16)!
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
        static var placeholderGray: UIColor {
            UIColor(red: 169/255, green: 171/255, blue: 183/255, alpha: 1)
        }
        static var textFieldGray: UIColor {
            UIColor(red: 246/255, green: 246/255, blue: 249/255, alpha: 1)
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
        static var blueArrowUp: UIImage {
            UIImage(named: "BlueArrowUp")!
        }
        static var blueArrowDown: UIImage {
            UIImage(named: "BlueArrowDown")!
        }
        static var whitePlus: UIImage {
            UIImage(named: "WhitePlus")!
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
        static var departure = "Вылет из"
        static var arrivalCountry = "Страна, город"
        static var dates = "Даты"
        static var numberOfNights = "Кол-во ночей"
        static var hotelName = "Отель"
        static var room = "Номер"
        static var nutrition = "Питание"
        static var aboutSafety = "Эти данные никому не передаются. После оплаты мы вышлем чек на указанный вами номер и почту"
        static var tour = "Тур"
        static var fuelCharge = "Топливный сбор"
        static var serviceCharge = "Сервисный сбор"
        static var totalPrice = "К оплате"
        
        enum CellTitle {
            static var aboutHotel = "Об отеле"
            static var customerInfo = "Информация о покупателе"
            static var firstTourist = "Первый турист"
            static var tourist = " турист"
            static var addTourist = "Добавить туриста"
        }
        
        enum ButtonTitle {
            static var toRoomChoice = "К выбору номера"
            static var chooseRoom = "Выбрать номер"
        }
        
        enum Placeholder {
            static var phoneNumber = "Номер телефона"
            static var email = "Почта"
            static var firstName = "Имя"
            static var lastName = "Фамилия"
            static var birthDate = "Дата рождения"
            static var citizenship = "Гражданство"
            static var passportNumber = "Номер загранпаспорта"
            static var passportPeriod = "Срок действия загранпаспорта"
        }
    }
}
