Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCE53C433EF
	for <webhook@archiver.kernel.org>; Fri, 10 Jun 2022 14:03:19 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com
 [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web08.27448.1654869796071921556
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 10 Jun 2022 07:03:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Z2fuqKor;
 spf=pass (domain: gmail.com, ip: 209.85.210.176,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pf1-f176.google.com with SMTP id i64so381515pfc.8
        for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 10 Jun 2022 07:03:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hEMOASlvcsIuZQJkz0+wxsyLUDN2vn8aYHBXd85Azfc=;
        b=Z2fuqKor3AAD1JqP6/Sb3jTGl+KXGwPQcYdxciUmZru0IrkDOt5SwB3evKXoSWOxw9
         /o0rLf3HZK099mYwpaiQDGH6u5wPk8EtNjniqyTSrBtv4VaQsJKyKBZXIMiW7l67aUsb
         Dh1BC0Qd/9iPlIwpOmVOCDdFDQQNUPIH2K/2MRzf185wSc1skNRYqbdE+hxPqucZz2fc
         clntac07Hi8Bkjkrgo3ellEhh7Lk5hL0kl6sg3+VnZKF0T2bKxBmK7dKaCzMvKYk7XCD
         ZJ676pxbcdJPtCZ2MBdzcoCTk7yeAAXKkrprW3mj7dN5ENu8g9E6NvDZnXc8dMtcPdV/
         Z0uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hEMOASlvcsIuZQJkz0+wxsyLUDN2vn8aYHBXd85Azfc=;
        b=cL8SatawzY3tbdFJ7rVrQqyXJCQ+etdlFqL8aJgTZxmenBG37gcJPrFaukVE/2QrR1
         sVE8MOC0U/JxGgYGYQg7WI+AjqTJkilvY6SHGmFR5Ioid+YWI9SvI4OHMF/s7JE8cP5l
         nH6j0eJnXpAxfmwtCkKeoEu9WvTxzsayq33MRzBAA2+bYmPgCuVhHhEIzozVVKe0sm//
         mY4xVbbWZ5bSsaNJGj/F6sUzWUYm+Y5dUhsMk8bfZrUiMqAdMDp0mugtNZvQJ5J3KQH2
         eUJgdTPguWceEDL2Hb6GmjJuAJ7CaImjzX8IS2abW9eGplOpB1OeTDRWWceocvNi4X0b
         ExCQ==
X-Gm-Message-State: AOAM531EInNSSpqD9sRa4Xs1HyD+JH4rx6RmPGw7pobOn+22iB9Xrg+/
	4p7a+S1ql9XRu7FKng6shf+bPLTuQPhV3ZbtEzU=
X-Google-Smtp-Source: 
 ABdhPJwGr+l6HYAH+/Fs3JL8/AYAiBplIZj2bqqFw0TYUBcMjdb9rGw5qxF28C/wNw6a6/dNr/gC/kYKL83zzM3vvdA=
X-Received: by 2002:a05:6a00:1c5c:b0:505:7469:134a with SMTP id
 s28-20020a056a001c5c00b005057469134amr46091860pfw.16.1654869795476; Fri, 10
 Jun 2022 07:03:15 -0700 (PDT)
MIME-Version: 1.0
References: <20220610042053.4051-1-Qi.Chen@windriver.com>
 <20220610042053.4051-2-Qi.Chen@windriver.com>
 <CADkTA4OVCWoKY3TLAtAqzkGGUgsJt_Dgh=iHpwnDJdugWDD=tg@mail.gmail.com>
 <CO6PR11MB56025C31C487BD7ECF4EA2C1EDA69@CO6PR11MB5602.namprd11.prod.outlook.com>
In-Reply-To: 
 <CO6PR11MB56025C31C487BD7ECF4EA2C1EDA69@CO6PR11MB5602.namprd11.prod.outlook.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 10 Jun 2022 10:03:03 -0400
Message-ID: 
 <CADkTA4OH00TRuDAHs8fi=02xKxv=_74-fv=z8t_keyjGeq=0rA@mail.gmail.com>
Subject: Re: [meta-virtualization][master][kirkstone][PATCH 2/3]
 docker-distribution: fix build error on new hosts
To: "Chen, Qi" <Qi.Chen@windriver.com>
Cc: "meta-virtualization@lists.yoctoproject.org"
 <meta-virtualization@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 10 Jun 2022 14:03:19 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7369

On Fri, Jun 10, 2022 at 9:58 AM Chen, Qi <Qi.Chen@windriver.com> wrote:
>
> Hi Bruce,
>
> Got it. I'll adjust these CGO_XXX settings and send out V2 next week.
>

Sounds good to me. Thanks for adjusting them!

I will merge your docker-distribution fix though, since it is
unrelated to the flags.

I'm doing some upgrades to the packages right now, but will make sure
to not impact the changes I know you are making.

Bruce

> Regards,
> Qi
>
> -----Original Message-----
> From: Bruce Ashfield <bruce.ashfield@gmail.com>
> Sent: Friday, June 10, 2022 9:01 PM
> To: Chen, Qi <Qi.Chen@windriver.com>
> Cc: meta-virtualization@lists.yoctoproject.org
> Subject: Re: [meta-virtualization][master][kirkstone][PATCH 2/3] docker-distribution: fix build error on new hosts
>
> On Fri, Jun 10, 2022 at 12:21 AM Chen Qi <Qi.Chen@windriver.com> wrote:
> >
> > The CGO_CFLAGS and other related variables have already been set
> > appropriately by the go.bbclass in oe-core. Setting them in this
> > recipe is not only unncessary but also error prone.
> >
> > For example CGO_CFLAGS is set to use BUILDSDK_CFLAGS, and this is
> > incorrect. We need target flags instead of SDK related flags. Such
> > setting happens to work for some hosts. However, when building on
> > newer hosts, we get QA error like below:
> >
> >   ERROR: docker-distribution-v2.7.1-r0 do_package_qa:
> >   QA Issue: /usr/sbin/registry contained in package docker-registry requires
> >   libc.so.6(GLIBC_2.34)(64bit), but no providers found in
> > RDEPENDS_docker-registry? [file-rdeps]
> >
> > The above error was found on hardknott on host Fedora 35.
> > Tracking down the error and I found it's using host stuff which is
> > likely to be caused by using incorrect CGO_CFLAGS. As the master
> > branch is using the same settings, it has the same issue.
>
> And as I mentioned, feel free to adjust the flags and explicit settings, but I won't be dropping them.
>
> I've been through 6 years of getting these recipes working, and continually being broken by changes in the core classes, so I'm not going to drop the explicit settings.
>
> Bruce
>
> >
> > Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> > ---
> >  .../docker-distribution/docker-distribution_git.bb       | 9 ---------
> >  1 file changed, 9 deletions(-)
> >
> > diff --git
> > a/recipes-containers/docker-distribution/docker-distribution_git.bb
> > b/recipes-containers/docker-distribution/docker-distribution_git.bb
> > index 1d074bf3..679bcf8b 100644
> > ---
> > a/recipes-containers/docker-distribution/docker-distribution_git.bb
> > +++ b/recipes-containers/docker-distribution/docker-distribution_git.b
> > +++ b
> > @@ -23,17 +23,8 @@ inherit go systemd
> >  EXTRA_OEMAKE="BUILDTAGS=''"
> >
> >  do_compile() {
> > -       export GOARCH="${TARGET_GOARCH}"
> >         export GOPATH="${WORKDIR}/git/"
> > -       export GOROOT="${STAGING_LIBDIR_NATIVE}/${TARGET_SYS}/go"
> > -       # Pass the needed cflags/ldflags so that cgo
> > -       # can find the needed headers files and libraries
> > -       export CGO_ENABLED="1"
> > -       export CFLAGS=""
> > -       export LDFLAGS=""
> > -       export CGO_CFLAGS="${BUILDSDK_CFLAGS} --sysroot=${STAGING_DIR_TARGET}"
> >         export GO_GCFLAGS=""
> > -       export CGO_LDFLAGS="${BUILDSDK_LDFLAGS} --sysroot=${STAGING_DIR_TARGET}"
> >         export GO111MODULE=off
> >
> >         cd ${S}
> > --
> > 2.36.0
> >
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#7356):
> > https://lists.yoctoproject.org/g/meta-virtualization/message/7356
> > Mute This Topic: https://lists.yoctoproject.org/mt/91662218/1050810
> > Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> > Unsubscribe:
> > https://lists.yoctoproject.org/g/meta-virtualization/unsub
> > [bruce.ashfield@gmail.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

