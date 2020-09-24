Received: from mail-ej1-f67.google.com (mail-ej1-f67.google.com [209.85.218.67])
 by mx.groups.io with SMTP id smtpd.web12.20054.1600962100236216458
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 24 Sep 2020 08:41:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=lZtABCkL;
 spf=pass (domain: gmail.com, ip: 209.85.218.67, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f67.google.com with SMTP id nw23so5138180ejb.4
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 24 Sep 2020 08:41:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=8smgSn1r7Yad0omNFJLDlooxDUhPVvA+WuKNkXacfYo=;
        b=lZtABCkLwXJQbiHlBMaYglZ9LewpsmLYcdQGX0Utq0LA2ljtpiQpBPNGdFZmbN7Vs5
         V5zOLC0qdb9LgkVbnJjIMrNdJGt3UxZ3j93qW2G7YsboScZVW9+YC2mnm9T+ALfqTKo+
         9I9g0ziXV9m6sK3I0o+7WrSir9CICU3a0WLi22+8SVDN6NDX3RUw3Ji9rAkrbg6WuUAs
         obs2RwPY9ARa7EmzEGpvIXnNZxhoGGx4A7JL1MG1bA2wM/8V2xkqUj/Z5uf6exSyKLPA
         ZVMQgltKfltHoSYuf15IROQZZhnr2HXg6iEWolWyTIrkEK98P2ulXU6oMaC9reosA3cI
         5Lrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=8smgSn1r7Yad0omNFJLDlooxDUhPVvA+WuKNkXacfYo=;
        b=thLbQbE3pkJ3U7IqapgtE3hzyh1cF7ESvSrOCqVDwj/GMyfHGmJH2xkp7zDwL3v7rM
         wkxaobJF0MOmK+kysr39WjPrjb0ZFVtQ0bk+8D5IhKwLSTD4i7e2bcWItf8A8j1/gltG
         l+mapwDYkYYuBKgtVra5soNk8qYjMde5F8ff+vLKFTrexySWJK2anPtqGCUSqEurvbiN
         arAw+zr9vVOOx10nSG2qp6TafAj84hlMpNXzjK36CK9IycC+bbrWeQQHbNEBmfCE5bE7
         cpGf1TYJWXHx4cLOh74qChXftikWpiJFmTwBvBPsHCzoiMSmz+R2pxrFBHtQFXrT1IdG
         VZUQ==
X-Gm-Message-State: AOAM531FnF4g9hQtaNudpaQVkcfpCQmnsrT2ffv9dWG9cNvLXk1xIEV3
	DrRzsQ++8KdWdRriX9NFgxXSCvAX0KexHmy6jik=
X-Google-Smtp-Source: ABdhPJwZT3hKjivrn6G84IIHizr5dxff6D1sYD6GGn96Kv6JcXya5qSZe+39Y/RtLx4DdnS9t5b7spHj+Qir7DU+p/Q=
X-Received: by 2002:a17:906:e18:: with SMTP id l24mr516460eji.334.1600962098401;
 Thu, 24 Sep 2020 08:41:38 -0700 (PDT)
MIME-Version: 1.0
References: <20200821205529.29901-1-erik.jansson@axis.com> <6adf1052-aa13-b890-606e-119d70eab618@axis.com>
 <CADkTA4Mkpo9S92Pfqd_eDYiyt+3zopP9p97JF3yct2TWuc3kNQ@mail.gmail.com>
 <c13a622a-5d4c-d87e-f901-673bec12fe33@axis.com> <CADkTA4MArixWsydAc1YdwCvyiPHx36nqcigpLf=j_Fw6NudnRQ@mail.gmail.com>
 <ae269803-37c4-d72a-d19e-097a093baa60@axis.com>
In-Reply-To: <ae269803-37c4-d72a-d19e-097a093baa60@axis.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Thu, 24 Sep 2020 11:41:26 -0400
Message-ID: <CADkTA4NbKfrK0CwQz7P5ecGCgL_d_0CZnuROoVTL=iLWJ6kvMw@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] Adding k3s recipe
To: Joakim Roubert <joakim.roubert@axis.com>
Cc: "meta-virtualization@lists.yoctoproject.org" <meta-virtualization@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 24, 2020 at 10:46 AM Joakim Roubert <joakim.roubert@axis.com> w=
rote:
>
> On 2020-09-24 16:02, Bruce Ashfield wrote:
> >
> > So I've decided to do this in a couple phases, since I keep making the
> > bbclass more complex that it needs to be.
>
> Sounds like a good plan! For what we know, concepts as "Big Bang" only
> was successful once in the history of Universe, and it was not within
> the field of software development. ;-)
>
> > I've gone back through the patches, and have some questions/comments.
> > Would you be willing to tweak things basd on those comments ? I
> > realize it's been quite the delay from submission to this, so I can
> > work through issues if you don't have the cycles.
>
> Yes, I am happy to help in whatever way I can. Erik is a colleague of
> mine but currently on parental leave, so I will try to fill his shoes
> here now. But I have plenty of openembedded k3s build experience with
> these recipes too, so let's do this!

By phases, I meant some smaller changes to the series while I work a
bit more through the bbclass and DISTRO feature flag efforts.

I can say immediately, that we have a problem with the dependencies,
and we need to sort those out.

There are at least two utilities that are shared with the main
kubernetes and not in our existing layer dependencies. We shouldn't
expand our dependencies more, so we have to look at importing a
variant of the recipes to meta-virt, or seeing about getting the
recipes into a more common location. In particular, I'm talking about
ipset and and upx, and I'm still looking for more.

As for the service files, the k3s.service is different from the one
from the latest on the k3s 1.18 branch, and there's a patch that
modifies it. Although tempting to not use /usr/local/bin, for
maintenance, we'd be better off either just installing where things
are expected. Was something broken if /usr/local/bin was used ?

The other .service files, we have no idea where they come from by
looking at the series, and as such they need some sort of comment (by
looking at the repo, you can tell they are variants of the k3s.service
file, but that needs to be clarified).

The patches themselves to the code base (not just the overall git
commit) should have Signed-off-by: and Upstream-status: flags, so they
can be maintained as I bump through releases.

The scripts being created by the recipe, need license headers and spdx
tags. Boring, but it is something we want to make sure is in new
files. Also, at a glance, we need to make sure the dependencies of the
scripts are captured in the DEPENDS of the recipe (i.e. I see 'ip'
being called, make sure that is captured).

As for the networking, what we have in the submission is specific to a
setup, that's the parts that I'm really trying to unify. We need to
document what is expected in the CNI configuration, and then control
it via a distro/image flag such that it won't clobber/conflict with
other CNI users. I can take care of that distro part, but the
documentation would be ideal in a README that comes along with the
recipe.

As I said, I'm still working through some of the factoring out and
de-duplication, but there's some things in there that are best done on
your end, versus mine.

Bruce




>
> BR,
>
> /Joakim
> --
> Joakim Roubert
> Senior Engineer
>
> Axis Communications AB
> Emdalav=C3=A4gen 14, SE-223 69 Lund, Sweden
> Tel: +46 46 272 18 00, Tel (direct): +46 46 272 27 48
> Fax: +46 46 13 61 30, www.axis.com
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
