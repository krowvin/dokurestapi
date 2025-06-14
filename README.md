# DokuRestAPI

DokuRestAPI is a Python package that provides an easy-to-use interface for interacting with the DokuWiki web interface via its undocumented REST API. This package allows you to perform actions such as creating and deleting users, fetching user details, and managing other aspects of your DokuWiki instance programmatically.

If you would like to see other things added [create an issue](https://github.com/krowvin/dokurestapi/issues)! I've just been adding things as I need them.

## Features

- **User Management**: Create, delete, and fetch details of users.
- **Session Management**: Login and maintain sessions to interact with the API.
- **Integration**: Easily integrate with your DokuWiki instance using simple HTTP calls.

## Installation

Install the package using pip:

```sh
pip install dokurestapi
```

# Usage
First, make sure you have a .env file in your project directory with your DokuWiki credentials:
```env
DOKUWIKI_USERNAME=your_dokuwiki_username
DOKUWIKI_PASSWORD=your_dokuwiki_password
DOMAIN=https://path.toyourdoku.domain/andorsubdir
```

## Examples

### Login
```python
from dokurestapi.Login import Login

# Load credentials from .env file
import os
from dotenv import load_dotenv
load_dotenv()

username = os.getenv("DOKUWIKI_USERNAME")
password = os.getenv("DOKUWIKI_PASSWORD")
domain = os.getenv("DOMAIN")

with Login(username, password, domain) as login_session:
    if login_session.is_logged_in():
        print("Logged in successfully!")
    else:
        print("Login failed!")

```
### User Management
```python
from dokurestapi.Login import Login
from dokurestapi.Users import Users

# Load credentials from .env file
import os
from dotenv import load_dotenv
load_dotenv()

username = os.getenv("DOKUWIKI_USERNAME")
password = os.getenv("DOKUWIKI_PASSWORD")
domain = os.getenv("DOMAIN")

with Login(username, password, domain) as login_session:
    if login_session.is_logged_in():
        users = Users(login_session)
        
        # Get all users
        all_users = users.get_users()
        print(all_users)
        
        # Add a new user
        new_user = users.add_user(
            userid="newuser",
            username="New User",
            password="securepassword", # Leave blank to have it generate one!
            email="newuser@example.com",
            notify=True,
            groups=["user"]
        )
        print(new_user)
    else:
        print("Login failed!")
```

## API Reference
**Login**
The Login class handles the login process and session management.

* `Login(username, password, domain)`: Initializes the login class with the given credentials.
* `login(username=None, password=None)`: Logs in to DokuWiki. You can override the username and password.
* `logout()`: Logs out from DokuWiki and allows you to login as another user in the same script run
* `is_logged_in()`: Returns True if logged in, False otherwise.
* `get_username()`: Returns the username of the logged-in user.

**Users**
The Users class provides methods for user management.

* `get_user(username)`: Fetches details of a specific user.
* `get_users()`: Fetches a list of all users.
* `add_user(userid, username, password, email, notify=True, groups=["user"])`: Adds a new user with the specified details.

# Contributing
Contributions are welcome! Please feel free to submit a Pull Request or open an Issue.

# License
This project is licensed under the MIT License