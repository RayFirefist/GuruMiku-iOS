//
//  SyncHttpQuery.swift
//  GuruMiku
//
//  Created by Ray on 22/02/21.
//

import Foundation

func SyncHttpQuery(address: String) -> String {
    let url = URL(string: address)
    let semaphore = DispatchSemaphore(value: 0)
    
    var result: String = ""
    
    let task = URLSession.shared.dataTask(with: url!) {(data, response, error) in
        result = String(data: data!, encoding: String.Encoding.utf8)!
        semaphore.signal()
    }
    
    task.resume()
    semaphore.wait()
    return result
}

func SyncHttpQueryAsData(address: String) -> Data {
    let url = URL(string: address)
    let semaphore = DispatchSemaphore(value: 0)
    
    var result: Data = "".data(using: .utf8)!
    
    let task = URLSession.shared.dataTask(with: url!) {(data, response, error) in
        result = data!
        semaphore.signal()
    }
    
    task.resume()
    semaphore.wait()
    return result
}
