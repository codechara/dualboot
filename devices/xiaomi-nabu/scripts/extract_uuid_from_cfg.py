#!/usr/bin/python3
import sys

def main():
    with open(sys.argv[-1], "r") as cfg:
        print(cfg.read().replace("\n", "").replace("\r", "").replace("\"", "").replace("set BOOT_UUID=", "")) # seoarate UUID from data

if __name__ == "__main__":
    main()
