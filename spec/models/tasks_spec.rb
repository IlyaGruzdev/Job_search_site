require 'rails_helper'

RSpec.describe Task, type: :model do
  context "validation test" do
    let(:name){Faker::Internet.name}
    let(:email){Faker::Internet.email}
    let(:password){Faker::Internet.password}
    let(:title){Faker::Name.name }
    let(:body){Faker::String.random}
     it "uncorrect body" do
      task=Task.new(title: "title")
      expect(task.valid?).to eq(false)   
     end
     it "uncorrect title" do
      task=Task.new(body: "body")
      expect(task.valid?).to eq(false)   
     end
     it "correct params" do
      user=User.new(name:"Ilya",email: "Crocodile0099@gmail.com", password: "Ily9a5123Ko@eynd3")
      user.save
      task=user.tasks.build(title: "title", body: "body", category: "Дизайн")
      expect(task.save).to eq(true)   
     end
     it "correct save" do
      user=User.new(name:name,email:email,password: password)
      user.save
      task=user.tasks.build(title: title, body: body, category: "Другое")
      expect(task.valid?).to eq(true)   
     end
    end

end