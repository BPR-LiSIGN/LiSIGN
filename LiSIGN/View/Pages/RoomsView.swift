//
//  RoomsView.swift
//  LiSIGN
//

import SwiftUI

struct RoomsView: View {
    
    @State var searchText = ""
    @State var searching = false
    // @State var showSidebar: Bool = false
    
    // let sidebar = Sidebar(showSidebar: $showSidebar)
    
    let myFruits = [
        "Apple 🍏", "Banana 🍌", "Blueberry 🫐", "Strawberry 🍓", "Avocado 🥑", "Cherries 🍒", "Mango 🥭", "Watermelon 🍉", "Grapes 🍇", "Lemon 🍋"
    ]
    
    var body: some View{
        // Text("RoomsView")
        
        NavigationView {
            VStack(alignment: .leading){
                HStack {
                    SearchBar(searchText: $searchText, searching: $searching)
                    Button("+") {
                        /**
                         right-click on the play button in the preview canvas and choose “Debug Preview”. With that small change made you’ll find your print() calls work as normal.
                         */
                        // Add here connection to the CameraView or the ViewModel
                    }
                    .cornerRadius(20)
                    .buttonStyle(.borderedProminent)
                    .tint(Color.accentColor)
                    .padding(10)
                }
                // Color.red
                List{
                    ForEach(myFruits.filter({ (fruit: String) -> Bool in
                        return fruit.hasPrefix(searchText) || searchText == ""
                    }), id: \.self) { fruit in
//                        // Text(fruit)
                        ProductCard(image: "3d_sofa", title: fruit, type: "room", price: 11.99)

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
                //.navigationTitle("Fruits")
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
