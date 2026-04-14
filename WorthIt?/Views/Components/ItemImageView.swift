//
//  ItemImageView.swift
//  WorthIt?
//
//  Created by hilda on 13/04/2026.
//

import SwiftUI
import PhotosUI

struct ItemImageView: View {
    @Binding var imageData: Data?
    var initial: String
    var color: Color
    var size: CGFloat = 90
    
    // State untuk PhotosPicker
    @State private var selectedPhoto: PhotosPickerItem? = nil
    
    var body: some View {
        PhotosPicker(selection: $selectedPhoto, matching: .images) {
            ZStack(alignment: .bottomTrailing) {
                
                // Tampilkan foto atau placeholder
                if let data = imageData, let uiImage = UIImage(data: data) {
                    Image(uiImage: uiImage)
                        .resizable()
                        .scaledToFill()
                        .frame(width: size, height: size)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                } else {
                    InitialPlaceholderView(
                        initial: initial,
                        color: color,
                        size: size
                    )
                }
                
                // Icon kamera kecil di sudut
                Image(systemName: "camera.fill")
                    .font(.caption2)
                    .foregroundStyle(.white)
                    .padding(5)
                    .background(Color.blue)
                    .clipShape(Circle())
                    .offset(x: 4, y: 4)
            }
        }
        // Saat user pilih foto, konversi ke Data
        .onChange(of: selectedPhoto) { _, newItem in
            Task {
                if let data = try? await newItem?.loadTransferable(type: Data.self) {
                    imageData = data
                }
            }
        }
    }
}

#Preview {
    @Previewable @State var imageData: Data? = nil
    
    ItemImageView(
        imageData: $imageData,
        initial: "i",
        color: .blue
    )
    .padding()
}
