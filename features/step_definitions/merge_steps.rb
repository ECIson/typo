Given /^I am not an admin$/ do
  User.create!({:login => 'user',
              :password => 'aaaaaaaa',
              :email => 'moo@snow.com',
              :profile_id => 2,
              :name => 'user',
              :state => 'active'})
  visit '/accounts/login'
  fill_in 'user_login', :with => 'user'
  fill_in 'user_password', :with => 'aaaaaaaa'
  click_button 'Login'
  if page.respond_to? :should
    page.should have_content('Login successful')
  else
    assert page.has_content?('Login successful')
  end
end

Given /^I make an article named "(.*)" with author "(.*)"$/ do |name, author|
  visit '/admin/content/new'
  fill_in("article_title", :with => name)
  fill_in("article__body_and_extended_editor", :with => "Lorem Ipsum")
  click_button("Publish")
end

