#!/usr/bin/env python
"""
Recursively hard links a source file or directory to a destination.
"""
import os, re, shell, sys

def hardlink(src, dst, local_mnt=None, remote_mnt=None):
	src = os.path.abspath(src)
	dst = os.path.abspath(dst)
	if local_mnt:
		local_mnt = os.path.abspath(local_mnt)

	# validate source.
	if not os.path.exists(src):
		err('hardlink: %s: No such file or directory' % src)
	# append source basename to destination for existing directories.
	if os.path.isdir(dst):
		dst = os.path.join(dst, os.path.basename(src))
	# validate destination. abort for existing files.
	if os.path.exists(dst):
		err('hardlink: %s: Already exists' % dst)

	# recursively link directories.
	if os.path.isdir(src):
		cwd = os.getcwd()
		try:
			os.makedirs(dst)
		except OSError:
			pass
		os.chdir(src)
		for local, dirs, files in os.walk('.'):
			for d in dirs:
				os.makedirs(os.path.join(dst, local, d))
			for f in files:
				srcfile = os.path.join(local, f)
				dstfile = os.path.join(dst, local, f)
				link(srcfile, dstfile, local_mnt, remote_mnt)
		os.chdir(cwd)

	# link single files.
	if os.path.isfile(src):
		try:
			os.makedirs(os.path.dirname(dst))
		except OSError:
			pass
		link(src, dst, local_mnt, remote_mnt)

def err(stderr):
	sys.stderr.write('%s\n' % stderr.strip())
	exit(1)

def link(src, dst, local_mnt, remote_mnt):
	if local_mnt and remote_mnt:
		remote_host, remote_path = remote_mnt.split(':')
		src = re.sub(r'^%s/' % local_mnt, remote_path, os.path.abspath(src))
		dst = re.sub(r'^%s/' % local_mnt, remote_path, os.path.abspath(dst))
		shell.shell("""ssh %s 'ln "%s" "%s"'""" % (remote_host, src, dst))
	else:
		os.link(src, dst)

def main():
	if len(sys.argv) not in [3, 5]:
		err('Usage: %s <src> <dst> [local_mnt] [remote_mnt]' %
			os.path.basename(sys.argv[0]))
	hardlink(*sys.argv[1:])

if __name__ == '__main__':
	main()
