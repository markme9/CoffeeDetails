//
//  ImagePicker.swift
//  ImagePicker7
//
//  Created by mark me on 12/7/22.
//

import SwiftUI
import PhotosUI

struct UserValues: View {
    
    @State var selectedItem: PhotosPickerItem? = nil
    @State var selectedImageData: Data?
    @State var discrip: String = ""
    
    @Environment (\.presentationMode) var presentationMode
    
    @State var name: String = ""
    @State var ingredient: String = ""
    @State var price: Int = 0
    
    var pro: (Product) -> ()
    
    var body: some View {
        VStack(alignment: .leading) {
            Form {
                PhotosPicker(
                    selection: $selectedItem,
                    matching: .images,
                    photoLibrary: .shared()) {
                        
                        if let selectedImageData, let image = UIImage(data: selectedImageData) {
                            
                            Image(uiImage: image)
                                .resizable()
                                .scaledToFit()
                                .cornerRadius(15)
                                
                            
                        } else {
                            Image(systemName: "photo")
                                .resizable()
                                .scaledToFit()
                                .foregroundColor(Color.pink)
                                .frame(width: 70, height: 70)
                                .cornerRadius(15)
                                
                            
                        }
                        
                        
                    }
                    .onChange(of: selectedItem) { newItem in
                        Task {
                            if let data = try? await newItem?.loadTransferable(type: Data.self) {
                                selectedImageData = data
                                
                            }
                        }
                        
                    }
                
                
                TextField("Name", text: $name)
                
                
                TextField("Price", value: $price, formatter: NumberFormatter())
                
                TextField("Ingredient", text: $ingredient, axis: .vertical)
                
                Button {
                    
                    if let selectedImageData, let image = UIImage(data: selectedImageData) {
                        
                        self.pro(.init(name: name, image: image, price: price, ingredient: ingredient))
                        
                    }
                    presentationMode.wrappedValue.dismiss()
                    
                } label: {
                    Text("Submit")
                        .font(.title2.bold())
                    
                }
                
            }
            .navigationTitle(Text("User Details"))
            
        }
        
    }
}

struct UserValues_Previews: PreviewProvider {
    static var previews: some View {
        UserValues(pro: {_ in})
            .environmentObject(KartManager())
    }
}
