//
//  AddProductView.swift
//  LiSIGN
//
//  Created by Lenka Orinčáková on 11/6/22.
//

import SwiftUI

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
                ToolbarItem(placement: .navigationBarLeading){
                    Button {
                        dismiss()
                    }
                label: {
                    Label("Cancel", systemImage: "xmark")
                        .labelStyle(.iconOnly)
                    
                }
                }
                ToolbarItem{
                    NavigationLink(isActive: $navigateToProduct)
                    {
                        ProductDetailCard(product: productsViewModel.products.sorted {$0.datePublished > $1.datePublished}[0])
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
        let product = Product(name: name, image: "", description: description, info: info, datePublished: datePublished)
        productsViewModel.addProduct(product: product)
    }
}


