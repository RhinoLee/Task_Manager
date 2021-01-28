require "rails_helper"

RSpec.feature "Task management", :type => :feature do
  scenario "User creates a new Task" do
    visit "/tasks/new"

    fill_in "task_title", :with => "My task"
    fill_in "task_content", :with => "My task content"

    click_button "新增任務"

    expect(page).to have_text("任務新增成功！")
  end
end