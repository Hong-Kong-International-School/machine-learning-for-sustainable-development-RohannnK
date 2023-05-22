//
//  ContentView.swift
//  PlantDiseaseClassifier
//
//  Created by Rohan Kaman on 21/5/2023.
//
import SwiftUI
import Vision
import CoreML

struct ContentView: View {
    @State private var image: UIImage?
    @State private var showCamera = false
    @State private var classificationResult: VNClassificationObservation?
    
    var body: some View {
        VStack {
            if let image = image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                
                if classificationResult == nil {
                    Text("Classifying...")
                        .font(.headline)
                } else {
                    ClassificationResultView(result: classificationResult!)
                }
            } else {
                Text("Take a photo to classify it")
                    .font(.headline)
            }
            
            Button(action: {
                showCamera = true
            }) {
                Text("Take Photo")
                    .font(.title)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
        }
        .sheet(isPresented: $showCamera) {
            CameraView(image: $image) { takenImage in
                classifyImage(takenImage)
            }
        }
    }
    
    func classifyImage(_ image: UIImage) {
        guard let ciImage = CIImage(image: image) else { return }

        // Resize the image to match the expected input size of the model
        let modelSize = CGSize(width: 224, height: 224)
        guard let resizedImage = ciImage.resize(to: modelSize) else { return }

        // Convert the resized image to a CVPixelBuffer
        guard let pixelBuffer = resizedImage.toPixelBuffer() else { return }

        // Load the Core ML model
        guard let modelURL = Bundle.main.url(forResource: "plantmodel", withExtension: "mlpackage") else {
            print("Failed to find the plantmodel.mlpackage file.")
            return
        }

        do {
            let model = try VNCoreMLModel(for: MLModel(contentsOf: modelURL))

            // Create a Vision request with the model
            let request = VNCoreMLRequest(model: model) { request, error in
                guard let results = request.results as? [VNClassificationObservation], let firstResult = results.first else {
                    print("Failed to perform classification.")
                    return
                }

                DispatchQueue.main.async {
                    self.classificationResult = firstResult
                }
            }

            // Perform the request
            DispatchQueue.global().async {
                do {
                    try VNImageRequestHandler(cvPixelBuffer: pixelBuffer, options: [:]).perform([request])
                } catch {
                    print("Error performing classification request: \(error)")
                }
            }
        } catch {
            print("Failed to load the plantmodel: \(error)")
        }
    }

}

// Helper extensions for image resizing and conversion to CVPixelBuffer
extension CIImage {
    func resize(to size: CGSize) -> CIImage? {
        let scaleX = size.width / self.extent.size.width
        let scaleY = size.height / self.extent.size.height
        return self.transformed(by: CGAffineTransform(scaleX: scaleX, y: scaleY))
    }
    
    func toPixelBuffer() -> CVPixelBuffer? {
        var pixelBuffer: CVPixelBuffer?
        let attributes: [String: Any] = [
            kCVPixelBufferCGImageCompatibilityKey as String: kCFBooleanTrue!,
            kCVPixelBufferCGBitmapContextCompatibilityKey as String: kCFBooleanTrue!,
            kCVPixelBufferMetalCompatibilityKey as String: kCFBooleanTrue!,
            kCVPixelBufferIOSurfacePropertiesKey as String: [:]
        ]
        
        let width = Int(self.extent.size.width)
        let height = Int(self.extent.size.height)
        
        CVPixelBufferCreate(kCFAllocatorDefault, width, height, kCVPixelFormatType_32BGRA, attributes as CFDictionary, &pixelBuffer)
        
        if let pixelBuffer = pixelBuffer {
            let ciContext = CIContext()
            ciContext.render(self, to: pixelBuffer)
        }
        
        return pixelBuffer
    }
}
