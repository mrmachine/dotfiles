#!/usr/bin/env python
"""
Removes or consolidates active torrent data based on color label and seed time.
Removes orphaned torrent data.
"""
import datetime
import os
import requests
import shutil
import sys
import struct
import transmission
import xattr

client = transmission.Transmission()

DAYS_SEEDING = 10


def clean_torrents(torrents_dir, days_seeding=DAYS_SEEDING):
    """
    Removes or consolidates active torrent data based on color label and seed
    time. Removes orphaned torrent data.
    """
    # Validate arguments.
    if not os.path.isdir(torrents_dir):
        err('No such file or directory: %r' % torrents_dir)
    try:
        seconds_seeding = datetime.timedelta(days=int(days_seeding)) \
            .total_seconds()
    except ValueError:
        err('Invalid days_seeding: %r' % days_seeding)

    # Get torrents.
    try:
        torrents = client('torrent-get', fields=[
            'downloadDir', 'id', 'name', 'secondsSeeding'])['torrents']
    except requests.ConnectionError:
        err('Error: Unable to connect to Transmission')

    for torrent in torrents:
        # Already moved.
        if torrent['downloadDir'].startswith(torrents_dir):
            # Remove old torrents.
            if torrent['secondsSeeding'] >= seconds_seeding:
                sys.stdout.write(
                    'Removing old torrent: %s\n' % torrent['name'])
                client(
                    'torrent-remove',
                    ids=[torrent['id']], delete_local_data=True)
        # Not yet moved.
        else:
            # Get color label. Assume processed if set.
            color = get_color(os.path.join(
                torrent['downloadDir'], torrent['name']))
            # Skip torrents that have not been processed.
            if not color:
                sys.stdout.write('Skipping torrent: %s (no color label)\n' %
                                 torrent['name'])
                continue
            # Move recent torrents.
            location = os.path.join(
                torrents_dir, os.path.basename(torrent['downloadDir']))
            print 'Moving %s to %s' % (torrent['name'], location)
            client(
                'torrent-set-location',
                ids=[torrent['id']], location=location, move=True)

    # Remove orphaned torrent data.
    torrent_names = set(torrent['name'] for torrent in torrents)
    for dirname in os.listdir(torrents_dir):
        dirname = os.path.join(torrents_dir, dirname)
        if os.path.isdir(dirname):
            for filename in os.listdir(dirname):
                if filename not in torrent_names:
                    filename = os.path.join(dirname, filename)
                    sys.stdout.write(
                        'Removing orphaned torrent data: %s\n' % filename)
                    try:
                        shutil.rmtree(filename)
                    except OSError:
                        os.remove(filename)


def err(stderr):
    sys.stderr.write('%s\n' % stderr.strip())
    exit(1)


def get_color(filename):
    """
    Returns the color label for a filename.
    """
    colornames = {
        0: None,
        1: 'gray',
        2: 'green',
        3: 'purple',
        4: 'blue',
        5: 'yellow',
        6: 'red',
        7: 'orange',
    }
    attrs = xattr.xattr(filename)
    try:
        finder_attrs = attrs[u'com.apple.FinderInfo']
    except KeyError:
        color = 0
    else:
        flags = struct.unpack(32*'B', finder_attrs)
        color = flags[9] >> 1 & 7
    return colornames[color]


def main():
    if len(sys.argv) not in [2, 3]:
        message = 'Usage: %s <torrents_dir> [days_seeding=%s]' % (
            os.path.basename(sys.argv[0]),
            DAYS_SEEDING,
        )
        err(message)
    clean_torrents(*sys.argv[1:])


if __name__ == '__main__':
    main()
