Received: from mail-lf1-f65.google.com (mail-lf1-f65.google.com [209.85.167.65])
 by mx.groups.io with SMTP id smtpd.web10.183.1582224088434301789
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 20 Feb 2020 10:41:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=cUxcqiRB;
 spf=pass (domain: gmail.com, ip: 209.85.167.65, mailfrom: christopher.w.clark@gmail.com)
Received: by mail-lf1-f65.google.com with SMTP id f24so3940615lfh.3
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 20 Feb 2020 10:41:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=OP6kXbzkcgA4bD5TB5+syMCq/StVJRphC6lfcgdodW0=;
        b=cUxcqiRBRY61Uu191oNMYFMDgPGzlE4416gwBw7vr1QYpjg6moIKRNm6O8j8vByBYl
         XYwstSGZz3/Doj4dXhzJikeaNjuENYhW1SpTWT12q5TUbuL9h7+rcK3idE0udOl3PWM9
         eruBZFKgKcPqxSoLbvJuu2NrnHm6YsAh7lPo5R4zG5lJeqG6XlCSa1faAazTTahyLImi
         NtJXakIyStDCJAnADf7Vs6OXmQBH1fVTTGAQch2debSVwfO6xI1oT9W+fun9lAttQYFu
         7ZYdVMrpeQSW2wFRJ9dNQYHY48HAK+2iuynh1oW+21O7QI2ikE/Fqh7aa/IrlYGoot0c
         DTwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=OP6kXbzkcgA4bD5TB5+syMCq/StVJRphC6lfcgdodW0=;
        b=SEIzkjiPlPmPeKzIA1hvLO2jRk6n3aw+HM4FigRHPEx5TkpMPaAsaqXPweZ6cIHWCO
         0CWjqCMJajIR082BX6UcDfPyGh+Q5Vj6+QJ/HeMdK9PDKsKd8ao3WitFtgy4nWnxkxCZ
         rQurQwsr5Uvz/qK81cdWXC5zRQ43VI6XrClgspnepgusBxYYszc0gC8oL5kka2ATOKxF
         cZ7nSzldH1CGBSI0E8Df1djISqSfKAXqiL+KEQHVRZfGKXMbEGvx9ejQpP+cCQ46Qr3u
         tvid119k73k7oBhQVUutsa2RLLAda9NE7DMnvDETr50I9W9yen8uP3ZoSExSoOaL8gvI
         ImIQ==
X-Gm-Message-State: APjAAAWtdfuletV6tJac5GerFRpdLcUTAuyc159EQpDU5CgX46g3PaGn
	snK0k9B50VdYaSQgKEtyVT/KEaf1b6nmkvBBe6E=
X-Google-Smtp-Source: APXvYqxIKslatgmeJjOWTy0MmTN1V4xQa/Klh6UiDPnc0/E3/9WUOKDLjjj9Df3RMUkcIIGJxcHmdHLV06kwueWSX5E=
X-Received: by 2002:a05:6512:4c6:: with SMTP id w6mr5801101lfq.157.1582224081607;
 Thu, 20 Feb 2020 10:41:21 -0800 (PST)
MIME-Version: 1.0
References: <15F33D74C6BC534D.11355@lists.yoctoproject.org>
 <74D7E070-D2BE-4A70-9394-0DE45CC5E06C@arm.com> <CADkTA4MmNbkXjMQCJGF4NME4Vp0mgH8KUbL2a5c5Q-ZWpMo=ag@mail.gmail.com>
 <10562492-D715-4A10-85F9-983CD272221F@arm.com> <CADkTA4MFBHuXrySuG02TzOkmEitwMwXXs-JPccZj--7-NR9RDA@mail.gmail.com>
In-Reply-To: <CADkTA4MFBHuXrySuG02TzOkmEitwMwXXs-JPccZj--7-NR9RDA@mail.gmail.com>
From: "Christopher Clark" <christopher.w.clark@gmail.com>
Date: Thu, 20 Feb 2020 10:41:10 -0800
Message-ID: <CACMJ4GZrj27_qeT7Y-s1DpEmzHgWMuHoFLYhHu9uyVxCoxBOqg@mail.gmail.com>
Subject: Re: [meta-virtualization] [PATCH] Xen: fix do_deploy dependencies
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>, 
	"meta-virtualization@lists.yoctoproject.org" <meta-virtualization@lists.yoctoproject.org>, nd <nd@arm.com>, 
	Doug Goldstein <cardoe@gentoo.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 19, 2020 at 6:00 AM Bruce Ashfield <bruce.ashfield@gmail.com> w=
rote:
>
> On Wed, Feb 19, 2020 at 8:47 AM Bertrand Marquis <Bertrand.Marquis@arm.co=
m> wrote:
> >
> > On 19 Feb 2020, at 13:31, Bruce Ashfield <bruce.ashfield@gmail.com> wro=
te:
> >
> > On Wed, Feb 19, 2020 at 8:09 AM Bertrand Marquis  <Bertrand.Marquis@arm=
.com> wrote:
> >
> > On 14 Feb 2020, at 10:17, Bertrand Marquis via Lists.Yoctoproject.Org <=
bertrand.marquis=3Darm.com@lists.yoctoproject.org> wrote:
> >
> > > > > do_deploy is using the files installed during do_install and it m=
ust be
> > > > > executed after it but before do_build. This is fixing SSTATE beha=
viour
> > > > > which had previously an empty scene in some cases.
> > >
> > > > Any chance somebody could check and ack on this ?
> > >
> > > There's an entire update / re-work of Xen on the mailing list. I won'=
t
> > > be merging any Xen patches until we have that sorted out.
> >
> > Ok I will re-push my patch once the changes in Xen are merged then.
>
> the patch does look fine, and I've tagged it for merging. I just
> wanted to get the big changes in before jiggling anything (even if it
> shouldn't have an impact).

Thanks for the report, Bertrand. I've taken a look at this. The
addition of "before do_build" looks OK to me, and should be sufficient
to address the behaviour reported about an empty scene observed in
some cases -- some more details about that observation that prompted
this patch, and some testing to confirm that just adding "before
do_build" addition addresses it would be helpful.

I'm not convinced about the change to move it to "after do_install" though.
do_populate_sysroot already runs after do_install, so no change is
needed to ensure that the binaries are available by the time the
deploy task runs, but more importantly I think that the deploy task
should run, as it currently does, after do_populate_sysroot to ensure
that the same binaries that are made available to other recipes via
sysroots are also those that are deployed. Scheduling it after the
do_populate_sysroot means that if the deploy task is run, the sysroot
copies are also up to date.

Christopher



> > While there, it would make sense to also push this in zeus branch.
> >
> > =E2=80=94
> > Bertrand Marquis
> >
> >
> > Change-Id: I04b1f652c697ed0bc7e262571dd03e123ac096f6
> > Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
> > ---
> > recipes-extended/xen/xen.inc | 4 +++-
> > 1 file changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.in=
c
> > index 36ab78e..41b1983 100644
> > --- a/recipes-extended/xen/xen.inc
> > +++ b/recipes-extended/xen/xen.inc
> > @@ -1099,7 +1099,9 @@ do_deploy() {
> >    fi
> > }
> >
> > -addtask deploy after do_populate_sysroot
> > +# do_deploy is using files created during do_install so force it to be=
 called
> > +# after do_install but before do_build
> > +addtask deploy before do_build after do_install
> >
> > # Enable use of menuconfig directly from bitbake and also within the de=
vshell
> > OE_TERMINAL_EXPORTS +=3D "HOST_EXTRACFLAGS HOSTLDFLAGS TERMINFO"
> > --
> > 2.17.1
