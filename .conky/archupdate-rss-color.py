#!/usr/bin/env python
import feedparser
from pacman import database

feed = feedparser.parse("http://www.archlinux.org/feeds/packages/")
db = database()
updateCount = 0

repos = {'Community' : 'K', 'Testing' : 'T', 'Core' : 'C', 'Extra' : 'X', 'Community-Testing': 'Z'}
months = ('Febtober', 'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec')
hide_uninstalled = 1

def printLine(color, month, day, repo, pkg, pkg_ver):
	print '${color %s} %s/%s %s %s %s' % (color, month, day, repo, pkg, pkg_ver)

for item in feed["items"]:
	if item["tags"][1]['term'] in ['x86_64', 'any']:
		update = item["title"].split()				#[0] = name, [1] = version
		repo = item["tags"][0]['term']
		date = item["updated"].split()
		

		# match up the update against the repos
		search = db.search_by_name(update[0])
		for pkg in search:	
			if update[0] == pkg.name and repo.lower() == pkg.repo.lower():
				break

		if not len(search) or pkg.inst_ver == "-":
			color = ""
		elif update[1] > pkg.inst_ver:				#package needs updating
			color = "yellow"
		elif update[1] == pkg.inst_ver:				#package is updated
			color = "green"

		if not (hide_uninstalled and color == ""):
			updateCount += 1
			printLine(color, months.index(date[2]), date[1], repos[repo], update[0], update[1])

if not updateCount:
	print "\n${alignc}--no updates in feed--"
