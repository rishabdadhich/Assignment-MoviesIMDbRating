//
//  Strings.swift
//  ST Ecommerce
//
//  Created by necixy on 07/07/20.
//  Copyright © 2020 Shashi. All rights reserved.
//

import Foundation



func getlanguage() -> String{

    if let language = DEFAULTS.value(forKey: UD_Language) as? String{
        return language
    }else{
        return "en"
    }
}

//MARK: - Sign In screen Strings
let enterPhoneNumberAlertText = "Please enter your phone number."
let enterValidPhoneNumberAlertText = "Please enter valid phone number."

//MARK: - Register screen Strings
let enterNameAlertText = "Please enter your name."

//MARK: - Varify screen Strings
let enterOTPAlertText = "Please enter 6-Digit pin"


//MARK: - Home screen
let myOrderText = "My Order"
let accountText = "Account"
let settingsText = "Settings"
let rewardsText = "Rewards"
let donationsText = "Donations"
let suggestionProductText = "Suggestions products"
let suggestionRestaurantText = "Suggestions Restaurant"
let newArrivalProductsText = "New Arrival Products"
let newArrivalRestaurantText = "New Arrival Restaurant"
let offText = "OFF"
let rewardMessageText = "Stay Tune for More information about our New Exciting Event! More rewards coming your way!"



//MARK: - Store Screens
let storeText = "Store"
let searchText = "Search..."
let emptyCartAlertText = "Cart is empty, Please add an item."
let productsText = "Products"
let goToCartText = "Go to Cart"
let addressalertText = "Please select or add address."
let restaurantsText = "Restaurants"


//MARK: - Store Details/ Product details
let freeText = "FREE"
let soldText = "Sold"
let UsersText = "Users"
let customerReviewsText = "Customer Reviews"
let notAvailableText = "Not Available"
let closedText = "Closed"


//MARK: - Foods Screens
let foodsText = "Foods"

//MARK: - More Screens
let moreText = "More"



//MARK: - General
let attentionText = "Attention"


let errorText = "Error"
let serverError = "Server Error Try again."
let loadingText = "Loading..."

let no_internet_connection_available = "Please check your internet connection or try again later."

let sessionExpiredText = "Session Expired"
let logoutText = "Logout"
let okayText = "Okay"
let goBackText = "Go Back"
let successText = "Success"
let comingSoonText = "Coming Soon"
let loginMessageText = "Seems you are not Login into the app. You need to login for making order."
let needToLoginText = "Login"
let yesText = "yes"
let noText = "no"
let warningText = "warning"
let locationEnableText = "Please enable location permissions in settings."
let locationPermissionRequiredText = "Location Permission Required"
let privacyPolicy = "Privacy Policy"
let termsAndConditions = "Terms & Conditions"


//MARK: - Address
let changeAddressText = "Change Address"
let addAddressText = "Add Address"
let enterYourNameForAddress = "Please give a name for your address."
let EditText = "Edit"
let deleteText = "Delete"
let AddText = "Add"
let UpdateText = "Update"
let addressDeletePromptText = "Are you sure want to delete address?"
let selectTownShipText = "Please select townShip"
let selectFloorText = "Please select floor"
let enterYourZipCode = "Please enter your Zip code."


//MARK: -  Cart
let expectedDeliveryText = "Expected Delivery :"
let removeItemFromCartAlertText = "Are you sure want to remove item from cart?"
let destroyCartAlertText = "Are you sure want to destroy your cart?"


//MARK: - My Order
let currentOrdersText = "Current Orders"
let deliveredOrdersText = "Delivered Orders"
let onTheWayText = "On the way"
let orderNoText = "Order No."
let deliveredAt = "Delivered at"
let deliveredText = "Delivered"


//MARK: - Account screen
let addNewText = "Add New"
let changeText = "Change"

let choose_your_option = "choose_your_option"
let open_camera = "open_camera"
let open_photos = "open_photos"
let open_files = "open_files"
let app_name = ""
let camera_not_available = "camera_not_available"
let denied_gallery_permission_message = "denied_gallery_permission_message"
let cancelText = "cancel"
let denied_camera_permission_message = "denied_camera_permission_message"
let maleText = "Male"
let femaleText = "Female"
let ChangePasswordText = "Change Password"
let PrivacyPolicyText = "Privacy Policy"
let Terms_ConditionsText = "Terms & Conditions"
let PaymentSettingsText = "Payment Settings"
let HelpDeskText = "Help Desk"
let logoutpromptText = "Are you sure want to logout?"
//let a = ""
//let a = ""
//let a = ""
//let a = ""
//let a = ""
//let a = ""
//let a = ""
//let a = ""


//MARK: - Restro Details
let itemNotAvailableText = "Currently item is not available"
let currentlyNotAccepting = "Currently not accepting orders."
let freeDeliveryText = "Free Delivery"

//MARK - Restro Order detils
let estimatedDeliveryText = "Estimated Delivery By :"

//MARK:- Product Search screen
let searchProductText = "Search Products"
let doneText = "Done"

//MARK:- Restro Search screen
let searchRestroText = "Search Restaurants" 
