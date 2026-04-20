//
//  ErrorView.swift
//  NewsFlow
//
//  Created by Chinkal on 20/04/26.
//

import SwiftUI

struct ErrorView: View {
    let message: String
    let onRetry: () -> Void
    
    var body: some View {
        VStack(spacing: 16) {
            Image(systemName: "exclamationmark.triangle")
                .font(.system(size: 50))
                .foregroundStyle(.orange)
            Text(message)
                .font(.body)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 32)
            
            Button("Try Again", action: onRetry)
            .buttonStyle(.borderedProminent)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    ErrorView(message: "Error", onRetry: {})
}
