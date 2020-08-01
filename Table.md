## 【DB設計】
### users table
|Column|Type|Option|
|------|----|------|
|name|string|null: false|
|email|string|null: false|
|password|string|null: false|
|icon|string||

#### Association
- has_many :messages
- has_many :likes, dependent: :destroy
- has_many :tweets
- has_many :genrus, through: users_genrus
- has_many :chats, through: users_chats

#### index(users)
|Table|Column|Option|
|------|----|------|
|users|name|unique: true|
|users|email|unique: true|


### genrus table
|Column|Type|Option|
|------|----|------|
|name|string|null: false, unique: true|

#### Association
- has_many :tweets
- has_many :groups
- has_many :users, through: users_genrus

### tweets table
|Column|Type|Option|
|------|----|------|
|text|text||
|image|text||
|user_id|integer|null: false, foreign_key: true|
|genru_id|integer|null: false, foreign_key: true|

#### Association
- belongs_to :user
- belongs_to :genru
- has_many :comments
- has_meny :likes, dependent: :destroy

### comments table
|Column|Type|Option|
|------|----|------|
|comment|text|null: false|
|user_id|integer|null: false, foreign_key: true|
|tweet-id|integer|null: false, foreign_key: true|

#### Association
- belongs_to :tweet

### groups table
|Column|Type|Option|
|------|----|------|
|name|string|null: false|
|otarank|integer|null: false|
|genru_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :genru
- has_many :messages
- has_many :users, through: users_chats
- has_many :tags, through: chats_tags

### index
|Table|Column|Option|
|------|----|------|
|chats|name|unipue|

### messages table
|Column|Type|Option|
|------|----|------|
|message|text||
|image|text||
|user_id|integer|null: false, foreign_key: true|
|group_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :chat
- belongs_to :user

### tags table
|Column|Type|Option|
|------|----|------|
|name|string|null: false, unique: true|

### Association
- has_many :chats, through: chats_tags

### likes table
|Column|Type|Option|
|------|----|------|
|user_id|integer|null: false, foreign_key: true|
|tweet_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :tweet

### users_genrus table
|Column|Type|Option|
|------|----|------|
|user_id|integer|null: false, foreign_key: true|
|genru_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :genru

### chats_tags table
|Column|Type|Option|
|------|----|------|
|tag_id|integer|null: false, foreign_key: true|
|group_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :chat
- belongs_to :tag

### users_chats table
|Column|Type|Option|
|------|----|------|
|user_id|integer|null: false, foreign_key: true|
|group_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :chat
