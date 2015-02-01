Given(/^Admin user account$/) do |user_data|
  @admin = create :user, user_data.hashes.first
end

Given(/^(\d+) existing users/) do |count|
  @users = create_list :user, count.to_i
end

When(/^I visit index page$/) do
  visit users_path
end

Then(/^I see (\d+) users$/) do |count|
  expect(all("table tbody tr").length).to eq count.to_i
end

And(/^I click on name "(.*?)"$/) do |name|
  within "table tbody" do
    click_link name
  end
end

Then(/^I see user's profile page with name "(.*?)"$/) do |name|
  expect(find("h1#user-name").text).to eq name
end

When(/^I go to my profile$/) do
  visit user_path @admin
end

Then(/^I see name "(.*?)" and email "(.*?)"$/) do |name, email|
  expect(page).to have_selector("h1#user-name", text: name)
  expect(page).to have_selector("p#user-email", text: email)
end
