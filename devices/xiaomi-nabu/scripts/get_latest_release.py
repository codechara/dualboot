#!/usr/bin/python3

import requests

def main():
    r = requests.get("https://api.github.com/repos/pocketblue/pocketblue/releases")
    releases = r.json()
    print(releases[0]["name"])

if __name__ == "__main__":
    main()
