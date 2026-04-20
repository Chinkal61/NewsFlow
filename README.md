# NewsFlow 📰

**NewsFlow** is a production-grade iOS application built with **SwiftUI** and **Swift Concurrency**. It demonstrates a protocol-oriented architecture designed for scalability, testability, and performance.

---

## Screenshot
![NewsFlow Screenshot](screenshots/home.png)

---

## 🧠 Key Takeaways & Technical Growth
- **Structured Concurrency & Lifecycle Management**: Deepened expertise in Swift's modern concurrency model. This ensures optimized resource management and used 'Task' that prevents the UI from freezing while the network request is running.

- **Protocol-Oriented Networking Abstraction**: Developed a highly scalable and decoupled networking layer using an Endpoint protocol. Using Endpoint, all API calls transform into a structured object that is easier to maintain.

- **Decoupled & Stateless UI Components**: Engineered reusable SwiftUI components that adhere to the Single Responsibility Principle. By ensuring Views only receive the specific data required for rendering, I achieved a "data-driven" UI that remains independent of the ViewModel's underlying implementation, facilitating easier maintenance and cross-feature reusability.

- **Async image loading with 3-state handling**: Implemented a comprehensive asynchronous image loading strategy using SwiftUI's AsyncImage 3-state pattern. By explicitly managing these states, I ensured UI stability and prevented layout shifts, providing a polished UX through custom loading states and graceful fallback mechanisms.

---

## 🛠 Tech Stack

- **Language**: Swift 5.9+
- **Framework**: SwiftUI
- **Architecture**: MVVM
- **Concurrency**: Swift Concurrency (Tasks, Async/Await)
- **Minimum iOS**: 16.0+

---

## ⚙️ Setup Instructions

- **Clone the repo**

- **Get a free API key from newsapi.org**: This project utilizes the NewsAPI.org service to fetch real-time headlines.
1)Visit NewsAPI.org and sign up for a free developer account.
2)Copy your unique API Key.

- **Add API key to Constants.swift**: For security and modularity, the API key is centralized in the Constants file.
1) Open NewsFlow.xcodeproj in Xcode.
2) Navigate to Utilities/Constants.swift.
3) Update the apiKey property with your credentials

- **Run on simulator or device**
