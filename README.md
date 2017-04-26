# DB設計

## users table
| Column     | Type     | Options                   |
|:-----------|----------|---------------------------|
| name       | string   | null: false, unique: true |

### Association
* has_many :messages
* has_many :groups, through: :groupe_users

## messages table
| Column     | Type     | Options                   |
|:-----------|----------|---------------------------|
| body       | text     |                           |
| image      | string   |                           |
| user_id    | integer  | foreign_key: true         |
| groupe_id  | integer  | foreign_key: true         |
### Association
* belongs_to :user
* belongs_to :groupe

### groupes table
| Column     | Type     | Options                   |
|:-----------|----------|---------------------------|
| name       | string   | null: false               |

### Association
* has_many :messages
* has_many :users, through: :groupe_users

## groupe_users table
| Column     | Type     | Options                   |
|:-----------|----------|---------------------------|
| user_id    | integer  | foreign_key: true         |
|groupe_id   | integer  | foreign_key: true         |

### Association
* belongs_to :user
* belomgs_to :groupe