//
//  CloseButton.swift
//  ImmersiveModal
//
//  Created by Zelyna Sillas on 9/8/23.
//

import SwiftUI

struct CloseButton: View {
    var body: some View {
        Image(systemName: "xmark")
            .font(.system(size: 15, weight: .bold))
            .foregroundColor(.secondary)
            .padding(6)
            .background(.ultraThinMaterial, in: Circle())
    }
}

#Preview {
    CloseButton()
}

