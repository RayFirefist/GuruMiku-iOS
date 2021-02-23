//
//  CacheManager.swift
//  GuruMiku
//
//  Created by Ray on 22/02/21.
//

import Foundation

class CacheManager {
    static func writeIntoCache(fileName: String, data: Data) {
        let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as String
        let url = NSURL(fileURLWithPath: path)
        if let pathComponent = url.appendingPathComponent(fileName) {
            let filePath = pathComponent.path
            let fileManager = FileManager.default
            if fileManager.fileExists(atPath: filePath) {
                print("FILE AVAILABLE")
            } else {
                print("FILE NOT AVAILABLE")
                do {
                    try data.write(to: filePath.asURL())
                } catch {
                    print(error.localizedDescription)
                }
            }
        } else {
            print("FILE PATH NOT AVAILABLE")
        }
    }
}
