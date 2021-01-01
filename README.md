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
    $ pip3 install --upgrade pip setuptools wheel
    $ pip3 install -r github_copy/requirements.txt
    $ cd ..
    $ python3 server_setup/github_copy/run.py
    $
    ```

## Other Suff
Please note, this is not the most secure way of securing credentials. You will need to get a Personal Access Token (https://github.com/settings/tokens).

- **Git Credentials**
    ```console

    $ git config --global credential.helper store
    $ git config --global user.name "Your Name"
    $ git config --global user.email "youremail@yourdomain.com"
    $ git config --global password

    ```