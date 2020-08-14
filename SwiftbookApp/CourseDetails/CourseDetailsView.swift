//
//  CourseDetailsView.swift
//  SwiftbookApp
//
//  Created by Alexey Efimov on 14.08.2020.
//

import SwiftUI

struct CourseDetailsView: View {
    @StateObject var viewModel: CourseDetailViewModel
    
    var body: some View {
        VStack {
            Text(viewModel.courseName)
                .font(.largeTitle)
            
            VStack(alignment: .leading, spacing: 20) {
                ZStack {
                    CourseImage(imageData: viewModel.imageData)
                    FavouriteStatusButton(isFavourite: viewModel.isFavourite) {
                        viewModel.isFavourite.toggle()
                    }
                }
                
                Text(viewModel.numberOfLessons)
                    .font(.headline)
                Text(viewModel.numberOfTests)
                    .font(.headline)
            }
            
            Spacer()
        }
    }
}

struct CourseImage: View {
    let imageData: Data?
    
    var body: some View {
        getImage(from: imageData)
            .resizable()
            .cornerRadius(30)
            .frame(width: 230, height: 180)
            .shadow(radius: 10)
    }
    
    private func getImage(from data: Data?) -> Image {
        guard let data = data else { return Image(systemName: "xmark.shield") }
        guard let image = UIImage(data: data) else { return Image(systemName: "xmark.shield") }
        return Image(uiImage: image)
    }
}

struct FavouriteStatusButton: View {
    var isFavourite: Bool
    var action: () -> Void
    
    var body: some View {
        Image(systemName: isFavourite ? "heart.fill" : "heart")
            .resizable()
            .frame(width: 30, height: 30)
            .offset(x: 115, y: 60)

        Button("    ", action: action)
            .offset(x: 115, y: 60)
    }
}

struct CourseDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        CourseDetailsView(viewModel: CourseDetailViewModel(course: Course(
            name: "Course Name",
            imageUrl: "https://swiftbook.ru/wp-content/uploads/2018/03/2-courselogo.jpg",
            numberOfLessons: 40,
            numberOfTests: 10
        )))
    }
}
