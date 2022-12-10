//
//  RoomsView.swift
//  LiSIGN
//

import SwiftUI
import SceneKit

struct RoomsView: View {
    
    @State var searchText = ""
    @State var searching = false
    @StateObject var loginData: LoginPageModel = LoginPageModel()

    
    var allRooms = RoomRepository.shared.getAllRooms()
    
    let myFruits = [
        "Apple 🍏", "Banana 🍌", "Blueberry 🫐", "Strawberry 🍓", "Avocado 🥑", "Cherries 🍒", "Mango 🥭", "Watermelon 🍉", "Grapes 🍇", "Lemon 🍋"
    ]
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading){
                HStack {
                    SearchBar(searchText: $searchText, searching: $searching)
//                    NavigationLink (
//                        destination: storyboardview(),
//                        label: {
//                            ProductCard(image: "chair", title: "h", type: "j", price: 2)
//                        }
//                    )
                    NavigationLink("Add Room") {
                        AddRoomView()
                    }.padding()
                }
                
                
//                displaying 3d model
//                VStack{
//                    Text("HEllo")
//
//                    SceneView(scene: SCNScene(named: "scaned-my room-full.obj"), options: [.autoenablesDefaultLighting, .allowsCameraControl])
//                }.frame(width: 400, height: 400)
            
                List{
                    ForEach(myFruits.filter({ (fruit: String) -> Bool in
                        return fruit.hasPrefix(searchText) || searchText == ""
                    }), id: \.self) { fruit in
                        NavigationLink(destination: RoomDetailed()) {
                            ProductCard(image: "3d_sofa", title: fruit, type: "room", price: 11.99)
                        }
                    }
                }
                .listStyle(GroupedListStyle())
                .toolbar{
                    if searching{
                        Button("Cancel") {
                            searchText = ""
                            withAnimation{
                                searching = false
                                UIApplication.shared.dismissKeyboard()
                            }
                        }
                    }
                }
                .gesture(DragGesture()
                    .onChanged({ _ in
                        UIApplication.shared.dismissKeyboard()
                    }))
            }
            
            .navigationTitle(searching ? "Searching": "Rooms")
            
            
        }
    }
}

struct RoomsView_Previews: PreviewProvider {
    static var previews: some View {
        RoomsView()
    }
}


// This next extension should be in the file ContentView.swift ?? not sure about if it's necessary
extension UIApplication {
    func dismissKeyboard() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
