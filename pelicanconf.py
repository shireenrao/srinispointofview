#!/usr/bin/env python
# -*- coding: utf-8 -*- #
from __future__ import unicode_literals

AUTHOR = u'Srini'
SITENAME = u"Srini's Point of View"
SITESUBTITLE = """My thoughts on technology, food and other fancies…"""
SITEURL = 'https://www.nyayapati.com/srao'

PATH = 'content'
CUSTOM_CSS = 'static/custom.css'
STATIC_PATHS = ['wp-content', 'images', 'static']
TIMEZONE = 'America/New_York'

DEFAULT_LANG = u'en'

TYPOGRIFY = True

# Feed generation is usually not desired when developing
FEED_ALL_ATOM = 'feeds/all.atom.xml'
CATEGORY_FEED_ATOM = None #'feeds/%s.atom.xml'
TRANSLATION_FEED_ATOM = None
AUTHOR_FEED_ATOM = None
AUTHOR_FEED_RSS = None

# Blogroll
#LINKS = (('Pelican', 'http://getpelican.com/'),
#         ('Python.org', 'http://python.org/'),
#         ('Jinja2', 'http://jinja.pocoo.org/'),
#         ('You can modify those links in your config file', '#'),)

# Social widget
#SOCIAL = (('twitter', 'http://twitter.com/shireenrao'),
#          ('github', 'http://github.com/shireenrao'),
#          ('linkedin', 'https://www.linkedin.com/in/shireenrao'),)
#          ('google+', 'https://plus.google.com/106272697451442541761'),
#          ('youtube', 'http://www.youtube.com/user/shireenrao?sub_confirmation=1'),
#          ('flickr', 'http://www.flickr.com/photos/sraopics'),
#          ('pinterest', 'http://www.pinterest.com/shireenrao'),
#          ('instagram', 'http://instagram.com/shireenrao'),)

DEFAULT_PAGINATION = 5

# Uncomment following line if you want document-relative URLs when developing
#RELATIVE_URLS = True

#Formatting urls
ARTICLE_URL = "{date:%Y}/{date:%m}/{slug}/"
ARTICLE_SAVE_AS = "{date:%Y}/{date:%m}/{slug}/index.html"
PAGE_URL = "pages/{slug}/"
PAGE_SAVE_AS = "pages/{slug}/index.html"
CATEGORY_URL = "category/{slug}/"
CATEGORY_SAVE_AS = "category/{slug}/index.html"
TAG_URL = "tag/{slug}/"
TAG_SAVE_AS = "tag/{slug}/index.html"

# Theme
THEME = "pelican-octopress-theme"

FAVICON_FILENAME = 'images/favicon.ico'
#social
TWITTER_USER = 'shireenrao'
FACEBOOK_LIKE = True

TWITTER_TWEET_BUTTON = True
TWITTER_FOLLOW_BUTTON = True

FAVICON_FILENAME = 'images/favicon.ico'

SIDEBAR_MY_NAME = 'Srinivas Nyayapati'
SIDEBAR_IMAGE = 'images/MyPic.JPG'
SIDEBAR_INTRO = """I am a technologist at heart. This blog covers my two biggest passions.. Technology and food. It's the place I collect my thoughts, work and findings."""

SIDEBAR_IMAGE_WIDTH = 120
SIDEBAR_IMAGE_ALT = "Learn more…"

GOOGLE_PLUS_ONE = True
SEARCH_BOX = True

PLUGIN_PATHS = ['plugins']
PLUGINS = ['neighbors',
           'related_posts',
           'sitemap',
           'tipue_search',
          ]
DIRECT_TEMPLATES = (('index', 'tags', 'categories', 'authors', 'archives', 'search'))
MD_EXTENSIONS = ['codehilite(css_class=highlight)', 'extra']

SITEMAP = {
    'format': 'xml',
    'priorities': {
        'articles': 0.5,
        'indexes': 0.5,
        'pages': 0.5
    },
    'changefreqs': {
        'articles': 'monthly',
        'indexes': 'daily',
        'pages': 'monthly'
    }
}

TAG_CLOUD_STEPS = 4
