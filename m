Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web09.23547.1609007325983951260
 for <meta-virtualization@lists.yoctoproject.org>;
 Sat, 26 Dec 2020 10:28:46 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from cpef81d0f814063-cmf81d0f814060.cpe.net.cable.rogers.com ([174.114.57.56]:52466 helo=localhost.localdomain)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1ktEJ1-0002vl-Bk
	for meta-virtualization@lists.yoctoproject.org; Sat, 26 Dec 2020 13:28:44 -0500
Date: Sat, 26 Dec 2020 13:28:39 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: meta-virtualization@lists.yoctoproject.org
Subject: what is the state of meta-cloud-services, re: chef/puppet/ruby recipes?
Message-ID: <aee11c2c-09f-1c4-3a0-13b1b2338030@crashcourse.ca>
MIME-Version: 1.0
X-OutGoing-Spam-Status: No, score=-1.0
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel8.indieserve.net
X-AntiAbuse: Original Domain - lists.yoctoproject.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Get-Message-Sender-Via: cpanel8.indieserve.net: authenticated_id: rpjday+crashcourse.ca/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: cpanel8.indieserve.net: rpjday@crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Content-Type: text/plain; charset=US-ASCII


  followup to earlier post of mine on main yocto mailing list, now
that i realize this is the right place.

  using gatesgarth version of layers, i want to test build puppet,
chef and a number of ruby recipes, then dig into how to extend/create
my own ruby recipes, but i want to first verify what shape the
meta-cloud-services layer is in.

  if i use "qemux86-64" as my target, i started off with "bitbake
puppet" and that seemed to work (it didn't in earlier versions, but i
see no point rehashing that here).

  i then moved on to "bitbake chef", hoping to verify that an
absolutely generic build would work -- customization would come
later. now, even though chef doesn't need "yard", it does depend on
yard-native, and i have other needs for "yard" later so i tried:

  $ bitbake yard

and got:

ERROR: yard-0.8.7.6-r0 do_fetch: Fetcher failure: Unable to find
revision d83194e1a09098ec5be28b616cde3b9a15380873 in branch master
even from upstream
ERROR: yard-0.8.7.6-r0 do_fetch: Fetcher failure for URL:
'git://github.com/lsegal/yard.git'. Unable to fetch URL from any
source.
ERROR: Logfile of failure stored in:
/home/rpjday/oe/builds/puppet/build/tmp/work/core2-64-poky-linux/yard/0.8.7.6-r0/temp/log.do_fetch.1418067
ERROR: Task
(/home/rpjday/oe/dist/layers/meta-cloud-services/meta-openstack/recipes-devtools/ruby/yard_git.bb:do_fetch)
failed with exit code '1'

well, there's an obvious reason for that -- yard is one of the many
recipes that succumbed to political correctness and renamed "master"
to "main", so a quick patch:

   SRC_URI = " \
  -    git://github.com/lsegal/yard.git \
  +    git://github.com/lsegal/yard.git;branch=main \
       "

resolved that issue and i got a build for yard, but that's a bit
worrisome -- that seems like a really blatant error in that it clearly
won't even allow yard to build. obviously, i can submit a patch, but
it makes me wonder what other trivial gotchas are waiting for me.

  with that patch in place, i figured i'd try the following, which i
would need for chef, anyway:

  $ bitbake yard-native

ERROR: yard-native-0.8.7.6-r0 do_compile: Execution of
'/home/rpjday/oe/builds/puppet/build/tmp/work/x86_64-linux/yard-native/0.8.7.6-r0/temp/run.do_compile.1419759'
failed with exit code 1:
ERROR:  Gemspec file not found: yard-native.gemspec.gemspec

  i'm still digging into gemspec files, but it looks really weird that
the file suffix is ".gemspec.gemspec", as if the code somewhere is
accidentally adding one of the suffixes, not realizing something else
will be adding it a second time.

  am i investing my time wisely? has anyone else got a working
puppet/chef/general ruby build environment up and running? sorry for
not being more specific, but i don't want to spend hours only to find
that no one is looking after this layer.

rday


