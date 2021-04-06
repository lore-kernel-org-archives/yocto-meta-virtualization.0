Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web12.11780.1617714427204600365
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 06 Apr 2021 06:07:07 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from bras-base-otwaon0916w-grc-67-70-50-7-189.dsl.bell.ca ([70.50.7.189]:34514 helo=fedora)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1lTlQ9-00DIfz-Nu; Tue, 06 Apr 2021 09:07:06 -0400
Date: Tue, 6 Apr 2021 09:07:03 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization] "FILESEXTRAPATHS_append" error in openvswitch_git.bb
In-Reply-To: <CADkTA4PAUFvU=XNeksY8j9-SF+cJOHFbewHBw0s9ckju_Kw4Nw@mail.gmail.com>
Message-ID: <541ead14-9177-a6be-c1ad-1c9640833646@crashcourse.ca>
References: <f65d58c1-c178-9980-f835-418f5bded250@crashcourse.ca> <CADkTA4OhSe3z5Dv=SSFBA2dg_GZurw2QqjW=jxdu1ZFW__8EZg@mail.gmail.com> <2ae08013-4ca0-d661-fb8c-e8b8164bef29@crashcourse.ca>
 <CADkTA4PAUFvU=XNeksY8j9-SF+cJOHFbewHBw0s9ckju_Kw4Nw@mail.gmail.com>
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

> On Tue, Apr 6, 2021 at 8:40 AM Robert P. J. Day <rpjday@crashcourse.ca> wrote:
> >
> > On Tue, 6 Apr 2021, Bruce Ashfield wrote:
> >
> > > On Tue, Apr 6, 2021 at 5:35 AM Robert P. J. Day <rpjday@crashcourse.ca> wrote:
> > > >
> > > >
> > > >   this doesn't look right, but i don't know how one wants to resolve
> > > > it:
> > > >
> > >
> > > What part doesn't look right ? I don't see any issues with it.
> > >
> > > Bruce
> > >
> > > >   FILESEXTRAPATHS_append := "${THISDIR}/${PN}-git:"
> >
> >   isn't the colon on the wrong end?
>
> In a quick scan of other layers, they are all leaving the variable in
> the same state (with a trailing colon), whether they are using
> _prepend or _append.

  i beg to differ -- here's a single example:

  meta-intel/recipes-core/zlib/zlib-intel_1.2.11.1.jtkv6.3.bb:
    FILESEXTRAPATHS_append = ":${COREBASE}/meta/recipes-core/zlib/zlib"

anyway, i will defer to the community opinion on this.

rday

