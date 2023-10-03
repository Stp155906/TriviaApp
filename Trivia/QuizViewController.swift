import UIKit

struct Question {
    let text: String
    let options: [String]
    let correctAnswerIndex: Int
}

class QuizViewController: UIViewController {
    // UI Outlets
    
    @IBOutlet weak var questionLabel: UILabel!
   
    @IBOutlet weak var optionButton1: UIButton!
    
    @IBOutlet weak var optionButton2: UIButton!
   
    @IBOutlet weak var optionButton3: UIButton!
   
    @IBOutlet weak var optionButton4: UIButton!
    
   
   
    var questions: [Question] = [
        Question(text: "Favorite hue?", options: ["Lavender", "Amethyst", "Orchid", "Grape"], correctAnswerIndex: 2),
        Question(text: "Favorite drink?", options: ["Coffee", "Tea", "Soda", "Water"], correctAnswerIndex: 1),
        Question(text: "Which animal do you prefer?", options: ["Dog", "Cat", "Fish", "Bird"], correctAnswerIndex: 0) // Assuming "Dog" is the correct answer here
           //... Add more questions as // assuming Tea is the correct answer here
        //... Add more questions here
    ]

    
    var currentQuestionIndex = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        setupQuestion()
        setupActions()
    }
    
    
    func setupQuestion() {
        let currentQuestion = questions[currentQuestionIndex]
        questionLabel.text = currentQuestion.text
        optionButton1.setTitle(currentQuestion.options[0], for: .normal)
        optionButton2.setTitle(currentQuestion.options[1], for: .normal)
        optionButton3.setTitle(currentQuestion.options[2], for: .normal)
        optionButton4.setTitle(currentQuestion.options[3], for: .normal)
    }
    
    func setupActions() {
        optionButton1.addTarget(self, action: #selector(optionSelected(_:)), for: .touchUpInside)
        optionButton2.addTarget(self, action: #selector(optionSelected(_:)), for: .touchUpInside)
        optionButton3.addTarget(self, action: #selector(optionSelected(_:)), for: .touchUpInside)
        optionButton4.addTarget(self, action: #selector(optionSelected(_:)), for: .touchUpInside)
    }
    
    @objc func optionSelected(_ sender: UIButton) {
        guard let selectedOption = sender.titleLabel?.text else { return }
        
        // Identify the button pressed using its title (or tag if you set them)
        print("User selected: \(selectedOption)")
        
        // Check if the answer is correct and provide feedback or move to the next question
        // For now, just move to the next question
        if currentQuestionIndex < questions.count - 1 { // check to ensure we don't exceed the array bounds
            currentQuestionIndex += 1
            setupQuestion()
        } else {
            print("Quiz finished!")
            // Optionally, you can reset the quiz or navigate to another screen, show results, etc.
        }
    }

}
