Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web09.7364.1617966239485873321
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 09 Apr 2021 04:03:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=I24cJm4L;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f46.google.com with SMTP id f6so5210660wrv.12
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 09 Apr 2021 04:03:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=XgzGEDlWx4brG+WNc4z3Z4YjWgDIzCqp61Z6bOfDhsY=;
        b=I24cJm4LsuWDt1HDjYjTcHTmu3xrPciRio1kEMDKK74uXgtN8WerUN6wk5BWlHabdr
         gX7TaCUyR48GkoPLN3HHaCgKSzRySpuaUoQG1J9pDRvVGgfJfduzCTBzf/meafOpYxpu
         dpIpSbroDJgGq7vgUg9QAW1bsWc17z4yDPJMI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=XgzGEDlWx4brG+WNc4z3Z4YjWgDIzCqp61Z6bOfDhsY=;
        b=eWZ00C+mXJs7eGvSKUas7/SPk1UFDEUKKnl5Hwwgql0bFdOalUwnVtFlAyCoyeuMCT
         ACNBoQIFRjjnrjt60TwdoUpHqYg8KhGJAMw2T8PGT/oSssn2fM7yjONaJOYVrJSCJi5E
         6jV38oHje0dJN6SCmBUlq/S8311bQvOSBKT+9gtqtzuMFcNhXhVo5m7TaIV9mycMVXXv
         xypCQMT5bEJRBspbotb0V5jMDlwZPAG4cyeBwyMTlV2y+V1sqmYKatqiQGeoRupbAuLl
         laPRrShOHfFcbLj+8vDWaTCNUYA7n8tSuW6AuVmL84P7MAMefHRjTltSNxts81xUtbaD
         mjxA==
X-Gm-Message-State: AOAM531oUYz7iLFNmthdEqUNJ79gpH3egC3We8HEwMEhYWbvQ7RvDr7G
	n0AxTMoeHI/qULhY2aS75wKtHA==
X-Google-Smtp-Source: ABdhPJwU9M0ALLsfoqS8ZV9x+Z+2bat4GZzuTSMVbTFvHCXh6g83hpOWiZiSh0qT00ru82gJaRTDaA==
X-Received: by 2002:a05:6000:362:: with SMTP id f2mr17181130wrf.141.1617966237927;
        Fri, 09 Apr 2021 04:03:57 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:434b:3ea0:b8b8:6ecc? ([2001:8b0:aba:5f3c:434b:3ea0:b8b8:6ecc])
        by smtp.gmail.com with ESMTPSA id o38sm3187446wmp.37.2021.04.09.04.03.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Apr 2021 04:03:57 -0700 (PDT)
Message-ID: <5d8d2a086eb0fec5bd11dacc4507fe7dace9ffd3.camel@linuxfoundation.org>
Subject: Re: [meta-virtualization] "FILESEXTRAPATHS_append" error in openvswitch_git.bb
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: Peter Kjellerstedt <peter.kjellerstedt@axis.com>, Bruce Ashfield
	 <bruce.ashfield@gmail.com>, "meta-virtualization@lists.yoctoproject.org"
	 <meta-virtualization@lists.yoctoproject.org>
Date: Fri, 09 Apr 2021 12:03:56 +0100
In-Reply-To: <197a43c7-18d7-ab23-b269-58e0ecaf0c1@crashcourse.ca>
References: <f65d58c1-c178-9980-f835-418f5bded250@crashcourse.ca>
	  <CADkTA4OhSe3z5Dv=SSFBA2dg_GZurw2QqjW=jxdu1ZFW__8EZg@mail.gmail.com>
	  <2ae08013-4ca0-d661-fb8c-e8b8164bef29@crashcourse.ca>
	  <CADkTA4PAUFvU=XNeksY8j9-SF+cJOHFbewHBw0s9ckju_Kw4Nw@mail.gmail.com>
	 <541ead14-9177-a6be-c1ad-1c9640833646@crashcourse.ca>
	  <CADkTA4M8PpPDMf8hLQzZfsoyfDpZOeCvAhNMu5v1D39iU9s4Xw@mail.gmail.com>
	  <d9f285551e4a9265bc225e8b02c18df1e16d753e.camel@linuxfoundation.org>
	  <9f36d6a2b724481d9437b425145767f3@XBOX03.axis.com>
	 <4476d5aa824e0282887bda50172d7cd9bbf972e8.camel@linuxfoundation.org>
	 <197a43c7-18d7-ab23-b269-58e0ecaf0c1@crashcourse.ca>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fri, 2021-04-09 at 06:38 -0400, Robert P. J. Day wrote:
> On Fri, 9 Apr 2021, Richard Purdie wrote:
> 
> > On Fri, 2021-04-09 at 10:04 +0000, Peter Kjellerstedt wrote:
> > > > -----Original Message-----
> > > > From: meta-virtualization@lists.yoctoproject.org <meta-
> > > > virtualization@lists.yoctoproject.org> On Behalf Of Richard Purdie
> > > > Sent: den 6 april 2021 15:59
> > > > To: Bruce Ashfield <bruce.ashfield@gmail.com>; Robert P. J. Day
> > > > <rpjday@crashcourse.ca>
> > > > Cc: meta-virtualization@lists.yoctoproject.org
> > > > Subject: Re: [meta-virtualization] "FILESEXTRAPATHS_append" error in
> > > > openvswitch_git.bb
> > > > 
> > > > On Tue, 2021-04-06 at 09:13 -0400, Bruce Ashfield wrote:
> > > > > On Tue, Apr 6, 2021 at 9:07 AM Robert P. J. Day <rpjday@crashcourse.ca>
> > > > wrote:
> > > > > > 
> > > > > > On Tue, 6 Apr 2021, Bruce Ashfield wrote:
> > > > > > 
> > > > > > > On Tue, Apr 6, 2021 at 8:40 AM Robert P. J. Day
> > > > <rpjday@crashcourse.ca> wrote:
> > > > > > > > 
> > > > > > > > On Tue, 6 Apr 2021, Bruce Ashfield wrote:
> > > > > > > > 
> > > > > > > > > On Tue, Apr 6, 2021 at 5:35 AM Robert P. J. Day
> > > > <rpjday@crashcourse.ca> wrote:
> > > > > > > > > > 
> > > > > > > > > > 
> > > > > > > > > >   this doesn't look right, but i don't know how one wants to
> > > > resolve
> > > > > > > > > > it:
> > > > > > > > > > 
> > > > > > > > > 
> > > > > > > > > What part doesn't look right ? I don't see any issues with it.
> > > > > > > > > 
> > > > > > > > > Bruce
> > > > > > > > > 
> > > > > > > > > >   FILESEXTRAPATHS_append := "${THISDIR}/${PN}-git:"
> > > > > > > > 
> > > > > > > >   isn't the colon on the wrong end?
> > > > > > > 
> > > > > > > In a quick scan of other layers, they are all leaving the variable
> > > > in
> > > > > > > the same state (with a trailing colon), whether they are using
> > > > > > > _prepend or _append.
> > > > > > 
> > > > > >   i beg to differ -- here's a single example:
> > > > > > 
> > > > > >   meta-intel/recipes-core/zlib/zlib-intel_1.2.11.1.jtkv6.3.bb:
> > > > > >     FILESEXTRAPATHS_append = ":${COREBASE}/meta/recipes-core/zlib/zlib"
> > > > > 
> > > > > Do a build with that. You have a double colon, so you found a bad
> > > > > example, unless the double colon is expected.
> > > > > 
> > > > > FILESEXTRAPATHS="__default::/home/poky/meta/recipes-core/zlib/zlib"
> > > > 
> > > > Anything using append should be adding a leading colon, anything
> > > > prepending should be adding a trailing one.
> > > > 
> > > > I suspect we need an audit and cleanup of several layers...
> > > > 
> > > > Cheers,
> > > > 
> > > > Richard
> > > 
> > > Normally, I would agree with you. However, the definition of FILESEXTRAPATHS in
> > > meta/conf/bitbake.conf contradicts that:
> > > 
> > > FILESEXTRAPATHS ?= "__default:"
> > > 
> > > The benefit of that (I guess) is that the added string looks the same whether
> > > _prepend or _append is used. At the same time it is a bit confusing since
> > > this is not the normal pattern for adding to a colon-separated variable.
> > 
> > It gets worse unfortunately. See the code in classes/utils.bbclass which
> > handles this and the magic __default: value :/.
> > 
> > It is far from clear what is going on :(
> 
>   well, now that i've released the ferret into the henhouse, i see my
> work here is done. :-)

Great, we've found some issues but the real challenge is figuring out how 
to improve things and move forward from here. If you really want to help,
the work is just started.

If all these unresolved threads you're leaving are "someone else's problem", 
that effectively means you're just creating work for others and I know that
personally, I have a ton already but thanks for adding to the queue.

Cheers,

Richard

