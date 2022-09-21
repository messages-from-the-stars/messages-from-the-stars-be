# README

## Intro

## Database Design And Schema

(insert DB diagram screenshot)



## API Endpoints

### `GET /api/v1/satellites/find_by_user_id?user_id={{user_id}}`

- **Purpose:** Returns all satellites associated with provided user_id.
```
https://messages-from-the-stars-be.herokuapp.com/api/v1/satellites/find_by_user_id?user_id=1 
```
- **Example response:** 
```json
  {
    "data": [
        {
            "id": "117",
            "type": "satellite",
            "attributes": {
                "norad_id": 3597
            }
        },
        {
            "id": "123",
            "type": "satellite",
            "attributes": {
                "norad_id": 837
            }
        }
    ]
}
```

### `GET /api/v1/messages/find_by_sat_id?sat_id={{sat_id}}`
  - Returns all messages associated with provided satellite database ID.
  - **Example request:**
```
https://messages-from-the-stars-be.herokuapp.com/api/v1/messages/find_by_sat_id?sat_id=3
```
  - **Example response:**
  ```json
  {
    "data": [
        {
            "id": "36",
            "type": "message",
            "attributes": {
                "satellite_id": 3,
                "start_lat": 25.72070389115322,
                "start_lng": -147.91088486228148,
                "content": "Rich gifts wax poor when givers prove unkind.",
                "created_at": "2021-11-29T13:20:35.000Z",
                "updated_at": "2022-09-14T05:20:30.000Z"
            }
        }
    ]
}
  ```
### `GET /api/v1/messages/find_by_norad_id?norad_id={{norad_id}}`
  - Returns a *count* of all messages associated with given NORAD ID. 
  - **Example request:**
  - **Example response:**
```
[
    "27763",
    5
]
```
### `POST /api/v1/user_satellite/create_user_satellite?user_id={{user_id}}&sat_id={{sat_id}}`
  - Creates a user_satellite instance, associating a user and a satellite object. 
  - This is triggered when a user creates a new message, adding that satellite to that user's list of satellites on their dashboard. 
  - **Example request:**
  - **Example response:**
### `GET /api/v1/find_or_create_user?username={{username/email}}&name={{name}}`
  - Finds an existing user in the database, or creates a new user if not found. Used in tandem with OAuth on front-end, allowing `User` table to be stored in backend database. 
  - **Example request:**
  - **Example response:**
### `GET /api/v1/satellites/{{sat_id}}`
  - Returns satellite object by database ID.
  - **Example request:**
  - **Example response:**
### `POST /api/v1/satellites?sat_id={{norad_id}}`
  - Creates a new satellite instance in the database if it does not already exist.
  - **Example request:**
  - **Example response:**
### `POST /api/v1/messages`
  - Accepts application/json post request. 
  - Requires including all message params in the request(`satellite_id`, `start_lat`, `start_lng`, and `content`)
  - **Example request:**
  - **Example response:**
### `GET /api/v1/messages/{{message_id}}`
  - Returns information about message associated with given ID, including message contents, satellite the message is associated with, and the location it was sent from.
  - **Example request:**
```
https://messages-from-the-stars-be.herokuapp.com/api/v1/messages/1
```
  - **Example response:**

```json
{
    "data": {
        "id": "1",
        "type": "message",
        "attributes": {
            "satellite_id": 7,
            "start_lat": -6.700576759545427,
            "start_lng": 178.10153887995511,
            "content": "A little more than kin, and less than kind.",
            "created_at": "2022-04-18T20:32:53.000Z",
            "updated_at": "2022-01-31T16:42:06.000Z"
        }
    }
}
```