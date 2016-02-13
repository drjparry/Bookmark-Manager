feature "users can register" do
  scenario 'users can fill in a form to sign up' do
    visit '/sign_up'
    fill_in('name', with: 'David')
    fill_in('email', with: 'drjparry@gmail.com')
    fill_in('password', with: 'john')
    fill_in('password_confirmation', with: 'john')
    expect{click_button('Submit')}.to change(User, :count).by 1
    expect(page).to have_content 'Welcome David'
    expect(User.first.email).to eq 'drjparry@gmail.com'
  end


  scenario "I can't sign up without an email address" do
    visit '/sign_up'
    fill_in('name', with: 'David')
    fill_in('password', with: 'john')
    fill_in('password_confirmation', with: 'john')
    expect{click_button('Submit')}.to change(User, :count).by 0
  end


    scenario "I can't sign up with an invalid email address" do
    visit '/sign_up'
    fill_in('name', with: 'David')
    fill_in('email', with: 'drjparrygmail.com')
    fill_in('password', with: 'john')
    fill_in('password_confirmation', with: 'john')
    expect{click_button('Submit')}.not_to change(User, :count)
  end
end





