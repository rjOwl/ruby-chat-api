# README

### How to run:
- Using docker
    - make sure you have docker and docker compose installed
    - docker-compose up
- OR follow this to setup the dependencies: https://gorails.com/setup/ubuntu/22.04

# Postman Collection

<details>
<summary>Application endpoints</summary>

### index
- **Method**: GET
- **URL**: `http://localhost:3000/applications/`
- **Body**: 21e972f91b1c5c161ae8

### show
- **Method**: GET
- **URL**: `http://localhost:3000/applications/e807b8377b5158aace76`
- **Body**: (empty)

### create
- **Method**: POST
- **URL**: `http://127.0.0.1:3000/applications`
- **Body**:
  ```json
  {
      "name": "app1"
  }

### update

- **Method**: PUT
- **URL**: http://127.0.0.1:3000/applications/e807b8377b5158aace76
- **Body**:

  ```json

    {
        "name": "app1-updated",
        "chats_count": 4
    }

### destroy

- **Method**: DELETE
- **URL**: http://127.0.0.1:3000/applications/e0ed18a1ecaa7dd24cb8
- **Body**: (empty)
</details>

<details>
<summary>Chat endpoints</summary>

### index

- **Method**: GET
- **URL**: http://localhost:3000/applications/e807b8377b5158aace76/chats/
- **Body**: (empty)

### show

- **Method**: GET
- **URL**: http://localhost:3000/applications/e807b8377b5158aace76/chats/3
- **Body**: (empty)

### create

- **Method**: POST
- **URL**: http://127.0.0.1:3000/applications/e807b8377b5158aace76/chats
- **Body**: (empty)

### destroy

- **Method**: DELETE
- **URL**: http://localhost:3000/applications/e807b8377b5158aace76/chats/5
- **Body**: (empty)
</details>

<details>
<summary> Message endpoints</summary>

### index

- **Method**: GET
- **URL**: http://localhost:3000/applications/e807b8377b5158aace76/chats/3/messages
- **Body**: (empty)

### search

- **Method**: GET
- **URL**: http://localhost:3000/applications/e807b8377b5158aace76/chats/3/messages?query=increment
- **Body**: (empty)

### show

- **Method**: GET
- **URL**: http://localhost:3000/applications/e807b8377b5158aace76/chats/3/messages/1
- **Body**: (empty)

### create

- **Method**: POST
- **URL**: http://localhost:3000/applications/e807b8377b5158aace76/chats/3/messages
- **Body**:

  ```json

    {
        "body": "incrementttttttttttttthhutlffwfqhiuytttttttttttt"
    }

### search

- **Method**: POST
- **URL**: http://localhost:3000/applications/e807b8377b5158aace76/chats/3/messages/search
- **Body**:

  ```json

    {
        "body": "incrementttttttttttttthhutlffwfqhiuytttttttttttt"
    }

### update

- **Method**: PUT
- **URL**: http://localhost:3000/applications/e807b8377b5158aace76/chats/23/messages/1
- **Body**:

  ```json

    {
        "body": "updated222222222222asdasdasdasdasdasd222"
    }

### destroy

- **Method**: DELETE
- **URL**: http://localhost:3000/applications/e807b8377b5158aace76/chats/3/messages/3
- **Body**: (empty)
</details>

## Notes:
- For sql db we used indexes on the most used rows to enhance the querying like token and message.
- Used elasticsearch for free text search

- DB ERD:
![erd](https://github.com/rjOwl/ruby-chat-api/assets/11742610/2a4cae79-e8cf-46e5-bd4a-06a826038597)
