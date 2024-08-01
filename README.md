# Table of contents
1. [The Project](#1-flutter-animations-studio)
2. [Demo video](#2-demo-video)
3. [Architecture](#3-architecture)

# 1. Flutter Animations Studio
Animate with ease using Flutter Animations Studio, a Flutter web-app that generates live Dart code as you create stunning animations. 😉
<br>

# 2. Demo video
Enjoy a visual demo of Flutter Animations Studio - isn't it amazing?

https://github.com/gianlucaromeo/flutter-animations-studio/assets/48991017/5c18d808-1537-4df2-a867-97740a794811

# 3. Architecture
If you are new to flutter_redux, here's a brief introduction of how it works: 
1. A **Store** saves the **state**.
2. A **StoreConnector** listens to the state and creates/updates the UI.
3. The UI **dispatches** **actions**.
4. **Reducers** intercept these actions and update the state.
<br>

In this project, I extended this pattern by:
1. Adding a **ViewModel** to store the properties that define the UI.
2. Created a **redux_components** folder, to define an action and its reducer for each file.
3. Created a **redux_adapters** folder, to define a UI adapter and its ViewModel for each file.
<br>

A visual representation of the architecture of **FlutterAnimationsStudio** is shown in the image below:
<br>

![FlutterAnimationsStudio Architecture Pattern](https://github.com/user-attachments/assets/9fc4db14-fde3-4f36-a7f4-65df7cf8903a)
