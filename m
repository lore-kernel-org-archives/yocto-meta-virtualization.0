Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web12.7074.1624625320124267446
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 25 Jun 2021 05:48:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=X5dOS+j2;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f43.google.com with SMTP id j1so10446056wrn.9
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 25 Jun 2021 05:48:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=xVT2rJdOltyqa3LtrLFOPBvXe+jVlmuI9bcKCiHyUQw=;
        b=X5dOS+j2wPS6ELnFivqut5W6/+jRrLCWMXvr95rUCrdIi1fJbpKuGepHdj/17M8QuC
         TbP35FcF/wi1Bt5dJ5slVdFtV5YJGVRDuL9IhTygDcY50YuDITFdab8KvF7gEewYNR3Z
         izPvr+QaP9KN3FAfQYTxW5Am+ktVdR8vXJrYs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=xVT2rJdOltyqa3LtrLFOPBvXe+jVlmuI9bcKCiHyUQw=;
        b=EWXdGgQwUY7P5KBVgupGKysIB+OmMyhNIwoY+BCaIlZxmPQf8YcZWOcxzbL6nJmbiL
         nTd2Kqml7WrKM6uD5+wvSFWdvYrFOMu6zUetscmVOajnv0xwio/MyJxTQETTxNYhlKQk
         MrSOcpZvWApPP6v3bGc8Uk9LGDsYbMW52aq4KGSgNwWZa8mn3VGgBHu7o919VtRkGxnS
         9xv9gOX17r9vFmFolC2dLOlSJkLNLiqh3qPXac1AQilfwY31mn4qKC7g+Jl7B0MUTjm/
         7n4hmVS8MJBOMmOtMqppqD6zeHq8DftxVlTws4tl2FKOH2hcYcFpQQmhPBwlgz5w/T6a
         IEhg==
X-Gm-Message-State: AOAM5333g9MRWJkrxl8nAHkWHWUkITs0C90X7S/e+vR0KJNpgvQr//VG
	uchSYKkIf63Ojb5PWbpJx+tGsg==
X-Google-Smtp-Source: ABdhPJxGSCkquRjA0qjkbuNlU0pADLytI4K04wC8Rfwued+u0b60ruuKRjhKo5FvXEAlY33W/XpTpw==
X-Received: by 2002:a05:6000:112:: with SMTP id o18mr10542804wrx.289.1624625318750;
        Fri, 25 Jun 2021 05:48:38 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:628a:47d1:4c03:7e6d? ([2001:8b0:aba:5f3c:628a:47d1:4c03:7e6d])
        by smtp.gmail.com with ESMTPSA id m184sm5525229wmm.26.2021.06.25.05.48.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Jun 2021 05:48:38 -0700 (PDT)
Message-ID: <be2bd019c9f0f8de87726310ccdbe476a0b3ac26.camel@linuxfoundation.org>
Subject: Re: [meta-virtualization][PATCH 1/3] podman: Add seccomp as REQUIRED_DISTRO_FEATURES
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Bruce Ashfield <bruce.ashfield@gmail.com>, Diego Sueiro
	 <Diego.Sueiro@arm.com>
Cc: Martin Jansa <martin.jansa@gmail.com>, 
	"meta-virtualization@lists.yoctoproject.org"
	 <meta-virtualization@lists.yoctoproject.org>, nd <nd@arm.com>
Date: Fri, 25 Jun 2021 13:48:36 +0100
In-Reply-To: <CADkTA4O5XShSxFr-5EASoKrTdqXY1z2XsJ5CF376cOoR2Ap+Jw@mail.gmail.com>
References: 
	<d9bb229282006df4f0bf945346312e1b53145a1e.1624561041.git.diego.sueiro@arm.com>
	 <CADkTA4Or9D4H3imLR9Pqgu2CB4VGPJO8Ng8qgReB0ridu=F_yQ@mail.gmail.com>
	 <CA+chaQfm5Q4dX8xE42N2GfPKZwWwZa3pR4ttH=jwX34PXkLz1Q@mail.gmail.com>
	 <CADkTA4P7gGBGTBdVLTFdSGiX5DDoHZc7ymmrcre+ifPA=vG7fA@mail.gmail.com>
	 <AM6PR08MB3461FE3409922F52F7A6ED2592069@AM6PR08MB3461.eurprd08.prod.outlook.com>
	 <CADkTA4O5XShSxFr-5EASoKrTdqXY1z2XsJ5CF376cOoR2Ap+Jw@mail.gmail.com>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2021-06-25 at 08:46 -0400, Bruce Ashfield wrote:
> On Fri, Jun 25, 2021 at 4:11 AM Diego Sueiro <Diego.Sueiro@arm.com> wrote:
> > 
> > > -----Original Message-----
> > > From: Bruce Ashfield <bruce.ashfield@gmail.com>
> > > Sent: 25 June 2021 03:49
> > > To: Martin Jansa <martin.jansa@gmail.com>
> > > Cc: Diego Sueiro <Diego.Sueiro@arm.com>; meta-
> > > virtualization@lists.yoctoproject.org; nd <nd@arm.com>
> > > Subject: Re: [meta-virtualization][PATCH 1/3] podman: Add seccomp as
> > > REQUIRED_DISTRO_FEATURES
> > > 
> > > On Thu, Jun 24, 2021 at 5:01 PM Martin Jansa <martin.jansa@gmail.com>
> > > wrote:
> > > > 
> > > > This change is correct, libseccomp still requires seccomp in
> > > DISTRO_FEATURES, so anything depending on it should have the same
> > > restriction.
> > > > 
> > > 
> > > Right, I understand how/why it works like this .. but it is super clunky when we
> > > can't just depend on something that is now in core, without needing to
> > > sprinkle distro checks everywhere.
> > > 
> > > As the list of recipes gets larger with that check, it really isn't an optional distro
> > > feature for using meta virt at all, and it would be nice if we could just do the
> > > check once and be done with it.
> > 
> > Just a side note that these patches fix issues with yocto-check-layer.
> 
> I've disagreed with check-layer before (and we've changed how it works)
> 
> That being said, the layer is checked on the AB, and Richard hasn't
> reported any issues. So clearly there's something wrong with the AB
> test or with something else.

https://autobuilder.yoctoproject.org/typhoon/#/builders/121/builds/110

Says green...

Obviously we just tweak the css :)

Cheers,

Richard

