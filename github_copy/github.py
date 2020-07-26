import requests
import json
import os
import pprint

pp = pprint.PrettyPrinter(indent=4)

def setup_repos(git_url: str):
    print(git_url)
    os.system(f'git clone {git_url}')

def call_api(url):
    r = requests.get(url)
    # print(r.status_code)
    data = r.json()
    # Parse JSON data and save to file
    # result = for_json(data)
    # # Save full JSON response and save to file
    # save_all_json(data)

    # Print result of JSON parse
    # print(data)
    count = 0
    for d in data:
        pp.pprint(d['git_url'])
        setup_repos(d['git_url'])
        # count += 1
        # if count == 20:
        #     break
        name= d['name']
        print(f"Complete clone of {name}")

url = "https://api.github.com/users/devsetgo/repos"


if __name__ == "__main__":

    call_api(url)