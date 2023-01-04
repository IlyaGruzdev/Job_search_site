require 'rails_helper'

RSpec.describe Responce, type: :model do
  context "responce test" do
  let(:title) { Faker::String.random}
  let(:body) {Faker::String.random}
  it "self respond" do
  task=Responce.new(title: title,body: body,user_id: 3,task_id: 10)
  expect(task.valid?).to eq(false)
  end
end
end
