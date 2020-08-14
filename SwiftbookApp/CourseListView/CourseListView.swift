//
//  CourseListView.swift
//  SwiftbookApp
//
//  Created by Alexey Efimov on 14.08.2020.
//

import SwiftUI

struct CourseListView: View {
    @StateObject private var viewModel = CourseListViewModel()
    
    var body: some View {
        NavigationView {
            List(viewModel.courses, id: \.name) { course in
                NavigationLink(destination: CourseDetailsView(viewModel: CourseDetailViewModel(course: course))) {
                    RowView(viewModel: CourseViewViewModel(course: course))
                }
            }
            .navigationTitle("Courses")
        }
        .onAppear {
            viewModel.fetchCourses()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CourseListView()
    }
}
