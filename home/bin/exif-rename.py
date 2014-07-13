#!/usr/bin/env python
"""
Renames a file or all image files in a folder, according to the
`DateTimeOriginal` EXIF data.
"""
from PIL import Image
from PIL.ExifTags import TAGS
import datetime
import os
import re
import sys


def exif_rename(src, pattern='%Y-%m-%d at %H-%M-%S'):
    if not os.path.exists(src):
        err('%s: No such file or directory' % src)

    # Get list of image files from `src` file or folder.
    jpeg_pattern = re.compile(r'(?i)\.jpe?g$')
    if os.path.isdir(src):
        files = [
            os.path.join(src, f)
            for f in os.listdir(src) if jpeg_pattern.search(f)]
        if not files:
            err('%s: No JPEG images found' % src)
    else:
        if not jpeg_pattern.search(src):
            err('%s: Not a JPEG image' % src)
        files = [os.path.abspath(src)]

    for src in files:
        # Get `DateTimeOriginal` from EXIF.
        try:
            exif = Image.open(src)._getexif()
        except IOError as e:
            err('IOError: %s' % e.message)
        exif = {TAGS[k]: v for k, v in exif.items() if k in TAGS}
        original = exif.get('DateTimeOriginal', None)
        print original

        # Skip if we couldn't get `DateTimeOriginal`.
        if not original:
            continue

        # Get dirname, name and ext.
        dirname, basename = os.path.split(src)
        name, ext = os.path.splitext(basename.lower())

        # Convert `DateTimeOriginal` from string to datetime, then back to
        # string according to `pattern`.
        original = datetime.datetime \
            .strptime(original, '%Y:%m:%d %H:%M:%S').strftime(pattern)

        # Skip if name already matches `DateTimeOriginal` with optional index.
        if re.search(r'^%s( \(\d+\))?$' % original, name):
            continue

        # Add index to name if a file already exists.
        basename = original + ext
        i = 1
        while True:
            path = os.path.join(dirname, basename)
            if not os.path.exists(path):
                break
            basename = '%s (%s)%s' % (original, i, ext)
            i += 1

        # Rename file.
        dst = os.path.join(dirname, basename)
        os.rename(src, dst)


def err(stderr):
    sys.stderr.write('%s\n' % stderr.strip())
    exit(1)


def main():
    if len(sys.argv) not in [2, 3]:
        cmd = os.path.basename(sys.argv[0])
        err(
            'Usage: %s <file> [pattern]\n'
            '       %s <directory> [pattern]' % (cmd, cmd))
    exif_rename(*sys.argv[1:])


if __name__ == '__main__':
    main()
