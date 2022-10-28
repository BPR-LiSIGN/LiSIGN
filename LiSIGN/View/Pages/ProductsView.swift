

import SwiftUI

struct ProductsView: View {
    @State private var search: String = ""
    @State private var searching = false
    @State private var selectedIndex: Int = 1
    var cardDetailed = [CardDetailed()];
    private let categories = ["Chair", "Sofa", "Lamp"]
    var body: some View {
        NavigationView {
            ZStack {
                Color(#colorLiteral(red: 0.937254902, green: 0.937254902, blue: 0.937254902, alpha: 1))
                    .ignoresSafeArea()
                
                ScrollView (showsIndicators: false) {
                    VStack (alignment: .leading) {
                        
                        
                        TagLineView2()
                            .padding()
                                                
                        ScrollView (.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(0 ..< categories.count) { i in
                                    Button(action: {selectedIndex = i}) {
                                        CategoryView2(isActive: selectedIndex == i, text: categories[i])
                                    }
                                }
                            }
                            .padding()
                        }
                        
                    
                        .padding(.bottom)
                        
                        Text("All")
                            .font(.system(size: 24, weight: .light, design: .default))
                            .padding(.horizontal)
                        
                        ScrollView (.horizontal, showsIndicators: false) {
                            VStack(spacing:30)
                            {
                                ForEach(0 ..< 10) { i in
                                    ProductCardView2(image:
                                        Image(systemName: "sofa"), size: 100)
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

struct ProductsView_Previews: PreviewProvider {
    static var previews: some View {
        ProductsView()
    }
}
struct AppBarView2: View {
    var body: some View {
        HStack {
            Button(action: {}) {
                Image("menu")
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10.0)
            }

            Spacer()

//
        }
        .padding(.horizontal)
    }
}
struct TagLineView2: View {
    var body: some View {
        Text("Products")
//            .font(.custom("PlayfairDisplay-Regular", size: 28))
            
            .font(.system(size: 36, weight: .bold, design: .default))
            .foregroundColor(Color("Brown"))
            
    }
}


struct CategoryView2: View {
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

struct ProductCardViewHorizontal2: View {
    let image: Image
    let size: CGFloat

    var body: some View {
        VStack {
            image
                .resizable()
                .frame(width: size, height: 200 * (size/210))
                .cornerRadius(20.0)
            Text("Chair").font(.title3).fontWeight(.bold)

        
        }
        .frame(width: size)
        .padding()
        .background(Color.white)
        .cornerRadius(20.0)

    }
}
struct ProductCardView2: View {
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

