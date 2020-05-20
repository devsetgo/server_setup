# Ubuntu Server Setup 
These scripts should work on Ubuntu 18.04 and 20.04 LTS. The scripts are used to setup my server(s) on Digital Ocean. 

These are not heavily tested, as I do this maybe once or twice a year. So treat it accordingly.

If you have suggests or improvements, please feel free to create an Issue or Pull Request.

# Get and Execute Scripts

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
$ y
```
for Python or Docker standalone
Assuming this is run from a non-root user who can perform sudo.
