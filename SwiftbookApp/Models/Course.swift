//
//  Course.swift
//  SwiftbookApp
//
//  Created by Alexey Efimov on 14.08.2020.
//

struct Course: Decodable {
    let name: String
    let imageUrl: String
    let numberOfLessons: Int
    let numberOfTests: Int
}
