//
//  EndPoint.swift
//  NYTArticles
//
//  Created by Abdelhamid Naeem on 27/08/2025.
//

import Foundation

protocol EndPoint{
    var path: String { get }
    var method: RequestMethod { get }
    var body: [String: String]? { get }
    var header: [String: String]? { get }

}

extension EndPoint{
    
    var header: [String: String]?{
        return [
            "Content-Type": "application/json;charset=utf-8"
        ]
    }
    
    var body: [String: String]?{
        return nil
    }
}

