//
//  ClassificationView.swift
//  PlantDiseaseClassifier
//
//  Created by Rohan Kaman on 21/5/2023.
//

import SwiftUI
import Vision

struct ClassificationResultView: View {
    let result: VNClassificationObservation
    
    var body: some View {
        VStack {
            Text("Classification Result")
                .font(.headline)
            
            Text("Identifier: \(result.identifier)")
            Text("Confidence: \(result.confidence)")
        }
    }
}


