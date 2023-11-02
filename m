Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2781C4332F
	for <webhook@archiver.kernel.org>; Thu,  2 Nov 2023 19:13:40 +0000 (UTC)
Received: from mail-io1-f45.google.com (mail-io1-f45.google.com [209.85.166.45])
 by mx.groups.io with SMTP id smtpd.web10.41276.1698952420072481194
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 02 Nov 2023 12:13:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=W/rJdDVp;
 spf=pass (domain: gmail.com, ip: 209.85.166.45, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-io1-f45.google.com with SMTP id ca18e2360f4ac-7ad1236c419so10605539f.0
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 02 Nov 2023 12:13:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698952419; x=1699557219; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BiVu4YuZ+e19Gt5+8dH/cF5bRaVNBiEsGAGz14MF60Y=;
        b=W/rJdDVpEUYwD87czm4KYNICbzuxGmrw0OTIW7MwGN+thejFbfdQPopXWkt88HCrNG
         5dSCA+KmIKkbf1KuU4iaVLObf7Wb9FWOKWcUapt+iJSiVOwaA1Pnv6D9z+7xL+gXfm+h
         kxjP1W2zl7A6VY0ls6lmPRK2eopekdGTZmNUN3gugKcgXVACpC6R6aYG3fIZx5GqRbC5
         RrjlDVgTLAwpk7kB1Qk0/ZnLBYcnEBNj/pv4mqj7fRM7Ofy55x0uvsElKNwjHsJb/8DJ
         H2ir0O/fk3Km4caYiM4aoD+JoCVUnq3ukrP38fabGkGN+3+RGXUs8fbJS4qY+UIm4/7Y
         zjOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698952419; x=1699557219;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BiVu4YuZ+e19Gt5+8dH/cF5bRaVNBiEsGAGz14MF60Y=;
        b=VsRqWKDCBgJledV3PQLsYQBhh21V/1vNf7tyVE++17QuF2UswPa2umtImk1eldBaN2
         cyrdmOmiADweA5EZPNJrkfYcNhrBYDT38+hJY6XGVfOGeV5UyT1X7+Zre/4Ja089svLv
         7rV7KTb0uge1EPHhygVQBqEC7f155ZdI/hVvm4WjnxA+ZYOIjjL9sK0pEEyQLfMN05o0
         /NsrDzjCSR/OAez2WHDkkTTGcccyVhZbRgdw5Rf+oTvUJOhNYgYcrexWrUl+ts7bp44I
         rOADsRgUxX50BSTJgpsVLYyU/Jt+2vPI67dHGDluLIhOx4BEJyRxCUCCuWSpRip+iXz7
         5P9g==
X-Gm-Message-State: AOJu0Yw8AJRVpUAp4rqNH6gzZZqszDW681mQPeJnO2VYBdvRPdFyYz2G
	0StWBf5VSINtMI01ZyL4TQRKIn1mwEsTrgsKFnw=
X-Google-Smtp-Source: AGHT+IHTrauPWD/2ZQkFlM7F4ZAtUSN91FRh7nXqHXQjiMAxXPBz7yirMn8NUQdKjENwVM5QjvFWQcKD0XbjsEIfYjA=
X-Received: by 2002:a05:6602:1589:b0:7a2:dee5:84b6 with SMTP id
 e9-20020a056602158900b007a2dee584b6mr23429743iow.21.1698952419186; Thu, 02
 Nov 2023 12:13:39 -0700 (PDT)
MIME-Version: 1.0
References: <06ec1922fd901a02d492158a995cfbeeb158e379.camel@siemens.com>
In-Reply-To: <06ec1922fd901a02d492158a995cfbeeb158e379.camel@siemens.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 2 Nov 2023 15:13:27 -0400
Message-ID: <CADkTA4Mgak8=Hg1eFjUfXiskt5=QO0-cGyOA6zLn4Ck9EUn3GA@mail.gmail.com>
Subject: Re: use of yocto-cfg-fragments
To: "Sverdlin, Alexander" <alexander.sverdlin@siemens.com>
Cc: "meta-virtualization@lists.yoctoproject.org" <meta-virtualization@lists.yoctoproject.org>, 
	"adrian.freihofer@gmail.com" <adrian.freihofer@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 02 Nov 2023 19:13:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8413

Hi Alexander!

On Thu, Nov 2, 2023 at 6:24=E2=80=AFAM Sverdlin, Alexander
<alexander.sverdlin@siemens.com> wrote:
>
> Hello Bruce!
>
> Trying to understand the usage of SRC_URI type=3Dkmeta/kernel-cache in
> commits
> 5c2129118797 ("virtualization/config: allow conditional use of yocto-cfg-=
fragments")
> and 5be8686e659c ("kernel: fix conditional application of fragments").
>
> I have an issue implementing some locally-maintained fragments, I'm addin=
g
> "file://features/debug;type=3Dkmeta;destsuffix=3Dfeatures/debug" to SRC_U=
RI in my
> kernel recipe derived from kernel-yocto class and this actually works
> fine for me until I try to combine this with meta-virtualization.
>
> My current understanding is that
> meta-virtualization/recipes-kernel/linux/linux-yocto_virtualization.inc
> makes an assumption that any type=3Dkmeta will point to upstream
> git://git.yoctoproject.org/yocto-kernel-cache but this doesn't hold
> for my use case.

close.

The support assumes that if something is on the src_uri named
"kernel-cache" that it is a complete, similarly formatted repository
to the upstream / centralized one that I maintain

If that is found, it is preferred over the yocto-kernel-cache provided
by the yocto-cfg-fragments recipe.

That's why I have the similarly formatted stipulation above, since
it is locating a fragment based on a name and relative path. I could
easily drop that stipulation by doing more advanced searching,
but that hasn't been required so far.

All the above assumes that I don't have bugs in the implementation :)

side note: I just updated the yocto-cfg-fragments recipe to the latest
6.5 SRCREVs.

>
> The only type=3Dkmeta is my local file:// storage and the following
> linux-yocto_virtualization.inc part leads to fetch failure (fetch
> from Internet not expected/forbidden):
>
> # if kernel-yocto has been inherited (how we can check for configuration
> # fragment merging suport at the moment, then add a dependency on the
> # configuration fragment repository. This allows us to be sure that our
> # features can be enabled via the fragments
> do_kernel_metadata[depends] +=3D "${@['', 'yocto-cfg-fragments-native:do_=
populate_sysroot'][(bb.data.inherits_class('kernel-yocto', d))]}"
>
> Summary: 1 task failed:
> virtual:native:.../projects/ccp-sd-virt/../../meta-virtualization/recipes=
-kernel/linux/yocto-cfg-fragments.bb:do_fetch

At a glance, I'm not seeing how your local kmeta is causing
the full fragments recipe to fail to fetch.

>
> When I read the comment "if the kernel-yocto meta-data routine automatica=
lly
> starts to add the recipe-sysroot-native..." I get a feeling that
> this feature is still "work in progress". Are there any further developme=
nts
> I could test in this direction?

There's nothing that would fix that issue. The in-progress part of that
is that I plan to remove all of the local fragments in the virtualization
layer and rely on the cloned kernel-cache from that recipe.

I don't suppose there's a layer I can look at which has your fragments
and the related kernel bbappend ? I'd like to reproduce the issue
locally so I can debug it in more detail.

Bruce

>
> What would be a proper resolution of the above type=3Dkmeta usage conflic=
t from
> your PoV?
>
> --
> Alexander Sverdlin
> Siemens AG
> www.siemens.com



--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

