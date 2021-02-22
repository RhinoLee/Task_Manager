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
    task_old = Task.create(title: "old task", content: "old content", status: "待處理")
    task_new = Task.create(title: "new task", content: "new content", status: "待處理")

    visit "/"

    expect( page.body.index(task_new.title) ).to be < page.body.index(task_old.title)
  end

  # scenario "任務列表以結束時間排序" do
  #   visit "/"

  #   task_short = Task.create(title: "old task", content: "old content", end_time: "2021/02/17", status: "待處理")
  #   task_long = Task.create(title: "new task", content: "new content", end_time: "2021/04/20", status: "待處理")

  #   find('.sort-btn.end_time').click

  #   expect( page.body.index(task_long.title) ).to be > page.body.index(task_short.title)

  # end

  # scenario "任務依照優先順序由高到低排序" do
  #   visit "/"

  #   task_important = Task.create(title: "task_important", content: "old content", end_time: "2021/02/17", status: "待處理", level: 2)
  #   task_lazy = Task.create(title: "task_lazy", content: "new content", end_time: "2021/04/20", status: "待處理", level: 0)

  #   find('#level_desc_btn').click

  #   expect( page.body.index(task_important.title) ).to be < page.body.index(task_lazy.title)

  # end

  # scenario "任務依照優先順序由低到高排序" do
  #   visit "/"

  #   task_important = Task.create(title: "task_important", content: "old content", end_time: "2021/02/17", status: "待處理", level: 2)
  #   task_lazy = Task.create(title: "task_lazy", content: "new content", end_time: "2021/04/20", status: "待處理", level: 0)

  #   find('#level_asc_btn').click

  #   expect( page.body.index(task_important.title) ).to be > page.body.index(task_lazy.title)

  # end

end