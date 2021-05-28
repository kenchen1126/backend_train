![](/public/ERB.jpg)

## User model
| 欄位 | 類別型態 |
| :------: | :------: | 
| id       | integer    |
| name     | string     |
| email    | string     |
| password | string     |


## Task model
| 欄位 | 類別型態 |
| :------: | :------: | 
| id       | integer    |
| name     | string     |
| description| string   |
| priority | integer    |
| status   | integer    |
| start_at | datetime   |
| end_at   | datetime   |
| user_id  | integer    |

## Tag model
| 欄位 | 類別型態 |
| :------: | :------: | 
| id       | integer    |
| name     | string     |

## Tagging model
| 欄位 | 類別型態 |
| :------: | :------: | 
| id       | integer  |
| task_id  | integer  |
| tag_id   | integer  |

## 部署流程
# 使用版本
ruby: 2.7.2
rails: 6.1.3.2
heroku: 7.54.0
# 使用環境
Ubuntu 18.04
# 第一步
建立heroku app
`heroku create backendtrain`
# 第二步
把專案 main分支 推上去heroku
`git push heroku main`

這時候到heroku網頁打開app發現有錯誤於是輸入
`heroku logs`
![](/public/deploy.png)
發現還沒將migration寫入資料庫
# 第三步
`heroku run rails db:migrate`

# 第四步
完成部署
![](/public/deploydone.png)
連結: [https://backendtrain.herokuapp.com/](https://backendtrain.herokuapp.com/)
