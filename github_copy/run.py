# -*- coding: utf-8 -*-
import logging
from math import fabs
import os
import time

import click
import requests
from unsync import unsync


@unsync
def setup_repos(git_url: str):
    """
    Run git clone command for repo
    """
    try:
        os.system(f"git clone {git_url}")
        return 1
    
    except Exception as e:
        logging.warning(e)
        return 0


@click.command()
@click.option("--github_profile", prompt="github profile name", help="e.g. devsetgo", default="devsetgo")
@click.option(
    "--max_repos", prompt="maximum number of public repos to retrieve", help="e.g. 100", default="100"
)
@click.option(
    "--skip_archive", prompt="skip archived repos", help="e.g. yes, no, y, or n", default="yes"
)
def call_api(github_profile, max_repos, skip_archive):
    """
    call Github API for User
    Loop through all repos and call
    """
    try:
        max_repos = int(max_repos)

    except ValueError:
        logging.warning(
            f"Maximum repos must be an integer and\
        not a {type(max_repos)}"
        )
        exit()

    # Gets the most recent repos
    url = f"https://api.github.com/users/{github_profile}/repos?sort=\
    updated&per_page={max_repos}"

    t0 = time.time()
    r = requests.get(url)
    logging.info(f"Fetching Repos for {github_profile}")
    data = r.json()

    if skip_archive == "yes" or skip_archive == "y":
        new_data = skip_archived(repos=data)
    else:
        new_data = data

    tasks = [setup_repos(d["clone_url"]) for d in new_data]
    results = [task.result() for task in tasks]

    # print(new_results)
    print(type(results))
    count = len(results)

    t1 = time.time() - t0
    print(f"{count} repos cloned in {t1:.2f} seconds.")

def skip_archived(repos:list)->list:
    new_list:list=[]
    for repo in repos:
        if repo["archived"]==False:
            new_list.append(repo)
    return new_list


if __name__ == "__main__":

    call_api()
