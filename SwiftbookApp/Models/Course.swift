//
//  Course.swift
//  SwiftbookApp
//
//  Created by Alexey Efimov on 14.08.2020.
//

struct Course: Decodable {
    var name: String
    var imageUrl: String
    var numberOfLessons: Int
    var numberOfTests: Int
}
