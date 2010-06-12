#!/usr/bin/env python
from subprocess import Popen, PIPE

file = open("/etc/pacman.conf", "r")
pacconf = file.read().split('\n')
for line in pacconf:
	if line.startswith("IgnorePkg"):
		break

IgnoreList = line.split("=")[1].strip()
repos = {'community' : 'K', 'testing' : 'T', 'core' : 'C', 'extra' : 'X', 'community-testing': 'Z'}

output = Popen(["pacman", "-Qu"], stdout=PIPE).communicate()[0]
if len > 0:
	updates = [item.split(' ') for item in output.split('\n') if item]
	for update in updates:
		p1 = Popen(["pacman", "-Si", update[0]], stdout=PIPE)
		p2 = Popen(["grep", "-e", "^Ver", "-e", "^Repo"], stdin=p1.stdout, stdout=PIPE)
		pacinfo = [item.split(': ')[1] for item in  p2.communicate()[0].split('\n') if item]
		repo = repos[pacinfo[0]]
		pkgname = update[0]
		curver = update[1]
		newver = pacinfo[1]
		if update[0] in IgnoreList:
			color = ""
			newver = "HELD"
		else:
			color = "green"
		print "%s ${color %s}%s${color} ${alignr}%s > %s" % (repo, color, pkgname, curver, newver)
