#!/usr/bin/env python

# chandl.py
# author: Thomas Dziedzic
# description: downloads all pictures on a 4chan board

from HTMLParser import HTMLParser
import urllib
import sys
import os

url = 'http://www.4chan.org/'
board = 'wg'

if len(sys.argv) > 1:
    board = sys.argv[1]

path = os.path.join('4chan', board)
if not os.path.exists (path):
    os.makedirs(path)

# parse html for boards
boards = {}
f = urllib.urlopen(url)
s = f.read()
f.close()
class BoardParser(HTMLParser):
    def handle_starttag(self, tag, attrs):
        classTag = [pair for pair in attrs if pair[0] == 'class']
        if tag == 'a' and len(classTag) == 1 and classTag[0][1] == 'boardlink':
            hrefTag = [pair for pair in attrs if pair[0] == 'href']
            titleTag = [pair for pair in attrs if pair[0] == 'title']
            href = hrefTag[0][1]
            title = titleTag[0][1]
            if len(title) > 0:
                boards[href.split('/')[-2]] = (title, href)
try:
    parser = BoardParser()
    parser.feed(s)
    parser.close()
except:
    # stupid malformed tags
    pass

# retrieves html content
f = urllib.urlopen(boards[board][1])
s = f.read()
f.close()

# parse html for board numbers
count = 0
class Parser(HTMLParser):
    encouteredBurichan = False

    def handle_starttag(self, tag, attrs):
        global count
        if tag == "a" and self.encouteredBurichan == True:
            count += 1
        if tag == 'form':
            self.encouteredBurichan = False

    def handle_data(self, data):
        if data == "Burichan":
            self.encouteredBurichan = True

parser = Parser()
parser.feed(s)
parser.close()
print '%i pages' % count

# create a list with current pages in board
pages = ['imgboard.html']
for i in range(1, count + 1):
    pages.append(str(i) + '.html')

for page in pages:
    # retrieve html content
    link = boards[board][1].split('imgboard.html')[0] + page
    print link
    f = urllib.urlopen(link)
    s = f.read()
    f.close()
    class ImageParser(HTMLParser):
        skipNext = False #4chan includes 2 consecutive links to the same image.
        
        def handle_starttag(self, tag, attrs):
            if tag == "a" and not self.skipNext:
                link = attrs[0][1]
                filename = link.split('/')[-1]
                fileext = filename.split('.')[-1]
                if fileext == 'jpg' and not os.path.exists(os.path.join(path, filename)):
                    f = urllib.urlopen(link)
                    print link
                    s = f.read()
                    f.close()
                    f = open(os.path.join(path, filename), 'wb')
                    f.write(s)
                    f.close()
                self.skipNext = True
            else:
                self.skipNext = False

    parser = ImageParser()
    parser.feed(s)
    parser.close()
