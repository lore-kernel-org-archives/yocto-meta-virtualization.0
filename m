Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web10.16137.1609618052672270643
 for <meta-virtualization@lists.yoctoproject.org>;
 Sat, 02 Jan 2021 12:07:33 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from cpef81d0f814063-cmf81d0f814060.cpe.net.cable.rogers.com ([174.114.57.56]:38718 helo=fedora)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1kvnBS-0003Z0-0s; Sat, 02 Jan 2021 15:07:31 -0500
Date: Sat, 2 Jan 2021 15:07:27 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization] what is the state of meta-cloud-services, re: chef/puppet/ruby recipes?
In-Reply-To: <CADkTA4Nf59A4F_JrPOtv77FK57nNEVjEvirhuegmWc=WwJzyhQ@mail.gmail.com>
Message-ID: <aceeb927-56eb-f93d-cdc3-9d9c3643dcdf@crashcourse.ca>
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

> No one has done much with the ruby support in quite some time, so it
> would need work as well. I thought there was a meta-ruby floating
> around, but I couldn't find it on the layerindex, so it looks like
> just oe-core + some work would be required.

  random thoughts after messing with various aspects of ruby for the
last couple days.

  first, would it not make sense to move the ruby.bbclass file to
oe-core? given the fundamental nature of ruby.bbclass, it seems
inappropriate to have it in a specialized layer like
meta-cloud-services. if oe-core has class files related to things like
perl and python, it would seem like ruby.bbclass belongs there as
well.

  also, i had to hack ruby.bbclass given the python 3 distinction
between strings and bytes in order to get some ruby variables to be
set properly:

diff --git a/classes/ruby.bbclass b/classes/ruby.bbclass
index 15ac9f4b..585d128d 100644
--- a/classes/ruby.bbclass
+++ b/classes/ruby.bbclass
@@ -26,7 +26,7 @@ def get_rubyversion(p):
     version = subprocess.Popen([cmd, "--version"],
stdout=subprocess.PIPE).communicate()[0]

     r = re.compile("ruby ([0-9]+\.[0-9]+\.[0-9]+)*")
-    m = r.match(version)
+    m = r.match(version.decode("utf-8"))
     if m:
         found_version = m.group(1)

@@ -44,6 +44,7 @@ def get_rubygemslocation(p):
        return found_loc

     loc = subprocess.Popen([cmd, "env"], stdout=subprocess.PIPE).communicate()[0]
+    loc = loc.decode("utf-8")

     r = re.compile(".*\- (/usr.*/ruby/gems/.*)")
     for line in loc.split('\n'):

  i'm sure there's a cleaner way to do that ... i can submit that, but
i'm not sure which ML to give it to.

  in any event, i'm still beating up on ruby, and it would be nice to
formalize how to get this organized.

rday
