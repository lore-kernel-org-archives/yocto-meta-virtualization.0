Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web11.11623.1609597218309703844
 for <meta-virtualization@lists.yoctoproject.org>;
 Sat, 02 Jan 2021 06:20:18 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com ([174.114.100.179]:45394 helo=fedora)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1kvhlP-0007Wu-Qd; Sat, 02 Jan 2021 09:20:16 -0500
Date: Sat, 2 Jan 2021 09:20:14 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization] what is the state of meta-cloud-services, re: chef/puppet/ruby recipes?
In-Reply-To: <CADkTA4Nf59A4F_JrPOtv77FK57nNEVjEvirhuegmWc=WwJzyhQ@mail.gmail.com>
Message-ID: <4720fd3-e8d0-544f-2388-15f275d631@crashcourse.ca>
References: <aee11c2c-09f-1c4-3a0-13b1b2338030@crashcourse.ca> <CADkTA4Nf59A4F_JrPOtv77FK57nNEVjEvirhuegmWc=WwJzyhQ@mail.gmail.com>
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

On Sun, 27 Dec 2020, Bruce Ashfield wrote:

... snip ...

> No one has done much with the ruby support in quite some time, so it
> would need work as well. I thought there was a meta-ruby floating
> around, but I couldn't find it on the layerindex, so it looks like
> just oe-core + some work would be required.

  dumb question alert: i'm currently going through all of the ruby
recipes in meta-openstack, doing the occasional fixup to get them to
build on the master branch, and i can see that all(?) of those recipes
define a SRC_URI that downloads a proper .gemspec file for each
recipe, which allows the recipe to build.

  *however*, even though a number of those recipes BBCLASSEXTEND to
class "native", it's not possible to build the native variants as the
error is that there is no gemspec file for the native variant. which
is why i get:

  $ bitbake yard-native
  ...
  Log data follows:
  | DEBUG: Executing shell function do_compile
  | ERROR:  Gemspec file not found: yard-native.gemspec
  ... snip ...

what's the magic to build native ruby recipes? does one actually have
to define a distinct native version of the gemspec file for each
recipe?

rday
