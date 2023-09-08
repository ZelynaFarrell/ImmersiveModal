//
//  ModalView.swift
//  ImmersiveModal
//
//  Created by Zelyna Sillas on 9/8/23.
//

import SwiftUI

struct ModalView: View {
    @EnvironmentObject var vm: ContentViewModel
    @Environment(\.dismiss) var dismiss
    @State var viewState = CGSize.zero
    
    var drag: some Gesture {
        DragGesture()
            .onChanged { value in
                viewState = value.translation
            }
            .onEnded { value in
                if value.translation.height > 300 {
                    vm.dismissModal()
                } else {
                    withAnimation(.spring(response: 0.5, dampingFraction: 0.6)) {
                        viewState = .zero
                    }
                }
            }
    }
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(.ultraThinMaterial)
                .opacity(vm.appear ? 1 : 0)
                .ignoresSafeArea()
            
            GeometryReader { proxy in
                Group {
                    switch vm.selectedModal {
                    case .resume:
                        ResumeView()
                    case .coverLetter:
                       CoverLetterView()
                    case .coverLetterPartTwo:
                        CoverLetterPartTwo()
                    case .coverLetterPartThree:
                        CoverLetterPartThree()
                    }
                }
                .rotationEffect(.degrees(viewState.width / 40))
                .rotation3DEffect(.degrees(viewState.height / 20), axis: (x: 1, y: 0, z: 0), perspective: 1)
                .shadow(color: Color(.shadow).opacity(0.2), radius: 30, x: 0, y: 30)
                .padding(.horizontal, 10)
                .offset(x: viewState.width, y: viewState.height)
                .gesture(drag)
                .frame(maxHeight: .infinity, alignment: .center)
                .offset(y: vm.appear ? 0 : proxy.size.height)
                .background(
                    Image(.blob)
                        .offset(x: 170, y: -90)
                        .opacity(vm.appearBackground ? 1 : 0)
                        .offset(y: vm.appearBackground ? -10 : 0)
                        .blur(radius: vm.appearBackground ? 0 : 40)
                        .hueRotation(.degrees(viewState.width / 5))
                )
                .background(
                    Image(.spline)
                        .blur(radius: 30)
                        .offset(x: 100, y: 100)
                        .hueRotation(.degrees(viewState.width / 2))
                )
                .animation(.easeInOut(duration: 0.4), value: vm.selectedModal)
            }
            
            Button {
                vm.dismissModal()
            } label: {
                CloseButton()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
            .padding(.trailing)
            .offset(y: vm.appear ? 20 : -100)
        }
        .onAppear {
            withAnimation(.spring()) {
                vm.appear = true
            }
            withAnimation(.easeOut(duration: 2)) {
                vm.appearBackground = true
            }
        }
    }
}

#Preview {
    ModalView()
        .environmentObject(ContentViewModel())
}
