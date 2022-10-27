//
//  FavouritesView.swift
//  LiSIGN
//

import SwiftUI

struct FavouritesView: View {
    
    let columns = [GridItem(.flexible()), GridItem(.flexible())]
                                                   
    var body: some View{
        NavigationView {
            VStack{
                ScrollView{
                    LazyVGrid(columns: columns) {
                        // Change '0x1f600...0x1f679' with the list of user's favObjects
                        ForEach(0x1f600...0x1f679, id: \.self) { value in
                            SmallCardView(image: Image("chair_2"), title: "chair", type: "Furniture", price: 30, size: 130)
                        }
                    }
                }
            }
            .navigationTitle("Your Favourites")
            .padding(20)
        }
        
    }
}

struct LenkasCardView: View {
    let image: Image
    let size: CGFloat

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
                Text("$1000")
                    .font(.title3)
                    .fontWeight(.bold)
            }
        }
        .frame(width: size)
        .padding()
        .background(Color.white)
        .cornerRadius(20.0)

    }
}

struct FavouritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavouritesView()
    }
}
