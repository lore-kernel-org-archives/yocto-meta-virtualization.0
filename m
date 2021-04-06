Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web11.12368.1617717515072690251
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 06 Apr 2021 06:58:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=hBI1XWp3;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f47.google.com with SMTP id j4-20020a05600c4104b029010c62bc1e20so7369207wmi.3
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 06 Apr 2021 06:58:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=sT1WZM8cklDqD4k0uO8cH34Q+mRGPk2ZXBPVvVV8R94=;
        b=hBI1XWp3+8H5HvYUmRy9eYhiZR8Iui4yDsZVRAjJQG+/kcsoc7Ttv6QdMI3bangfBZ
         h9r24t/e7iBFJ+p6kuqnBsbpS2xVLxPo6oTFb04lagPebla1sz9Sy8rRICpNuQH6D/Sx
         /zzXWcUVddTooe79QyEkGoqviOcI/fZRxTWhc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=sT1WZM8cklDqD4k0uO8cH34Q+mRGPk2ZXBPVvVV8R94=;
        b=fMoDZeWIR/H9+RaY1n7kTUZzJOPSLHrqnWv8/KFbFUkfRNnMog2Fz/PfYghFS3e76G
         tLZ/+tR+sbutOAR7Ri53Q3H8d46Jo9M+dwZNLDYxLyj3DaBfrvaHg/PJqLYDwsXC/N8L
         XDdZO8cT6tSfYtDTn2XqcW2QnsqThtSiTRiWtTtzNNfYrroEoVjf/WFaaPxfoZVXb8RU
         0ghqYooe0rD6iNEQUtHNZ4mop/n2iPswlJ2z1B7qKgBkhsK+Bvt6mjHJejTeNt9cf0E9
         HQ6w+fGH/6syOIimWXk299Lsi97SuyJP5EC8tPTpAJJRQVGS3sq/ZxpTmL6n/exStVnm
         GB+Q==
X-Gm-Message-State: AOAM532YU+gDHqxBg3MIlBG0is7I7+7dDM/i+zVuVtUT4I4MhWnGoF6I
	Nec3Xtt78/jfaQhHQgo0g2Irlw==
X-Google-Smtp-Source: ABdhPJyd8WBMBLitYGVIlGmuw6lzEsEPVu9Q4PQR/riXMSquMu1aPnvDPALNPH3F1FC+Ur2KpYfpcg==
X-Received: by 2002:a1c:6a01:: with SMTP id f1mr4268831wmc.144.1617717513533;
        Tue, 06 Apr 2021 06:58:33 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:7a9e:d3b:5548:6469? ([2001:8b0:aba:5f3c:7a9e:d3b:5548:6469])
        by smtp.gmail.com with ESMTPSA id c9sm150976wme.20.2021.04.06.06.58.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Apr 2021 06:58:33 -0700 (PDT)
Message-ID: <d9f285551e4a9265bc225e8b02c18df1e16d753e.camel@linuxfoundation.org>
Subject: Re: [meta-virtualization] "FILESEXTRAPATHS_append" error in openvswitch_git.bb
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Bruce Ashfield <bruce.ashfield@gmail.com>, "Robert P. J. Day"
	 <rpjday@crashcourse.ca>
Cc: meta-virtualization@lists.yoctoproject.org
Date: Tue, 06 Apr 2021 14:58:32 +0100
In-Reply-To: <CADkTA4M8PpPDMf8hLQzZfsoyfDpZOeCvAhNMu5v1D39iU9s4Xw@mail.gmail.com>
References: <f65d58c1-c178-9980-f835-418f5bded250@crashcourse.ca>
	 <CADkTA4OhSe3z5Dv=SSFBA2dg_GZurw2QqjW=jxdu1ZFW__8EZg@mail.gmail.com>
	 <2ae08013-4ca0-d661-fb8c-e8b8164bef29@crashcourse.ca>
	 <CADkTA4PAUFvU=XNeksY8j9-SF+cJOHFbewHBw0s9ckju_Kw4Nw@mail.gmail.com>
	 <541ead14-9177-a6be-c1ad-1c9640833646@crashcourse.ca>
	 <CADkTA4M8PpPDMf8hLQzZfsoyfDpZOeCvAhNMu5v1D39iU9s4Xw@mail.gmail.com>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2021-04-06 at 09:13 -0400, Bruce Ashfield wrote:
> On Tue, Apr 6, 2021 at 9:07 AM Robert P. J. Day <rpjday@crashcourse.ca> wrote:
> > 
> > On Tue, 6 Apr 2021, Bruce Ashfield wrote:
> > 
> > > On Tue, Apr 6, 2021 at 8:40 AM Robert P. J. Day <rpjday@crashcourse.ca> wrote:
> > > > 
> > > > On Tue, 6 Apr 2021, Bruce Ashfield wrote:
> > > > 
> > > > > On Tue, Apr 6, 2021 at 5:35 AM Robert P. J. Day <rpjday@crashcourse.ca> wrote:
> > > > > > 
> > > > > > 
> > > > > >   this doesn't look right, but i don't know how one wants to resolve
> > > > > > it:
> > > > > > 
> > > > > 
> > > > > What part doesn't look right ? I don't see any issues with it.
> > > > > 
> > > > > Bruce
> > > > > 
> > > > > >   FILESEXTRAPATHS_append := "${THISDIR}/${PN}-git:"
> > > > 
> > > >   isn't the colon on the wrong end?
> > > 
> > > In a quick scan of other layers, they are all leaving the variable in
> > > the same state (with a trailing colon), whether they are using
> > > _prepend or _append.
> > 
> >   i beg to differ -- here's a single example:
> > 
> >   meta-intel/recipes-core/zlib/zlib-intel_1.2.11.1.jtkv6.3.bb:
> >     FILESEXTRAPATHS_append = ":${COREBASE}/meta/recipes-core/zlib/zlib"
> 
> Do a build with that. You have a double colon, so you found a bad
> example, unless
> the double colon is expected.
> 
> FILESEXTRAPATHS="__default::/home/poky/meta/recipes-core/zlib/zlib"

Anything using append should be adding a leading colon, anything prepending
should be adding a trailing one.

I suspect we need an audit and cleanup of several layers...

Cheers,

Richard

