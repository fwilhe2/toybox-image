import urllib.request
import os
import platform
import subprocess

os.makedirs('rootfs/bin')
os.makedirs('rootfs/sbin')
os.makedirs('rootfs/usr/bin')
os.makedirs('rootfs/usr/sbin')

with urllib.request.urlopen(f'http://landley.net/toybox/bin/toybox-{platform.machine()}') as f:
    toybox = f.read()
    with open('rootfs/bin/toybox', 'wb') as file:
        file.write(toybox)
        os.chmod('rootfs/bin/toybox', 0o777)
    toybox_commands = subprocess.run(['rootfs/bin/toybox', '--long'], capture_output=True, text=True).stdout.split()
    print(toybox_commands)
    for c in toybox_commands:
        print(c)
        os.symlink('/bin/toybox', f'rootfs/{c}')
