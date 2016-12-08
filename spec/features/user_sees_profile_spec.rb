# require 'rails_helper'
#
# describe "user can visit profile" do
#   it "user can see profile info" do
#     VCR.use_cassette("views profile") do
#       visit '/'
#
#       stub_omniauth
#
#       click_link "Login with Github"
#
#       expect(current_path).to eq('/dashboard')
#       expect(page).to have_content("Megan T")
#       expect(page).to have_content("meganft")
#
#     end
#   end
# end
