import SwiftUI

class MessageManager: ObservableObject {
    @Published var messages: [Message] = []
    
    private var messageToBeAddIndex = 0
    private var timer: Timer?
        
    init() {
        startTimer()
    }
    
    private func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 2.0, repeats: true) { timer in
            self.addMessage()
        }
    }
    
    private func stopTimer() {
        timer?.invalidate()
        timer = nil
    }
    
    func allMessagesRead() -> Bool {
        for message in messages {
            if !message.isRead {
                return false
            }
        }
        
        return true
    }
    
    func addMessage() {
        messages.append(messagesToBeAdded[messageToBeAddIndex])
        messageToBeAddIndex += 1
        
        if messageToBeAddIndex > messagesToBeAdded.count - 1 {
            stopTimer()
        }
        
        objectWillChange.send()
    }
    
    private let messagesToBeAdded: [Message] = [
        Message(
            authorEmail: "bob@starship.com",
            authorName: "Bob",
            content: """
      Hi Michael! 👋
      
      I heard you're traveling to Aqualis with your new spaceship, but I wanted to warn you about some precautions you need to take in that part of the universe, okay?
      
      **Security tips for your space travels:**
      
      **Strong passwords:** Use strong, complex passwords like magic keys to protect your spaceship in cyberspace. They should be a mix of letters, numbers, and symbols to make them difficult to guess and prevent brute-force attacks.
      
      **Beware of suspicious emails:** Not all emails are trustworthy! Watch out for phishing attacks that try to deceive you and steal your information.
      
      **Use a firewall:** A firewall acts like a shield for your spaceship in the digital world, monitoring and blocking unauthorized access. This helps prevent attacks like DDoS, which overload your system with fake requests.
      
      *I remember once having problems with bots because of a weak password. Since then, I've learned my lesson and prioritize security. I've also heard about recent cyber attacks in the region.* **Stay vigilant**.
      
      Best,
      Bob 🚀
      """,
            isRead: false
        )
    ]
}
