//
//  UserDefaultsPref.swift
//  MexicoInteligente
//
//  Created by Jorge Espinoza on 23/01/26.
//

import Foundation
import UIKit

struct UserDefaultsPref {
    
    static var userId: Int {
        get {
            return UserDefaults.standard.integer(forKey: Constants.DEFAULT_USER_ID)
        } set (value) {
            UserDefaults.standard.set(value, forKey: Constants.DEFAULT_USER_ID)
            UserDefaults.standard.synchronize()
        }
    }
    
    static var userName: String {
        get {
            return UserDefaults.standard.string(forKey: Constants.DEFAULT_USER_NAME) ?? ""
        } set (value) {
            UserDefaults.standard.set(value, forKey: Constants.DEFAULT_USER_NAME)
            UserDefaults.standard.synchronize()
        }
    }
    
    static var userEmail: String {
        get {
            return UserDefaults.standard.string(forKey: Constants.DEFAULT_USER_EMAIL) ?? ""
        } set (value) {
            UserDefaults.standard.set(value, forKey: Constants.DEFAULT_USER_EMAIL)
            UserDefaults.standard.synchronize()
        }
    }
    
    static var userPhone: String {
        get {
            return UserDefaults.standard.string(forKey: Constants.DEFAULT_USER_PHONE) ?? ""
        } set (value) {
            UserDefaults.standard.set(value, forKey: Constants.DEFAULT_USER_PHONE)
            UserDefaults.standard.synchronize()
        }
    }
    
    static var userPhoto: String {
        get {
            return UserDefaults.standard.string(forKey: Constants.DEFAULT_USER_PHOTO) ?? ""
        } set (value) {
            UserDefaults.standard.set(value, forKey: Constants.DEFAULT_USER_PHOTO)
            UserDefaults.standard.synchronize()
        }
    }
    
    static var lastLogin: String {
        get {
            return UserDefaults.standard.string(forKey: Constants.DEFAULT_LAST_LOGIN) ?? "Hoy"
        } set (value) {
            UserDefaults.standard.set(value, forKey: Constants.DEFAULT_LAST_LOGIN)
            UserDefaults.standard.synchronize()
        }
    }
    
    static var hideOnboarding: Bool {
        get {
            return UserDefaults.standard.bool(forKey: Constants.DEFAULT_ONBOARDING_SHOW) 
        } set (value) {
            UserDefaults.standard.set(value, forKey: Constants.DEFAULT_ONBOARDING_SHOW)
            UserDefaults.standard.synchronize()
        }
    }
    
    static var hideCreateRealState: Bool {
        get {
            return UserDefaults.standard.bool(forKey: Constants.DEFAULT_REALSTATE_SHOW) 
        } set (value) {
            UserDefaults.standard.set(value, forKey: Constants.DEFAULT_REALSTATE_SHOW)
            UserDefaults.standard.synchronize()
        }
    }
}
