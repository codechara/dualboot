#!/usr/bin/python3

import requests

def main():
    r = requests.get("https://api.github.com/repos/pocketblue/pocketblue/releases")
    releases = r.json()

    for asset in releases[0]["assets"]:
        if "xiaomi-nabu-gnome-desktop" in asset["name"]:
            print(asset["browser_download_url"])

if __name__ == "__main__":
    main()
