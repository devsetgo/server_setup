import requests
import json
import os
import pprint

# Setup
pp = pprint.PrettyPrinter(indent=4)
# Set Github username here
GITHUB_USERNAME: str =  'devsetgo'
# Set maximum number of repo to loop through 
MAX_REPO: int = 200

def setup_repos(git_url: str):
    """
    Run git clone command for repo
    """
    os.system(f'git clone {git_url}')

def call_api(url):
    """
    call Github API for User
    Loop through all repos and call
    """
    r = requests.get(url)
    # print(r.status_code)
    data = r.json()

    for d in data:
        pp.pprint(d['git_url'])
        setup_repos(d['git_url'])
        name= d['name']
        print(f"Complete clone of {name}")

# Gets the first 200 most recent repos
url = f"https://api.github.com/users/{GITHUB_USERNAME}/repos?sort=updated&per_page={MAX_REPO}"


if __name__ == "__main__":

    call_api(url)