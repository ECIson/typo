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

Given /^I make an article named "(.*)" with author "(.*)" and text "(.*)"$/ do |name, author, body|
  visit '/admin/content/new'
  fill_in("article_title", :with => name)
  fill_in("article__body_and_extended_editor", :with => body)
  click_button("Publish")
end

Given /^an article named "(.*)" with author "(.*)", text "(.*)", id "(.*)", and guid "(.*)" exists$/ do |name, author, body, id, guid|
  a = Article.create!(:allow_comments => true, :allow_pings => true, :author => author, :body => body, :guid => guid, :id => id.to_i, :permalink => "hello-world", :post_type => "read", :published => true, :published_at => "2012-06-09 21:51:55 UTC", :settings => {"password"=>""}, :state => "published", :text_filter_id => 5, :title => name, :type => "Article", :user_id => 1)
  #puts id.to_i
  #puts a.id
end
