# README

## Intro

## Database Design And Schema

## API Endpoints

- `GET /api/v1/satellites/find_by_user_id?user_id={{user_id}}`
  - Returns all satellites associated with provided user_id.
- `GET /api/v1/messages/find_by_sat_id?sat_id={{sat_id}}`
  - Returns all messages associated with provided satellite database ID.
- `GET /api/v1/messages/find_by_norad_id?norad_id={{norad_id}}`
  - Returns all messages associated with a given NORAD satellite ID. 
- `POST /api/v1/user_satellite/create_user_satellite?user_id={{user_id}}&sat_id={{sat_id}}`
  - Creates a user_satellite instance, associating a user and a satellite object. 
  - This is triggered when a user creates a new message, adding that satellite to that user's list of satellites on their dashboard. 
- `GET /api/v1/find_or_create_user?username={{username/email}}&name={{name}}`
  - Finds an existing user in the database, or creates a new user if not found. 
  - Used in tandem with OAuth on front-end, allowing `User` table to be stored in backend database. 
- `GET /api/v1/satellites/{{sat_id}}`
  - Returns satellite object by database ID.
- `POST /api/v1/satellites?sat_id={{norad_id}}`
  - Creates a new satellite instance in the database if it does not already exist.
- `POST /api/v1/messages`
  - Accepts application/json post request. 
  - Requires including all message params in the request(`satellite_id`, `start_lat`, `start_lng`, and `content`)
- `GET /api/v1/messages/{{message_id}}`
  - Returns information about message associated with given ID, including message contents, satellite the message is associated with, and the location it was sent from. 