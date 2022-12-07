//
//  AddProductView.swift
//  LiSIGN
//
//  Created by Lenka Orinčáková on 11/6/22.
//

import SwiftUI
import Firebase
import FirebaseDatabase
import FirebaseAuth

struct AddProductView: View {
    @State private var name: String = ""
    @State private var description: String = ""
    @State private var info: String = ""
    @State private var navigateToProduct =  false
    @EnvironmentObject var productsViewModel: ProductsViewModel
//    var viewModel = ReadProductsViewModel()
    

    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        
        NavigationView {
            Form {
                Section(header: Text("Name"))
                {
                    TextField("Product name", text: $name)
                }
                
                Section(header: Text("Description"))
                {
                    TextEditor(text: $description)
                }
                
                Section(header: Text("Info"))
                {
                    TextEditor(text: $info)
                }
            }
            .toolbar(content: {
               
                ToolbarItem{
                    NavigationLink(isActive: $navigateToProduct)
                    {
                        var product = Product(name: name, description: description, info: info)
                        ProductDetailCard(product: product)
                            .navigationBarBackButtonHidden(true)
                    }
                label: {
                    
                    Button {
                        saveProduct()
//                        viewModel.observeProducts()
                        navigateToProduct = true
                    }
                label: {
                    Label("Done", systemImage: "checkmark")
                        .labelStyle(.iconOnly)
                }
                .disabled(name.isEmpty)
                    
                }}
            })
            .navigationTitle("New product")
                .navigationBarTitleDisplayMode(.inline)
        }
        .navigationViewStyle(.stack)
        
        }
    }
struct AddProductView_Previews: PreviewProvider {
    static var previews: some View {
       
            
        AddProductView().environmentObject(ProductsViewModel())
        }
    }
extension AddProductView {
    private func saveProduct() {
        let now = Date()
        let dateFormat = DateFormatter()
        dateFormat.dateFormat = "yyyy-MM-dd"
        
        let datePublished = dateFormat.string(from: now)
        print(datePublished)
//        let product = Product(name: name,  description: description, info: info)
        let product = Product( name: name,  description: description, info: info)
        print("---------- name:  ",  name, description, info)

        ProductRepository.shared.addProduct(id: product.id, name: product.name, description: product.description, info: product.info, datePublished: datePublished)
        print("----------id and name:  ", product.id, product.name, product.description, product.info, product.datePublished)
        ProductRepository.shared.addProductToList(id: product.id, name: product.name, description: product.description, info: product.info, datePublished: datePublished)
    }
}


