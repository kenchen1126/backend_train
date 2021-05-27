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
