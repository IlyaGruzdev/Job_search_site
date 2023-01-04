require 'rails_helper'

RSpec.describe User, type: :model do
  context "validation test" do
    
     it "ensure name is present" do
    user=User.new(name: "Ilya")
    expect(user.valid?).to eq(false)
  end

 it "ensure email is present" do 
    user=User.new(email: "Ilya@123gmail.com")
    expect(user.valid?).to eq(false)
  end

it "ensure password is present" do 
  user=User.new(password: "Ilya5123Koeynd3")
  expect(user.valid?).to eq(false)

  end
 it "check not save user" do 

    user=User.new(name:"Ilya",email: "Crocodile0099@gmail.com", password: "Ilya5123Koeynd3")
    expect(user.save).to eq(false)
  end
  it "should be save user" do 

    user=User.new(name:"Ilya",email: "Crocodile0099@gmail.com", password: "Ily9a5123Ko@eynd3")
    expect(user.save).to eq(true)
  end
end
 

end
