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

feature "users can only register if password is confirmed" do
  scenario 'users cannot sign up if password is not confirmed' do
    visit '/sign_up'
    fill_in('name', with: 'David')
    fill_in('email', with: 'john@gmail.com')
    fill_in('password', with: 'bottle')
    fill_in('password_confirmation', with: 'buttle')
    expect{click_button('Submit')}.to change(User, :count).by 0
    expect(current_path).to eq('/sign_up')
    expect(page).to have_content 'Password does not match the confirmation'
  end

  scenario 'I cannot sign up with an existing email' do
    sign_in
    expect { sign_in }.to_not change(User, :count)
    expect(page).to have_content('Email is already taken')
end

end