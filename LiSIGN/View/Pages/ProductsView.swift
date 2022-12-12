
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
   
    var body: some View {
    
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
            NavigationLink{
//                FavoritesView(productsViewModel: ProductsViewModel())
            }
        label: {
            Text("Favorites").foregroundColor(.gray)
                
            
        }
            NavigationView {
                
                ScrollView{
                    ProductList(products: productsViewModel.products)
                    
                }.navigationViewStyle(.stack)
                
                
            }
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
