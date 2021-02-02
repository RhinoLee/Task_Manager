require "rails_helper"

RSpec.feature "Task management", :type => :feature do
  scenario "User creates a new Task" do
    visit "/tasks/new"

    fill_in "task_title", :with => "My task"
    fill_in "task_content", :with => "My task content"

    click_button "新增任務"

    expect(page).to have_text("任務新增成功！")
  end

  scenario "任務列表以建立時間排序" do
    task_old = Task.create(title: "old task", content: "old content")
    task_new = Task.create(title: "new task", content: "new content")

    visit "/"

    expect( page.body.index(task_new.title) ).to be < page.body.index(task_old.title)
  end

  scenario "任務列表以結束時間排序" do
    visit "/"

    task_old = Task.create(title: "old task", content: "old content", end_time: "2021/02/17")
    task_new = Task.create(title: "new task", content: "new content", end_time: "2021/04/20")

    find('#end_time_btn').click

    expect( page.body.index(task_new.title) ).to be > page.body.index(task_old.title)

  end

end