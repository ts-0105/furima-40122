## usersTable

|Column              |Type       |Options        |
|--------------------|-----------|---------------|
|name                |string     |null: false    |
|email               |string     |null: false unique: true|
|encrypted_password  |string     |null: false    |
|lastname            |string     |null: false    |
|firstname           |string     |null: false    |
|lastname_kana       |string     |null: false    |
|firstname_kana      |string     |null: false    |
|birthday            |date       |null: false    |


### Association
- has_many :items
- has_many :boughts

## itemsTable

|Column           |Type       |Options         |
|-----------------|-----------|----------------|
|name             |string     |null: false     |
|text             |text       |null: false     |
|category_id      |integer    |null: false     |
|condition_id     |integer    |null: false     |
|load_id          |integer    |null: false     |
|region_id        |integer    |null: false     |
|delivery_date_id |integer    |null: false     |
|price            |integer    |null: false     |
|user             |references |null: false foreign_key: true|



### Association
- belongs_to :user
- has_one :bought


## boughtsTable

|Column    |Type       |Options        |
|----------|-----------|---------------|
|user      |references |null: false foreign_key: true| 
|item      |references |null: false foreign_key: true|


### Association
- belongs_to :user
- belongs_to :item
- has_one :address

## addressesTable

|Column               |Type       |Options        |
|---------------------|-----------|---------------|
|post_num             |string     |null: false    |
|region_id            |integer    |null: false    |
|city                 |string     |null: false    |
|street               |string     |null: false    |
|building             |string     |               |
|phone_num            |string     |null: false    |
|bought               |references |null: false foreign_key: true|


### Association
- belongs_to :bought