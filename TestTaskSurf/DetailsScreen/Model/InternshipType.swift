//
//  InternshipType.swift
//  TestTaskSurf
//
//  Created by Yuliya Lapenak on 2/12/23.
//

import UIKit


enum InternshipType: String , CaseIterable {
    
    case android
    case flutter
    case design
    case pm
    case devOps
    case java
    case dotNet
    case qa
    case js
    case iOS

    var readable: String {
        switch self {
        case .iOS:
            return "IOS"
        case .android:
            return "Android"
        case .flutter:
            return "Flutter"
        case .design:
            return "Design"
        case .qa:
            return "QA"
        case .pm:
            return "PM"
        case .devOps:
            return "DevOps"
        case .java:
            return "Java"
        case .dotNet:
            return "C#"
        case .js:
            return "Java Script"
        }
    }
}


