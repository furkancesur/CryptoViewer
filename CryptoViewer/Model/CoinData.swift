//
//  CoinData.swift
//  CryptoViewer
//
//  Created by Mac on 5.02.2021.
//

import Foundation

//Make the struct conform to the Decodable protocol to use it to decode our JSON.
//NOTE: You can also use the Codable type alias to conform to both Decodable and Encodable protocls in case you
//want to turn a Swift object back into a JSON.
struct CoinData: Decodable {
    let asset_id_base: String
    let asset_id_quote: String
    let rate: Double
}
