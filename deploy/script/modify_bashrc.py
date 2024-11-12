#!/usr/bin/env python
import argparse
import getpass
import os
import sys

parser = argparse.ArgumentParser(description="")
# parser.add_argument("action", help="action: upload, download, ssh")
parser.add_argument("--file", type=str, help="script file for ssh")
parser.add_argument("--cmd", type=str, help="root")
args, remaining_args = parser.parse_known_args()


def main():
    files = args.file.split(",")
    cmd = args.cmd
    print("[modify_bashrc] cmd: ", cmd)
    for file in files:
        if not file.startswith("/"):
            file = os.path.expanduser(f"~/{file}")
        content = ""
        if os.path.exists(file):
            with open(file, "r") as f:
                content = f.read()
        print("[modify_bashrc] check: ", file)
        if cmd not in content:
            with open(file, "a") as f:
                f.write(cmd)
                print(f"add to {file}: {cmd}")


if __name__ == '__main__':
    # current_user = getpass.getuser()
    # current_user2 = os.getlogin()
    # print(current_user, current_user2)
    print(sys.argv)
    main()
