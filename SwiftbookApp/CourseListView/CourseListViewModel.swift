//
//  CourseListViewModel.swift
//  SwiftbookApp
//
//  Created by Alexey Efimov on 14.08.2020.
//

import Foundation

protocol CourseListViewModelProtocol: class {
    var courses: [Course] { get }
    func fetchCourses()
}

class CourseListViewModel: CourseListViewModelProtocol, ObservableObject {
    
    @Published var courses: [Course] = []
    
    func fetchCourses() {
        NetworkManager.shared.fetchCourses { courses in
            DispatchQueue.main.async {
                self.courses = courses
            }
        }
    }
}
