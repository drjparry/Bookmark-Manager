feature "users can register" do
  scenario 'users can fill in a form to sign up' do
    visit '/sign_up'
    fill_in('name', with: 'David')
    fill_in('email', with: 'drjparry@gmail.com')
    expect{click_button('Submit')}.to change(User, :count).by 1
    expect(page).to have_content 'Welcome David'
    expect(User.first.email).to eq 'drjparry@gmail.com'
  end
end





