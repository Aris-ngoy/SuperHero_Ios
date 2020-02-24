import SwiftUI

struct ContentView: View {
    let cars = ["Batman", "Superman", "Batwoman", "Spiderman", "Ant-Man", "Black Panther", "Aquaman"]
    @State private var searchText : String = ""

    var body: some View {
        NavigationView{
            VStack(alignment:.center){
//                Text("SUPERHERO")
//                .font(.title)
//                .fontWeight(.black)
//                .foregroundColor(.primary)
//                .lineLimit(3)
                NavigationLink(destination: SearchView()){
                    HStack(alignment:.center){
                        Image(systemName: "magnifyingglass")
                            .resizable()
                            .frame(width: 20, height: 20).accentColor(Color.white)
                        Text("SEARCH HERE").accentColor(Color.white)
                        
                    }.frame(width: 300,height: 45,alignment: .center)
                    .background(Color.purple)
                }
                VStack(alignment:.center){
                    Text("Type your Superhero name")
                    .padding()
                    .font(.headline)
                    .multilineTextAlignment(.center)
                    Image("illustration")
                        .resizable()
                        .frame(width: 200.0, height:150.0, alignment: .center)
                    Text("No superhero found ! \n Type your superhero to continue...")
                    .padding(10)
                    .multilineTextAlignment(.center)
                }
                
            }
        }
    }
}

//VStack {
//    SearchBar(searchText: $searchText)
//    List {
//        ForEach(self.cars.filter {
//            self.searchText.isEmpty ? true : $0.lowercased().contains(self.searchText.lowercased())
//        }, id: \.self) { car in
//            Text(car)
//        }
//    }.navigationBarTitle(Text("SuperHero"))
//}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
