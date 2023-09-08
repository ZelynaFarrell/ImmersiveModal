//
//  ContentViewModel.swift
//  ImmersiveModal
//
//  Created by Zelyna Sillas on 9/8/23.
//

import SwiftUI

enum Modal: String {
    case resume
    case coverLetter
    case coverLetterPartTwo
    case coverLetterPartThree
}

class ContentViewModel: ObservableObject {
    @Published var isInDarkMode: Bool = true
    @Published var selectedModal: Modal = .resume
    @Published var showModal = false
    @Published var appear = false
    @Published var appearBackground = false
    @Published var contentAppear = [false, false, false, false, false, false, false]
    
    func dismissModal() {
        withAnimation {
            appear = false
            appearBackground = false
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) { [self] in
            withAnimation(.spring(response: 0.5, dampingFraction: 0.7)) {
                showModal = false
                contentAppear = Array(repeating: false, count: 7)
                selectedModal = .resume
            }
        }
    }
    
    func animateView() {
        withAnimation(.timingCurve(0.2, 0.8, 0.2, 1, duration: 0.8).delay(0.2)) {
            contentAppear[0] = true
        }
        withAnimation(.timingCurve(0.2, 0.8, 0.2, 1, duration: 0.8).delay(0.4)) {
            contentAppear[1] = true
        }
        withAnimation(.timingCurve(0.2, 0.8, 0.2, 1, duration: 0.8).delay(0.6)) {
            contentAppear[2] = true
        }
        withAnimation(.timingCurve(0.2, 0.8, 0.2, 1, duration: 0.8).delay(0.8)) {
            contentAppear[3] = true
        }
        withAnimation(.timingCurve(0.2, 0.8, 0.2, 1, duration: 0.8).delay(1.0)) {
            contentAppear[4] = true
        }
        withAnimation(.timingCurve(0.2, 0.8, 0.2, 1, duration: 0.8).delay(1.2)) {
            contentAppear[5] = true
        }
        withAnimation(.timingCurve(0.2, 0.8, 0.2, 1, duration: 0.8).delay(1.4)) {
            contentAppear[6] = true
        }
    }
}
