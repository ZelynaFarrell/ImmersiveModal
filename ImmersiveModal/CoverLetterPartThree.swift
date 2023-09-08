//
//  CoverLetterPartThree.swift
//  ImmersiveModal
//
//  Created by Zelyna Sillas on 9/8/23.
//

import SwiftUI

struct CoverLetterPartThree: View {
    @EnvironmentObject var vm: ContentViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("CoverLetter")
                .font(.largeTitle).bold()
                .blendMode(.overlay)
                .slideFadeIn(show: vm.contentAppear[0], offset: 30)
            

            partThree
                .font(.subheadline)
                .foregroundColor(.primary.opacity(0.7))
            
            Divider()
            
            Text("Want more formal content? **resume**")
                .font(.footnote)
                .foregroundColor(.primary.opacity(0.7))
                .accentColor(.primary.opacity(0.7))
                .onTapGesture {
                    vm.contentAppear = Array(repeating: false, count: 7)
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                        withAnimation(.easeInOut(duration: 0.8)) {
                            vm.selectedModal = .resume
                        }
                    }
                }
        }
        .padding(20)
        .padding(.vertical, 20)
        .background(.ultraThinMaterial)
        .cornerRadius(30)
        .background(
            VStack {
                Circle().fill(vm.isInDarkMode ? .blue : .purple).frame(width: 88, height: 88)
                    .scaleEffect(vm.contentAppear[0] ? 1 : 0.1)
            }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        )
        .modifier(OutlineModifier(cornerRadius: 30))
        .onAppear { vm.animateView() }
        .frame(height: 760)
    }
   
    var partThree: some View {
        VStack(alignment: .leading, spacing: 25) {
            Text("""
        My aim is to craft impactful, cutting-edge, and visually stunning work that seamlessly aligns with your company's ethos, all the while consistently expanding my knowledge, refining my skills, and deepening my expertise.
        """)
            .padding(.top, 30)
            .slideFadeIn(show: vm.contentAppear[1], offset: 25)
            
            Text("""
        I eagerly anticipate the opportunity to discuss how I can contribute to your team.
        In the meantime, check out my GitHub that I made just for you.
        """).slideFadeIn(show: vm.contentAppear[2], offset: 25)

            Text("""
        With Sincere Anticipation,
        Zelyna Farrell
        """).slideFadeIn(show: vm.contentAppear[3], offset: 25)
            
            VStack(alignment: .leading, spacing: 2) {
                Text(verbatim: "https://github.com/ZelynaFarrell")
                Text(verbatim: "https://www.linkedin.com/in/zelynafarrell/")
                Text(verbatim: "zelynafarrell@gmail.com")
            }
            .foregroundColor(.secondary)
            .slideFadeIn(show: vm.contentAppear[4], offset: 25)
            
            Spacer()
                .frame(height: 75)
        }
    }
}


#Preview {
    CoverLetterPartThree()
        .environmentObject(ContentViewModel())
}
