Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web09.2942.1625039920802271526
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 30 Jun 2021 00:58:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=SdAPGbS+;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f53.google.com with SMTP id m41-20020a05600c3b29b02901dcd3733f24so3714593wms.1
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 30 Jun 2021 00:58:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=VudgxpIDlu35tMyM8MaQqApSLZFDFdUzyWmVrZs/3rE=;
        b=SdAPGbS+B/dEQJwfGzn2BZdMGZi425H3mtLTAkvKy66urDf5u6L9W3hrBdDyttG64w
         hlxdzPu1DzUsR15+jj7oPZZIHDYtnmPIlz3c9nBqi56JsFPy8Iylh7sR44G55XbwfIu6
         ky8yh3iegTFIOkLAF7nNcFTsKzQH6jSIKABBY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=VudgxpIDlu35tMyM8MaQqApSLZFDFdUzyWmVrZs/3rE=;
        b=SyBKV/Lr/HNzxh+lyEY6YMSofk4gRZp6NMBlW3ULTPCFwETYXyUhX2L5WfvhuuadQ+
         Tws+lZVaonxNbvgzUVm5a5FtY8gXaSPQF40nB3PSHKgOt724zdFkV61mG4hde1p/Pqgi
         7ekccbgDl9V3fuQvSLDAOHXmR+5KSxl42TFKLqrAO8+A7TNv1KArnQHX9szLe/uQ17ai
         lvD58qEEihcTaltrYXc99G5bp8jfrdh7OtRKi+wRO/6pR0rtAXSas99jRNAUEk5gytcO
         UYQRs1YDD9Y4nGCuHmoVSkngmnazNoEeU2NFXHeqS1Nr7lsVUZZx6ILiU1zlgqDzxY9a
         WOfQ==
X-Gm-Message-State: AOAM530ypkZFoZYrZnlez09drt4S0Wb2R4zpaIsb3AVwyeVk070wFyOF
	lrgL4Xgv1NlSXbxATQDN4qbEsw==
X-Google-Smtp-Source: ABdhPJwbwC/9bi3BkdgOrCjF2FkOxAFSsZ7TWIUHR/SFjIC87+A8VZwo1VuaXiYPlYegkAADBQRZMw==
X-Received: by 2002:a1c:c208:: with SMTP id s8mr21683149wmf.37.1625039919334;
        Wed, 30 Jun 2021 00:58:39 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:fa9c:ff43:b5c6:d04f? ([2001:8b0:aba:5f3c:fa9c:ff43:b5c6:d04f])
        by smtp.gmail.com with ESMTPSA id o3sm3990036wrw.56.2021.06.30.00.58.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Jun 2021 00:58:38 -0700 (PDT)
Message-ID: <dff2419f8628febf129a41d00cd11dc66465d21b.camel@linuxfoundation.org>
Subject: Re: [meta-virtualization][PATCH 1/3] podman: Add seccomp as REQUIRED_DISTRO_FEATURES
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Diego Sueiro <Diego.Sueiro@arm.com>, Martin Jansa
 <martin.jansa@gmail.com>,  "meta-virtualization@lists.yoctoproject.org"
 <meta-virtualization@lists.yoctoproject.org>, nd <nd@arm.com>
Date: Wed, 30 Jun 2021 08:58:35 +0100
In-Reply-To: <CADkTA4PNTH0nUb8XH-UcD2+vfA6zYbRVu9ETy9M7HhrC9QMiTw@mail.gmail.com>
References: 
	<d9bb229282006df4f0bf945346312e1b53145a1e.1624561041.git.diego.sueiro@arm.com>
	 <CADkTA4Or9D4H3imLR9Pqgu2CB4VGPJO8Ng8qgReB0ridu=F_yQ@mail.gmail.com>
	 <CA+chaQfm5Q4dX8xE42N2GfPKZwWwZa3pR4ttH=jwX34PXkLz1Q@mail.gmail.com>
	 <CADkTA4P7gGBGTBdVLTFdSGiX5DDoHZc7ymmrcre+ifPA=vG7fA@mail.gmail.com>
	 <AM6PR08MB3461FE3409922F52F7A6ED2592069@AM6PR08MB3461.eurprd08.prod.outlook.com>
	 <CADkTA4O5XShSxFr-5EASoKrTdqXY1z2XsJ5CF376cOoR2Ap+Jw@mail.gmail.com>
	 <CA+chaQeZG57ZxMd+wOc4pUfNJLF61ZK8tOkKPmN6Eph9iiDYHg@mail.gmail.com>
	 <AM6PR08MB34615D753470426E1679E0A192069@AM6PR08MB3461.eurprd08.prod.outlook.com>
	 <168BDC4B6AEEB1F5.20368@lists.yoctoproject.org>
	 <168BDC756BE2FF71.10690@lists.yoctoproject.org>
	 <CADkTA4PNTH0nUb8XH-UcD2+vfA6zYbRVu9ETy9M7HhrC9QMiTw@mail.gmail.com>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2021-06-29 at 23:27 -0400, Bruce Ashfield wrote:
> On Fri, Jun 25, 2021 at 11:21 AM Bruce Ashfield via
> lists.yoctoproject.org
> > > That is the core of what I was asking. A package that is now in core,
> > > why is it only enabled by a distro feature ?
> > > 
> > 
> > And for clarity, I realize that the systemd recipe checks for the
> > systemd distro feature .. so that is similar. But systemd is one of
> > many init managers, so I can see why it is used.
> 
> I still don't have a better solution to this, and while I see about
> getting seccomp behaviour changed in core, I can get this into the
> tree.
> 
> I've added the extra seccomp dependent recipes and expect to merge
> this on Wednesday.

The reason for the distro_feature is to have a way to configure multiple
packageconfigs on/off centrally. Some platforms don't support seccomp
at all (riscv/arc) so forcing it on everywhere isn't possible.

I think we can remove the DISTRO_FEATURE restriction in the seccomp recipe itself
in core and replace it with a COMPATIBLE_HOST declaration.

We could also add the option to the default distro backfill.

Cheers,

Richard

