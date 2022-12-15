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

    
    var allRooms: [Room] = RoomRepository.shared.getAllRooms()
    
    var mockRooms: [Room] = [
        Room(title: "Bedroom", description: "This is my bedroom. It has enough space for a king size bed. Besides that it also has a lot of storage space and wardrobes."),
        Room(title: "Kitchen", description: "Big kitchen. It's just a regular danish kitchen. The layout is open, like an american house, and there is space for having breakfast all together here."),
        Room(title: "Living room", description: "shared living room with my danish roomie. Nice space for being a big group. You can play board games, and there's even a pool table!"),
        Room(title: "Bathroom", description: "Where the magic happens. All the battles took place here. Some losses, but overall, the team gave its all"),
        Room(title: "Master bedroom", description: "This is the biggest bedroom of the house. It has a nice balcony with a view to the pool outside."),
        Room(title: "Garage", description: "It fits 2 regular cars, and some more space for random things that you don't know where to store. like biclycles and stuff like that.")
    ]
    let columns = [
           GridItem(.flexible())
       ]
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading){
                HStack {
                    SearchBar(searchText: $searchText, searching: $searching)
                    NavigationLink("Add Room") {
                        AddRoomView()
                    }.padding()
                }
                ScrollView {
                    LazyVGrid(columns: [GridItem(.adaptive(minimum: 250), spacing: 15)],spacing: 15){
                        ForEach(mockRooms, id: \.id) { mockRoom in
                            NavigationLink(destination: RoomDetailed(room: mockRoom)) {
                                ProductCard(image: "3d_scanned_room", title: mockRoom.title, type: "Room in my apartment", price: 100.000)
                            }.padding(.top) .padding(.bottom)
                        }

                    }.padding(.horizontal)
                }
            
            }
            
            .navigationTitle(searching ? "Searching": "Rooms")
            
            
        }.onAppear{
            ProductRepository.shared.getAllProducts()
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
