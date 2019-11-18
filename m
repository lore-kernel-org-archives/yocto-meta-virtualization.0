Return-Path: <christopher.w.clark@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 46B58E00E04; Sun, 17 Nov 2019 21:39:36 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (christopher.w.clark[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/,
	no *      trust
	*      [209.85.208.196 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
	[209.85.208.196])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 75317E00D8E
	for <meta-virtualization@yoctoproject.org>;
	Sun, 17 Nov 2019 21:39:35 -0800 (PST)
Received: by mail-lj1-f196.google.com with SMTP id d5so17347762ljl.4
	for <meta-virtualization@yoctoproject.org>;
	Sun, 17 Nov 2019 21:39:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=ZRB9OZxw1mJgPB4fTRh18Z/cw1YJ4SdexWVt0mzaKkU=;
	b=WRbx+vSr/tdNjJ15Ri51/PVV6zJ8tnp7zl8EPGCnrgjRTAOoIj6uUB0RMSuythbbH9
	wjR5mxgk9gJLNhJVizLZXpgOzGKHBIcfQ0oduOflbreIz1PbOJVW66smCnwyd7kntLSu
	yfgejww/mVwvlHUDYRFhSJiHqGjIsX67Ur7Imisaykh6C375eheUA9bsPn0ZsdPHjA4J
	QOJOpDsAZ4lu0IoTV0fYPoZQu27+uxk3UJtadv1jyyRwkqYiQAxBHe4v6BJlwDgS6e7H
	jUNXfPv7rf2Q3MySYCjvbTewkvxq91Kix8/XiGxZwHVqsZKe24dAJMeP1ugl/0hhNJtp
	Rc7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=ZRB9OZxw1mJgPB4fTRh18Z/cw1YJ4SdexWVt0mzaKkU=;
	b=EjFxKIlUbAaevWWBB8eMrwu62GpuVqd2eKbP8ZGFZr+HVLmUk5WSyX3hlZQ5GY4fjv
	1TaED61aWAcgnzTWvUOaI0vHMLU1UWyBnAPBiHQfZ7zwVNNCWQfAfmJeJDREkDucCsor
	24Das5BN0DHsglfos+5y27DuHm1Jz/Q15gvSNmOG2oTPiMHWc3KWoOhcSbsOwtuLkqYA
	z2viT+MFuGUTJjHueO84d9bVgoN8Uup3jFsK7BeTUDmStiWjJDn7IIk8ogqBF5UiS9mt
	55maesCuOnnChczCPpZDyH/3IjPvDbx8A4m1gPRSnmj3c02D06pdsr6wMws9ML9owuv5
	FtBQ==
X-Gm-Message-State: APjAAAUeFq7u9jP4AoMfB61SkyHJOFO2c0ybffMqB4QQuZOprJHJI+Va
	sv3/EExcM0lrXyInbEHsEArXcIU8TT1zbpdAGIM=
X-Google-Smtp-Source: APXvYqz50vc57LH4snL9LVh0oDja2a/FTpkzutMarwP4XxyH2JLJOUEMyOLP/DdOQBMXBTAMYwJ9ivlhcmZ4F9GoZLw=
X-Received: by 2002:a2e:b5d4:: with SMTP id g20mr9680886ljn.140.1574055574515; 
	Sun, 17 Nov 2019 21:39:34 -0800 (PST)
MIME-Version: 1.0
References: <c8623b0b-96f2-a3b3-8cd8-8249a2f53455@3mdeb.com>
	<CADkTA4O4PUuSumcF7gdATc5y4rHwtDYjq0YOhb1UwNyNkSbvmQ@mail.gmail.com>
In-Reply-To: <CADkTA4O4PUuSumcF7gdATc5y4rHwtDYjq0YOhb1UwNyNkSbvmQ@mail.gmail.com>
From: Christopher Clark <christopher.w.clark@gmail.com>
Date: Sun, 17 Nov 2019 21:39:23 -0800
Message-ID: <CACMJ4GYZgT38T9kV9-kqz87SGVr==DYcvaUgZT6UfzEW8RejfA@mail.gmail.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: meta-virtualization <meta-virtualization@yoctoproject.org>,
	piotr.krol@3mdeb.com
Subject: Re: [PATCH] recipes-extended/xen/xen.inc: Add RDEPENDS_${PN}-pygrub
X-BeenThere: meta-virtualization@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: "Discussion of layer enabling hypervisor, virtualization tool stack,
	and cloud support" <meta-virtualization.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-virtualization>
List-Post: <mailto:meta-virtualization@yoctoproject.org>
List-Help: <mailto:meta-virtualization-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Mon, 18 Nov 2019 05:39:36 -0000
Content-Type: text/plain; charset="UTF-8"

On Sun, Nov 17, 2019 at 7:37 PM Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
>
> On Thu, Nov 14, 2019 at 9:24 AM Norbert Kaminski
> <norbert.kaminski@3mdeb.com> wrote:
> >
> >  From ea86f97c347f6637d85a6fdbf36943d43adfa18e Mon Sep 17 00:00:00 2001
> > From: Norbert Kaminski <norbert.kaminski@3mdeb.com>
> > Date: Tue, 12 Nov 2019 11:25:29 +0100
> > Subject: [PATCH] recipes-extended/xen/xen.inc: Add RDEPENDS_${PN}-pygrub
>
> Maybe: "xen: fix pygrub runtime by adding xen-python to xen-pygrub
> RDEPENDS"  as the shortlog ?
>
> >
> > The patch fixes a problem with importing the package xen.lowlevel.xc.
> > RDEPENDS add the xen-python tool, which contains the package.
>
> Can we expand on this message a bit ?
>
> I assume that something from xen.lowlevel.xc is pulling in pygrub, and
> that in turn requires xen-python? What is the actual on-target or boot
> issue this then triggers ?
>
> I'm not currently able to do Xen runtime tests (and hence can't see
> this for myself), so I'm trying to understand the issue just from the
> commit message (and failing at the moment).

One issue that Norbert's patch fixes is: when xen-pygrub is added to
an image, it doesn't pull in the xen-python package that it needs
which contains the support
library xen.lowlevel.xc .

I've build-tested a similar patch in a related environment and I think
the patch should also have this too:

+RDEPENDS_${PN}-python = " \
+    python \
+    "

Christopher



>
> Cheers,
>
> Bruce
>
> >
> > Signed-off-by: Norbert Kaminski <norbert.kaminski@3mdeb.com>
> > ---
> >   recipes-extended/xen/xen.inc | 2 ++
> >   1 file changed, 2 insertions(+)
> >
> > diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc
> > index 628e52b..ba00d2a 100644
> > --- a/recipes-extended/xen/xen.inc
> > +++ b/recipes-extended/xen/xen.inc
> > @@ -151,6 +151,8 @@ RDEPENDS_${PN}-xentrace = "python"
> >
> >   RDEPENDS_${PN}-xen-watchdog = "bash"
> >
> > +RDEPENDS_${PN}-pygrub = "${PN}-python"
> > +
> >   PACKAGES = "\
> >       ${PN}-base \
> >       ${PN}-blktap \
> > --
> > 2.17.1
> >
> > --
> > _______________________________________________
> > meta-virtualization mailing list
> > meta-virtualization@yoctoproject.org
> > https://lists.yoctoproject.org/listinfo/meta-virtualization
>
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization

