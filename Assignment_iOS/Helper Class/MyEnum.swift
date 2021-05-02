//
//  MyEnum.swift
//  ST Ecommerce
//
//  Created by necixy on 30/06/20.
//  Copyright © 2020 Shashi. All rights reserved.
//

import Foundation

//MARK: - API
//let BASEURL = "http://52.52.216.99/mp/signnow/public/api/" //for stage

let BASEURL = "http://new-website-design.com/mp/signnow-qa/public/api/" //for QA


public enum APIEndPoint
{
    case townships
    case rating
    case register
    case request_OTP
    case verify_OTP
    case logout
    case productCategoryWise
    case productsPath
    case productSearchStore
    case addToCartStore
    case getCartItemsStore
    case removeItemFromCartStore
    case updateItemInCartStore
    case categories
    case homeSuggestions
    case getAddresses
    case addNewAddress
    case makeAddressPrimary
    case placeOrder
    case myOrdersStore
    case myOrdersRestro
    case newArrival
    case userProfile
    case orderDetails
    case home_banner_sliders
    case destroyCart
    case getRestaurantsCategorywise
    case getRestaurantsSliders
    case restaurants
    case add
    case getItems
    case cartPathRestro
    case remove
    case update
    case destroy
    case delete
    case orderPathRestro
    case place
    case detail
    case rate
    case updateprofile
    case productCategory
    case productSearchRestro
    case stores
    case donation
    case policy
    case termsAndcondition
    case homeSearch
    case getAllAddresses
    
    //0//
    case register_user
    case login_user
    case forgotPassword_user
    case delete_file
    case mainScreen
    case documents
    case createFolder
    case createDocumentGroup
    case moveDocument
    case moveTemplate
    case DocumentHistory
    case EmailDocument
    case makeTemplate
    case duplicateDocument
    case renameTemplate
    case delete_template
    case unarchive_document
    case renameDocument
    case renameFolder
    case trashData
    case trashRestore
    case trashRestoreTemplate
    case userInfo
    case updateUserProfile
    case userChangePassword
    case contactUs
    case deleteAccountReasons
    case sendFeedbackReason
    case deleteAccount
    case documentGroupData
    case deleteDocumentGroup
    case documentGroupDetail
    case documentAddFields
    //0//
    
    var caseValue: String{
        switch self{
        case .townships:                            return "townships"
        case .rating:                               return "ratings"
        case .register:                             return "register"
        case .request_OTP:                          return "auth/request_otp"
        case .verify_OTP:                           return "auth/verify_otp"
        case .logout:                               return "logout"
        case .productCategoryWise:                  return "products/category-wise"
        case .categories:                           return "categories"
        case .homeSuggestions:                                 return "home/suggestions"
        case .productsPath:                       return "products/"
        case .addToCartStore:                       return "store/cart/add"
        case .getCartItemsStore:                    return "store/cart/items"
        case .removeItemFromCartStore:              return "store/cart/"
        case .updateItemInCartStore:                return "store/cart/"
        case .getAddresses:                         return "user/profile/address/"
        case .addNewAddress:                        return "user/profile/address/add"
        case .userProfile:                        return "user/profile"
        case .makeAddressPrimary:                   return "user/profile/address/2/make_primary"
        case .placeOrder:                           return "store/orders/place"
        case .orderDetails:                           return "store/orders/"
        case .myOrdersStore:                             return "store/orders?status="
        case .myOrdersRestro:                             return "restaurants/orders?status="
        case .newArrival:                             return "home/new-arrivals"
        case .home_banner_sliders:                  return "home/banner-sliders"
        case .destroyCart:                  return "store/cart/destroy"
        case .getRestaurantsCategorywise:                  return "restaurants/category-wise"
        case .getRestaurantsSliders:                  return "restaurants/sliders"
        case .restaurants:                  return "restaurants/"
        case .add:                  return "add"
        case .remove:                  return "remove"
        case .destroy:                  return "destroy"
        case .update:                  return "update"
        case .delete:                  return "delete"
        case .getItems:                  return "items"
        case .cartPathRestro:                  return "restaurants/cart/"
        case .orderPathRestro:                  return "restaurants/orders/"
        case .place:                  return "place"
        case .detail:                  return "detail"
        case .rate:                  return "rate"
        case .productSearchStore:         return "products?search="
        case .updateprofile:                  return "user/profile/update"
        case .productCategory:         return "categories/"
        case .productSearchRestro:      return "restaurants?search="
        case .stores:                     return "stores/"
        case .donation:                     return "home/donation"
        case .policy:                     return "pages/user-privacy-policy"
        case .termsAndcondition:                     return "pages/user-terms-conditions"
        case  .homeSearch:                 return "home/search?text="
        case .getAllAddresses:             return "user/profile/addresses"
            //0//
        case .register_user:       return "user/register"
        case .login_user:          return "user/login"
        case .forgotPassword_user:              return "user/forgot-password"
        case .mainScreen:  return "user/main-screen"
        case .documents:  return "user/get-document"
        case .createFolder: return "user/directory/create"
        case .createDocumentGroup: return "user/document-group/create"
        case .delete_file: return "change-document-status"
        case .moveDocument: return "move-document"
        case .DocumentHistory: return "view-document-history"
        case .EmailDocument: return "email-copy-of-document"
        case .makeTemplate: return "make-template"
        case .duplicateDocument: return "user/copy-document"
        case .renameTemplate: return "user/rename-template"
        case .delete_template: return "user/delete-template"
        case .unarchive_document: return "move-archive-to-document"
        case .renameDocument: return "user/document/rename"
        case .moveTemplate: return "user/move-template"
        case .trashData: return "get-trashed-document-list"
        case .trashRestore: return "change-document-status"
        case .userInfo : return "mix-api-one-for-app"
        case .updateUserProfile : return "user/update/profile"
        case .trashRestoreTemplate : return "user/restore-template"
        case .userChangePassword : return "user/change-password"
        case .contactUs : return "contactus"
        case .deleteAccountReasons : return "delete-request-reason-data"
        case .sendFeedbackReason : return "save-user-delete-reason"
        case .deleteAccount : return "final-delete-user"
        case .renameFolder : return "user/directory/rename"
        case .documentGroupData : return "user/document-groups"
        case .deleteDocumentGroup : return "user/document-group/delete"
        case .documentGroupDetail : return "user/document-group"
        case .documentAddFields : return "user/document-template/add-update-fields"
            
            //0//
        
            
        
            
        
            
        }
    }
}

//MARK: -
public enum Role
{
    case user
    var caseValue: String{
        switch self{
        case .user:                             return "user"
        }
    }
}

public enum MyOrderStatus
{
    case current
    case past
    var caseValue: String{
        switch self{
        case .current:                return "current"
        case .past:                  return "past"
        }
    }
}

public enum Cart
{
    case store
    case restaurant
    var caseValue: String{
        switch self{
        case .store:                return "store"
        case .restaurant:                  return "restaurant"
        }
    }
}


public enum PaymentMode
{
    case online
    case cash
    var caseValue: String{
        switch self{
        case .online:                     return "online"
        case .cash:                       return "cod"
        }
    }
}

public enum StoreCellType
{
    case verticalGrid
    case horizontalLinear
    case single
    var caseValue: String{
        switch self{
        case .verticalGrid:                       return "vertical_grid"
        case .horizontalLinear:                   return "horizontal_linear"
        case .single:                             return "single"
        }
    }
}


public enum Type
{
    case restaurant
    case product
    var caseValue: String{
        switch self{
        case .restaurant:               return "restaurant"
        case .product:                  return "product"
        }
    }
}

public enum HomeItemType
{
    case SuggestionsProductType
    case SuggestionsRestaurantType
    case NewArrivalsProductType
    case NewArrivalsRestaurantType
    var caseValue: String{
        switch self{
        case .SuggestionsProductType:            return "SuggestionsProductType"
        case .SuggestionsRestaurantType:         return "SuggestionsRestaurantType"
        case .NewArrivalsProductType:            return "NewArrivalsProductType"
        case .NewArrivalsRestaurantType:         return "NewArrivalsRestaurantType"
            
        }
    }
}

public enum RatingStatus
{
    case ask
    case done
    case notDelivered
    var caseValue: String{
        switch self{
        case .ask:                             return "ask"
        case .done:                             return "done"
        case .notDelivered:                             return "na"
        }
    }
}

public enum DeliveryStatus
{
    case pending
    case delivered
    var caseValue: String{
        switch self{
        case .pending:                             return "pending"
        case .delivered:                             return "delivered"
        }
    }
}

// for cases in store

public enum StoreProduct
{
    case search
    case viewAll
    case store
    var caseValue: String{
        switch self{
        case .search:                             return "search"
        case .viewAll:                             return "viewAll"
        case .store:                             return "store"
        }
    }
}




