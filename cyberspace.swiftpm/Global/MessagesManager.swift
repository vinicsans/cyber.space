import SwiftUI

class MessageManager: ObservableObject {
    @Published var messages: [Message] = []
    
    @Published var showModal: Bool = false
        
    @Published var hasUnreadMessages: Bool = false
    
    private var scoreManager = ScoreManager.shared
    
    @Published var fakeMessageAction: Bool = false
    @Published var trueMessageAction: Bool = false
    
    private var messageToBeAddIndex = 0
    private var timer: Timer?
        
    static var shared = MessageManager()
    
    init() {
        self.startTimer()
        allMessagesRead()
    }
    
    private func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 2.0, repeats: true) { timer in
            self.addMessage()
            self.allMessagesRead()
        }
    }
    
    private func stopTimer() {
        timer?.invalidate()
        timer = nil
    }
    
    func cancelFakeMessage() {
        showModal = false
        allMessagesRead()
        scoreManager.addPoints(bonus: .very)
        fakeMessageAction = true
    }
    
    func submitFakeMessage() {
        fakeMessageAction = true
    }
    
    func submitTrueMessage() {
        trueMessageAction = true
    }
    
    func cancelTrueMessage() {
        showModal = false
        allMessagesRead()
        trueMessageAction = true

    }
    
    func allMessagesRead() -> Void {
        for message in messages {
            if message.isRead {
                hasUnreadMessages = true
            }
        }
        
        hasUnreadMessages = false
        objectWillChange.send()
        ObjectWillChangePublisher()
    }
    
    func addMessage() {
        messages.append(messagesToBeAdded[messageToBeAddIndex])
        messageToBeAddIndex += 1
        
        if messageToBeAddIndex > messagesToBeAdded.count - 1 {
            stopTimer()
        }
        
        allMessagesRead()

        objectWillChange.send()
    }
    
    func addFakeMessage() {
        let timer = Timer.scheduledTimer(withTimeInterval: 2.0, repeats: false) { [self] timer in
            messages.append(fakeMessage)
        }
        
        
        showModal = true
        allMessagesRead()
    }
    
    func addTrueMessage() {
        messages.append(trueMessage)
        showModal = true
        allMessagesRead()
    }
    
    private let trueMessage: Message = Message(
        type: .trued,
        authorEmail: "bob@starship.com",
        authorName: "Bob",
        isRead: false,
        popUp: true,
        isFake: false,
        content: """
        Hi Michael,

        I have been receiving information about possible phishing attempts in the region you are in. It is crucial to remain vigilant against potential cyber threats.

        Please confirm your identity by providing your ship ID number. This will help us ensure that only you are actually responding to this message. Additionally, beware of fake emails that may come to you, always check the name, spelling errors, and if the email address ends with @starship.com, okay?

        Intergalactic hugs, Bob. 🚀
        """)
    
    private let fakeMessage: Message = Message(
        type: .fake,
        authorEmail: "suspect@protonni.su",
        authorName: "???&¨#$@!",
        isRead: false,
        popUp: true,
        isFake: true,
        content: """
        Hi Michel,.,

        We are experienceing unexpected technical issues with our security system and require your immediate assistance to avoid serious complications!!!

        To resolve this urgent situation, we kindly request that you provide us with the access password for your ship.

        We apologize for the inconvieniente, but your cooperation is essential to maintain the integrity of the system. We appreciate your prompt action.

        Sincerely,
        Martian Technical Support
        """)
    
    private let messagesToBeAdded: [Message] = [
        Message(
            type: .intro,
            authorEmail: "bob@starship.com",
            authorName: "Bob",
            isRead: false,
            popUp: true,
            isFake: false,
            content: """
      Hi Michael! 👋
      
      I heard you're traveling to Aqualis with your new spaceship, but I wanted to warn you about some precautions you need to take in that part of the universe, okay?
      
      **Security tips for your space travels:**
      
      **Strong passwords:** Use strong, complex passwords like magic keys to protect your spaceship in cyberspace. They should be a mix of letters, numbers, and symbols to make them difficult to guess and prevent brute-force attacks.
      
      **Beware of suspicious emails:** Not all emails are trustworthy! Watch out for phishing attacks that try to deceive you and steal your information.
      
      **Use a firewall:** A firewall acts like a shield for your spaceship in the digital world, monitoring and blocking unauthorized access. This helps prevent attacks like DDoS, which overload your system with fake requests.
      
      *I remember once having problems with bots because of a weak password. Since then, I've learned my lesson and prioritize security. I've also heard about recent cyber attacks in the region.* **Stay vigilant**. Best, Bob 🚀
      """
        ),
    ]
}
