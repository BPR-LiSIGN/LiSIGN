//
//  AddRoomView.swift
//  LiSIGN
//

import SwiftUI
import Firebase
import FirebaseDatabase
import FirebaseAuth

struct AddRoomView: View {
    @State private var title: String = ""
    @State private var description: String = ""
    @State private var info: String = ""
    @State private var navigateToRoom =  false
    @EnvironmentObject var productsViewModel: ProductsViewModel
//    var viewModel = ReadProductsViewModel()
    

    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        
        NavigationView {
            Form {
                Section(header: Text("Title"))
                {
                    TextField("Room title", text: $title)
                }
                
                Section(header: Text("Description"))
                {
                    TextEditor(text: $description)
                }
                
//                Section(header: Text("Info"))
//                {
//                    TextEditor(text: $info)
//                }
            }
            .toolbar(content: {
               
                ToolbarItem{
                    NavigationLink(isActive: $navigateToRoom)
                    {
                        storyboardview()
                    }
                label: {
                    
                    Button {
                        saveRoom()
                        
//                        viewModel.observeProducts()
                        navigateToRoom = true
                    }
                label: {
                    Label("Done", systemImage: "checkmark")
                        .labelStyle(.iconOnly)
                }
                .disabled(title.isEmpty)
                    
                }}
            })
            .navigationTitle("New Room")
                .navigationBarTitleDisplayMode(.inline)
        }
        .navigationViewStyle(.stack)
        
        }
    }

extension AddRoomView {
    private func saveRoom() {
        let now = Date()
        let dateFormat = DateFormatter()
        dateFormat.dateFormat = "yyyy-MM-dd"
        
        let datePublished = dateFormat.string(from: now)
        print(datePublished)
        
        let room = Room(title: title, description: description)
//        ProductRepository.shared.addProduct(id: product.id, name: product.name, description: product.description, info: product.info, datePublished: datePublished)
//        print("----------id and name:  ", product.id, product.name, product.description, product.info, product.datePublished)
//        ProductRepository.shared.addProductToList(id: product.id, name: product.name, description: product.description, info: product.info, datePublished: datePublished)
        RoomRepository.shared.addRoom(_roomId: room.id, _roomObject: room)
    }
}

// For displaying the Storyboard for scanning rooms
struct storyboardview: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> some UIViewController {
        let storyboard = UIStoryboard(name: "ScanRoomView", bundle: Bundle.main)
        let controller = storyboard.instantiateViewController(identifier: "ScanRoomView")
        
        return controller
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        // This remains empty
    }
}


struct AddRoomView_Previews: PreviewProvider {
    static var previews: some View {
        AddProductView().environmentObject(ProductsViewModel())
    }
}
