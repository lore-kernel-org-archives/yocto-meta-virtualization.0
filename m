Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web08.7499.1617966490970800693
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 09 Apr 2021 04:08:11 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com ([174.114.107.13]:35054 helo=fedora)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1lUozc-00BO5r-Qp; Fri, 09 Apr 2021 07:08:09 -0400
Date: Fri, 9 Apr 2021 07:08:01 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
cc: Peter Kjellerstedt <peter.kjellerstedt@axis.com>, 
    Bruce Ashfield <bruce.ashfield@gmail.com>, 
    "meta-virtualization@lists.yoctoproject.org" <meta-virtualization@lists.yoctoproject.org>
Subject: Re: [meta-virtualization] "FILESEXTRAPATHS_append" error in openvswitch_git.bb
In-Reply-To: <5d8d2a086eb0fec5bd11dacc4507fe7dace9ffd3.camel@linuxfoundation.org>
Message-ID: <547e1a4-639f-7684-fd8f-cfb497cf2dd5@crashcourse.ca>
References: <f65d58c1-c178-9980-f835-418f5bded250@crashcourse.ca>   <CADkTA4OhSe3z5Dv=SSFBA2dg_GZurw2QqjW=jxdu1ZFW__8EZg@mail.gmail.com>   <2ae08013-4ca0-d661-fb8c-e8b8164bef29@crashcourse.ca>   <CADkTA4PAUFvU=XNeksY8j9-SF+cJOHFbewHBw0s9ckju_Kw4Nw@mail.gmail.com>
  <541ead14-9177-a6be-c1ad-1c9640833646@crashcourse.ca>   <CADkTA4M8PpPDMf8hLQzZfsoyfDpZOeCvAhNMu5v1D39iU9s4Xw@mail.gmail.com>   <d9f285551e4a9265bc225e8b02c18df1e16d753e.camel@linuxfoundation.org>   <9f36d6a2b724481d9437b425145767f3@XBOX03.axis.com> 
 <4476d5aa824e0282887bda50172d7cd9bbf972e8.camel@linuxfoundation.org>  <197a43c7-18d7-ab23-b269-58e0ecaf0c1@crashcourse.ca> <5d8d2a086eb0fec5bd11dacc4507fe7dace9ffd3.camel@linuxfoundation.org>
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
Content-Type: multipart/mixed; boundary="8323328-2140380017-1617966484=:11933"

--8323328-2140380017-1617966484=:11933
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Fri, 9 Apr 2021, Richard Purdie wrote:

> On Fri, 2021-04-09 at 06:38 -0400, Robert P. J. Day wrote:
> > On Fri, 9 Apr 2021, Richard Purdie wrote:
> >
> > > On Fri, 2021-04-09 at 10:04 +0000, Peter Kjellerstedt wrote:
> > > > > -----Original Message-----
> > > > > From: meta-virtualization@lists.yoctoproject.org <meta-
> > > > > virtualization@lists.yoctoproject.org> On Behalf Of Richard Purdie
> > > > > Sent: den 6 april 2021 15:59
> > > > > To: Bruce Ashfield <bruce.ashfield@gmail.com>; Robert P. J. Day
> > > > > <rpjday@crashcourse.ca>
> > > > > Cc: meta-virtualization@lists.yoctoproject.org
> > > > > Subject: Re: [meta-virtualization] "FILESEXTRAPATHS_append" error in
> > > > > openvswitch_git.bb
> > > > >
> > > > > On Tue, 2021-04-06 at 09:13 -0400, Bruce Ashfield wrote:
> > > > > > On Tue, Apr 6, 2021 at 9:07 AM Robert P. J. Day <rpjday@crashcourse.ca>
> > > > > wrote:
> > > > > > >
> > > > > > > On Tue, 6 Apr 2021, Bruce Ashfield wrote:
> > > > > > >
> > > > > > > > On Tue, Apr 6, 2021 at 8:40 AM Robert P. J. Day
> > > > > <rpjday@crashcourse.ca> wrote:
> > > > > > > > >
> > > > > > > > > On Tue, 6 Apr 2021, Bruce Ashfield wrote:
> > > > > > > > >
> > > > > > > > > > On Tue, Apr 6, 2021 at 5:35 AM Robert P. J. Day
> > > > > <rpjday@crashcourse.ca> wrote:
> > > > > > > > > > >
> > > > > > > > > > >
> > > > > > > > > > >   this doesn't look right, but i don't know how one wants to
> > > > > resolve
> > > > > > > > > > > it:
> > > > > > > > > > >
> > > > > > > > > >
> > > > > > > > > > What part doesn't look right ? I don't see any issues with it.
> > > > > > > > > >
> > > > > > > > > > Bruce
> > > > > > > > > >
> > > > > > > > > > >   FILESEXTRAPATHS_append := "${THISDIR}/${PN}-git:"
> > > > > > > > >
> > > > > > > > >   isn't the colon on the wrong end?
> > > > > > > >
> > > > > > > > In a quick scan of other layers, they are all leaving the variable
> > > > > in
> > > > > > > > the same state (with a trailing colon), whether they are using
> > > > > > > > _prepend or _append.
> > > > > > >
> > > > > > >   i beg to differ -- here's a single example:
> > > > > > >
> > > > > > >   meta-intel/recipes-core/zlib/zlib-intel_1.2.11.1.jtkv6.3.bb:
> > > > > > >     FILESEXTRAPATHS_append = ":${COREBASE}/meta/recipes-core/zlib/zlib"
> > > > > >
> > > > > > Do a build with that. You have a double colon, so you found a bad
> > > > > > example, unless the double colon is expected.
> > > > > >
> > > > > > FILESEXTRAPATHS="__default::/home/poky/meta/recipes-core/zlib/zlib"
> > > > >
> > > > > Anything using append should be adding a leading colon, anything
> > > > > prepending should be adding a trailing one.
> > > > >
> > > > > I suspect we need an audit and cleanup of several layers...
> > > > >
> > > > > Cheers,
> > > > >
> > > > > Richard
> > > >
> > > > Normally, I would agree with you. However, the definition of FILESEXTRAPATHS in
> > > > meta/conf/bitbake.conf contradicts that:
> > > >
> > > > FILESEXTRAPATHS ?= "__default:"
> > > >
> > > > The benefit of that (I guess) is that the added string looks the same whether
> > > > _prepend or _append is used. At the same time it is a bit confusing since
> > > > this is not the normal pattern for adding to a colon-separated variable.
> > >
> > > It gets worse unfortunately. See the code in classes/utils.bbclass which
> > > handles this and the magic __default: value :/.
> > >
> > > It is far from clear what is going on :(
> >
> >   well, now that i've released the ferret into the henhouse, i see my
> > work here is done. :-)
>
> Great, we've found some issues but the real challenge is figuring
> out how to improve things and move forward from here. If you really
> want to help, the work is just started.
>
> If all these unresolved threads you're leaving are "someone else's
> problem", that effectively means you're just creating work for
> others and I know that personally, I have a ton already but thanks
> for adding to the queue.

  i'm more than happy to submit patches, after i've verified that i
actually understand the problem and someone else verifies that there
*is* a problem.

  patches forthcoming.

rday

--8323328-2140380017-1617966484=:11933--
