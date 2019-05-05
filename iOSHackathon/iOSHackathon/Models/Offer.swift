//
//  Offer.swift
//  iOSHackathon
//
//  Created by Xu Mo on 5/4/19.
//

import Foundation
import MapKit

class Offer: NSObject, MKAnnotation, Codable {
//    var coordinate: CLLocationCoordinate2D {
//        var location = CLLocationCoordinate2D()
//
//        let semaphore = DispatchSemaphore(value: 0)
//        CLGeocoder().geocodeAddressString(merchantList.first?.merchantAddress.first ?? "") { (results, _) in
//            guard let coordinates = results?.first?.location?.coordinate else {return}
//            location = coordinates
//
//            semaphore.signal()
//        }
//        return location
//    }
    var coordinate: CLLocationCoordinate2D{
        return CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
    var title: String?{
        return offerTitle
    }
    
    var offerId: Int
    var activeIndicator, soldOut: Bool
    var merchantList: [MerchantList]
    var offerTitle: String
    var validityFromDate, validityToDate: String
    var shareTitle: String
    var offerShortDescription, offerCopy, merchantTerms: FAQs
    var redemptionCode: String
    var barcode: String?
    var qrCode: String?
    var latitude: Double
    var longitude: Double
    
    init(offerRepresentation: OfferRepresentation) {
        
        offerId = offerRepresentation.offerId
        activeIndicator = offerRepresentation.activeIndicator
        soldOut = offerRepresentation.soldOut
        merchantList = offerRepresentation.merchantList
        offerTitle = offerRepresentation.offerTitle
        validityFromDate = offerRepresentation.validityFromDate
        validityToDate = offerRepresentation.validityToDate
        shareTitle = offerRepresentation.shareTitle
        offerShortDescription = offerRepresentation.offerShortDescription
        offerCopy = offerRepresentation.offerCopy
        merchantTerms = offerRepresentation.merchantTerms
        redemptionCode = offerRepresentation.redemptionCode
        barcode = offerRepresentation.barcode
        qrCode = offerRepresentation.qrCode
        latitude = offerRepresentation.merchantList[0].latitude
        longitude = offerRepresentation.merchantList[0].longitude
        
    }
    
    init(title: String, description: String, id: Int) {
        self.offerTitle = title
        self.offerId = id
        self.activeIndicator = true
        self.soldOut = false
        self.merchantList = []
        self.validityToDate = ""
        self.validityFromDate = ""
        self.shareTitle = ""
        self.offerShortDescription = FAQs(text: "")
        self.offerCopy = FAQs(text: "")
        self.merchantTerms = FAQs(text: "")
        self.barcode = ""
        self.qrCode = ""
        self.redemptionCode = ""
        self.longitude = 0.0
        self.latitude = 0.0
    }
    
}
