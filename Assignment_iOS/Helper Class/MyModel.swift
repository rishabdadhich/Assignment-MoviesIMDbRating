//
//  MyModel.swift
//  ST Ecommerce
//
//  Created by necixy on 30/06/20.
//  Copyright © 2020 Shashi. All rights reserved.
//

import Foundation
import UIKit

//MARK: - Self Made
struct MoreOptions {
    
    var image = UIImage()
    var title = ""
    var subTitle = ""
    var color = #colorLiteral(red: 0.4392156899, green: 0.01176470611, blue: 0.1921568662, alpha: 1)
    
    init(image:UIImage, title:String, subTitle:String, color:UIColor) {
        self.image = image
        self.title = title
        self.subTitle = subTitle
        self.color = color
    }
    
}

struct HomeOption {
    
    var image = UIImage()
    var title = ""
    var color = UIColor()
    
    init(image:UIImage, title:String, color:UIColor) {
        self.image = image
        self.title = title
        self.color = color
    }
    
}

struct SettingOption {
    
    var image = UIImage()
    var title = ""
    var color = UIColor()
    
    init(title:String) {
        self.title = title
    }
    
}

struct Floor {
    
    var name = ""
    var value = 0
}


// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let profileData = try ProfileData(json)

// MARK: - Helper functions for creating encoders and decoders

func newJSONDecoder() -> JSONDecoder {
    let decoder = JSONDecoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        decoder.dateDecodingStrategy = .iso8601
    }
    return decoder
}

func newJSONEncoder() -> JSONEncoder {
    let encoder = JSONEncoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        encoder.dateEncodingStrategy = .iso8601
    }
    return encoder
}









// MARK: - Encode/decode helpers -----------------------------

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public func hash(into hasher: inout Hasher) {
        // No-op
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}

class JSONCodingKey: CodingKey {
    let key: String

    required init?(intValue: Int) {
        return nil
    }

    required init?(stringValue: String) {
        key = stringValue
    }

    var intValue: Int? {
        return nil
    }

    var stringValue: String {
        return key
    }
}

class JSONAny: Codable {

    let value: Any

    static func decodingError(forCodingPath codingPath: [CodingKey]) -> DecodingError {
        let context = DecodingError.Context(codingPath: codingPath, debugDescription: "Cannot decode JSONAny")
        return DecodingError.typeMismatch(JSONAny.self, context)
    }

    static func encodingError(forValue value: Any, codingPath: [CodingKey]) -> EncodingError {
        let context = EncodingError.Context(codingPath: codingPath, debugDescription: "Cannot encode JSONAny")
        return EncodingError.invalidValue(value, context)
    }

    static func decode(from container: SingleValueDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if container.decodeNil() {
            return JSONNull()
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decode(from container: inout UnkeyedDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if let value = try? container.decodeNil() {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer() {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decode(from container: inout KeyedDecodingContainer<JSONCodingKey>, forKey key: JSONCodingKey) throws -> Any {
        if let value = try? container.decode(Bool.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Int64.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Double.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(String.self, forKey: key) {
            return value
        }
        if let value = try? container.decodeNil(forKey: key) {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer(forKey: key) {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decodeArray(from container: inout UnkeyedDecodingContainer) throws -> [Any] {
        var arr: [Any] = []
        while !container.isAtEnd {
            let value = try decode(from: &container)
            arr.append(value)
        }
        return arr
    }

    static func decodeDictionary(from container: inout KeyedDecodingContainer<JSONCodingKey>) throws -> [String: Any] {
        var dict = [String: Any]()
        for key in container.allKeys {
            let value = try decode(from: &container, forKey: key)
            dict[key.stringValue] = value
        }
        return dict
    }

    static func encode(to container: inout UnkeyedEncodingContainer, array: [Any]) throws {
        for value in array {
            if let value = value as? Bool {
                try container.encode(value)
            } else if let value = value as? Int64 {
                try container.encode(value)
            } else if let value = value as? Double {
                try container.encode(value)
            } else if let value = value as? String {
                try container.encode(value)
            } else if value is JSONNull {
                try container.encodeNil()
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer()
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }

    static func encode(to container: inout KeyedEncodingContainer<JSONCodingKey>, dictionary: [String: Any]) throws {
        for (key, value) in dictionary {
            let key = JSONCodingKey(stringValue: key)!
            if let value = value as? Bool {
                try container.encode(value, forKey: key)
            } else if let value = value as? Int64 {
                try container.encode(value, forKey: key)
            } else if let value = value as? Double {
                try container.encode(value, forKey: key)
            } else if let value = value as? String {
                try container.encode(value, forKey: key)
            } else if value is JSONNull {
                try container.encodeNil(forKey: key)
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer(forKey: key)
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }

    static func encode(to container: inout SingleValueEncodingContainer, value: Any) throws {
        if let value = value as? Bool {
            try container.encode(value)
        } else if let value = value as? Int64 {
            try container.encode(value)
        } else if let value = value as? Double {
            try container.encode(value)
        } else if let value = value as? String {
            try container.encode(value)
        } else if value is JSONNull {
            try container.encodeNil()
        } else {
            throw encodingError(forValue: value, codingPath: container.codingPath)
        }
    }

    public required init(from decoder: Decoder) throws {
        if var arrayContainer = try? decoder.unkeyedContainer() {
            self.value = try JSONAny.decodeArray(from: &arrayContainer)
        } else if var container = try? decoder.container(keyedBy: JSONCodingKey.self) {
            self.value = try JSONAny.decodeDictionary(from: &container)
        } else {
            let container = try decoder.singleValueContainer()
            self.value = try JSONAny.decode(from: container)
        }
    }

    public func encode(to encoder: Encoder) throws {
        if let arr = self.value as? [Any] {
            var container = encoder.unkeyedContainer()
            try JSONAny.encode(to: &container, array: arr)
        } else if let dict = self.value as? [String: Any] {
            var container = encoder.container(keyedBy: JSONCodingKey.self)
            try JSONAny.encode(to: &container, dictionary: dict)
        } else {
            var container = encoder.singleValueContainer()
            try JSONAny.encode(to: &container, value: self.value)
        }
    }
}


//MARK:- // Doculo Api methods ---


import Foundation

// MARK: - MainData
struct MainData: Codable {
    var code: Int?
    var message: String?
    var data: DataClass?
}

// MARK: MainData convenience initializers and mutators

extension MainData {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(MainData.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        code: Int?? = nil,
        message: String?? = nil,
        data: DataClass?? = nil
    ) -> MainData {
        return MainData(
            code: code ?? self.code,
            message: message ?? self.message,
            data: data ?? self.data
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - DataClass
struct DataClass: Codable {
    var directories: [Directory]?
    var subscriptionPlan: SubscriptionPlan?

    enum CodingKeys: String, CodingKey {
        case directories
        case subscriptionPlan
    }
}

// MARK: DataClass convenience initializers and mutators

extension DataClass {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(DataClass.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        directories: [Directory]?? = nil,
        subscriptionPlan: SubscriptionPlan?? = nil
    ) -> DataClass {
        return DataClass(
            directories: directories ?? self.directories,
            subscriptionPlan: subscriptionPlan ?? self.subscriptionPlan
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - Directory
struct Directory: Codable {
    var id: Int?
    var name: String?
    var sequence: Int?
    var children: [JSONAny]?
    var created_at_date : String?
    var created_at_time : String?
}

// MARK: Directory convenience initializers and mutators

extension Directory {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Directory.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        id: Int?? = nil,
        name: String?? = nil,
        sequence: Int?? = nil,
        children: [JSONAny]?? = nil,
        created_at_date: String?? = nil,
        created_at_time:String?? = nil
    ) -> Directory {
        return Directory(
            id: id ?? self.id,
            name: name ?? self.name,
            sequence: sequence ?? self.sequence,
            children: children ?? self.children,
            created_at_date: created_at_date ?? self.created_at_date,
            created_at_time: created_at_time ?? self.created_at_time
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - SubscriptionPlan
struct SubscriptionPlan: Codable {
    var id, subscriptionPlanID: Int?
    var name, activate_date, expire_on: String?
    var isExpired: Bool?
    var daysLeft: Int?

    enum CodingKeys: String, CodingKey {
        case id
        case subscriptionPlanID
        case name
        case activate_date
        case expire_on
        case isExpired
        case daysLeft
    }
}

// MARK: SubscriptionPlan convenience initializers and mutators

extension SubscriptionPlan {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(SubscriptionPlan.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        id: Int?? = nil,
        subscriptionPlanID: Int?? = nil,
        name: String?? = nil,
        activate_date: String?? = nil,
        expire_on: String?? = nil,
        isExpired: Bool?? = nil,
        daysLeft: Int?? = nil
    ) -> SubscriptionPlan {
        return SubscriptionPlan(
            id: id ?? self.id,
            subscriptionPlanID: subscriptionPlanID ?? self.subscriptionPlanID,
            name: name ?? self.name,
            activate_date: activate_date ?? self.activate_date,
            expire_on: expire_on ?? self.expire_on,
            isExpired: isExpired ?? self.isExpired,
            daysLeft: daysLeft ?? self.daysLeft
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

import Foundation

// MARK: - Documents
struct Documents: Codable {
    var name: String?
    var records: [Record]?
    var total_records, totalPage, currentPage: Int?
    var  recordPerPage: Int?
    var child_directories: [ChildDirectory]?

    enum CodingKeys: String, CodingKey {
        case name, records
        case total_records
        case totalPage, currentPage, recordPerPage
        case child_directories
    }
}

// MARK: Documents convenience initializers and mutators

extension Documents {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Documents.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        name: String?? = nil,
        records: [Record]?? = nil,
        total_records: Int?? = nil,
        totalPage: Int?? = nil,
        currentPage: Int?? = nil,
        recordPerPage: Int?? = nil,
        child_directories: [ChildDirectory]?? = nil
    ) -> Documents {
        return Documents(
            name: name ?? self.name,
            records: records ?? self.records,
            total_records: total_records ?? self.total_records,
            totalPage: totalPage ?? self.totalPage,
            currentPage: currentPage ?? self.currentPage,
            recordPerPage: recordPerPage ?? self.recordPerPage,
            child_directories: child_directories ?? self.child_directories
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - ChildDirectory
struct ChildDirectory: Codable {
    
    var id: Int?
    var name, created_at, created_at_date, created_at_time: String?
    var sequence: String?
    var children: [JSONAny]?

    enum CodingKeys: String, CodingKey {
        case id, name
        case created_at
        case created_at_date
        case created_at_time
        case sequence, children
    }
}

// MARK: ChildDirectory convenience initializers and mutators

extension ChildDirectory {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(ChildDirectory.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        id: Int?? = nil,
        name: String?? = nil,
        created_at: String?? = nil,
        created_at_date: String?? = nil,
        created_at_time: String?? = nil,
        sequence: String?? = nil,
        children: [JSONAny]?? = nil
    ) -> ChildDirectory {
        return ChildDirectory(
            id: id ?? self.id,
            name: name ?? self.name,
            created_at: created_at ?? self.created_at,
            created_at_date: created_at_date ?? self.created_at_date,
            created_at_time: created_at_time ?? self.created_at_time,
            sequence: sequence ?? self.sequence,
            children: children ?? self.children
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - Record
struct Record: Codable {
    var id: Int?
    var document_id: String?
    var document_group_id: Int? = 0
    var directory_id: Int?
    var name : String? = ""
    var document_group_name: String? = ""
    var signed_doc, invite_to_sign: Int?
    var url: String?
    var total_fields: Int?
    var created_at, created_at_date, created_at_time: String?
    var preview_image: String?

    enum CodingKeys: String, CodingKey {
        case id
        case document_id
        case document_group_id
        case directory_id
        case name
        case document_group_name
        case signed_doc
        case invite_to_sign
        case url
        case total_fields
        case created_at
        case created_at_date
        case created_at_time
        case preview_image
    }
}

// MARK: Record convenience initializers and mutators

extension Record {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Record.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        id: Int?? = nil,
        document_id: String?? = nil,
        document_group_id: Int?? = nil,
        directory_id: Int?? = nil,
        name: String?? = nil,
        document_group_name: String?? = nil,
        signed_doc: Int?? = nil,
        invite_to_sign: Int?? = nil,
        url: String?? = nil,
        total_fields: Int?? = nil,
        created_at: String?? = nil,
        created_at_date: String?? = nil,
        created_at_time: String?? = nil,
        preview_image: String?? = nil
    ) -> Record {
        return Record(
            id: id ?? self.id,
            document_id: document_id ?? self.document_id,
            document_group_id: (document_group_id ?? self.document_group_id) ?? 0,
            directory_id: directory_id ?? self.directory_id,
            name: (name ?? self.name) ?? "",
            document_group_name: (document_group_name ?? self.document_group_name) ?? "",
            signed_doc: signed_doc ?? self.signed_doc,
            invite_to_sign: invite_to_sign ?? self.invite_to_sign,
            url: url ?? self.url,
            total_fields: total_fields ?? self.total_fields,
            created_at: created_at ?? self.created_at,
            created_at_date: created_at_date ?? self.created_at_date,
            created_at_time: created_at_time ?? self.created_at_time,
            preview_image: preview_image ?? self.preview_image
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}


// MARK: - DocumentHistory
struct DocumentHistory: Codable {
    var document_name, document_created, document_id: String?
    var history: [History]?

    enum CodingKeys: String, CodingKey {
        case document_name
        case document_created
        case document_id
        case history
    }
}

// MARK: DocumentHistory convenience initializers and mutators

extension DocumentHistory {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(DocumentHistory.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        document_name: String?? = nil,
        document_created: String?? = nil,
        document_id: String?? = nil,
        history: [History]?? = nil
    ) -> DocumentHistory {
        return DocumentHistory(
            document_name: document_name ?? self.document_name,
            document_created: document_created ?? self.document_created,
            document_id: document_id ?? self.document_id,
            history: history ?? self.history
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - History
struct History: Codable {
    var client, event, directory_by, server_time: String?
    var client_time, ip_address: String?

    enum CodingKeys: String, CodingKey {
        case client, event
        case directory_by
        case server_time
        case client_time
        case ip_address
    }
}

// MARK: History convenience initializers and mutators

extension History {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(History.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        client: String?? = nil,
        event: String?? = nil,
        directory_by: String?? = nil,
        server_time: String?? = nil,
        client_time: String?? = nil,
        ip_address: String?? = nil
    ) -> History {
        return History(
            client: client ?? self.client,
            event: event ?? self.event,
            directory_by: directory_by ?? self.directory_by,
            server_time: server_time ?? self.server_time,
            client_time: client_time ?? self.client_time,
            ip_address: ip_address ?? self.ip_address
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}


// MARK: - UserInfo
struct UserInfo: Codable {
    var userData: UserData?
    var plans: [Plan]?
    var userPlans: [UserPlan]?
}

// MARK: UserInfo convenience initializers and mutators

extension UserInfo {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(UserInfo.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        userData: UserData?? = nil,
        plans: [Plan]?? = nil,
        userPlans: [UserPlan]?? = nil
    ) -> UserInfo {
        return UserInfo(
            userData: userData ?? self.userData,
            plans: plans ?? self.plans,
            userPlans: userPlans ?? self.userPlans
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - Plan
struct Plan: Codable {
    var id: Int?
    var name, detailText: String?
    var monthlyPrice, yearlyPrice, saveOnYearly: Int?
    var tagsBasic, tagsAdvanced: [String]?
    var subscriptionDetail: String?

    enum CodingKeys: String, CodingKey {
        case id, name
        case detailText = "detail_text"
        case monthlyPrice = "monthly_price"
        case yearlyPrice = "yearly_price"
        case saveOnYearly = "save_on_yearly"
        case tagsBasic = "tags_basic"
        case tagsAdvanced = "tags_advanced"
        case subscriptionDetail = "subscription_detail"
    }
}

// MARK: Plan convenience initializers and mutators

extension Plan {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Plan.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        id: Int?? = nil,
        name: String?? = nil,
        detailText: String?? = nil,
        monthlyPrice: Int?? = nil,
        yearlyPrice: Int?? = nil,
        saveOnYearly: Int?? = nil,
        tagsBasic: [String]?? = nil,
        tagsAdvanced: [String]?? = nil,
        subscriptionDetail: String?? = nil
    ) -> Plan {
        return Plan(
            id: id ?? self.id,
            name: name ?? self.name,
            detailText: detailText ?? self.detailText,
            monthlyPrice: monthlyPrice ?? self.monthlyPrice,
            yearlyPrice: yearlyPrice ?? self.yearlyPrice,
            saveOnYearly: saveOnYearly ?? self.saveOnYearly,
            tagsBasic: tagsBasic ?? self.tagsBasic,
            tagsAdvanced: tagsAdvanced ?? self.tagsAdvanced,
            subscriptionDetail: subscriptionDetail ?? self.subscriptionDetail
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - UserData
struct UserData: Codable {
    var id: Int?
    var first_name, last_name: String?
    var full_name, stripe_customer_id, registration_date: String?
    var profile_picture: String?
    var email, default_sign, default_initial: String?
    var default_sign_id: Int?
    var default_initial_id: Int?
    var signs, initials: [Sign]?

    enum CodingKeys: String, CodingKey {
        case id
        case first_name
        case last_name
        case full_name
        case stripe_customer_id
        case registration_date
        case profile_picture
        case email
        case default_sign
        case default_initial
        case default_sign_id
        case default_initial_id
        case signs, initials
    }
}

// MARK: UserData convenience initializers and mutators

extension UserData {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(UserData.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        id: Int?? = nil,
        first_name: String?? = nil,
        last_name: String?? = nil,
        full_name: String?? = nil,
        stripe_customer_id: String?? = nil,
        registration_date: String?? = nil,
        profile_picture: String?? = nil,
        email: String?? = nil,
        default_sign: String?? = nil,
        default_initial: String?? = nil,
        default_sign_id: Int?? = nil,
        default_initial_id: Int?? = nil,
        signs: [Sign]?? = nil,
        initials: [Sign]?? = nil
    ) -> UserData {
        return UserData(
            id: id ?? self.id,
            first_name: first_name ?? self.first_name,
            last_name: last_name ?? self.last_name,
            full_name: full_name ?? self.full_name,
            stripe_customer_id: stripe_customer_id ?? self.stripe_customer_id,
            registration_date: registration_date ?? self.registration_date,
            profile_picture: profile_picture ?? self.profile_picture,
            email: email ?? self.email,
            default_sign: default_sign ?? self.default_sign,
            default_initial: default_initial ?? self.default_initial,
            default_sign_id: default_sign_id ?? self.default_sign_id,
            default_initial_id: default_initial_id ?? self.default_initial_id,
            signs: signs ?? self.signs,
            initials: initials ?? self.initials
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - UserPlan
struct UserPlan: Codable {
    var id: Int?
    var name: String?
    var planType: Int?
    var paymentMethod: String?
    var transactionID, activateDate, expireOn: String?
    var discount, paidAmount: String?

    enum CodingKeys: String, CodingKey {
        case id, name
        case planType = "plan_type"
        case paymentMethod = "payment_method"
        case transactionID = "transaction_id"
        case activateDate = "activate_date"
        case expireOn = "expire_on"
        case discount
        case paidAmount = "paid_amount"
    }
}

// MARK: UserPlan convenience initializers and mutators

extension UserPlan {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(UserPlan.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        id: Int?? = nil,
        name: String?? = nil,
        planType: Int?? = nil,
        paymentMethod: String?? = nil,
        transactionID: String?? = nil,
        activateDate: String?? = nil,
        expireOn: String?? = nil,
        discount: String?? = nil,
        paidAmount: String?? = nil
    ) -> UserPlan {
        return UserPlan(
            id: id ?? self.id,
            name: name ?? self.name,
            planType: planType ?? self.planType,
            paymentMethod: paymentMethod ?? self.paymentMethod,
            transactionID: transactionID ?? self.transactionID,
            activateDate: activateDate ?? self.activateDate,
            expireOn: expireOn ?? self.expireOn,
            discount: discount ?? self.discount,
            paidAmount: paidAmount ?? self.paidAmount
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - Sign
struct Sign: Codable {
    var id: Int?
    var sign: String?
}

// MARK: Sign convenience initializers and mutators

extension Sign {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Sign.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        id: Int?? = nil,
        sign: String?? = nil
    ) -> Sign {
        return Sign(
            id: id ?? self.id,
            sign: sign ?? self.sign
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}



// MARK: - DocumentGroup
struct DocumentGroup: Codable {
    var records: [RecordGroup]?
    var totalRecords, totalPage: Int?
    var currentPage, recordPerPage: Int?

    enum CodingKeys: String, CodingKey {
        case records
        case totalRecords = "total_records"
        case totalPage, currentPage, recordPerPage
    }
}

// MARK: DocumentGroup convenience initializers and mutators

extension DocumentGroup {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(DocumentGroup.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        records: [RecordGroup]?? = nil,
        totalRecords: Int?? = nil,
        totalPage: Int?? = nil,
        currentPage: Int?? = nil,
        recordPerPage: Int?? = nil
    ) -> DocumentGroup {
        return DocumentGroup(
            records: records ?? self.records,
            totalRecords: totalRecords ?? self.totalRecords,
            totalPage: totalPage ?? self.totalPage,
            currentPage: currentPage ?? self.currentPage,
            recordPerPage: recordPerPage ?? self.recordPerPage
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - RecordGroup
struct RecordGroup: Codable {
    var id, directoryID: Int?
    var name: String?
    var createStep: Int?
    var quickInviteStatus, sendSigningStatus, fieldStatus: Bool?
    var createdAt: String?

    enum CodingKeys: String, CodingKey {
        case id
        case directoryID = "directory_id"
        case name
        case createStep = "create_step"
        case quickInviteStatus = "quick_invite_status"
        case sendSigningStatus = "send_signing_status"
        case fieldStatus = "field_status"
        case createdAt = "created_at"
    }
}

// MARK: RecordGroup convenience initializers and mutators

extension RecordGroup {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(RecordGroup.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        id: Int?? = nil,
        directoryID: Int?? = nil,
        name: String?? = nil,
        createStep: Int?? = nil,
        quickInviteStatus: Bool?? = nil,
        sendSigningStatus: Bool?? = nil,
        fieldStatus: Bool?? = nil,
        createdAt: String?? = nil
    ) -> RecordGroup {
        return RecordGroup(
            id: id ?? self.id,
            directoryID: directoryID ?? self.directoryID,
            name: name ?? self.name,
            createStep: createStep ?? self.createStep,
            quickInviteStatus: quickInviteStatus ?? self.quickInviteStatus,
            sendSigningStatus: sendSigningStatus ?? self.sendSigningStatus,
            fieldStatus: fieldStatus ?? self.fieldStatus,
            createdAt: createdAt ?? self.createdAt
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - DocumentGroupDetail
struct DocumentGroupDetail: Codable {
    var id: Int?
    var name: String?
    var directoryID, createStep: Int?
    var quickInviteStatus, sendSigningStatus, status: Bool?
    var documents: [GroupDocuments]?
    var signingOrder: [JSONAny]?

    enum CodingKeys: String, CodingKey {
        case id, name
        case directoryID = "directory_id"
        case createStep = "create_step"
        case quickInviteStatus = "quick_invite_status"
        case sendSigningStatus = "send_signing_status"
        case status, documents
        case signingOrder = "signing_order"
    }
}

// MARK: DocumentGroupDetail convenience initializers and mutators

extension DocumentGroupDetail {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(DocumentGroupDetail.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        id: Int?? = nil,
        name: String?? = nil,
        directoryID: Int?? = nil,
        createStep: Int?? = nil,
        quickInviteStatus: Bool?? = nil,
        sendSigningStatus: Bool?? = nil,
        status: Bool?? = nil,
        documents: [GroupDocuments]?? = nil,
        signingOrder: [JSONAny]?? = nil
    ) -> DocumentGroupDetail {
        return DocumentGroupDetail(
            id: id ?? self.id,
            name: name ?? self.name,
            directoryID: directoryID ?? self.directoryID,
            createStep: createStep ?? self.createStep,
            quickInviteStatus: quickInviteStatus ?? self.quickInviteStatus,
            sendSigningStatus: sendSigningStatus ?? self.sendSigningStatus,
            status: status ?? self.status,
            documents: documents ?? self.documents,
            signingOrder: signingOrder ?? self.signingOrder
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - GroupDocuments
struct GroupDocuments: Codable {
    var id: Int?
    var documentID, name: String?
    var fieldStatus: Bool?
    var document: String?
    var previewImage : String?

    enum CodingKeys: String, CodingKey {
        case id
        case documentID = "document_id"
        case name
        case fieldStatus = "field_status"
        case document
        case previewImage = "preview_image"
    }
}

// MARK: GroupDocuments convenience initializers and mutators

extension GroupDocuments {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(GroupDocuments.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        id: Int?? = nil,
        documentID: String?? = nil,
        name: String?? = nil,
        fieldStatus: Bool?? = nil,
        document: String?? = nil,
        previewImage : String?? = nil
    ) -> GroupDocuments {
        return GroupDocuments(
            id: id ?? self.id,
            documentID: documentID ?? self.documentID,
            name: name ?? self.name,
            fieldStatus: fieldStatus ?? self.fieldStatus,
            document: document ?? self.document,
            previewImage: previewImage ?? self.previewImage
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}
