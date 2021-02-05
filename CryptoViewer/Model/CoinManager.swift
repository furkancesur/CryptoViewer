//
//  CoinManager.swift
//  CryptoViewer
//
//  Created by Mac on 30.01.2021.
//

import Foundation

struct CoinManager {
    
    let baseURL = "https://rest.coinapi.io/v1/exchangerate/BTC"
    let apiKey = "FFF1EC57-04C4-4654-8890-7380DFA16077"
    
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]
    
    func getCoinPrice(for currency: String) {
        
        let urlString = "\(baseURL)/\(currency)?apikey=\(apiKey)"
        
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) {
                (data, response, error) in
                if error != nil {
                    print(error!)
                    return
                }
                //Format the data we got back as a string to be able to print it.
                //let dataAsString = String(data: data!, encoding: .utf8)
                //print(dataAsString)
                
                if let safeData = data {
                    let coinPrice = self.parseJSON(safeData)
                }
                
            }
            //Start task to fetch data from bitcoin average's servers.
            task.resume()
        }
        
    }
    
    func parseJSON(_ data: Data) -> Double? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(CoinData.self, from: data)
            let lastPrice = decodedData.rate
            print(lastPrice)
            return lastPrice
        } catch {
            print(error)
            //delegate?.didFailWithError(self, error: error)
            return nil
        }
    }
    
    
}
