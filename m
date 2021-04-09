Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web09.7103.1617964355040354787
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 09 Apr 2021 03:32:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ZNS8Fiyk;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f51.google.com with SMTP id a6so5115858wrw.8
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 09 Apr 2021 03:32:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=ZWTKsWVOUPU8TUocAQbXUcMS4WNXute6Q5n86AQjaQA=;
        b=ZNS8Fiyk002/hXp7+xIv4U1UtBSRdcGHRvc3Xaxc0BwzjM7GRODPjqpd4sJ85olp+Z
         GR7kQGh4dEwAqD62EpJpqBYFEWUtBeY6xjigUl+ywNOeT9qF6/Agd4IarIKKaqCSRnz0
         pbKllPrVkBTpPB3qc63AMMpr2P8dxlzvzt4B4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=ZWTKsWVOUPU8TUocAQbXUcMS4WNXute6Q5n86AQjaQA=;
        b=oCOFINUvltcfhNr9CuVDsQ94renWZffs8fxYP8MP3hu0j0IncNbOPDNiybVcP9nBuR
         DZZDMZiYd9JbnnTXGNoOtM9O6dEcoVa86jpCM8r+Ufzk3LJKY0Ltr4rs4FFm3WzH1HpQ
         njhUOBse0AeZS0I3KPj73gGeDfROR9ufcRHYlILOjjbZarWRIX7mlIhtQ1t0Wgi5vfoQ
         dN2uBnk4iQtiKXLsBw2nCN+vzqeFY8U5RXcY4kt5OJuBlIHBxQaxKShY1KTPD0eotNc4
         Cjj0pL4+C/u/rb6eu+FTHVPLHQno3JbQssvxqCspj5Q7qPqKjFyZVN24r5pI0XUf+j2V
         XHoA==
X-Gm-Message-State: AOAM533+ObxV0q6HAvzSUFe5biUtZgM/i1KbYhs7OZB9l3DkGeeQvbxx
	FRN+/gRY+O0lEX/lgz3Et1HrVQ==
X-Google-Smtp-Source: ABdhPJygamT/zPsKFo24M8lMrN+WScI58ZGXDrB2DZ+iiCK531Wgkezh64atSGjyljGUQOriQNb+0g==
X-Received: by 2002:adf:fbc8:: with SMTP id d8mr16953469wrs.94.1617964353543;
        Fri, 09 Apr 2021 03:32:33 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:434b:3ea0:b8b8:6ecc? ([2001:8b0:aba:5f3c:434b:3ea0:b8b8:6ecc])
        by smtp.gmail.com with ESMTPSA id f24sm3152824wmb.32.2021.04.09.03.32.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Apr 2021 03:32:33 -0700 (PDT)
Message-ID: <4476d5aa824e0282887bda50172d7cd9bbf972e8.camel@linuxfoundation.org>
Subject: Re: [meta-virtualization] "FILESEXTRAPATHS_append" error in openvswitch_git.bb
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>, Bruce Ashfield
	 <bruce.ashfield@gmail.com>, "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: "meta-virtualization@lists.yoctoproject.org"
	 <meta-virtualization@lists.yoctoproject.org>
Date: Fri, 09 Apr 2021 11:32:30 +0100
In-Reply-To: <9f36d6a2b724481d9437b425145767f3@XBOX03.axis.com>
References: <f65d58c1-c178-9980-f835-418f5bded250@crashcourse.ca>
	 <CADkTA4OhSe3z5Dv=SSFBA2dg_GZurw2QqjW=jxdu1ZFW__8EZg@mail.gmail.com>
	 <2ae08013-4ca0-d661-fb8c-e8b8164bef29@crashcourse.ca>
	 <CADkTA4PAUFvU=XNeksY8j9-SF+cJOHFbewHBw0s9ckju_Kw4Nw@mail.gmail.com>
	 <541ead14-9177-a6be-c1ad-1c9640833646@crashcourse.ca>
	 <CADkTA4M8PpPDMf8hLQzZfsoyfDpZOeCvAhNMu5v1D39iU9s4Xw@mail.gmail.com>
	 <d9f285551e4a9265bc225e8b02c18df1e16d753e.camel@linuxfoundation.org>
	 <9f36d6a2b724481d9437b425145767f3@XBOX03.axis.com>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fri, 2021-04-09 at 10:04 +0000, Peter Kjellerstedt wrote:
> > -----Original Message-----
> > From: meta-virtualization@lists.yoctoproject.org <meta-
> > virtualization@lists.yoctoproject.org> On Behalf Of Richard Purdie
> > Sent: den 6 april 2021 15:59
> > To: Bruce Ashfield <bruce.ashfield@gmail.com>; Robert P. J. Day
> > <rpjday@crashcourse.ca>
> > Cc: meta-virtualization@lists.yoctoproject.org
> > Subject: Re: [meta-virtualization] "FILESEXTRAPATHS_append" error in
> > openvswitch_git.bb
> > 
> > On Tue, 2021-04-06 at 09:13 -0400, Bruce Ashfield wrote:
> > > On Tue, Apr 6, 2021 at 9:07 AM Robert P. J. Day <rpjday@crashcourse.ca>
> > wrote:
> > > > 
> > > > On Tue, 6 Apr 2021, Bruce Ashfield wrote:
> > > > 
> > > > > On Tue, Apr 6, 2021 at 8:40 AM Robert P. J. Day
> > <rpjday@crashcourse.ca> wrote:
> > > > > > 
> > > > > > On Tue, 6 Apr 2021, Bruce Ashfield wrote:
> > > > > > 
> > > > > > > On Tue, Apr 6, 2021 at 5:35 AM Robert P. J. Day
> > <rpjday@crashcourse.ca> wrote:
> > > > > > > > 
> > > > > > > > 
> > > > > > > >   this doesn't look right, but i don't know how one wants to
> > resolve
> > > > > > > > it:
> > > > > > > > 
> > > > > > > 
> > > > > > > What part doesn't look right ? I don't see any issues with it.
> > > > > > > 
> > > > > > > Bruce
> > > > > > > 
> > > > > > > >   FILESEXTRAPATHS_append := "${THISDIR}/${PN}-git:"
> > > > > > 
> > > > > >   isn't the colon on the wrong end?
> > > > > 
> > > > > In a quick scan of other layers, they are all leaving the variable
> > in
> > > > > the same state (with a trailing colon), whether they are using
> > > > > _prepend or _append.
> > > > 
> > > >   i beg to differ -- here's a single example:
> > > > 
> > > >   meta-intel/recipes-core/zlib/zlib-intel_1.2.11.1.jtkv6.3.bb:
> > > >     FILESEXTRAPATHS_append = ":${COREBASE}/meta/recipes-core/zlib/zlib"
> > > 
> > > Do a build with that. You have a double colon, so you found a bad
> > > example, unless the double colon is expected.
> > > 
> > > FILESEXTRAPATHS="__default::/home/poky/meta/recipes-core/zlib/zlib"
> > 
> > Anything using append should be adding a leading colon, anything
> > prepending should be adding a trailing one.
> > 
> > I suspect we need an audit and cleanup of several layers...
> > 
> > Cheers,
> > 
> > Richard
> 
> Normally, I would agree with you. However, the definition of FILESEXTRAPATHS in 
> meta/conf/bitbake.conf contradicts that:
> 
> FILESEXTRAPATHS ?= "__default:"
> 
> The benefit of that (I guess) is that the added string looks the same whether 
> _prepend or _append is used. At the same time it is a bit confusing since 
> this is not the normal pattern for adding to a colon-separated variable.

It gets worse unfortunately. See the code in classes/utils.bbclass which
handles this and the magic __default: value :/.

It is far from clear what is going on :(

Cheers,

Richard

