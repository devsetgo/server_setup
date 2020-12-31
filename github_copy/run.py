# -*- coding: utf-8 -*-
import logging
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
    # os.system("git fetch")
    except Exception as e:
        logging.warning(e)
        return 0


@click.command()
@click.option("--github_profile", prompt="github profile name", help="e.g. devsetgo")
@click.option(
    "--max_repos", prompt="maximum number of public repos to retrieve", help="e.g. 50"
)
def call_api(github_profile, max_repos):
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

    tasks = [setup_repos(d["clone_url"]) for d in data]
    results = [task.result() for task in tasks]

    count = sum(results)

    t1 = time.time() - t0
    print(f"{count} repos cloned in {t1:.2f} seconds.")


if __name__ == "__main__":

    call_api()
