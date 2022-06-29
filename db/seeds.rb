puts "🌱 Seeding spices..."

# Seed your database here
puts "🌱 Seeding messages..."

Message.create([
  {
    body: "Hello 👋",
    username: "Liza"
  },
  {
    body: "Hi!",
    username: "Duane"
  },
  {
    body: "let's get this chat app working",
    username: "Liza"
  },
  {
    body: "ngl, this looks like a lot 😬",
    username: "Duane"
  },
  {
    body: "You got this! 💪",
    username: "Liza"
  }
])

12.times do 
    PatientDetail.create(
        patient_id: rand(1..5),
        temperature: rand(30..39),
        pressure: rand(90..120),
        SPO2: rand(60..90),
        Doctor_Remarks: Faker::Quote.matz
    )
end

puts "✅ Done seeding!"

puts "✅ Done seeding!"
