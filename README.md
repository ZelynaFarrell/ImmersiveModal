# <p align="center"><b>Immersive Modal Experience with Custom Animations</b></p>


#### <p align="center">This mini project showcases a captivating and dynamic modal view with custom animations, incorporating interactive drag and hue effects for an engaging user experience in both light and dark mode.
</p>

<br>

## **Features**
- <kbd style="background-color: #f0f0f0">**Custom Animation Effects:**</kbd> Utilizes SwiftUI animations for an engaging user experience.
- <kbd style="background-color: #f0f0f0">**Hue and Drag Effects:**</kbd> Incorporates dynamic color adjustments and drag gestures.
- <kbd style="background-color: #f0f0f0">**Modal Views:**</kbd> Presents different views (Resume, Cover Letter, etc.) within a modal interface.
- <kbd style="background-color: #f0f0f0">**Dismissal Gesture:**</kbd> Allows users to dismiss the modal view with a swipe gesture.
- <kbd style="background-color: #f0f0f0">**Close Button:**</kbd> Provides an option to close the modal view.
- <kbd style="background-color: #f0f0f0">**Light and Dark Mode:**</kbd> Toggle between light and dark mode to allow users to view the content and hues in different color palettes.


<br>

### **Videos and Demos**

| Resume | Cover Letter |
|:---------------:|:----------------:|
|<img width="400" src="https://github.com/ZelynaFarrell/ImmersiveModal/assets/117409535/0009cbfe-9639-4132-905e-11c4f0271152">|<img width="400" src="https://github.com/ZelynaFarrell/ImmersiveModal/assets/117409535/c1f50bcf-a1c0-4f77-ac0f-96d6237dd5f9">|


<br>

| Light | Dark |
|:---------------:|:----------------:|
|<img width="400" src="https://github.com/ZelynaFarrell/ImmersiveModal/assets/117409535/4ac08f07-00d1-4920-a5d3-1906ffeb168d">|<img width="400" src="https://github.com/ZelynaFarrell/ImmersiveModal/assets/117409535/178d9de7-d3e6-421f-8320-865ae58769ed">|

<br>

### **How It Works**
- The ModalView struct is at the heart of the project, utilizing SwiftUI to create a dynamic modal interface.
- It employs an EnvironmentObject to manage the application's environment, including appearance states.
- The DragGesture allows users to interact with the modal by dragging it, while custom animations respond to the gestures.
- Different modal views (e.g., Resume, Cover Letter) are presented within the GeometryReader, each with its own unique appearance and content.
- Shadows, rotations, and hue adjustments are applied to the views to create engaging visual effects.
- A dismiss gesture is implemented, allowing users to close the modal with a swipe.
- The project encourages further customization, enabling developers to integrate the ModalView into their own applications.
- The ContentView exemplifies how to incorporate the ModalView within an app, passing the necessary environment object.

By combining SwiftUI's powerful animation capabilities with gesture recognition, the project provides an immersive user experience within a modal context. Developers can leverage this structure to create interactive, visually engaging interfaces for their applications.

<br>

### **How to Use**
1. Clone the repository.
2. Open the project in Xcode.
