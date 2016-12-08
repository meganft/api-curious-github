# require 'rails_helper'
#
# describe "user can visit profile" do
#   it "user can see profile info" do
#     VCR.use_cassette("views profile") do
#
#       stubbed_response = {"login"=>"meganft", "id"=>19432922, "avatar_url"=>"https://avatars.githubusercontent.com/u/19432922?v=3", "gravatar_id"=>"", "url"=>"https://api.github.com/users/meganft", "html_url"=>"https://github.com/meganft", "followers_url"=>"https://api.github.com/users/meganft/followers", "following_url"=>"https://api.github.com/users/meganft/following{/other_user}", "gists_url"=>"https://api.github.com/users/meganft/gists{/gist_id}", "starred_url"=>"https://api.github.com/users/meganft/starred{/owner}{/repo}", "subscriptions_url"=>"https://api.github.com/users/meganft/subscriptions", "organizations_url"=>"https://api.github.com/users/meganft/orgs", "repos_url"=>"https://api.github.com/users/meganft/repos", "events_url"=>"https://api.github.com/users/meganft/events{/privacy}", "received_events_url"=>"https://api.github.com/users/meganft/received_events", "type"=>"User", "site_admin"=>false, "name"=>"Megan T", "company"=>nil, "blog"=>nil, "location"=>"Denver, CO", "email"=>nil, "hireable"=>nil, "bio"=>nil, "public_repos"=>30, "public_gists"=>5, "followers"=>3, "following"=>3, "created_at"=>"2016-05-18T15:26:07Z", "updated_at"=>"2016-12-08T18:23:32Z", "token"=>ENV["github_user_token"]
#     }
#
#       allow(OauthService).to receive(:register).and_return(stubbed_response)
#
#       visit '/'
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
