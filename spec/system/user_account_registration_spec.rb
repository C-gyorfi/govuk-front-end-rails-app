require 'rails_helper'

RSpec.feature 'User account registration' do
  scenario 'User signs up' do

    when_i_visit_the_root_page
    and_i_click_on_the_registration_tab
    then_i_can_see_the_registration_page

    when_i_fill_up_the_form_by_omitting_fields
    and_i_click_on_the_registration
    the_i_can_see_field_errors

    when_i_fill_up_the_form
    and_i_click_on_the_registration
    the_i_can_see_the_success_page
  end

  def when_i_visit_the_root_page
    visit '/'
  end

  def and_i_click_on_the_registration_tab
    click_on 'Register'
  end

  def then_i_can_see_the_registration_page
    expect(page).to have_content('Register a new user')
    expect(page).to have_content('Username')
    expect(page).to have_content('Phone number')
    expect(page).to have_content('Date of Birth')
  end

  def when_i_fill_up_the_form_by_omitting_fields
    fill_in 'Date of Birth', with: '12/12/1212'
  end

  def the_i_can_see_field_errors
    expect(page).to have_content("Enter a user name")
    expect(page).to have_content("Enter a phone number")
  end

  def when_i_fill_up_the_form
    fill_in 'Username', with: 'new_user'
    fill_in 'Phone number', with: '0788888888'
    fill_in 'Date of Birth', with: '12/12/1212'
  end

  def and_i_click_on_the_registration
    click_button 'Register'
  end

  def the_i_can_see_the_success_page
    expect(page).to have_content('SUCCESSS')
  end
end
