# DB設計

## users table
| Column     | Type     | Options                   |
|:-----------|----------|---------------------------|
| name       | string   | null: false, unique: true |

### Association
* has_many :messages
* has_many :groups, through: :group_users

### Index
* add_index :users, :name

## messages table
| Column     | Type     | Options                   |
|:-----------|----------|---------------------------|
| body       | text     |                           |
| image      | string   |                           |
| user_id    | integer  | foreign_key: true         |
| group_id   | integer  | foreign_key: true         |
### Association
* belongs_to :user
* belongs_to :group

### groups table
| Column     | Type     | Options                   |
|:-----------|----------|---------------------------|
| name       | string   | null: false               |

### Association
* has_many :messages
* has_many :users, through: :group_users

### group_users table
| Column     | Type     | Options                   |
|:-----------|----------|---------------------------|
| user_id    | integer  | foreign_key: true         |
| group_id   | integer  | foreign_key: true         |

### Association
* belongs_to :user
* belomgs_to :group