feature "users can only register if password is confirmed" do
  scenario 'users cannot sign up if password is not confirmed' do
    visit '/sign_up'
    fill_in('name', with: 'David')
    fill_in('email', with: 'john@gmail.com')
    fill_in('password', with: 'bottle')
    fill_in('password_confirmation', with: 'buttle')
    expect{click_button('Submit')}.to change(User, :count).by 0
    #expect { password_confirmation:'wrong' }.not_to change(User, :count)
  end
end