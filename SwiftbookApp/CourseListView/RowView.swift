//
//  RowView.swift
//  SwiftbookApp
//
//  Created by Alexey Efimov on 14.08.2020.
//

import SwiftUI

struct RowView: View {
    let viewModel: RowViewViewModel
    
    var body: some View {
        HStack {
            getImage(from: viewModel.imageData)
                .resizable()
                .frame(width: 130, height: 100)
            
            Text(viewModel.courseName)
                .padding()
                .font(.title3)
        }
    }
    
    private func getImage(from data: Data?) -> Image {
        guard let data = data else { return Image(systemName: "xmark.shield") }
        guard let image = UIImage(data: data) else { return Image(systemName: "xmark.shield") }
        return Image(uiImage: image)
    }
}

struct CourseRowView_Previews: PreviewProvider {
    static var previews: some View {
        RowView(viewModel: RowViewViewModel(course: Course(
            name: "Course Name",
            imageUrl: "https://swiftbook.ru/wp-content/uploads/2018/03/2-courselogo.jpg",
            numberOfLessons: 40,
            numberOfTests: 10
        )))
    }
}
