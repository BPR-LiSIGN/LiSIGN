
//
//  ContentView.swift
//  Bird
//
//  Created by Sullivan De carli on 08/07/2022.
//

import SwiftUI

struct ProductsView: View {
    @State private var selectionOption: FilterProductsListViewModel = .productsList
    @State private var selectedIndex: Int = 1
    @StateObject var loginData: LoginPageModel = LoginPageModel()
    @State private var addMode = false
    @EnvironmentObject var productsViewModel: ProductsViewModel
    @Namespace var animation
    var viewModel = ProductsViewModel().getAllProducts()
    
    //    var viewModel = ReadProductsViewModel()
    
    private var gridItemLayout = [GridItem(.flexible()), GridItem(.flexible())]
    init() {
        
    }
    private let categories2 = ["Your products", "Favorites"]
    //    func observePosts() {
    //        let postsRef = Database.database().reference().child("Product")
    //
    //        postsRef.observe(.value, with: { snapshot in
    //            for child in snapshot.children {
    //                if let childSnapshot = child as? DataSnapshot,
    //                   let id = dict["id"'] as? String,
    //                   let dict = childSnapshot as? [String:Any],
    //                   let name = dict["name"] as? String,
    //                   let description = dict["description"] as? String,
    //                   let info = dict ["info"] as? String {
    //                    let user = User(id: id, email: <#T##String#>)
    //                }
    //            }
    //        }<#T##(DataSnapshot) -> Void#>)
    //    }
    
    var body: some View {
        //        HStack {
        //            ForEach(FilterProductsListViewModel.allCases, id \.rawValue)
        //            { viewModel in
        //                VStack {
        //                    Text(viewModel.title)
        //                }
        //            }
        //        }
        VStack{
            HStack {
                ForEach(FilterProductsListViewModel.allCases, id: \.rawValue)
                { viewModel in
                    VStack {
                        
                        Text(viewModel.title)
                            .font(.subheadline)
                            .fontWeight(selectionOption == viewModel ? .semibold : .regular)
                            .foregroundColor(selectionOption == viewModel ? .black : .gray)
                        
                        if selectionOption == viewModel {
                            Capsule().foregroundColor(Color(.systemBlue))
                                .frame(height:3)
                                .matchedGeometryEffect(id: "filter", in: animation)
                        }
                        else {
                            Capsule().foregroundColor(Color(.clear))
                                .frame(height:3)
                        }
                    }
                    .padding(.top)
                    .padding(.top)
                
                    .onTapGesture {
                        withAnimation(.easeInOut) {
                            self.selectionOption = viewModel
                        }
                    }
                }
            }.padding(.vertical)
            NavigationView {
                
                ScrollView{
                    ProductList(products: productsViewModel.products)
                    
                }.navigationViewStyle(.stack)
                //        NavigationView {
                //            List(Product.all) { product in
                //                Text(product.name)
                //                    .navigationTitle("My Products")
                //            }
                //        }
                
            }
            //        NavigationView {
            //            ZStack {
            //                Color(#colorLiteral(red: 0.937254902, green: 0.937254902, blue: 0.937254902, alpha: 1))
            //                    .ignoresSafeArea()
            //
            //                ScrollView (showsIndicators: false) {
            //                    VStack (alignment: .leading) {
            //
            //
            //                        Text("Products")
            //                            .font(.system(size: 30, weight: .medium, design: .default))
            //                            .padding(.horizontal)
            //
            ////                        NavigationView {
            ////                             VStack {
            ////                                 List(listItems) { listItem in
            ////                                     NavigationLink(destination: AddDetailView(existingItem: listItem)) {
            ////                                         Text(listItem.name)
            ////                                     }
            ////                                 }
            ////                                 .navigationBarTitle(Text("Configure List Items"), displayMode: .inline)
            ////                                 .navigationBarItems(trailing: Button(action: {
            ////                                      // button activates link
            ////                                       self.addMode = true
            ////                                     } ) {
            ////                                     Image(systemName: "plus")
            ////                                         .resizable()
            ////                                         .padding(6)
            ////                                         .frame(width: 24, height: 24)
            ////                                         .background(Color.blue)
            ////                                         .clipShape(Circle())
            ////                                         .foregroundColor(.white)
            ////                                 } )
            ////
            ////                                 // invisible link inside NavigationView for add mode
            ////                                 NavigationLink(destination: AddDetailView(existingItem: nil),
            ////                                     isActive: $addMode) { EmptyView() }
            ////                             }
            ////                         }
            //
            //                        ScrollView (.horizontal, showsIndicators: false) {
            //                            HStack {
            //                                ForEach(0 ..< categories2.count) { i in
            //                                    Button(action: {selectedIndex = i}) {
            //                                        //
            //                                        CategoryViewProducts(isActive: selectedIndex == i, text: categories2[i])
            //                                    }
            //                                }
            //                            }
            //                            .padding()
            //                        }
            //
            //                        //
            //                        ScrollView (.vertical, showsIndicators: true){
            //                            LazyVGrid(columns: gridItemLayout, spacing: 20) {
            //                                ForEach(0..<9) { item in
            //                                    ForEach(0 ..< 2) { i in
            //                                        Image(systemName: "lamp.desk")
            //
            //                                            .frame(width: 300, height: 160)
            //                                            .foregroundColor(.yellow)
            //                                            .cornerRadius(10)
            //
            //
            //
            //                                    }
            //                                }
            //                            }
            //
            //
            //                        }
            //                    }
            //
            //                }
            //            }
            //        }
            //    }
            //
            //    struct ProductsView_Previews: PreviewProvider {
            //        static var previews: some View {
            //            ProductsView()
            //        }
            //    }
            //
            //    struct CategoryViewProducts: View {
            //        let isActive: Bool
            //        let text: String
            //        var body: some View {
            //            VStack (alignment: .leading, spacing: 0) {
            //                Text(text)
            //                    .font(.system(size: 18))
            //                    .fontWeight(.medium)
            //                    .foregroundColor(isActive ? Color("Brown") : Color.black.opacity(0.5))
            //                if (isActive) { Color("Brown")
            //                        .frame(width: 15, height: 2)
            //                        .clipShape(Capsule())
            //                }
            //            }
            //            .padding(.trailing)
            //        }
            //    }
            //
            //    struct ProductCardViewProducts: View {
            //        let image: Image
            //        let size: CGFloat
            //
            //        var body: some View {
            //            VStack {
            //                image
            //                    .resizable()
            //                    .frame(width: size, height: 200 * (size/210))
            //                    .cornerRadius(20.0)
            //                Text("Chair").font(.title3).fontWeight(.bold)
            //
            //                HStack (spacing: 9) {
            //                    ForEach(0 ..< 5) { item in
            //                        Image(systemName: "star.fill")
            //                            .foregroundColor(.yellow)
            //                            .frame(width: 6, height: 6)
            //                    }
            //                    Spacer()
            //                    Text("$1000")
            //                        .font(.title3)
            //                        .fontWeight(.light)
            //                }
            //            }
            //            .frame(width: size)
            //            .padding()
            //            .background(Color.white)
            //            .cornerRadius(20.0)
            //
            //        }
            //    }
            
            //            SidebarView().frame(width:300)
            //        }.toolbar {
            //            ToolbarItem(placement: .navigationBarLeading)
            //            {Button{
            //                showSidebar.toggle()
            //            }
            //            label: {
            //                Circle()
            //                    .frame(width: 32, height: 32)
            //            }
            //            }
            //        }
        }.toolbar {
            ToolbarItem(placement: .navigationBarTrailing)
            {
                NavigationLink(
                    destination:AddProductView(),
                    label: {
                        Image(systemName: "plus")
                            .frame(width: 32, height: 32)
                    })
                AddProductView()
                }
            }
          
        
        .onAppear{ self.productsViewModel.getAllProducts()}
        .background(Color.white)
        
        .padding(.top,40)
    }}
struct ProductsView_Previews: PreviewProvider {
    static var previews: some View {
        ProductsView().environmentObject(ProductsViewModel())
    }
}

//{
//    let allProducts = database.child("user")
//        .child("qdmvwiGBElSnXrmSAgX8ezMRsQ93")
//        .child("scannedObjects")
//        .child("productsId")
//        .observe(.value,
//                 with:
//                    { [self]
//            (
//                snapshot
//            )
//            in
//
//        for child in snapshot.children {
//            if let childSnapshot = child as? DataSnapshot,
//               let dict = childSnapshot.value as? [String:Any],
//               let name = dict["name"] as? String,
//               let description = dict["description"] as? String,
//               let info = dict["info"] as? String
//                {
//                var p = Product(name: name, description: description, info: info)
//                self.products.append(p)
//
//                Swift.print("-------name in dao: " + p.name )
//                Swift.print("-------name in dao: ", products[0].name )
//                Swift.print("-----first ", [products] )
//                self.products = products
//            }
//            Swift.print("-------second ", [products])
//
//            }
//            Swift.print("-------third ", [products])
//
//
//        })
//
//    print("below the stuff : ", [products] )
////        ProductRepository.shared.getAllProducts()
////        print("--this is in viewmodel: ", ProductDAO.shared.products.count)
//
//
 




























///--------------------------/import SwiftUI
//import Firebase
//import FirebaseDatabase
//
//struct ProductsView: View {
//
//    @State private var selectedIndex: Int = 1
//    @StateObject var loginData: LoginPageModel = LoginPageModel()
//    @State private var addMode = false
//    @EnvironmentObject var productsViewModel: ProductsViewModel
////    var viewModel = ReadProductsViewModel()
//
//    private var gridItemLayout = [GridItem(.flexible()), GridItem(.flexible())]
//
//    var cardDetailed = [CardDetailed()];
//    private let categories2 = ["Your products", "Favorites"]
////    func observePosts() {
////        let postsRef = Database.database().reference().child("Product")
////
////        postsRef.observe(.value, with: { snapshot in
////            for child in snapshot.children {
////                if let childSnapshot = child as? DataSnapshot,
////                   let id = dict["id"'] as? String,
////                   let dict = childSnapshot as? [String:Any],
////                   let name = dict["name"] as? String,
////                   let description = dict["description"] as? String,
////                   let info = dict ["info"] as? String {
////                    let user = User(id: id, email: <#T##String#>)
////                }
////            }
////        }<#T##(DataSnapshot) -> Void#>)
////    }
//
//    var body: some View {
//        NavigationView {
//            ScrollView{
//                ProductList()
//
//            }.navigationViewStyle(.stack)
//            //        NavigationView {
//            //            List(Product.all) { product in
//            //                Text(product.name)
//            //                    .navigationTitle("My Products")
//            //            }
//            //        }
//
//        }
//        //        NavigationView {
//        //            ZStack {
//        //                Color(#colorLiteral(red: 0.937254902, green: 0.937254902, blue: 0.937254902, alpha: 1))
//        //                    .ignoresSafeArea()
//        //
//        //                ScrollView (showsIndicators: false) {
//        //                    VStack (alignment: .leading) {
//        //
//        //
//        //                        Text("Products")
//        //                            .font(.system(size: 30, weight: .medium, design: .default))
//        //                            .padding(.horizontal)
//        //
//        ////                        NavigationView {
//        ////                             VStack {
//        ////                                 List(listItems) { listItem in
//        ////                                     NavigationLink(destination: AddDetailView(existingItem: listItem)) {
//        ////                                         Text(listItem.name)
//        ////                                     }
//        ////                                 }
//        ////                                 .navigationBarTitle(Text("Configure List Items"), displayMode: .inline)
//        ////                                 .navigationBarItems(trailing: Button(action: {
//        ////                                      // button activates link
//        ////                                       self.addMode = true
//        ////                                     } ) {
//        ////                                     Image(systemName: "plus")
//        ////                                         .resizable()
//        ////                                         .padding(6)
//        ////                                         .frame(width: 24, height: 24)
//        ////                                         .background(Color.blue)
//        ////                                         .clipShape(Circle())
//        ////                                         .foregroundColor(.white)
//        ////                                 } )
//        ////
//        ////                                 // invisible link inside NavigationView for add mode
//        ////                                 NavigationLink(destination: AddDetailView(existingItem: nil),
//        ////                                     isActive: $addMode) { EmptyView() }
//        ////                             }
//        ////                         }
//        //
//        //                        ScrollView (.horizontal, showsIndicators: false) {
//        //                            HStack {
//        //                                ForEach(0 ..< categories2.count) { i in
//        //                                    Button(action: {selectedIndex = i}) {
//        //                                        //
//        //                                        CategoryViewProducts(isActive: selectedIndex == i, text: categories2[i])
//        //                                    }
//        //                                }
//        //                            }
//        //                            .padding()
//        //                        }
//        //
//        //                        //
//        //                        ScrollView (.vertical, showsIndicators: true){
//        //                            LazyVGrid(columns: gridItemLayout, spacing: 20) {
//        //                                ForEach(0..<9) { item in
//        //                                    ForEach(0 ..< 2) { i in
//        //                                        Image(systemName: "lamp.desk")
//        //
//        //                                            .frame(width: 300, height: 160)
//        //                                            .foregroundColor(.yellow)
//        //                                            .cornerRadius(10)
//        //
//        //
//        //
//        //                                    }
//        //                                }
//        //                            }
//        //
//        //
//        //                        }
//        //                    }
//        //
//        //                }
//        //            }
//        //        }
//        //    }
//        //
//        //    struct ProductsView_Previews: PreviewProvider {
//        //        static var previews: some View {
//        //            ProductsView()
//        //        }
//        //    }
//        //
//        //    struct CategoryViewProducts: View {
//        //        let isActive: Bool
//        //        let text: String
//        //        var body: some View {
//        //            VStack (alignment: .leading, spacing: 0) {
//        //                Text(text)
//        //                    .font(.system(size: 18))
//        //                    .fontWeight(.medium)
//        //                    .foregroundColor(isActive ? Color("Brown") : Color.black.opacity(0.5))
//        //                if (isActive) { Color("Brown")
//        //                        .frame(width: 15, height: 2)
//        //                        .clipShape(Capsule())
//        //                }
//        //            }
//        //            .padding(.trailing)
//        //        }
//        //    }
//        //
//        //    struct ProductCardViewProducts: View {
//        //        let image: Image
//        //        let size: CGFloat
//        //
//        //        var body: some View {
//        //            VStack {
//        //                image
//        //                    .resizable()
//        //                    .frame(width: size, height: 200 * (size/210))
//        //                    .cornerRadius(20.0)
//        //                Text("Chair").font(.title3).fontWeight(.bold)
//        //
//        //                HStack (spacing: 9) {
//        //                    ForEach(0 ..< 5) { item in
//        //                        Image(systemName: "star.fill")
//        //                            .foregroundColor(.yellow)
//        //                            .frame(width: 6, height: 6)
//        //                    }
//        //                    Spacer()
//        //                    Text("$1000")
//        //                        .font(.title3)
//        //                        .fontWeight(.light)
//        //                }
//        //            }
//        //            .frame(width: size)
//        //            .padding()
//        //            .background(Color.white)
//        //            .cornerRadius(20.0)
//        //
//        //        }
//        //    }
//    }
//}
//struct ProductsView_Previews: PreviewProvider {
//    static var previews: some View{
//        ProductsView()
//            .environmentObject(ProductsViewModel())
//    }
//}
