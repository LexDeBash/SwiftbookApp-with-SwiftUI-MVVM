//
//  CourseViewViewModel.swift
//  SwiftbookApp
//
//  Created by Alexey Efimov on 14.08.2020.
//

import Foundation

protocol CourseViewViewModelProtocol: class {
    var courseName: String { get }
    var imageData: Data? { get }
    init(course: Course)
}

class CourseViewViewModel: CourseViewViewModelProtocol {
    var courseName: String {
        course.name
    }
    
    var imageData: Data? {
        NetworkManager.shared.fetchImageData(from: course.imageUrl)
    }
    
    private let course: Course
    
    required init(course: Course) {
        self.course = course
    }
}
