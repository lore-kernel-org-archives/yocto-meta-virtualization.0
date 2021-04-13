Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
 by mx.groups.io with SMTP id smtpd.web11.8636.1618318274682125513
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 13 Apr 2021 05:51:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=bXwFpp/z;
 spf=pass (domain: gmail.com, ip: 209.85.208.54, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f54.google.com with SMTP id s15so19252444edd.4
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 13 Apr 2021 05:51:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=UOvHWBZ0NNRXkhdrOb1YSvMUutDiMAdvaLK+L/M9oiE=;
        b=bXwFpp/zG2FttvdRJTHaGIG2EqO2+c42wQH1R5LGW0d6pKkHMvecTsDFQ4UD3/8Xt5
         TEl44RMnyBodXgsDttgoQKTvC0QJYX6vSIuZeYTJgviatBV8sCHXndXz5vBds8HkwTSF
         jA2S6QKJPmuFikA70TFxDnztOg28NgoqCie+pn/teFdEf5QOcmQNeA/vyNAvjR7ygu1Q
         FaPS8UGXZyr/yWEwIKqtJ8qxDl6sC64Bmu//ktUxrTG2LrdDoJ24u//gut1ueIRZw0pe
         jOIfcbyJgTJAbA9W0hQBF9ShVwUV3+s6+WgMWvXLbMeVMrK4mdnWITNEm2bzFCvIzV7v
         wIRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=UOvHWBZ0NNRXkhdrOb1YSvMUutDiMAdvaLK+L/M9oiE=;
        b=tt9l8Fo4IJvRMu6QuXKfkkyaAQPE9/OITjcufhr/04Pa99SwivFlqUzIQ0ZP+aEuNC
         g3OT0hqgWJZqlK2QxAS4CNaCgE4+KeUklbrNtA46n40nIbrdZw2zDj+Gro0+DvGsqukS
         2qUoWkNJqd+oaAVYr28aL5oQdX8sSUyJx4CkRcBajR5IvPAMvpzNSa4HoyGgO6NudEHX
         4RwS9LXukdZ7qCcbk7b0e3ZPI8lrAo1ZFhqEqzVDU/EnQpbxx1SwrSXXC4nTMtAkwCmQ
         GGyxE+IvJwMNk2/n4FMKxnhq2hxEYl7qwHaFU/UY0HY5rJ4IQboSxHdbT1pjoskB0jTV
         rAqg==
X-Gm-Message-State: AOAM530qZWX/4PSf5BVoyhEHxx8ureKI7nan3jOJus8iCYPIGa8jEpDf
	5aHUJrkafI1aikJdDVPsfUj92+yn7WKTpnAlQXo=
X-Google-Smtp-Source: ABdhPJzx59jDSu6TZgW/lyEIcaM4cS/0XKtJM/i39FcDF9CSlRiA8Y+oFdS/7v3JOiWLTauPRbj/NlZNNyvgkDvk0sg=
X-Received: by 2002:a05:6402:3445:: with SMTP id l5mr34960359edc.27.1618318273164;
 Tue, 13 Apr 2021 05:51:13 -0700 (PDT)
MIME-Version: 1.0
References: <20210413030951.40543-1-christopher.w.clark@gmail.com>
 <20210413030951.40543-2-christopher.w.clark@gmail.com> <5FD7ADC9-C018-4400-B51A-40C14618BB91@arm.com>
In-Reply-To: <5FD7ADC9-C018-4400-B51A-40C14618BB91@arm.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Tue, 13 Apr 2021 08:51:02 -0400
Message-ID: <CADkTA4ObusWLZzRwUm3K+V_AiuCNrear=y_GJ43MqGOZcw-=_w@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH 2/2] xen, xen-tools: upgrade version to latest 4.15
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Christopher Clark <christopher.w.clark@gmail.com>, 
	"meta-virtualization@lists.yoctoproject.org" <meta-virtualization@lists.yoctoproject.org>, 
	"cardoe@gentoo.org" <cardoe@gentoo.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 13, 2021 at 3:50 AM Bertrand Marquis
<Bertrand.Marquis@arm.com> wrote:
>
> Hi Christopher,
>
> > On 13 Apr 2021, at 04:09, Christopher Clark via lists.yoctoproject.org=
 <christopher.w.clark=3Dgmail.com@lists.yoctoproject.org> wrote:
> >
> > Update the git recipes revision to the recent master branch point for
> > starting 4.16 development.
> >
> > Remove the xen-tools python patch for 4.14.
>
> I do not think the 4.14 recipe should be removed as we decided a while a=
go that we should
> always have a recipe for:
> - current release - 1
> - current release
> - master

I recall the discussion, but can't find my mailing list archive of it.
If anyone has a pointer, I need to refresh my memory. See below for
why.

>
> More then that we have very near Hardknott release and meta-virtualizati=
on was not branched
> so this is a really bad idea to do a version bump right now.
>

I won't actually branch and declare meta-virt released for a couple of
weeks after the Yocto release. It takes a bit of time for retesting
and final stabilization. So there is some time, but yes, I'm not
really doing much for uprev's that will land in the release (I have
about 15 uprevs done locally as well that I'm deciding on). I can
either run a master-next for a bit, or I'll branch earlier, if we have
some changes that are better in tree.

> I would suggest to:
> - add recipes for Xen and Xen-tools 4.15
> - set preferred version to 4.14

From the Xen release pages I just read, there isn't a LTS release, is
there ? (or did I miss it ?).

Without a LTS, I'd hesitate to support the three versions when we get
into a timing issue like this (it hits me all the time with the kernel
in oe-core). We only do that with the kernel in a given release due to
LTS support. Otherwise, it would just be two: A tagged release +
latest.

If 4.15 is not the preferred version, I'd prefer it to not be in the
release at all, since it won't get much testing. If someone wants it,
I'd just point them at master.

So my summary is, we can keep the three versions, but I'd suggest that
4.15 never lands in the hardknott branch, and only master.  And for
the fall, we'd have 4.15 + 4.16 + the git recipe for the latest. In
that latter case, the patch as it stands is close to ok for master,
and I'll just never put it into the hardknott branch.

Also, feel free to drop by #meta-virt to discuss more interactively.

Bruce

>
> and after branching change the preferred version to 4.15 on master.
>
> What do you think ?
>
> Regards
> Bertrand
>
> >
> > Signed-off-by: Christopher Clark <christopher.w.clark@gmail.com>
> > Signed-off-by: Christopher Clark <christopher.w.clark@gmail.com>
> > ---
> > ...ython-pygrub-pass-DISTUTILS-xen-4.14.patch | 66 -------------------
> > .../{xen-tools_4.14.bb =3D> xen-tools_4.15.bb}  |  6 +-
> > recipes-extended/xen/xen-tools_git.bb         |  4 +-
> > .../xen/{xen_4.14.bb =3D> xen_4.15.bb}          |  4 +-
> > recipes-extended/xen/xen_git.bb               |  4 +-
> > 5 files changed, 9 insertions(+), 75 deletions(-)
> > delete mode 100644 recipes-extended/xen/files/0001-python-pygrub-pass-=
DISTUTILS-xen-4.14.patch
> > rename recipes-extended/xen/{xen-tools_4.14.bb =3D> xen-tools_4.15.bb}=
 (68%)
> > rename recipes-extended/xen/{xen_4.14.bb =3D> xen_4.15.bb} (85%)
> >
> > diff --git a/recipes-extended/xen/files/0001-python-pygrub-pass-DISTUT=
ILS-xen-4.14.patch b/recipes-extended/xen/files/0001-python-pygrub-pass-DIS=
TUTILS-xen-4.14.patch
> > deleted file mode 100644
> > index f0688fd..0000000
> > --- a/recipes-extended/xen/files/0001-python-pygrub-pass-DISTUTILS-xen=
-4.14.patch
> > +++ /dev/null
> > @@ -1,66 +0,0 @@
> > -From d79dcc2002008c58683de82f06c168d6eea57991 Mon Sep 17 00:00:00 200=
1
> > -From: Maciej Pijanowski <maciej.pijanowski@3mdeb.com>
> > -Date: Fri, 19 Oct 2018 11:01:37 +0200
> > -Subject: [PATCH] python,pygrub: pass DISTUTILS env vars as setup.py a=
rgs
> > -
> > -Allow to respect the target install dir (PYTHON_SITEPACKAGES_DIR)
> > -as well as other parameters set by the OpenEmbedded build system.
> > -This is especially useful when the target libdir is not the default o=
ne
> > -(/usr/lib), but for example /usr/lib64.
> > -
> > -Signed-off-by: Maciej Pijanowski <maciej.pijanowski@3mdeb.com>
> > -
> > -Forward-ported to Xen 4.12.0
> > -Signed-off-by: Christopher Clark <christopher.clark6@baesystems.com>
> > -
> > -Modified to support pygrub installation with python 3
> > -Signed-off-by: Christopher Clark <christopher.clark6@baesystems.com>
> > -
> > -Forward-ported to Xen 4.14.0
> > -Signed-off-by: Christopher Clark <christopher.clark6@baesystems.com>
> > -diff --git a/tools/pygrub/Makefile b/tools/pygrub/Makefile
> > -index 3063c49..513314b 100644
> > ---- a/tools/pygrub/Makefile
> > -+++ b/tools/pygrub/Makefile
> > -@@ -10,14 +10,17 @@ INSTALL_LOG =3D build/installed_files.txt
> > - all: build
> > - .PHONY: build
> > - build:
> > --CC=3D"$(CC)" CFLAGS=3D"$(PY_CFLAGS)" LDFLAGS=3D"$(PY_LDFLAGS)" $(PYT=
HON) setup.py build
> > -+CC=3D"$(CC)" CFLAGS=3D"$(PY_CFLAGS)" LDFLAGS=3D"$(PY_LDFLAGS)" $(PYT=
HON) setup.py build $(DISTUTILS_BUILD_ARGS)
> > -
> > - .PHONY: install
> > - install: all
> > - $(INSTALL_DIR) $(DESTDIR)/$(bindir)
> > - CC=3D"$(CC)" CFLAGS=3D"$(PY_CFLAGS)" LDFLAGS=3D"$(PY_LDFLAGS)" $(PYT=
HON) \
> > - setup.py install --record $(INSTALL_LOG) $(PYTHON_PREFIX_ARG) \
> > -- --root=3D"$(DESTDIR)" --install-scripts=3D$(LIBEXEC_BIN) --force
> > -+ --root=3D"$(DESTDIR)" --install-scripts=3D$(LIBEXEC_BIN) --force \
> > -+ $(DISTUTILS_INSTALL_ARGS)
> > -+rm -f $(DESTDIR)/$(LIBEXEC_BIN)/pygrub
> > -+$(INSTALL_PYTHON_PROG) src/pygrub $(DESTDIR)/$(LIBEXEC_BIN)/pygrub
> > - set -e; if [ $(bindir) !=3D $(LIBEXEC_BIN) -a \
> > -              "`readlink -f $(DESTDIR)/$(bindir)`" !=3D \
> > -              "`readlink -f $(LIBEXEC_BIN)`" ]; then \
> > -diff --git a/tools/python/Makefile b/tools/python/Makefile
> > -index 541858e..4d4a344 100644
> > ---- a/tools/python/Makefile
> > -+++ b/tools/python/Makefile
> > -@@ -10,7 +10,7 @@ INSTALL_LOG =3D build/installed_files.txt
> > -
> > - .PHONY: build
> > - build:
> > --CC=3D"$(CC)" CFLAGS=3D"$(PY_CFLAGS)" $(PYTHON) setup.py build
> > -+CC=3D"$(CC)" CFLAGS=3D"$(PY_CFLAGS)" $(PYTHON) setup.py build $(DIST=
UTILS_BUILD_ARGS)
> > -
> > - .PHONY: install
> > - install:
> > -@@ -18,7 +18,7 @@ install:
> > -
> > - CC=3D"$(CC)" CFLAGS=3D"$(PY_CFLAGS)" LDFLAGS=3D"$(PY_LDFLAGS)" $(PYT=
HON) \
> > - setup.py install --record $(INSTALL_LOG) $(PYTHON_PREFIX_ARG) \
> > ----root=3D"$(DESTDIR)" --force
> > -+--root=3D"$(DESTDIR)" --force $(DISTUTILS_INSTALL_ARGS)
> > -
> > - $(INSTALL_PYTHON_PROG) scripts/convert-legacy-stream $(DESTDIR)$(LIB=
EXEC_BIN)
> > - $(INSTALL_PYTHON_PROG) scripts/verify-stream-v2 $(DESTDIR)$(LIBEXEC_=
BIN)
> > diff --git a/recipes-extended/xen/xen-tools_4.14.bb b/recipes-extended=
/xen/xen-tools_4.15.bb
> > similarity index 68%
> > rename from recipes-extended/xen/xen-tools_4.14.bb
> > rename to recipes-extended/xen/xen-tools_4.15.bb
> > index a79b41d..314dc52 100644
> > --- a/recipes-extended/xen/xen-tools_4.14.bb
> > +++ b/recipes-extended/xen/xen-tools_4.15.bb
> > @@ -1,11 +1,11 @@
> > -SRCREV ?=3D "ad844aa352559a8b1f36e391a27d9d7dbddbdc36"
> > +SRCREV ?=3D "e25aa9939ae0cd8317605be3d5c5611b76bc4ab4"
> >
> > -XEN_REL ?=3D "4.14"
> > +XEN_REL ?=3D "4.15"
> > XEN_BRANCH ?=3D "stable-${XEN_REL}"
> >
> > SRC_URI =3D " \
> >     git://xenbits.xen.org/xen.git;branch=3D${XEN_BRANCH} \
> > -    file://0001-python-pygrub-pass-DISTUTILS-xen-4.14.patch \
> > +    file://0001-python-pygrub-pass-DISTUTILS-xen-4.15.patch \
> >     "
> >
> > LIC_FILES_CHKSUM ?=3D "file://COPYING;md5=3D419739e325a50f3d7b4501338e=
44a4e5"
> > diff --git a/recipes-extended/xen/xen-tools_git.bb b/recipes-extended/=
xen/xen-tools_git.bb
> > index 71850ee..0188bdd 100644
> > --- a/recipes-extended/xen/xen-tools_git.bb
> > +++ b/recipes-extended/xen/xen-tools_git.bb
> > @@ -1,6 +1,6 @@
> > -SRCREV ?=3D "9dc687f155a57216b83b17f9cde55dd43e06b0cd"
> > +SRCREV ?=3D "e680cc48b7184d3489873d6776f84ba1fc238ced"
> >
> > -XEN_REL ?=3D "4.15"
> > +XEN_REL ?=3D "4.16"
> > XEN_BRANCH ?=3D "master"
> >
> > SRC_URI =3D " \
> > diff --git a/recipes-extended/xen/xen_4.14.bb b/recipes-extended/xen/x=
en_4.15.bb
> > similarity index 85%
> > rename from recipes-extended/xen/xen_4.14.bb
> > rename to recipes-extended/xen/xen_4.15.bb
> > index 653e3b6..2842c0a 100644
> > --- a/recipes-extended/xen/xen_4.14.bb
> > +++ b/recipes-extended/xen/xen_4.15.bb
> > @@ -1,6 +1,6 @@
> > -SRCREV ?=3D "ad844aa352559a8b1f36e391a27d9d7dbddbdc36"
> > +SRCREV ?=3D "e25aa9939ae0cd8317605be3d5c5611b76bc4ab4"
> >
> > -XEN_REL ?=3D "4.14"
> > +XEN_REL ?=3D "4.15"
> > XEN_BRANCH ?=3D "stable-${XEN_REL}"
> >
> > SRC_URI =3D " \
> > diff --git a/recipes-extended/xen/xen_git.bb b/recipes-extended/xen/xe=
n_git.bb
> > index 2b62c5c..eaf3956 100644
> > --- a/recipes-extended/xen/xen_git.bb
> > +++ b/recipes-extended/xen/xen_git.bb
> > @@ -1,6 +1,6 @@
> > -SRCREV ?=3D "9dc687f155a57216b83b17f9cde55dd43e06b0cd"
> > +SRCREV ?=3D "e680cc48b7184d3489873d6776f84ba1fc238ced"
> >
> > -XEN_REL ?=3D "4.15"
> > +XEN_REL ?=3D "4.16"
> > XEN_BRANCH ?=3D "master"
> >
> > SRC_URI =3D " \
> > --
> > 2.25.1
> >
> >
> >=20
> >
>
> IMPORTANT NOTICE: The contents of this email and any attachments are con=
fidential and may also be privileged. If you are not the intended recipient=
, please notify the sender immediately and do not disclose the contents to =
any other person, use it for any purpose, or store or copy the information =
in any medium. Thank you.



--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
