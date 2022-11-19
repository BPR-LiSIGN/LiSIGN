//
//  MarketPlaceView.swift
//  LiSIGN
//

import SwiftUI

struct MarketPlaceView: View {
    @State private var search: String = ""
    @State private var searching = false
    @State private var selectedIndex: Int = 1
    var cardDetailed = [CardDetailed()];
    private let categories = ["Chair", "Sofa", "Lamp", "Kitchen"]
    var body: some View {
        NavigationView {
            ZStack {
                Color(#colorLiteral(red: 0.937254902, green: 0.937254902, blue: 0.937254902, alpha: 1))
                    .ignoresSafeArea()
                
                ScrollView (showsIndicators: false) {
                    VStack (alignment: .leading) {
                        
                        
                        TagLineView()
                            .padding()
                        
                        SearchBar(searchText: $search, searching: $searching)
                        
                        ScrollView (.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(0 ..< categories.count) { i in
                                    Button(action: {selectedIndex = i}) {
                                        CategoryView(isActive: selectedIndex == i, text: categories[i])
                                    }
                                }
                            }
                            .padding()
                        }
                        
                        Text("Bestsellers")
                            .font(.system(size: 30, weight: .medium, design: .default))
                            .padding(.horizontal)
                                                        

                        ScrollView (.horizontal, showsIndicators: false) {
                            HStack (spacing: 0) {
                                ForEach(0 ..< 4) { i in
                                    NavigationLink(
                                        destination: CardDetailed(),
                                        label: {
                                            ProductCardViewHorizontal(image: Image("chair_\(i+1)"), size: 200)
                                        })
                                        .navigationBarHidden(true)
                                        .foregroundColor(.black)
                                }
                                .padding(.leading)
                            }
                        }
                        .padding(.bottom)
                        
                        Text("All")
                            .font(.system(size: 24, weight: .light, design: .default))
                            .padding(.horizontal)
                        
                        ScrollView (.horizontal, showsIndicators: false) {
                            VStack(spacing:30)
                            {
                                HStack(spacing:30)
                                {
                                    ForEach(0 ..< 2) { i in
                                        ProductCardView(image: Image("chair_1"), size: 150)
                                       
                                        
                                    }

                                }.padding(.leading)
                                
                                HStack (spacing: 30) {
                                    ForEach(0 ..< 2) { i in
                                        ProductCardView(image: Image("chair_2"), size: 150)
                                    }
                                }.padding(.leading)
                                HStack (spacing: 30) {
                                    ForEach(0 ..< 2) { i in
                                        ProductCardView(image: Image("chair_3"), size: 150)
                                    }
                                }.padding(.leading)
                            }
                        }
                        
                    }
                }
                
                VStack {
                    Spacer()
                }
            }
        }
    }
}

struct MarketPlaceView_Previews: PreviewProvider {
    static var previews: some View {
        MarketPlaceView()
    }
}
struct AppBarView: View {
    var body: some View {
        HStack {
            Button(action: {}) {
                Image("menu")
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10.0)
            }

            Spacer()

//            Button(action: {}) {
//                Image(uiImage: #imageLiteral(resourceName: "Profile"))
//                    .resizable()
//                    .frame(width: 42, height: 42)
//                    .cornerRadius(10.0)
//            }
        }
        .padding(.horizontal)
    }
}
struct TagLineView: View {
    var body: some View {
        Text("Marketplace")
//            .font(.custom("PlayfairDisplay-Regular", size: 28))
            
            .font(.system(size: 36, weight: .bold, design: .default))
            .foregroundColor(Color("Brown"))
            
    }
}

struct SearchAndScanView: View {
    @Binding var search: String
    var body: some View {
        HStack {
            HStack {
                Image("Search")
                    .padding(.trailing, 8)
                TextField("Search Furniture", text: $search)
            }
            .padding(.all, 20)
            .background(Color.white)
            .cornerRadius(10.0)
            .padding(.trailing, 8)

            Button(action: {}) {
                Image("Scan")
                    .padding()
                    .background(Color("Brown"))
                    .cornerRadius(10.0)
            }
        }
        .padding(.horizontal)
    }
}

struct CategoryView: View {
    let isActive: Bool
    let text: String
    var body: some View {
        VStack (alignment: .leading, spacing: 0) {
            Text(text)
                .font(.system(size: 18))
                .fontWeight(.medium)
                .foregroundColor(isActive ? Color("Brown") : Color.black.opacity(0.5))
            if (isActive) { Color("Brown")
                .frame(width: 15, height: 2)
                .clipShape(Capsule())
            }
        }
        .padding(.trailing)
    }
}

struct ProductCardViewHorizontal: View {
    let image: Image
    let size: CGFloat

    var body: some View {
        VStack {
            image
                .resizable()
                .frame(width: size, height: 200 * (size/210))
                .cornerRadius(20.0)
            Text("Chair").font(.title3).fontWeight(.bold)

            HStack (spacing: 7) {
                ForEach(0 ..< 5) { item in
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                        .frame(width: 14, height: 15)
                }
                Spacer()
                Text("$1000")
                    .font(.title3)
                    .fontWeight(.light)
            }
        }
        .frame(width: size)
        .padding()
        .background(Color.white)
        .cornerRadius(20.0)

    }
}
struct ProductCardView: View {
    let image: Image
    let size: CGFloat

    var body: some View {
        VStack {
            image
                .resizable()
                .frame(width: size, height: 200 * (size/210))
                .cornerRadius(20.0)
            Text("Chair").font(.title3).fontWeight(.bold)

            HStack (spacing: 9) {
                ForEach(0 ..< 5) { item in
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                        .frame(width: 6, height: 6)
                }
                Spacer()
                Text("$1000")
                    .font(.title3)
                    .fontWeight(.light)
            }
        }
        .frame(width: size)
        .padding()
        .background(Color.white)
        .cornerRadius(20.0)

    }
}








//
////        .navigationBarTitle("") //this must be empty
////        .navigationBarHidden(true)
////        .navigationBarBackButtonHidden(true)
//    }
//}
//
//struct HomeScreen_Previews: PreviewProvider {
//    static var previews: some View {
//        HomeScreen()
//    }
//}
//
//
//

//

