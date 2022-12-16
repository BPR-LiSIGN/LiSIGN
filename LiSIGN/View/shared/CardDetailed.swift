//
//  CardDetailed.swift
//  LiSIGN
//

import Foundation
import SwiftUI
import SceneKit

struct CardDetailed: View {
    var product: Product

    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var body: some View {
        ZStack {
            Color("Bg")
            ScrollView  {
                VStack{
                    //            Product Image
                    VStack{
                        
                        SceneView(scene: SCNScene(named: "\(product.name).usdz"), options: [.autoenablesDefaultLighting, .allowsCameraControl])
                    }.frame(width: 350, height: 350)
                    
                
                    
                    DescriptionView(product: product)
                    
                }
               
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: BackButton(action: {presentationMode.wrappedValue.dismiss()}), trailing: Image("threeDot"))
    }
}


struct RoundedCorner: Shape {

    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
}

struct DetailScreen_Previews: PreviewProvider {
    static var previews: some View {
        CardDetailed(product: Product(name: "test name", description: "test desc", info: "test info")).environmentObject(ProductsViewModel())
    }
}


struct DescriptionView: View {
    var product: Product

    var body: some View {
        VStack (alignment: .leading) {
            HStack{
                //                Title
                Text(product.name)
                    .font(.title)
                    .fontWeight(.bold)
                Spacer()
                
                Text("$1299")
                    .font(.title)
                    .foregroundColor(.black)
                    .fontWeight(.medium)
                
                
                Button{
                    ProductRepository.shared.addProductToFavorites(id: product.id, name: product.name, description: product.description, info: product.info, datePublished: "09")
                }
            label:{
                Text("Add to Cart")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
                    .padding()
                    .padding(.horizontal, 8)
                    .background(Color.white)
                    .cornerRadius(10.0)
                
                
            }
            }
            //                Rating
         
            Text("Description")
                .fontWeight(.medium)
                .padding(.vertical, 8)

            Text("Luxury Swedian Chair is a contemporary chair based on the virtues of modern craft. it carries on the simplicity and honestly of the archetypical chair.")
                .lineSpacing(8.0)
                .opacity(0.6)
     
            
            //                Colors and Counter
         
        }.padding(.vertical)
                
            }
        }

struct BackButton: View {
    let action: () -> Void
    var body: some View {
        Button(action: action) {
            Image(systemName: "chevron.backward")
                .foregroundColor(.black)
                .padding(.all, 12)
                .background(Color.white)
                .cornerRadius(8.0)
        }
    }
}

