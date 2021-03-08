# 任務管理系統

### 網站連結：https://protected-garden-50035.herokuapp.com/

### 功能
* 會員系統
* 個人任務的 CRUD
* 可設定任務狀態：待處理、處理中、已完成
* 可設定任務結束時間，且按結束時間排序
* 可設定任務優先順序：高、中、低，且按優先順序排序
* 任務即時搜尋，可按任務狀態或名稱搜尋
* 系統管理員後台

### 預設帳號
帳號：seed@gmail.com
密碼：test
管理員後台：網址列結尾輸入 /admin

### 使用框架與技術
* 前端：HTML, CSS, JavaScript, Axios
* 後端框架：Ruby on Rails
* 資料庫：PostgreSQL
* 網站部署：Heroku
* 版本控制：Git






#### 案件紀錄

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


  * Heroku 部署
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

  
