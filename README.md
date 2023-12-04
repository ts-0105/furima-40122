## usersTable

|Column    |Type       |Options        |
|----------|-----------|---------------|
|name      |string     |null: false    |
|email     |string     |null: false    | 
|password  |string     |null: false    |


### Association
- has_many :item
- has_many :bought
- has_many :address

## itemsTable

|Column       |Type       |Options        |
|-------------|-----------|---------------|
|name         |storing    |null: false    |
|condition    |storing    |null: false    |
|region       |storing    |null: false    |
|delivery_date|storing    |null: false    |
|user_id      |references |null: false    |



### Association
- belongs_to :user
- has_one :bought
-

## boughtsTable

|Column    |Type       |Options        |
|----------|-----------|---------------|
|bought    |string     |null: false    |
|user_id   |references |null: false    | 
|items_id  |references |null: false    |


### Association
- belongs_to :user
- belongs_to :item
-

## addressesTable

|Column               |Type       |Options        |
|---------------------|-----------|---------------|
|shipping_address     |string     |null: false    |
|shipping_source      |string     |null: false    | 
|user_id              |references |null: false    |


### Association
- belongs_to :user
-
-