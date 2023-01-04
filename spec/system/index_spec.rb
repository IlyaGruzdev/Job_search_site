# frozen_string_literal: true
require 'rails_helper'

RSpec.describe 'Static content', type: :system do
  let(:uname){Faker::Internet.name}
  let(:uemail){Faker::Internet.email}
  let(:upassword){Faker::Internet.password}
  scenario 'correct params' do
    visit root_path # переходим на главную страницу
    find('#regbtn').click
    fill_in :name, with: uname 
    fill_in :email, with: uemail
    fill_in :password, with: upassword+"A@1"
    fill_in :password_confirmation, with: upassword+"A@1"
    find('#registration_btn').click
    expect(find('#registration_alert')).to have_text("Welcome to the site #{uname}")
  end
  scenario 'uncorrect params' do
    visit root_path 
    find('#regbtn').click
    fill_in :name, with: uname 
    fill_in :email, with: uemail
    fill_in :password, with: upassword
    fill_in :password_confirmation, with: upassword
    find('#registration_btn').click
    expect(find('#regerrors')).to have_text("Complexity requirement not met. Length should be 5-50 characters and include: 1 uppercase, 1 lowercase, 1 digit and 1 special character")
  
  end
  scenario 'password confirmation' do
  visit root_path 
  find('#regbtn').click
  fill_in :name, with: "Dedpool"
  fill_in :email, with: uemail
  fill_in :password, with:  upassword+"A@1"
  fill_in :password_confirmation, with: upassword + "A@1!"
  find('#registration_btn').click
  expect(find('#regerrors')).to have_text("Password confirmation не совпадает со значением поля Password")
end
scenario 'log params' do
  visit root_path 
  find('#logbtn').click
  fill_in :email, with: uemail
  fill_in :password, with:  upassword
  find('#login_btn').click
  expect(find('#log_alert')).to have_text("Incorrect email and/or password")
end

end