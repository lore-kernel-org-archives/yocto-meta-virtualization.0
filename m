Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web12.11399.1617712814711963768
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 06 Apr 2021 05:40:15 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com ([174.114.107.13]:34418 helo=fedora)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1lTl09-00DCqt-8X; Tue, 06 Apr 2021 08:40:13 -0400
Date: Tue, 6 Apr 2021 08:40:10 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization] "FILESEXTRAPATHS_append" error in openvswitch_git.bb
In-Reply-To: <CADkTA4OhSe3z5Dv=SSFBA2dg_GZurw2QqjW=jxdu1ZFW__8EZg@mail.gmail.com>
Message-ID: <2ae08013-4ca0-d661-fb8c-e8b8164bef29@crashcourse.ca>
References: <f65d58c1-c178-9980-f835-418f5bded250@crashcourse.ca> <CADkTA4OhSe3z5Dv=SSFBA2dg_GZurw2QqjW=jxdu1ZFW__8EZg@mail.gmail.com>
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

On Tue, 6 Apr 2021, Bruce Ashfield wrote:

> On Tue, Apr 6, 2021 at 5:35 AM Robert P. J. Day <rpjday@crashcourse.ca> wrote:
> >
> >
> >   this doesn't look right, but i don't know how one wants to resolve
> > it:
> >
>
> What part doesn't look right ? I don't see any issues with it.
>
> Bruce
>
> >   FILESEXTRAPATHS_append := "${THISDIR}/${PN}-git:"

  isn't the colon on the wrong end?

rday
