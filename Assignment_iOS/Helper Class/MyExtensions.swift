//
//  MyExtensions.swift
//  ST Ecommerce
//
//  Created by necixy on 03/07/20.
//  Copyright © 2020 Shashi. All rights reserved.
//

import Foundation
import UIKit
import SwiftLocation
import CoreLocation
import Comets
import JGProgressHUD


//MARK: - UISegmentedControl Extensions
extension UISegmentedControl {
    
    
    func setTitleColor(_ color: UIColor, state: UIControl.State) {
        var attributes = self.titleTextAttributes(for: state) ?? [:]
        attributes[.foregroundColor] = color
        self.setTitleTextAttributes(attributes, for: state)
    }
    
    func setTitleFont(_ font: UIFont, state: UIControl.State = .normal) {
        var attributes = self.titleTextAttributes(for: state) ?? [:]
        attributes[.font] = font
        self.setTitleTextAttributes(attributes, for: state)
    }
}

//MARK: - UIViewController Extensions
extension UIViewController {
    
    func showPermissionAlert(){
        let alertController = UIAlertController(title: "Location Permission Required", message: "Please enable location permissions in settings.", preferredStyle: UIAlertController.Style.alert)
        
        let okAction = UIAlertAction(title: "Settings", style: .default, handler: {(cAlertAction) in
            //Redirect to Settings app
            UIApplication.shared.open(URL(string:UIApplication.openSettingsURLString)!)
        })
        
        alertController.addAction(okAction)
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    func getGoogleFormatedAddress(coordinates:CLLocationCoordinate2D, completion: @escaping (_ result: String) -> Void){
        
        var formattedAddress = ""
        let options = GeocoderRequest.GoogleOptions(APIKey: GOOGLE_API_KEY)
        
        LocationManager.shared.locateFromCoordinates(coordinates, service: .google(options)) { result in
            switch result {
            case .failure(let error):
                debugPrint("An error has occurred: \(error)")
            case .success(let places):
                formattedAddress = places.first?.formattedAddress ?? ""
                completion(formattedAddress)
            }
        }
    }
    
    //MARK: - Comet UX
    func makeCommetAndAnimate(){
        
        // Customize your comet
        let width = view.bounds.width
        let height = view.bounds.height
        let comets = [Comet(startPoint: CGPoint(x: 100, y: 0),
                            endPoint: CGPoint(x: 0, y: 100),
                            lineColor: UIColor.white.withAlphaComponent(0.2),
                            cometColor: UIColor.white),
                      Comet(startPoint: CGPoint(x: 0.4 * width, y: 0),
                            endPoint: CGPoint(x: width, y: 0.8 * width),
                            lineColor: UIColor.white.withAlphaComponent(0.2),
                            cometColor: UIColor.white),
                      Comet(startPoint: CGPoint(x: 0.8 * width, y: 0),
                            endPoint: CGPoint(x: width, y: 0.2 * width),
                            lineColor: UIColor.white.withAlphaComponent(0.2),
                            cometColor: UIColor.white),
                      Comet(startPoint: CGPoint(x: width, y: 0.2 * height),
                            endPoint: CGPoint(x: 0, y: 0.25 * height),
                            lineColor: UIColor.white.withAlphaComponent(0.2),
                            cometColor: UIColor.white),
                      Comet(startPoint: CGPoint(x: 0, y: height - 0.8 * width),
                            endPoint: CGPoint(x: 0.6 * width, y: height),
                            lineColor: UIColor.white.withAlphaComponent(0.2),
                            cometColor: UIColor.white),
                      Comet(startPoint: CGPoint(x: width - 100, y: height),
                            endPoint: CGPoint(x: width, y: height - 100),
                            lineColor: UIColor.white.withAlphaComponent(0.2),
                            cometColor: UIColor.white),
                      Comet(startPoint: CGPoint(x: 0, y: 0.8 * height),
                            endPoint: CGPoint(x: width, y: 0.75 * height),
                            lineColor: UIColor.white.withAlphaComponent(0.2),
                            cometColor: UIColor.white)]
        
        // draw line track and animate
        for comet in comets {
            view.layer.addSublayer(comet.drawLine())
            view.layer.addSublayer(comet.animate())
        }
    }
    
    //MARK: - Alerts
    //    func showNotice(title:String?, message:String?){
    //        SCLAlertView().showNotice(title ?? "", subTitle: message ?? "")
    //
    //    }
    //
    //    func showWarning(title:String?, message:String?){
    //        SCLAlertView().showWarning(title ?? "", subTitle: message ?? "")
    //    }
    //
    //    func showSuccess(title:String?, message:String?){
    //        SCLAlertView().showSuccess(title ?? "", subTitle: message ?? "")
    //    }
    //
    //    func showError(title:String?, message:String?){
    //        SCLAlertView().showError(title ?? "", subTitle: message ?? "")
    //    }
    
    
    //MARK: - Showing Login alert
    func showNeedToLoginApp(){
        
        let message = loginMessageText
        
        self.presentAlertWithTitle(title: "", message: message, options: goBackText, needToLoginText) { (option) in
            
            print("option: \(option)")
            switch(option) {
            case 0:
                print("goBackText tapped")
                self.navigationController?.popViewController(animated: true)
                
            case 1:
                print("needToLoginText tapped")
                Util.makeSignInRootController()
                
            default:
                break
            }
        }
        
    }
}


//MARK: - UIColor Extensions
extension UIColor {
    
    class func appDarkGrayColor() -> UIColor{
        return #colorLiteral(red: 0.4078431373, green: 0.4117647059, blue: 0.4196078431, alpha: 1)
    }
    
    class func appLightGrayColor() -> UIColor{
        return #colorLiteral(red: 0.6549019608, green: 0.6509803922, blue: 0.6470588235, alpha: 1)
    }
    
    class func appPurpleColor() -> UIColor{
        return #colorLiteral(red: 0.6352941176, green: 0.3294117647, blue: 0.4745098039, alpha: 1)
    }
    
    class func appLightYelloColor() -> UIColor{
        return #colorLiteral(red: 1, green: 0.7333333333, blue: 0, alpha: 1)
    }
    
    class func appDarkYelloColor() -> UIColor{
        return #colorLiteral(red: 1, green: 0.6745098039, blue: 0.137254902, alpha: 1)
    }
    
    class func appRedColor() -> UIColor{
        return #colorLiteral(red: 0.9764705882, green: 0.3019607843, blue: 0, alpha: 1)
    }
    
    class func appGreenColor() -> UIColor{
        return #colorLiteral(red: 0.1019607843, green: 0.6823529412, blue: 0.4823529412, alpha: 1)
    }
    
    class func appBackGroundColor() -> UIColor{
        return #colorLiteral(red: 0.9529411765, green: 0.9529411765, blue: 0.9529411765, alpha: 1)
    }
    
    
}


//MARK: - UIFonnt Extensions
extension UIFont {
    
    class func latoRegular(size:CGFloat) -> UIFont{
        return UIFont.init(name: "LATO-REGULAR", size: size)!
    }
}

//MARK: - String Extensions


//MARK: - String Extensions
extension String {
    
    func localized(loc:String) ->String {
        let path = Bundle.main.path(forResource: loc, ofType: "lproj")
        let bundle = Bundle(path: path!)
        return NSLocalizedString(self, tableName: nil, bundle: bundle!, value: "", comment: "")
    }
    
    func height(withConstrainedWidth width: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)
        
        return ceil(boundingBox.height)
    }
    
    func width(withConstrainedHeight height: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: .greatestFiniteMagnitude, height: height)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)
        
        return ceil(boundingBox.width)
    }
}


extension UIView {
    enum Corner:Int {
        case bottomRight = 0,
        topRight,
        bottomLeft,
        topLeft
    }
    
    private func parseCorner(corner: Corner) -> CACornerMask.Element {
        let corners: [CACornerMask.Element] = [.layerMaxXMaxYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner, .layerMinXMinYCorner]
        return corners[corner.rawValue]
    }
    
    private func createMask(corners: [Corner]) -> UInt {
        return corners.reduce(0, { (a, b) -> UInt in
            return a + parseCorner(corner: b).rawValue
        })
    }
    
    func roundCorners(corners: [Corner], amount: CGFloat) {
        layer.cornerRadius = amount
        let maskedCorners: CACornerMask = CACornerMask(rawValue: createMask(corners: corners))
        layer.maskedCorners = maskedCorners
    }
}

extension NSAttributedString {
    
    /// Returns a new instance of NSAttributedString with same contents and attributes with strike through added.
    /// - Parameter style: value for style you wish to assign to the text.
    /// - Returns: a new instance of NSAttributedString with given strike through.
    func withStrikeThrough(_ style: Int = 1) -> NSAttributedString {
        let attributedString = NSMutableAttributedString(attributedString: self)
        attributedString.addAttribute(.strikethroughStyle,
                                      value: style,
                                      range: NSRange(location: 0, length: string.count))
        return NSAttributedString(attributedString: attributedString)
    }
}

// UIImage compression
extension UIImage {
    
    func resized(withPercentage percentage: CGFloat) -> UIImage? {
        let canvas = CGSize(width: size.width * percentage, height: size.height * percentage)
        return UIGraphicsImageRenderer(size: canvas, format: imageRendererFormat).image {
            _ in draw(in: CGRect(origin: .zero, size: canvas))
        }
    }
    
    func resized(toWidth width: CGFloat) -> UIImage? {
        let canvas = CGSize(width: width, height: CGFloat(ceil(width/size.width * size.height)))
        return UIGraphicsImageRenderer(size: canvas, format: imageRendererFormat).image {
            _ in draw(in: CGRect(origin: .zero, size: canvas))
        }
    }
    
    func upOrientationImage() -> UIImage? {
        switch imageOrientation {
        case .up:
            return self
        default:
            UIGraphicsBeginImageContextWithOptions(size, false, scale)
            draw(in: CGRect(origin: .zero, size: size))
            let result = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            return result
        }
    }
    
    func rotate(radians: Float) -> UIImage? {
        var newSize = CGRect(origin: CGPoint.zero, size: self.size).applying(CGAffineTransform(rotationAngle: CGFloat(radians))).size
        // Trim off the extremely small float value to prevent core graphics from rounding it up
        newSize.width = floor(newSize.width)
        newSize.height = floor(newSize.height)
        
        UIGraphicsBeginImageContextWithOptions(newSize, false, self.scale)
        let context = UIGraphicsGetCurrentContext()!
        
        // Move origin to middle
        context.translateBy(x: newSize.width/2, y: newSize.height/2)
        // Rotate around middle
        context.rotate(by: CGFloat(radians))
        // Draw the image at its center
        self.draw(in: CGRect(x: -self.size.width/2, y: -self.size.height/2, width: self.size.width, height: self.size.height))
        
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage
    }
}

//MARK:- NavigationBar

extension UINavigationBar {
    func setGradientBackground(colors: [UIColor],
                               startPoint: UINavigationBarGradientView.Point = .topLeft,
                               endPoint: UINavigationBarGradientView.Point = .bottomLeft,
                               locations: [NSNumber] = [0, 1]) {
        guard let backgroundView = value(forKey: "backgroundView") as? UIView else { return }
        guard let gradientView = backgroundView.subviews.first(where: { $0 is UINavigationBarGradientView }) as? UINavigationBarGradientView else {
            let gradientView = UINavigationBarGradientView(colors: colors, startPoint: startPoint,
                                                           endPoint: endPoint, locations: locations)
            backgroundView.addSubview(gradientView)
            gradientView.setupConstraints()
            return
        }
        gradientView.set(colors: colors, startPoint: startPoint, endPoint: endPoint, locations: locations)
    }
}



extension UIViewController {
    
    func presentAlertWithTitle(title: String, message: String, options: String..., completion: @escaping (Int) -> Void) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        for (index, option) in options.enumerated() {
            alertController.addAction(UIAlertAction.init(title: option, style: .default, handler: { (action) in
                completion(index)
            }))
        }
        self.present(alertController, animated: true, completion: nil)
    }
    
    func presentAlert(title: String, message: String){
        
        // First instantiate the UIAlertController

        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: .alert)
         alert.addAction(UIAlertAction(title: "ok", style: .cancel, handler: nil))

        self.present(alert, animated: true)
    }
}

extension UINavigationController {

  func popToViewController(ofClass: AnyClass, animated: Bool = true) {
    if let vc = viewControllers.filter({$0.isKind(of: ofClass)}).last {
      popToViewController(vc, animated: animated)
    }
  }

  func popViewControllers(viewsToPop: Int, animated: Bool = true) {
    if viewControllers.count > viewsToPop {
      let vc = viewControllers[viewControllers.count - viewsToPop - 1]
      popToViewController(vc, animated: animated)
    }
  }

}
