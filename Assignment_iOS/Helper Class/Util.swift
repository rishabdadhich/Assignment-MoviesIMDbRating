//
//  Util.swift
//  ST Ecommerce
//
//  Created by necixy on 30/06/20.
//  Copyright © 2020 Shashi. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import SystemConfiguration

import LanguageManager_iOS
import CoreLocation
import SwiftLocation
import AVFoundation
import Photos
import QuickLook

class Util {
    
    static func makeSignInRootController(){
        
        let controller = storyboardSignIn.instantiateViewController(withIdentifier: "VC_SignIn")
        self.makeRootController(controller: controller)
        
    }
    
    
    
    //-0-//
    
    static func makeHomeRootController(){
        
        let controller = storyboardHome.instantiateViewController(withIdentifier: "Home_VC")
        //        let controller = storyboardHome.instantiateViewController(identifier: "VC_Home")
        self.makeRootController(controller: controller)
    }
    
    static func makeSplashRootController(){
        
        //        let controller = storyboardHome.instantiateViewController(identifier: "TBC_Home")
        let controller = storyboardSplash.instantiateViewController(withIdentifier: "Splash_VC")
        self.makeRootController(controller: controller)
    }
    
    static func makeGuideRootController(){
        
        let controller = storyboardGuide.instantiateViewController(withIdentifier: "Guide_VC")
        //        let controller = storyboardHome.instantiateViewController(identifier: "VC_Home")
        self.makeRootController(controller: controller)
    }
    
    static func makeWelcomeRootController(){
        
        let controller = storyboardGuide.instantiateViewController(withIdentifier: "Welcome_VC")
        //        let controller = storyboardHome.instantiateViewController(identifier: "VC_Home")
        self.makeRootController(controller: controller)
    }
    
    static func makeForgotPinRootController(){
        
//        let controller = storyboardLogin.instantiateViewController(withIdentifier: "ForgotPin_VC")
//        //        let controller = storyboardHome.instantiateViewController(identifier: "VC_Home")
//        self.makeRootController(controller: controller)
    }
    
    static func makeRecieverVCRootController(){
        
        let controller = storyboardDashboard.instantiateViewController(withIdentifier: "RecieverList_VC")
        //        let controller = storyboardHome.instantiateViewController(identifier: "VC_Home")
        self.makeRootController(controller: controller)
    }
    
    static func makeMasterVCRootController(){
           
           let controller = storyboardDashboard.instantiateViewController(withIdentifier: "Split_VC")
           //        let controller = storyboardHome.instantiateViewController(identifier: "VC_Home")
            UIApplication.shared.windows.first?.rootViewController = controller
    }
    
    //-0-//
    
    static func makeRegisterRootController(){
        
        let controller = storyboardRegister.instantiateViewController(withIdentifier: "VC_Register")
        self.makeRootController(controller: controller)
        
    }
    
    static func makeRootController(controller:UIViewController){
        
        let navc = UINavigationController(rootViewController: controller)
        
        navc.navigationBar.isHidden = true
        
        UIApplication.shared.windows.first?.rootViewController = navc
        UIApplication.shared.windows.first?.makeKeyAndVisible()
    }
    
    static func resetDefaults() {
        let defaults = UserDefaults.standard
        let dictionary = defaults.dictionaryRepresentation()
        dictionary.keys.forEach { key in
            if key != UD_Language{
                defaults.removeObject(forKey: key)
            }
            
        }
        
//        LanguageManager.shared.currentLanguage = .en
//        LanguageManager.shared.defaultLanguage = .en
//        LanguageManager.shared.setLanguage(language: Languages.en)
    }
    
    
    
   
    
   
    
    
    static func getDateFrom(timeStampInString:String, format:String) -> String{
        
        var dateString = ""
        guard let timeStamp = Double(timeStampInString) else { return "" }
        
        let formatter = DateFormatter()
        formatter.dateFormat = format
        let exactDate = NSDate.init(timeIntervalSince1970: timeStamp)
        dateString = formatter.string(from: exactDate as Date)
        return dateString
    }
    
    static func getDateFrom(timeStampInString:String) -> Date{
        
        let timeStamp = Double(timeStampInString) ?? 0
        return NSDate.init(timeIntervalSince1970: timeStamp) as Date
    }
    
    static func configureTopViewPosition(heightConstraint:NSLayoutConstraint, bottomConstraint:NSLayoutConstraint){
        heightConstraint.constant = 70
        bottomConstraint.constant = 8
        if DeviceUtils.isDeviceIphoneXOrlatter(){
            heightConstraint.constant = 90
            bottomConstraint.constant = 8
        }
    }
    
    static func configureTopViewPosition(heightConstraint:NSLayoutConstraint){
        heightConstraint.constant = 70
        
        if DeviceUtils.isDeviceIphoneXOrlatter(){
            heightConstraint.constant = 90
        }
    }
}

class APIUtils{
    
    static func prepareModalFromData(_ data: Any, apiName : String, modelName:String, onSuccess success: @escaping (_ JSON: Any) -> Void, onFailure failure: @escaping (_ error: Error?, _ reason: String) -> Void) {
        
        if data is NSDictionary{
            
            let dict = data as! NSDictionary
            if let JSONData = try?  JSONSerialization.data(
                withJSONObject: dict,
                options: .prettyPrinted
                )
            {
                do {
                   if apiName == APIEndPoint.mainScreen.caseValue{
                        let modalData = try MainData(data: JSONData)
                        success(modalData)
                    }else if apiName == APIEndPoint.documents.caseValue{
                        let modalData = try Documents(data: JSONData)
                        success(modalData)
                    }else if apiName == APIEndPoint.DocumentHistory.caseValue{
                        let modalData = try DocumentHistory(data: JSONData)
                        success(modalData)
                    }else if apiName == APIEndPoint.userInfo.caseValue{
                        let modalData = try UserInfo(data: JSONData)
                        success(modalData)
                    }
                    else if apiName == APIEndPoint.documentGroupData.caseValue{
                        let modalData = try DocumentGroup(data: JSONData)
                        success(modalData)
                    }
                    else if apiName == APIEndPoint.documentGroupDetail.caseValue{
                        let modalData = try DocumentGroupDetail(data: JSONData)
                        success(modalData)
                    }
                   
                    else{
                        print("\(apiName) not matched")
                    }
                    
                }catch let error as NSError {
                    // error
                    print("error \(error)")
                    failure(error, apiName)
                }
            }
            
        }
        else if data is NSArray{
            
            let array = data as! NSArray
            var modalArray = [Any]()
            for item in array{
                
                let vac = item as! NSDictionary
                
                if let JSONData = try?  JSONSerialization.data(
                    withJSONObject: vac,
                    options: .prettyPrinted
                    )
                {
                    do {
                         if apiName == APIEndPoint.mainScreen.caseValue{
                            let modalData = try MainData(data: JSONData)
                            modalArray.append(modalData)
                        }else if apiName == APIEndPoint.documents.caseValue{
                            let modalData = try Documents(data: JSONData)
                            modalArray.append(modalData)
                        }else if apiName == APIEndPoint.DocumentHistory.caseValue{
                            let modalData = try DocumentHistory(data: JSONData)
                            modalArray.append(modalData)
                        }else if apiName == APIEndPoint.userInfo.caseValue{
                            let modalData = try UserInfo(data: JSONData)
                            modalArray.append(modalData)
                        }else if apiName == APIEndPoint.documentGroupData.caseValue{
                            let modalData = try DocumentGroup(data: JSONData)
                            modalArray.append(modalData)
                        }
                        else if apiName == APIEndPoint.documentGroupDetail.caseValue{
                            let modalData = try DocumentGroupDetail(data: JSONData)
                            modalArray.append(modalData)
                        }
                       
                        
                        else{
                            print("\(apiName) not matched")
                        }
                        
                    }catch let error as NSError {
                        // error
                        print("error \(error)")
                        failure(error, apiName)
                    }
                }
                
            }
            
            if !modalArray.isEmpty{
                success(modalArray)
            }
        }
    }
    
    static func APICall(postName:String, method: HTTPMethod, parameters:[String:Any], controller:UIViewController, onSuccess success: @escaping (_ JSON: Any) -> Void, onFailure failure: @escaping (_ reason: String, _ statusCode:Int) -> Void) {
        
        if !NetworkUtils.isNetworkReachable(){
            failure(no_internet_connection_available, 0)
            controller.presentAlert(title: attentionText, message: no_internet_connection_available)
        }
        
        if let url = URL(string:BASEURL+postName){
            //For file upload make send content-type  multipart
            let headers = HTTPHeaders([ "content-type": "application/json",
                                        "Authorization": "\(UserDefaults.standard.value(forKey: UD_APITOKEN) as? String ?? "")",
                "Accept":"application/json"])
            print("url \(url.absoluteString ?? "")")
            
            if method == HTTPMethod.get || method == HTTPMethod.delete{
                
                AF.request(url, method:method, /*parameters: parameters,*/ encoding: JSONEncoding.default, headers: headers).responseJSON { response in
                    switch(response.result) {
                        
                    case .success(_):
                        if let data = response.value
                        {
                            print(response.value as Any)
                            print(data)
                            let statusCode = response.response?.statusCode ?? 0
                            if statusCode == 401{
                                if let message = data as? NSDictionary{
                                  let displayMessage = message.value(forKey: key_message) as? String ?? serverError
                                    if displayMessage.contains("session is expired"){
                                        //Handel session expired work
                                        APIUtils.handelSessionExpired(data: data, controller: controller)
                                        failure(sessionExpiredText, statusCode)
                                    }else{
                                        //else then session expire on same status code
                                        let statusCode = response.response?.statusCode ?? 0
                                        failure(serverError, statusCode)
                                    }
                                }
                            }else{
                                DispatchQueue.main.async {
                                    success(data)
                                }
                            }
                            
                        }
                        break
                    case .failure(_):
                        if let data = response.error
                        {
                            print(response.value as Any)
                            print(data)
                            let statusCode = response.response?.statusCode ?? 0
                            failure(serverError, statusCode)
                        }
                        break
                    }
                }
            }
            else{
                
                AF.request(url, method:method, parameters: parameters, encoding: JSONEncoding.default, headers: headers).responseJSON { response in
                    switch(response.result) {
                        
                    case .success(_):
                        if let data = response.value
                        {
                            print(response.value as Any)
                            print(data)
                            let statusCode = response.response?.statusCode ?? 0
                            if statusCode == 401{
                                if let message = data as? NSDictionary{
                                  let displayMessage = message.value(forKey: key_message) as? String ?? serverError
                                    if displayMessage.contains("session is expired"){
                                        //Handel session expired work
                                        APIUtils.handelSessionExpired(data: data, controller: controller)
                                        failure(sessionExpiredText, statusCode)
                                    }else{
                                        //else then session expire on same status code
                                        let statusCode = response.response?.statusCode ?? 0
                                        failure(displayMessage, statusCode)
                                    }
                                }
                            }else{
                                DispatchQueue.main.async {
                                    success(data)
                                }
                            }
                        }
                        break
                    case .failure(_):
                        if let data = response.error
                        {
                            print(response.value as Any)
                            print(data)
                            let statusCode = response.response?.statusCode ?? 0
                            failure(serverError, statusCode)
                        }
                        break
                    }
                }
            }
        }
        
        
        
    }
    
    static func APICallWithImageUpload(imageData:Data,imageName:String, postName:String, method: HTTPMethod, parameters:[String:Any], controller:UIViewController, onSuccess success: @escaping (_ JSON: Any) -> Void, onFailure failure: @escaping (_ reason: String, _ statusCode:Int) -> Void){
        
        if !NetworkUtils.isNetworkReachable(){
            failure(no_internet_connection_available, 0)
            controller.presentAlert(title: attentionText, message: no_internet_connection_available)
        }
        
        let url = URL(string:BASEURL+postName)
        
        var urlRequest = URLRequest(url: (url?.appendingPathComponent(BASEURL+postName))!)
        urlRequest.httpMethod = "post"
        
        
        //For file upload make send content-type  multipart
        let headers = HTTPHeaders([ "content-type": "multipart/form-data",
                                    "Authorization":  "\(UserDefaults.standard.value(forKey: UD_APITOKEN) as? String ?? "")",
            "Accept":"application/json"])
        print("url \(url?.absoluteString ?? "")")
        
        AF.upload(multipartFormData: { multiPart in
            for (key, value) in parameters {
                if let temp = value as? String {
                    multiPart.append(temp.data(using: .utf8)!, withName: key)
                }
                if let temp = value as? Int {
                    multiPart.append("\(temp)".data(using: .utf8)!, withName: key)
                }
                if let temp = value as? NSArray {
                    temp.forEach({ element in
                        let keyObj = key + "[]"
                        if let string = element as? String {
                            multiPart.append(string.data(using: .utf8)!, withName: keyObj)
                        } else
                            if let num = element as? Int {
                                let value = "\(num)"
                                multiPart.append(value.data(using: .utf8)!, withName: keyObj)
                        }
                    })
                }
//                if let img = value as? UIImage{
//                    multiPart.append("\(img)".data(using: .utf8)!, withName: key)
////                    multiPart.append("\(img)".data(using: .utf8)!, withName: key, fileName: "", mimeType: "image/png")
//
//                }
                
            }
            if imageName == "file_signature"{
                //for upload signature
                multiPart.append(imageData, withName: "signature_sign", fileName: imageName, mimeType: "image/png")
            }else if imageName == "file_initial"{
                //for upload signature
                multiPart.append(imageData, withName: "initial_sign", fileName: imageName, mimeType: "image/png")
            }
            
            else{
               multiPart.append(imageData, withName: "documents[]", fileName: imageName, mimeType: "image/png")
            }
            
        }, to: url!, method: method, headers: headers)
            .uploadProgress(queue: .main, closure: { progress in
                //Current upload progress of file
                print("Upload Progress: \(progress.fractionCompleted)")
                
                if Int(progress.fractionCompleted) == 100{
                    print("Image upload success")
                }
            })
            .responseJSON(completionHandler: { response in
                //Do what ever you want to do with response
                switch(response.result) {
                    
                case .success(_):
                    if let data = response.value
                    {
                        print(response.value as Any)
                        print(data)
                        let statusCode = response.response?.statusCode ?? 0
                        if statusCode == 401{
                            //Handel session expired work
                            APIUtils.handelSessionExpired(data: data, controller: controller)
                            failure(sessionExpiredText, statusCode)
                        }else{
                            DispatchQueue.main.async {
                                success(data)
                            }
                        }
                    }
                    break
                case .failure(_):
                    if let data = response.error
                    {
                        print(response.value as Any)
                        print(data)
                        let statusCode = response.response?.statusCode ?? 0
                        failure(serverError, statusCode)
                    }
                    break
                }
                
            })
        
        
        
    }
    
    static func handelSessionExpired(data:Any, controller:UIViewController){
        
        var displayMessage = serverError
        if let message = data as? NSDictionary{
            displayMessage = message.value(forKey: key_message) as? String ?? serverError
        }
        
//        controller.presentAlertWithTitle(title: "", message: displayMessage, options: "Ok") { (option) in
//                
//                print("option: \(option)")
//                switch(option) {
//                    case 0:
//                        print("logoutText tapped")
////                        Util.resetDefaults()
//                        Util.makeSignInRootController()
//                        break
//                    default:
//                        break
//                }
//            }
        Util.makeWelcomeRootController()
    }
    
       
    
}

class NetworkUtils{
    
    static func isNetworkReachable() -> Bool {
        
        var zeroAddress = sockaddr_in(sin_len: 0, sin_family: 0, sin_port: 0, sin_addr: in_addr(s_addr: 0), sin_zero: (0, 0, 0, 0, 0, 0, 0, 0))
        zeroAddress.sin_len = UInt8(MemoryLayout.size(ofValue: zeroAddress))
        zeroAddress.sin_family = sa_family_t(AF_INET)
        
        let defaultRouteReachability = withUnsafePointer(to: &zeroAddress) {
            $0.withMemoryRebound(to: sockaddr.self, capacity: 1) {zeroSockAddress in
                SCNetworkReachabilityCreateWithAddress(nil, zeroSockAddress)
            }
        }
        
        var flags: SCNetworkReachabilityFlags = SCNetworkReachabilityFlags(rawValue: 0)
        if SCNetworkReachabilityGetFlags(defaultRouteReachability!, &flags) == false {
            return false
        }
        
        // Working for Cellular and WIFI
        let isReachable = (flags.rawValue & UInt32(kSCNetworkFlagsReachable)) != 0
        let needsConnection = (flags.rawValue & UInt32(kSCNetworkFlagsConnectionRequired)) != 0
        let ret = (isReachable && !needsConnection)
        
        return ret
    }
}

class DeviceUtils{
    
    static func lockOrientation(_ orientation: UIInterfaceOrientationMask) {
     
         if let delegate = UIApplication.shared.delegate as? AppDelegate {
             delegate.orientationLock = orientation
         }
     }

     /// OPTIONAL Added method to adjust lock and rotate to the desired orientation
     static func lockOrientation(_ orientation: UIInterfaceOrientationMask, andRotateTo rotateOrientation:UIInterfaceOrientation) {
    
         self.lockOrientation(orientation)
     
         UIDevice.current.setValue(rotateOrientation.rawValue, forKey: "orientation")
         UINavigationController.attemptRotationToDeviceOrientation()
     }
    
    static func isDeviceIphoneXOrlatter() -> Bool{
        
        if UIDevice().userInterfaceIdiom == .pad{
           return false
        }
        
        else if UIDevice().userInterfaceIdiom == .phone {
            switch UIScreen.main.nativeBounds.height {
            case 1136:
                print("iPhone 5 or 5S or 5C")
                return false
                
            case 1334:
                print("iPhone 6/6S/7/8")
                return false
                
            case 1920, 2208:
                print("iPhone 6+/6S+/7+/8+")
                return false
                
            case 2436:
                print("iPhone X/XS/11 Pro")
                return true
                
            case 2688:
                print("iPhone XS Max/11 Pro Max")
                return true
                
            case 1792:
                print("iPhone XR/ 11 ")
                return true
                
            default:
                print("Unknown")
                return false
            }
        }
        
        return false
    }
    
    static func isDeviceSixOrEarlier() -> Bool{
        if UIDevice().userInterfaceIdiom == .pad {
            return true
        }
        if UIDevice().userInterfaceIdiom == .phone {
            if UIScreen.main.nativeBounds.height < 1920{
                return false
            }else{
                return true
            }
        }
        return false
    }
    
}


//MARK: Open Image Picker
class GalleryUtil{
    
    static func presentActionSheetImagePicker(viewController:UIViewController) {
        
        let alertController = UIAlertController(title: choose_your_option, message: nil, preferredStyle: .actionSheet)
        
        let takePhotoAction = UIAlertAction(title: open_camera, style: .default, handler: { action in
            // Open Camera method calling
            GalleryUtil.requestCameraPermissionsIfNeeded(viewController: viewController)
        })
        
        
        let chooseFromLibraryAction = UIAlertAction(title: open_photos, style: .default, handler: { action in
            //Open Library method calling
            GalleryUtil.requestLibraryPermissionsIfNeeded(viewController: viewController)
            
        })
        
        
        
        let cancelAction = UIAlertAction(title: cancelText, style: .cancel, handler: { action in
            
        })
        
        alertController.addAction(takePhotoAction)
        alertController.addAction(chooseFromLibraryAction)
        alertController.addAction(cancelAction)
        
        //V3.3 crash fix
        //if iPhone
        if UI_USER_INTERFACE_IDIOM() == .phone {
            viewController.present(alertController, animated: true)
        } else {
            // Change Rect to position Popover
            alertController.modalPresentationStyle = .popover
            let popPresenter = alertController.popoverPresentationController
            popPresenter?.sourceView = viewController.view
            popPresenter?.sourceRect = CGRect(x: viewController.view.center.x, y: viewController.view.center.y, width: 0, height: 0)
            viewController.present(alertController, animated: true)
        }
        
        
    }
    
    static func requestCameraPermissionsIfNeeded(viewController:UIViewController) {
        
        // check camera authorization status
        let authStatus: AVAuthorizationStatus = AVCaptureDevice.authorizationStatus(for: .video)
        switch authStatus {
        case .authorized:
            // camera authorized
            GalleryUtil.openCamera(viewController: viewController)
        case .notDetermined:
            // request authorization
            
            AVCaptureDevice.requestAccess(for: .video, completionHandler: { granted in
                DispatchQueue.main.async(execute: {
                    
                    if granted {
                        GalleryUtil.openCamera(viewController: viewController)
                    } else {
                        GalleryUtil.notifyUserOfCameraAccessDenial(viewController: viewController)
                    }
                })
            })
        case .restricted, .denied:
            DispatchQueue.main.async(execute: {
                GalleryUtil.notifyUserOfCameraAccessDenial(viewController: viewController)
                
            })
        default:
            break
        }
    }
    
    static func requestLibraryPermissionsIfNeeded(viewController:UIViewController) {
        weak var weakSelf = viewController
        let status = PHPhotoLibrary.authorizationStatus()
        
        if status == .authorized {
            GalleryUtil.openLibrary(viewController: weakSelf!)
        } else if status == .denied {
            // Access has been denied.
            GalleryUtil.notifyUserOfLibraryAccessDenial(viewController: weakSelf!)
        } else if status == .notDetermined {
            
            // Access has not been determined.
            PHPhotoLibrary.requestAuthorization({ status in
                
                if status == .authorized {
                    
                    GalleryUtil.openLibrary(viewController: weakSelf!)
                } else {
                    // Access has been denied.
                    GalleryUtil.notifyUserOfLibraryAccessDenial(viewController: weakSelf!)
                }
            })
        } else if status == .restricted {
            // Restricted access - normally won't happen.
            GalleryUtil.notifyUserOfLibraryAccessDenial(viewController: weakSelf!)
        }
    }
    
    static func notifyUserOfCameraAccessDenial(viewController:UIViewController) {
        
        //User don't give us permission. Showing alert with redirection to settings
        //Getting description string from info.plist file
        let accessDescription = Bundle.main.object(forInfoDictionaryKey: "NSCameraUsageDescription") as? String
        let alertController = UIAlertController(title: accessDescription, message: denied_camera_permission_message, preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: cancelText, style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        
        let settingsAction = UIAlertAction(title: settingsText, style: .default, handler: { action in
            if let url = URL(string: UIApplication.openSettingsURLString) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
        })
        alertController.addAction(settingsAction)
        
        viewController.present(alertController, animated: true)
        
        
    }
    
    static func notifyUserOfLibraryAccessDenial(viewController:UIViewController) {
        //User don't give us permission. Showing alert with redirection to settings
        //Getting description string from info.plist file
        let accessDescription = Bundle.main.object(forInfoDictionaryKey: "NSPhotoLibraryUsageDescription") as? String
        let alertController = UIAlertController(title: accessDescription, message: denied_gallery_permission_message, preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: cancelText, style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        
        let settingsAction = UIAlertAction(title: settingsText, style: .default, handler: { action in
            if let url = URL(string: UIApplication.openSettingsURLString) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
        })
        alertController.addAction(settingsAction)
        
        viewController.present(alertController, animated: true, completion: nil)
        
    }
    
    static  func openCamera(viewController:UIViewController)  {
        
        let picker = UIImagePickerController()
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            picker.sourceType = .camera
            picker.allowsEditing = false
            picker.delegate = viewController as? UIImagePickerControllerDelegate & UINavigationControllerDelegate
            viewController.present(picker, animated: true)
        }
        else
        {
            let alertController = UIAlertController(title: app_name, message: camera_not_available, preferredStyle: .alert)
            
            
            let okAction = UIAlertAction(title: okayText, style: .cancel, handler: { action in
                
            })
            
            
            alertController.addAction(okAction)
            
            //if iPhone
            if UI_USER_INTERFACE_IDIOM() == .phone {
                viewController.present(alertController, animated: true)
            } else {
                // Change Rect to position Popover
                alertController.modalPresentationStyle = .popover
                let popPresenter = alertController.popoverPresentationController
                popPresenter?.sourceView = viewController.view
                popPresenter?.sourceRect = CGRect(x: viewController.view.center.x, y: viewController.view.center.y, width: 0, height: 0)
                viewController.present(alertController, animated: true)
            }
            
        }
        
    }
    
    static func openLibrary(viewController:UIViewController) {
        
        let picker = UIImagePickerController()
        picker.sourceType = .photoLibrary
        picker.delegate = viewController as? UIImagePickerControllerDelegate & UINavigationControllerDelegate
        picker.allowsEditing = false
        viewController.present(picker, animated: true)
    }
    
    static func openSettings(){
        
        if let url = URL(string: UIApplication.openSettingsURLString) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
    
    static func calculateSizeInMB(image:UIImage) -> Double{
        
        let imageSize : Int = image.pngData()?.count ?? 0
        let imageSizeKB = Double(imageSize) / 1000.0
        let imageSizeMB = imageSizeKB / 1024.0
        return imageSizeMB
    }
    
    static func calculateDataSizeInMB(data:Data) -> Double{
        
        let dataSize : Int = data.count
        let imageSizeKB = Double(dataSize) / 1000.0
        let imageSizeMB = imageSizeKB / 1024.0
        return imageSizeMB
    }
    
}
