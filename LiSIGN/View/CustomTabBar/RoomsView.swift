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

struct CardModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .cornerRadius(20)
            .shadow(color: Color.black.opacity(0.2), radius: 20, x: 0, y: 0)
    }
}

struct ProductCard: View {
    var image: String
    var title: String
    var type: String
    var price: Double
    
    var body: some View {
        HStack(alignment: .center) {
            Image(image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100)
                .padding(.all, 20)
            
            VStack(alignment: .leading) {
                Text(title)
                    .font(.system(size: 26, weight: .bold, design: .default))
                    .foregroundColor(.white)
                Text(type)
                    .font(.system(size: 16, weight: .bold, design: .default))
                    .foregroundColor(.gray)
                HStack {
                    Text("$" + String.init(format: "%0.2f", price))
                        .font(.system(size: 16, weight: .bold, design: .default))
                        .foregroundColor(.white)
                        .padding(.top, 8)
                }
            }.padding(.trailing, 20)
            Spacer()
        }
        .frame(maxWidth: .infinity, alignment: .center)
        .background(Color(red: 32/255, green: 36/255, blue: 38/255))
        .modifier(CardModifier())
        .padding(.all, 10)
    }
}

// This next extension should be in the file ContentView.swift ?? not sure about if it's necessary
extension UIApplication {
    func dismissKeyboard() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
