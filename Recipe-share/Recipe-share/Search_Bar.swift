import SwiftUI

struct SearchView: View {
    @State private var selectedMeal = "Breakfast"
    @State private var searchText = ""

    let meals = ["Breakfast", "Lunch", "Dinner"]

    var body: some View {
        NavigationView {
            ScrollView { // Wrapping entire content in a ScrollView for scrolling
                VStack(alignment: .leading, spacing: 20) { // Added spacing between sections
                    
                    // Search Bar
                    HStack {
                        TextField("Search", text: $searchText)
                            .padding(.leading, 30)
                            .frame(height: 40)
                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(10)
                            .overlay(
                                HStack {
                                    Image(systemName: "magnifyingglass")
                                        .foregroundColor(.gray)
                                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                                        .padding(.leading, 8)
                                }
                            )
                            .padding(.horizontal)
                    }
                    .padding(.top)
                    
                    // Meal Type Segmented Control
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 5) {
                            ForEach(meals, id: \.self) { meal in
                                Button(action: {
                                    selectedMeal = meal
                                }) {
                                    Text(meal)
                                        .padding(.vertical, 10)
                                        .padding(.horizontal, 20)
                                        .background(selectedMeal == meal ? Color.orange : Color.gray.opacity(0.2))
                                        .foregroundColor(selectedMeal == meal ? .white : .black)
                                        .cornerRadius(20)
                                }
                            }
                        }
                        .padding(.horizontal)
                    }
                    
                    // Popular Recipes Section
                    VStack(alignment: .leading, spacing: 5) {
                        HStack {
                            Text("Popular Recipes")
                                .font(.headline)
                            Spacer()
                            Button("View All") {
                                // Action for View All button
                            }
                            .foregroundColor(.orange)
                        }
                        .padding(.horizontal)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 15) {
                                RecipeCard(imageName: "Image1", title: "Egg & Avocado")
                                RecipeCard(imageName: "Image2", title: "Bowl of Rice")
                                RecipeCard(imageName: "Image3", title: "Chicken Salad")
                            }
                            .padding(.horizontal)
                        }
                    }
                    .padding(.top)
                    
                    // Editor's Choice Section
                    VStack(alignment: .leading, spacing: 25) {
                        HStack {
                            Text("Editor's Choice")
                                .font(.headline)
                            Spacer()
                            Button("View All") {
                                // Action for View All button
                            }
                            .foregroundColor(.orange)
                        }
                        .padding(.horizontal)
                        
                        VStack(spacing: 15) {
                            EditorChoiceCard(imageName: "Image4", title: "Easy homemade beef burger", author: "James Spader")
                            EditorChoiceCard(imageName: "Image5", title: "Blueberry with egg for breakfast", author: "Alice Fala")
                            EditorChoiceCard(imageName: "Image6", title: "Toast with egg for breakfast", author: "Aanes")
                            EditorChoiceCard(imageName: "Image3", title: "Chicken Salad for Lunch", author: "James Smith")
                            EditorChoiceCard(imageName: "Image2", title: "Egg and Avocado for Breakfast", author: "Jhon")
                        }
                        .padding(.horizontal)
                    }
                }
                .padding(.vertical) // Padding for vertical spacing
            }
            .navigationTitle("Search")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

// RecipeCard Component for Popular Recipes
struct RecipeCard: View {
    var imageName: String
    var title: String

    var body: some View {
        VStack {
            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 120, height: 120)
                .cornerRadius(10)
            Text(title)
                .font(.subheadline)
                .foregroundColor(.black)
        }
        .frame(width: 120)
    }
}

// EditorChoiceCard Component for Editor's Choice
struct EditorChoiceCard: View {
    var imageName: String
    var title: String
    var author: String

    var body: some View {
        HStack {
            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 70, height: 70)
                .cornerRadius(10)
            
            VStack(alignment: .leading) {
                Text(title)
                    .font(.headline)
                    .foregroundColor(.black)
                HStack {
                    Image(systemName: "person.crop.circle")
                    Text(author)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
            }
            Spacer()
            Button(action: {
                // Action for next button
            }) {
                Image(systemName: "arrow.right.circle.fill")
                    .foregroundColor(.orange)
                    .font(.system(size: 24))
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 2)
    }
}

// Preview
struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}

