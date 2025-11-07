🎥📘Lecture Notes Summarizer App

A Flutter app that converts lecture videos into clean summarized text notes.
Backend Repo : https://github.com/arun-kumar-bidila/lecturenotes

🚀 ##Overview

This application allows users to upload or record a lecture video and automatically generates structured notes from it.
It is designed for students who want to study faster without rewatching long lecture videos.

🛠️ Tech Stack
Component	Technology
Frontend	Flutter (Dart)
Backend	 (Nodejs)
Speech-to-Text	Whisper
Optional Storage	Cloudinary / MongoDB

✨Features

Upload or capture lecture video

Extract audio using FFmpeg

Speech-to-text transcription

Smart AI text summarization

Well-structured notes output

Download notes as PDF

Clean UI and easy to use

🔄 How It Works
Step 1: User selects/records video
Step 2: Video sent to server
Step 3: Audio extracted and transcribed to text
Step 4: Text is summarized & formatted
Step 5: Final notes returned to app for viewing or downloading



🔧 Setup Instructions
Flutter Side
flutter pub get
flutter run

Backend Side
npm install
npm start

🚀 Future Improvements

Slide/OCR text extraction

Question-answer generation from notes

Multi-language support

Topic-based highlights
