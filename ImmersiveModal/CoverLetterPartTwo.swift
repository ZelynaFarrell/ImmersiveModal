//
//  CoverLetterPartTwo.swift
//  ImmersiveModal
//
//  Created by Zelyna Sillas on 9/8/23.
//

import SwiftUI

struct CoverLetterPartTwo: View {
    @EnvironmentObject var vm: ContentViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("CoverLetter")
                .font(.largeTitle).bold()
                .blendMode(.overlay)
                .slideFadeIn(show: vm.contentAppear[0], offset: 30)

            partTwo
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
        .padding(15)
        .padding(.vertical, 10)
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
   
    
    
    var partTwo: some View {
        VStack(alignment: .leading, spacing: 20) {
           
            Text("""
yes, my credentials are substantial, but it's my determination and passion to continued learning that sets me apart. \nYou’d like an example? I’m glad you asked… \nI dove headfirst into all things iOS development, completely self-taught, during a global pandemic, all while embracing the many challenges of nurturing a newborn.
""")
            .padding(.top, 20)
            .slideFadeIn(show: vm.contentAppear[1], offset: 25)

            Text("""
Yes, you read that right—midnight coding sessions intertwined with soothing lullabies. It's a symphony of time management or a ballet of sleep-deprived multitasking artistry, depending on your perspective. If that isn't an embodiment of sheer determination, I don’t know what is. It’s also that very quality that grants me a distinctive vantage point, setting me apart from the other applicants for this role.
""").slideFadeIn(show: vm.contentAppear[2], offset: 25)
            
            VStack(alignment: .leading) {
                Text("""
    Congratulations, you made it to the final paragraph. As Google wisely suggests, this is where I drive my point home. \nSo, here it is:
    """).slideFadeIn(show: vm.contentAppear[3], offset: 25)
                
                Button {
                    vm.contentAppear = Array(repeating: false, count: 7)
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                        withAnimation(.easeInOut(duration: 0.8)) {
                            vm.selectedModal = .coverLetterPartThree
                        }
                    }
                } label: {
                    Image(systemName: "arrow.right.circle")
                        .font(.title3)
                        .frame(maxWidth: .infinity, alignment: .bottomTrailing)
                }
                .slideFadeIn(show: vm.contentAppear[4], offset: 25)
            }
        }
    }
}

#Preview {
    CoverLetterPartTwo()
        .environmentObject(ContentViewModel())
}
