//
//  File.swift
//  
//
//  Created by ky0me22 on 2023/09/02.
//

import UIKit

public enum KEOperationType {
    case globe(from: UIView, with: UIEvent)
    case insert(text: String)
    case delete(length: Int)
}
