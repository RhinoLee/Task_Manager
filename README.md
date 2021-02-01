# README

table: users 
  name: string
  email: string 
  password: string 

table: task_list
  title: string
  position: integer

table: task 
  title: string
  content: text
  start_time: datetime
  end_time: datetime
  level: string 
  status: string 
  category: string
  position: integer


  ## Heroku 部署
  1. heroku create
  2. git push heroku master => error: Failed to install gems via Bundler. 
  
  * error: Failed to install gems via Bundler. 
  > 本地 bundler 版本比 Heroku 新
  1. gem uninstall bundler
  2. gem install bundler --version '2.1.4' # 安裝 Heroku bundler 版本
  3. rm gemfile.lock # 刪除 lock 檔
  4. bundle _2.1.4_ install # 指定 2.1.4 版本 bundle install 
  5. git add . -> git commit -m "change bundle version for Heroku"
  5. git push heroku master 
  6. heroku run rails db:migrate
  
  * Error R10 (Boot timeout) -> Web process failed to bind to $PORT within 60 seconds of launch
  1. Procfile => web: bundle exec puma -p ${PORT:-3000}

  * 新增 http_base 環境變數

  