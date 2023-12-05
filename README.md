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

|Column       |Type       |Options         |
|-------------|-----------|----------------|
|image        |string     |                |
|name         |string     |null: false     |
|text         |text       |null: false     |
|category     |integer    |null: false     |
|condition    |integer    |null: false     |
|load         |integer    |null: false     |
|region       |integer    |null: false     |
|delivery_date|integer    |null: false     |
|user         |references |null: false foreign_key: true|



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
|post_num             |integer    |null: false    |
|region               |integer    |null: false    |
|city                 |string     |null: false    |
|street               |string     |null: false    |
|building             |string     |               |
|phone_num            |integer    |null: false    |
|bought               |references |null: false foreign_key: true|


### Association
- belongs_to :bought