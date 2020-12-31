# Ubuntu Server Setup
These scripts should work on Ubuntu 18.04 and 20.04 LTS. The scripts are used to setup my server(s) on Digital Ocean.

These are not heavily tested, as I do this maybe once or twice a year. So treat it accordingly.

If you have suggests or improvements, please feel free to create an Issue or Pull Request.


## Server Setup
To use just clone the repo. You can also curl any of the scripts and change the permissions (works on Ubuntu 18.04 & 20.04).

- **Git Clone** <-- Easiest
    ```console

    $ git clone https://github.com/devsetgo/server_setup.git
    $ cd server_setup
    $ ./server_setup/setup.sh
    ```
- **Curl and Permissions set** <-- change url for whatever script you want to use
    ```console

    $ curl -O https://github.com/devsetgo/server_setup/blob/master/server_setup/setup.sh

    $ chmod +x script.sh
    $ ./setup.sh
    ```

## WSL2 Setup

- **Git Clone**
    ```console

    $ git clone https://github.com/devsetgo/server_setup.git
    $ cd server_setup
    $ ./wsl_setup/setup_general.sh

    ```
- **Clone Repos** from the server_setup main folder
```console

    $ python3 -venv _venv
    $ source _venv/bin/activate
    $ pip3 install -r github_copy/requirements.txt
    $ cd ..
    $ python3 server_setup/github_copy/run.py
    $
    ```






## Get and Execute Scripts
<!-- 
**Start**
```console
    $ mkdir setup_scripts
    $ cd setup_scripts
```

**Get Script(s)**

- **Full Setup (user, python, docker)**
    ```console
    $ curl -O https://raw.githubusercontent.com/devsetgo/server_setup/dev/scripts/setup_.sh
    ```
- **Python setup**
    ```console
    $ curl -O https://raw.githubusercontent.com/devsetgo/server_setup/dev/scripts/setup_.sh
    ```
- **Docker Setup**
    ```console
    $ curl -O https://raw.githubusercontent.com/devsetgo/server_setup/dev/scripts/setup_.sh
    ```

**Make script(s) Executable**

```console
$ chmod +x script.sh
```

**Run Scripts**

For full setup, this will create a user (e.g. mike) and install docker and python.
REMEMBER THIS IS RUNNING AS ROOT
```console
$ cd ..
$ ./scripts/setup.sh mike
```

For Python or Docker standalone
Assumption: Run from a non-root user who can perform sudo.
```console
$ ./scripts/<filenam>.sh
``` -->


