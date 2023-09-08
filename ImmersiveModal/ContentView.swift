//
//  ContentView.swift
//  ImmersiveModal
//
//  Created by Zelyna Sillas on 9/8/23.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var vm: ContentViewModel
    
    var body: some View {
        ZStack {
            Color(.background)
            
            if vm.showModal {
                ModalView()
            }
            
            VStack(alignment: .trailing) {
                Spacer()
                    .frame(height: 80)
                
                Button {
                    vm.showModal = true
                } label: {
                    Image(systemName: "doc.on.doc")
                        .font(.system(size: 20, weight: .bold))
                        .frame(width: 36, height: 36)
                        .padding(5)
                        .foregroundColor(.gray)
                        .background(.ultraThinMaterial)
                        .cornerRadius(18)
                }
                .padding(.trailing, 20)
                .offset(y: vm.showModal ? -300 : 0)
                
                
                Spacer()
                HStack {
                    Spacer()
                        .frame(maxWidth: .infinity)
                    
                    Toggle(isOn: $vm.isInDarkMode.animation(.easeInOut)) {
                        Text("Toggle").bold()
                    }
                    .opacity(0.6)
                    .padding(.bottom, 30)
                    .offset(y: vm.showModal ? 100 : 0)
                    
                    Spacer()
                        .frame(maxWidth: .infinity)
                    
                }
            }
            
        }
        .preferredColorScheme(vm.isInDarkMode ? .dark : .light)
        .ignoresSafeArea()
    }
}

#Preview {
    ContentView()
        .environmentObject(ContentViewModel())
}
