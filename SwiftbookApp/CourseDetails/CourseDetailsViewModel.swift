//
//  CourseDetailsViewModel.swift
//  SwiftbookApp
//
//  Created by Alexey Efimov on 14.08.2020.
//

import Foundation

protocol CourseDetailsViewModelProtocol: class {
    var courseName: String { get }
    var imageData: Data? { get }
    var numberOfLessons: String { get }
    var numberOfTests: String { get }
    var isFavourite: Bool { get }
    
    init(course: Course)
}

class CourseDetailViewModel: CourseDetailsViewModelProtocol, ObservableObject {
    
    var courseName: String {
        course.name
    }
    
    var imageData: Data? {
        NetworkManager.shared.fetchImageData(from: course.imageUrl)
    }
    
    var numberOfLessons: String {
        "Number of lessons \(course.numberOfLessons)"
    }
    
    var numberOfTests: String {
        "Number of tests \(course.numberOfTests)"
    }
    
    @Published var isFavourite: Bool {
        didSet {
            DataManager.shared.saveFavouriteStatus(for: course.name, with: isFavourite)
        }
    }

    private let course: Course

    required init(course: Course) {
        self.course = course
        isFavourite = DataManager.shared.loadFavouriteStatus(for: course.name)
    }
}
