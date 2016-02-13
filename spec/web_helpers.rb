def sign_in
   visit '/sign_up'
    fill_in('name', with: 'David')
    fill_in('email', with: 'drjparry@gmail.com')
    fill_in('password', with: 'john')
    fill_in('password_confirmation', with: 'john')
    click_button('Submit')

end

def log_in
visit '/log_in'
fill_in('email', with: 'drjparry@gmail.com')
fill_in('password', with: 'john')
click_button('Submit')
end