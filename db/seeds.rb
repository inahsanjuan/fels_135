User.create!(name: "tuyenhong", email: "tuyenhong@gmail.com",
  password: "foobar", password_confirmation: "foobar", admin: "true")
Category.create!(name: "Basic Lesson")

Word_answers.create!(content: "asdasda", correct_answer: true, word_id: 1)
