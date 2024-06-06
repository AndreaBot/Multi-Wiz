# Multi Wiz
<img src="https://github.com/AndreaBot/Multi-Wiz/assets/128467098/2a1e9467-3fa8-4293-ae05-97dd22909c37" alt="1024" width="180">

Multi-Wiz is an educational app I developed as part of the Day 35 challenge in the "100 Days of SwiftUI" course by Paul Hudson. The goal was to create an app to help kids practice multiplication tables.

<img width="220" alt="Screenshot 2024-06-06 at 21 40 38" src="https://github.com/AndreaBot/Multi-Wiz/assets/128467098/2df33fc4-1b9e-488c-9931-daad1b46cfe4"> <img width="220" alt="Screenshot 2024-06-06 at 21 41 07" src="https://github.com/AndreaBot/Multi-Wiz/assets/128467098/11b4dfac-268a-4cd9-83b4-30f66e90ec15">

The Setup screen allows users to choose the base number they want to practice and set the number of questions using a stepper, ranging from a minimum of 5 to a maximum of 20.

Once the game starts, the createQuiz function generates a set of questions based on the selected parameters and stores the correct answers.

<img width="550" alt="Screenshot 2024-06-06 at 22 25 43" src="https://github.com/AndreaBot/Multi-Wiz/assets/128467098/cd13fc65-a4cf-4301-af9a-17ad2945f7b3"> <img width="300" alt="Screenshot 2024-06-06 at 22 28 45" src="https://github.com/AndreaBot/Multi-Wiz/assets/128467098/3a01c0d7-4314-469b-9b74-d0c352dc8998">

Users can then enter their answers in a TextField and check their responses.

<img width="220" alt="Screenshot 2024-06-06 at 21 42 05" src="https://github.com/AndreaBot/Multi-Wiz/assets/128467098/d2e5a336-eff7-42c7-9c0c-b824075d77cc"> <img width="220" alt="Screenshot 2024-06-06 at 21 42 29" src="https://github.com/AndreaBot/Multi-Wiz/assets/128467098/240f1f17-cfa3-4bb7-afd2-8d6c092bed47">

Upon completing all the questions, the End Game screen displays the final score and offers options to try again, change the quiz settings, or return to the home screen.

The main screen also provides access to overall stats.

<img width="220" alt="Screenshot 2024-06-06 at 22 16 08" src="https://github.com/AndreaBot/Multi-Wiz/assets/128467098/3ae203dd-2bf3-4106-94e0-ea0e3b140985">

The Stats page shows the number of times each multiplication table has been practiced, the average number of mistakes, and a color-coded bar indicating which tables need further revision.
The colors range from green (lowest error percentage) to yellow, orange, and red (highest error percentage).

These values are stored locally using UserDefaults.

