Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web09.3945.1615521813203996303
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 11 Mar 2021 20:03:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=tIwev0Pb;
 spf=pass (domain: gmail.com, ip: 209.85.218.43, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f43.google.com with SMTP id mj10so50769225ejb.5
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 11 Mar 2021 20:03:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=4XWmNHoxguUr/g+xAr8S//lcsLwwUsFTjFX2JPtjDrQ=;
        b=tIwev0PbRaeWPVcoqALyu7+gUiBffjmGyDzV+Yd4LWGtZJXqw2k20nTzGRnIAxi7hp
         Jgyi1tiNXgNISRF3dwXDCozOKCLjKJpLvmQbVnNBOD6BDjxKQ9UeVigfb5YtcdRdhY2h
         nLqPplpilzILLiARBgqZkz6Ou+JsXzTDL6FouwN3aKC56PKpmrxd5YKCFWuVlaWEakMI
         6jfOUtUALBMocplxJFyT0ZNf4Puw9RXmKcZ5x6wpvhlTwF07z98d4f6iGApvMXb1B8nC
         5HyUDmzbqr2ocysY6a3kdN9gEKXP5Y4wheQWr0JZGk2KgOe2tA1mTqlvf/LTKK5m1eHO
         +VMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=4XWmNHoxguUr/g+xAr8S//lcsLwwUsFTjFX2JPtjDrQ=;
        b=AkLA0ZgDBmcJFZgLlz6WU13EWImw1i66c6FgMt1dZ8GwTQPiCMbm3r/r8KTcUk/VnY
         dAKA4BIGMdc1SkXwVUoid5lLryztfpLz+FChLUMnJ6DQ8kIYb8SEBOiYrzq9e+Glo0LU
         Ylk0sF9rK+nUociQi72yurZZOXhNkiVGS7KTHyouiu/yZxioFa3hXz+D7SC8CyHTVIen
         b3LCxcT86l4/t0rh5HOtLXA6RvKO2GhTc267G4mAU0zJesZA7Ijfym3Lu0TsDhteE4iJ
         MKbOkV1+dMBx3mjkezxhuO64TgjVlsGvpk5GPwqn9Giy1CrGFra4nVlVN9XXyjqjzrBS
         8dIQ==
X-Gm-Message-State: AOAM530Cq759Mk6vKJ3vcSQh9ZKBxnj7iK0O7mZ2GS6JxCU7hHemLPQY
	tgUcehQV5ru8y654Yi1x1RSaWMd0gFro9w7Z8vc=
X-Google-Smtp-Source: ABdhPJy62MVH2W4aGqaCX75xi9J6gX7Da43CCUc1eqVj3FiS6sZuaVNi50GpavafMC3MXpdfbIXx1n92qK6udrlBjSc=
X-Received: by 2002:a17:906:11d1:: with SMTP id o17mr6373931eja.517.1615521811721;
 Thu, 11 Mar 2021 20:03:31 -0800 (PST)
MIME-Version: 1.0
References: <20210311193040.621009-1-rburanyi@google.com> <20210312035103.GB12488@gmail.com>
 <CANF=oU47b38sOkkVHcHz=zFhF+Nw_J40B9xpdi2Q8N-K97uopw@mail.gmail.com>
In-Reply-To: <CANF=oU47b38sOkkVHcHz=zFhF+Nw_J40B9xpdi2Q8N-K97uopw@mail.gmail.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Thu, 11 Mar 2021 23:03:20 -0500
Message-ID: <CADkTA4M6qxjzRFQw=dmyz9W7+xHKjMrZ3P+vEJqgxiB3B7tuew@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] lxc: change download folder
To: Robi Buranyi <rburanyi@google.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 11, 2021 at 10:58 PM Robi Buranyi <rburanyi@google.com> wrote:
>
> Thank you for reviewing and merging it, Bruce.
>
> I was sending it through regular =E2=80=9Cgit email=E2=80=9D with the co=
nfiguration I have found in some internal guidelines from my company. I can=
 ask around if there is something I can do.
>

It was odd, the Author came through as:

commit 4b1b573e46cef17a15697d4a4a304bab4e1ac054 (HEAD -> master)
Author: Robi Buranyi via lists.yoctoproject.org
<rburanyi=3Dgoogle.com@lists.yoctoproject.org>

Which lead to:

remote: ##############################################
remote: Invalid author Robi Buranyi via lists.yoctoproject.org
remote: ##############################################
To ssh://git.yoctoproject.org/meta-virtualization
 ! [remote rejected] master -> master (pre-receive hook declined)

Which of course looks like something on the mailing list did some
munging. But I've never seen that before, and it didn't happen on the
other patches that I merged tonight. I wonder if the relay you are
using did something ? (I didn't look into possible causes, so I'm just
guessing).

> I am working on the dunfell branch and I see the issue there too; I just=
 wanted to first send the patch to the main branch because I thought that=
=E2=80=99s the first step?

perfect. And yes, this is the right order. If you had sent directly to
dunfell, I would have asked for it to be in master first.

Bruce

>
> On Thu, Mar 11, 2021 at 7:51 PM Bruce Ashfield <bruce.ashfield@gmail.com=
> wrote:
>>
>> This will hit more than master, but for now, I've just merged this
>> there, and will wait for problem reports on the other branches.
>>
>> Also, however this was sent, the Author field came through as
>> invalid and the yocto hooks wouldn't let me push.
>>
>> I've manually updated the Author field, and this is now merged.
>>
>> Bruce
>>
>> In message: [meta-virtualization][PATCH] lxc: change download folder
>> on 11/03/2021 Robi Buranyi via lists.yoctoproject.org wrote:
>>
>> > The URI has been changed to 'https://linuxcontainers.org/downloads/lx=
c'
>> > by the site maintainers recently. Updating the recipe to reflect the =
new
>> > path.
>> >
>> > Signed-off-by: Robi Buranyi <rburanyi@google.com>
>> > ---
>> >  recipes-containers/lxc/lxc_4.0.6.bb | 2 +-
>> >  1 file changed, 1 insertion(+), 1 deletion(-)
>> >
>> > diff --git a/recipes-containers/lxc/lxc_4.0.6.bb b/recipes-containers=
/lxc/lxc_4.0.6.bb
>> > index ddff9af..b422909 100644
>> > --- a/recipes-containers/lxc/lxc_4.0.6.bb
>> > +++ b/recipes-containers/lxc/lxc_4.0.6.bb
>> > @@ -36,7 +36,7 @@ RDEPENDS_${PN}-ptest +=3D "file make gmp nettle gnu=
tls bash libgcc"
>> >
>> >  RDEPENDS_${PN}-networking +=3D "iptables"
>> >
>> > -SRC_URI =3D "http://linuxcontainers.org/downloads/${BPN}-${PV}.tar.g=
z \
>> > +SRC_URI =3D "http://linuxcontainers.org/downloads/${BPN}/${BPN}-${PV=
}.tar.gz \
>> >       file://lxc-1.0.0-disable-udhcp-from-busybox-template.patch \
>> >       file://run-ptest \
>> >       file://lxc-fix-B-S.patch \
>> > --
>> > 2.31.0.rc2.261.g7f71774620-goog
>> >
>>
>> >
>> >=20
>> >
>>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
