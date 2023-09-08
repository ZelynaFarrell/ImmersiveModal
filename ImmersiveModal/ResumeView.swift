//
//  ResumeView.swift
//  ImmersiveModal
//
//  Created by Zelyna Sillas on 9/8/23.
//

import SwiftUI

struct ResumeView: View {
    @EnvironmentObject var vm: ContentViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Resume")
                .font(.largeTitle).bold()
                .blendMode(.overlay)
                .padding(.bottom)
                .slideFadeIn(show: vm.contentAppear[0], offset: 30)
            
            Text("Snowdays Foundation  |  2015 - 2023")
                .font(.headline)
                .foregroundColor(.primary.opacity(0.8))
                .padding(.bottom, 1)
                .slideFadeIn(show: vm.contentAppear[1], offset: 20)
            VStack(alignment: .leading, spacing: 5) {
                Text("**•** Senior Director of Public Relations")
                Text("**•** Senior Director of Program Development")
                Text("**•** Board Member")
            }
            .font(.subheadline)
            .foregroundColor(.primary.opacity(0.7))
            .padding(.bottom, 10)
            .slideFadeIn(show: vm.contentAppear[1], offset: 15)
            
            
            Text("Nike  |  2018 - 2021")
                .font(.headline)
                .foregroundColor(.primary.opacity(0.8))
                .padding(.bottom, 1)
                .slideFadeIn(show: vm.contentAppear[2], offset: 20)
            VStack(alignment: .leading, spacing: 5) {
                Text("**•** Project Manager and Marketing Strategist")
                Text("**•** Logistics, Communications, and Operations Lead")
                Text("**•** Photo Studio Stylist Lead")
            }
            .font(.subheadline)
            .foregroundColor(.primary.opacity(0.7))
            .padding(.bottom, 10)
            .slideFadeIn(show: vm.contentAppear[2], offset: 15)
            
            
            Text("Anthropologie  |  2017 - 2018")
                .font(.headline)
                .foregroundColor(.primary.opacity(0.8))
                .padding(.bottom, 1)
                .slideFadeIn(show: vm.contentAppear[3], offset: 20)
            VStack(alignment: .leading, spacing: 5) {
                Text("**•** Apparel Manager")
                Text("**•** Visual Merchandising Team Lead")
            }
            .font(.subheadline)
            .foregroundColor(.primary.opacity(0.7))
            .padding(.bottom, 10)
            .slideFadeIn(show: vm.contentAppear[3], offset: 15)
            
            Text("Dr.Martens  |  2017 - 2018")
                .font(.headline)
                .foregroundColor(.primary.opacity(0.8))
                .slideFadeIn(show: vm.contentAppear[4], offset: 20)
            Text("**•** Assistant Store Manager")
                .font(.subheadline)
                .foregroundColor(.primary.opacity(0.7))
                .padding(.bottom, 10)
                .slideFadeIn(show: vm.contentAppear[4], offset: 15)
            
            Text("AllSaints  |  2016 - 2017")
                .font(.headline)
                .foregroundColor(.primary.opacity(0.8))
                .slideFadeIn(show: vm.contentAppear[5], offset: 20)
            Text("**•** Brand Stylist")
                .font(.subheadline)
                .foregroundColor(.primary.opacity(0.7))
                .padding(.bottom, 10)
                .slideFadeIn(show: vm.contentAppear[5], offset: 15)
            
            Text("Urban Outfitters  |  2012 - 2016")
                .font(.headline)
                .foregroundColor(.primary.opacity(0.8))
                .padding(.bottom, 1)
                .slideFadeIn(show: vm.contentAppear[6], offset: 20)
            VStack(alignment: .leading, spacing: 5) {
                Text("**•** Visual Merchandising Team Lead")
                Text("**•** Stylist Program Director")
            }
            .font(.subheadline)
            .foregroundColor(.primary.opacity(0.7))
            .padding(.bottom, 10)
            .slideFadeIn(show: vm.contentAppear[6], offset: 15)
            
            
            Divider()
                .padding(.bottom, 8)
            
            Text("Want more formal content? **Cover Letter**")
                .font(.footnote)
                .foregroundColor(.primary.opacity(0.7))
                .accentColor(.primary.opacity(0.7))
                .onTapGesture {
                    vm.contentAppear = Array(repeating: false, count: 7)
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                        withAnimation(.easeInOut(duration: 0.8)) {
                            vm.selectedModal = .coverLetter
                        }
                    }
                }
        }
        .padding(20)
        .padding(.vertical, 10)
        .background(.ultraThinMaterial)
        .cornerRadius(30)
        .background(
            VStack {
                Circle().fill(vm.isInDarkMode ? .blue : .purple).frame(width: 88, height: 88)
                    .offset(x: 0, y: 0)
                    .scaleEffect(vm.contentAppear[0] ? 1 : 0.1)
            }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        )
        .modifier(OutlineModifier(cornerRadius: 30))
        .onAppear { vm.animateView() }
        .frame(height: 770)
    }
    
    
}

#Preview {
    ResumeView()
        .environmentObject(ContentViewModel())
}


struct SlideFadeIn: ViewModifier {
    var show: Bool
    var offset: Double
    
    func body(content: Content) -> some View {
        content
            .opacity(show ? 1 : 0)
            .offset(y: show ? 0 : offset)
    }
}
extension View {
    func slideFadeIn(show: Bool, offset: Double = 10) -> some View {
        self.modifier(SlideFadeIn(show: show, offset: offset))
    }
}


struct OutlineModifier: ViewModifier {
    @Environment(\.colorScheme) var colorScheme
    var cornerRadius: CGFloat = 20
    
    func body(content: Content) -> some View {
        content.overlay(
            RoundedRectangle(cornerRadius: cornerRadius)
                .stroke(
                    .linearGradient(
                        colors: [
                            .white.opacity(colorScheme == .dark ? 0.1 : 0.3),
                            .black.opacity(0.1)],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing)
                )
        )
    }
}
