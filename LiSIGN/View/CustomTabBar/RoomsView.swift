//
//  RoomsView.swift
//  LiSIGN
//

import SwiftUI

struct RoomsView: View {
    
    @State var searchText = ""
    @State var searching = false
    
    let myFruits = [
        "Apple 🍏", "Banana 🍌", "Blueberry 🫐", "Strawberry 🍓", "Avocado 🥑", "Cherries 🍒", "Mango 🥭", "Watermelon 🍉", "Grapes 🍇", "Lemon 🍋"
    ]
    
    var body: some View{
        // Text("RoomsView")
        
        NavigationView {
            VStack(alignment: .leading){
                SearchBar(searchText: $searchText, searching: $searching)
                // Color.red
                List{
                    ForEach(myFruits.filter({ (fruit: String) -> Bool in
                        return fruit.hasPrefix(searchText) || searchText == ""
                    }), id: \.self) { fruit in
                        Text(fruit)
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

struct SearchBar: View {
    @Binding var searchText: String
    @Binding var searching: Bool
    
    var body: some View{
        ZStack{
            Rectangle()
                .foregroundColor(.gray)
            HStack{
                Image(systemName: "magnifyingglass")
                TextField("Search...", text: $searchText) { startedEditing in
                    if startedEditing  {
                        withAnimation{
                            searching = true
                        }
                    }
                    
                } onCommit: {
                    withAnimation{
                        searching = false
                        UIApplication.shared.dismissKeyboard()
                    }
                }
            }
            .foregroundColor(.white)
            .padding(.leading, 13)
        }
        .frame(height: 40)
        .cornerRadius(13)
        .padding()
    }
}

// This next extension should be in the file ContentView.swift ?? not sure about if it's necessary
extension UIApplication {
    func dismissKeyboard() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
