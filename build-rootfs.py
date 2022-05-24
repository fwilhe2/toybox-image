import urllib.request
import os
import platform


os.makedirs('rootfs/bin')

with urllib.request.urlopen(f'http://landley.net/toybox/bin/toybox-{platform.machine()}') as f:
    toybox = f.read()
    with open('rootfs/bin/toybox', 'wb') as file:
        file.write(toybox)
        os.chmod('rootfs/bin/toybox', 0o777)