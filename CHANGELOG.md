# CHANGELOG for sauceproxy

This file is used to list changes made in each version of sauceproxy.

## 0.1.8:

* SOP-2845 Upgrade to SauceConnect 3.0-r22 which solves the problem from the previous version

## 0.1.7:

* SOP-2812 chdir to the sauceproxy home before starting it up because the daemon tries to write to "./sauce_connect.log"

## 0.1.6:

* SOP-2812 Fix stupid failures on Sauceproxy download by greatly simplifying logic

## 0.1.5:

* SOP-2795 Upgrade to 3.0-r21
* FC001 compliance (even though it's not valid anymore, that's the style we've adopted)
* No longer need nightly_restart recipe
* Added a basic minitest and some unit tests

## 0.1.4:

* SOP-1686 Pin to version of Sauce Connect

## 0.1.3:

* SOP-1686 Remove nightly restart cron job

## 0.1.2:

* First locked version uploaded using Spork.

## 0.1.1:

* Wrote init script, sysconfig template

## 0.1.0:

* Initial release of sauceproxy

- - - 
Check the [Markdown Syntax Guide](http://daringfireball.net/projects/markdown/syntax) for help with Markdown.

The [Github Flavored Markdown page](http://github.github.com/github-flavored-markdown/) describes the differences between markdown on github and standard markdown.
