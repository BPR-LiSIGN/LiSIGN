//
//  SwiftUIView.swift
//  LiSIGN
//

import SwiftUI

struct SmallCardView: View {
    var image: Image
    var title: String
    var type: String
    var price: Double
    var size: CGFloat
    
    var body: some View{
        VStack{
            image
                .resizable()
                .frame(width: size, height: 200 * (size/210))
                .cornerRadius(20.0)
            Text("Chair").font(.title3).fontWeight(.bold)

            HStack(spacing: 2) {
                ForEach(0 ..< 5) { item in
                    Image("star")
                }
                Spacer()
                HStack{
                    Text("$1000")
                        .font(.title3)
                        .fontWeight(.bold)
                    Button(action: {
                        print("Object is removed from Favourites")
                        // Call ViewModel to delete object from user's list of favourite objects
                    }) {
                        Image(systemName: "trash")
                        .renderingMode(Image.TemplateRenderingMode?.init(Image.TemplateRenderingMode.original))
                        .cornerRadius(5)
                    }
                }
                
            }
        }
        .frame(width: size)
        .padding()
        .background(Color("CustomGray"))
        .cornerRadius(20.0)
    }
}

struct SmallCardView_Previews: PreviewProvider {
    static var previews: some View {
        SmallCardView(image: Image("chair_2"), title: "Chair 2", type: "Furniture", price: 30, size: 130)
    }
}
