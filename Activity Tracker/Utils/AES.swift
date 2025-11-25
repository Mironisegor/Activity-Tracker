//
//  AES.swift
//  Activity Tracker
//
//  Created by Egor Mironov on 28/09/2025.
//  Copyright © 2025 Egor Mironov. All rights reserved.
//

import Foundation
import CommonCrypto

struct AES {

    let key: Data

    func encrypt(data: Data) -> Data? {
        process(data: data, operation: CCOperation(kCCEncrypt))
    }

    func decrypt(data: Data) -> Data? {
        process(data: data, operation: CCOperation(kCCDecrypt))
    }

    private func process(data: Data, operation: CCOperation) -> Data? {

        let resultLength = data.count + kCCBlockSizeAES128
        var resultData = Data(count: resultLength)
        var bytesLength = 0

        let status = resultData.withUnsafeMutableBytes { cryptBytes in
            data.withUnsafeBytes { dataBytes in
                key.withUnsafeBytes { keyBytes in
                    CCCrypt(
                        operation, CCAlgorithm(kCCAlgorithmAES), CCOptions(kCCOptionECBMode),
                        keyBytes.baseAddress, key.count,
                        nil, // IV
                        dataBytes.baseAddress, data.count,
                        cryptBytes.baseAddress, resultLength,
                        &bytesLength
                    )
                }
            }
        }

        guard status == kCCSuccess else {
            return nil
        }

        resultData.removeSubrange(bytesLength..<resultData.count)
        return resultData
    }
}
