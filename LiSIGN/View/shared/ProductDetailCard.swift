//
//  ProductDetailCard.swift
//  LiSIGN
//

import SwiftUI
import Firebase
import FirebaseDatabase
import SceneKit



struct ProductDetailCard: View {
    var product: Product
    
    @State var _name: String = ""
    @State var _description: String = ""
    @State var _info : String = ""
    var vm = ProductsViewModel()
    
    var body: some View {
        ScrollView{
     
        placeholder: do {
                Image(systemName: "lamp.desk")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100, alignment: .center)
                .foregroundColor(.white.opacity(0.7))
                .frame(maxWidth: .infinity, maxHeight: .infinity)
               
            
        }
            
            VStack(spacing:30)
            {
                VStack{

                    SceneView(scene: SCNScene(named: "\(product.name).usdz"), options: [.autoenablesDefaultLighting, .allowsCameraControl])
            }.frame(width: 400, height: 400)
                    
                Text(product.name)
                    .font(.largeTitle)
                    .bold()
                    .multilineTextAlignment(.center)
                
                VStack(alignment: .leading, spacing: 30)
                {
                    Text(product.description)
                    
                    VStack(alignment: .leading, spacing:20)
                    {
                        Text("Info")
                            .font(.headline)
                        Text(product.info)
                        
                    }
                    NavigationLink("Scan Object") {
                        storyboardview()
                        }
                 
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
            }
            .padding(.horizontal)
        }
        .ignoresSafeArea(.container, edges: .top)
        
    }
}
struct ProductDetailCard_Previews: PreviewProvider{
    static var previews: some View {
        
        ProductDetailCard(product: Product(name: "test name", description: "test desc", info: "test info"))
    }
}
struct storyboardview2: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> some UIViewController {
        let storyboard = UIStoryboard(name: "ScanRoomView", bundle: Bundle.main)
        let controller = storyboard.instantiateViewController(identifier: "ScanObjectView")

        return controller
    }

    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        // This remains empty
    }
}
