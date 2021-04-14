Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
 by mx.groups.io with SMTP id smtpd.web09.8788.1618377226591554154
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 13 Apr 2021 22:13:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=mEJ+Zq/7;
 spf=pass (domain: gmail.com, ip: 209.85.210.42, mailfrom: christopher.w.clark@gmail.com)
Received: by mail-ot1-f42.google.com with SMTP id d3-20020a9d29030000b029027e8019067fso16376727otb.13
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 13 Apr 2021 22:13:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=EbTmpLu+2AlKwQD4OzrR9d9996J1SOjthaalAXB/+PY=;
        b=mEJ+Zq/7Myv6/NPcKhhZ92efcieHhCz2XCLRDyHuPyTTyheb/zIjuLKIRO4q3f3lmf
         AMe93Razjd+nvFkejP6EdNkHpLt9OuEkfrx4szlCIoU3Tb/jrllhBI2gocOY2AJHdfbf
         heUiPj4KMbcJkMJRnLtT1LZUt84lDEAMOleXey/deY/a1qOC0MdCkrnYQG+xcOiUQy6R
         LZYpyJWTfj4kddT6qUcmPx+oe6nb26C8pyWXpL/yPEW6oyO1uTUOs5Kay7Ia4o6TWVa3
         qTEkEnGPE5D2Ljeqx5eEOmXqeRhrlqJvaFJY/h708JYCzS2tc6V4gx5wD0g7GnJ5mwsd
         Ag9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=EbTmpLu+2AlKwQD4OzrR9d9996J1SOjthaalAXB/+PY=;
        b=uX0DcldKcV5f6XEQkV04bdAMF/Nj0Ee3KM5HMvu/CBE5ABBGz/krjb/F7kWZPK8LG3
         X+DL7REsxhXvroydBXkHCwJvpB63apwCvYwzCYcKg+k8HfcX1bmd6Egr0W0Vksn7Qt2N
         0gVbKbvVmnsgGKPGBO3tYmbp8p5JTHKvuUHdeWNwL99Ze215eo2IDpXv+6b/uT54PS6T
         28zOhEYRwA4aGWuOvgScMfmm5SssD8NPTicqjiIo19y1TOzFktnmICfckOPgncifWV3b
         t/jPhxd3RSLeQVdsRW5DosyE7junfMY4PvUp3CbEcsSOD53w+nQIq2L3AJR6QJLcK48Q
         BnuQ==
X-Gm-Message-State: AOAM533MRbNfABYwVpOkljQ1L67aKEkVqMjXLrBc20FR63AX7xkishJm
	LwIRvNkGuy834KEbW9Z2i0YFCp3p4QXuIRtHrb4=
X-Google-Smtp-Source: ABdhPJz1auROH/mdmecEHEFoUF6v5OtGTI/1lGku/T+/z4hmYDKmoQg6k+TgYdZnKWm2bK6zHMOGze5iIPO3kqjZHo4=
X-Received: by 2002:a05:6830:241b:: with SMTP id j27mr12412423ots.17.1618377225765;
 Tue, 13 Apr 2021 22:13:45 -0700 (PDT)
MIME-Version: 1.0
References: <20210413030951.40543-1-christopher.w.clark@gmail.com>
 <20210413030951.40543-2-christopher.w.clark@gmail.com> <5FD7ADC9-C018-4400-B51A-40C14618BB91@arm.com>
 <CADkTA4ObusWLZzRwUm3K+V_AiuCNrear=y_GJ43MqGOZcw-=_w@mail.gmail.com> <769FCB21-E735-4C21-83EC-5CDA3B423F98@arm.com>
In-Reply-To: <769FCB21-E735-4C21-83EC-5CDA3B423F98@arm.com>
From: "Christopher Clark" <christopher.w.clark@gmail.com>
Date: Tue, 13 Apr 2021 22:13:34 -0700
Message-ID: <CACMJ4GYMA-kAjMfz7gk0fmvCSqN8GgOyAigKa+99wrMy48GUPw@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH 2/2] xen, xen-tools: upgrade version to latest 4.15
To: Bertrand Marquis <bertrand.marquis@arm.com>
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>, 
	"meta-virtualization@lists.yoctoproject.org" <meta-virtualization@lists.yoctoproject.org>, 
	"cardoe@gentoo.org" <cardoe@gentoo.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 13, 2021 at 6:24 AM Bertrand Marquis
<bertrand.marquis@arm.com> wrote:
>
> Hi,
>
> > On 13 Apr 2021, at 13:51, Bruce Ashfield via lists.yoctoproject.org <b=
ruce.ashfield=3Dgmail.com@lists.yoctoproject.org> wrote:
> >
> > On Tue, Apr 13, 2021 at 3:50 AM Bertrand Marquis
> > <Bertrand.Marquis@arm.com> wrote:
> >>
> >> Hi Christopher,
> >>
> >>> On 13 Apr 2021, at 04:09, Christopher Clark via lists.yoctoproject.o=
rg <christopher.w.clark=3Dgmail.com@lists.yoctoproject.org> wrote:
> >>>
> >>> Update the git recipes revision to the recent master branch point fo=
r
> >>> starting 4.16 development.
> >>>
> >>> Remove the xen-tools python patch for 4.14.
> >>
> >> I do not think the 4.14 recipe should be removed as we decided a whil=
e ago that we should
> >> always have a recipe for:
> >> - current release - 1
> >> - current release
> >> - master
> >
> > I recall the discussion, but can't find my mailing list archive of it.
> > If anyone has a pointer, I need to refresh my memory. See below for
> > why.
>
> After a discussion on IRC, we agreed with Bruce that the scheme that
> was decided last year was to have 2 versions + master so that we try
> not to break backward compatibility and give time for people to update.

Hi all, sorry for causing the surprise and thanks for the engagement
with this. As you might imagine from my posting of the uprev patch, I
didn't end up with quite the same understanding of the discussion but
I agree with the proposed path forward.

> Here as we are really near the release we should:
> - add 4.15 recipe and bump master one
> - keep 4.14 recipe and set PREFERRED_VERSION to 4.14
>
> After branching hardknott we can change the preferred version
>  to 4.15 on master

Agreed.

> Also we need to put the outcome of our discussion that was written
> on wire inside a README file inside the Xen directory.

Yes - I agree.

> @Christopher please confirm you agree with that and tell me if you
> want help to do it (as I do have in fact a patch available internally to
> do just that).
>
> I have no access anymore to the wire discussion so one of you Bruce
> or Christopher will need to push the README file :-)

I can do this. We're going to need to update it slightly, following
the discussion on this thread. Below is the section that we had
regarding Xen version uprev. In current context for reading below, the
latest stable version of Xen is now 4.15.

-----
# Xen version update

The following rules shall be followed to define which version of Xen has a
recipe in meta-virtualization:

- Before a Yocto release meta-virtualization shall have a recipe for the l=
atest
  stable version of Xen and for master version of Xen (known as git recipe=
)

- On Yocto LTS and the latest stable Yocto release branch, the Xen major v=
ersion
  that is present when the Yocto release is issued must stay supported and
  the recipe shall be regularly updated to follow updates available in the
  Xen stable branch for that Xen major release.

- On Yocto LTS and the latest stable Yocto release branch, new Xen recipes
  shall be added when there is a new Xen major release.

    - The preferred version of the Xen recipe shall always stay at the sam=
e Xen
      major version once a Yocto release has been issued, and it shall rec=
eive
      regular updates to track the stable Xen branch of that Xen release.

    - When a new Xen recipe is added to a Yocto branch for a new Xen
major version,
      then any older Xen recipe present, except for the original
preferred version recipe,
      shall be marked as not updated anymore by adding a comment
inside the recipe.
      This recipe will not receive any build tests or be updated to
follow the Xen branch.
-----

The new development from this thread, to amend the above process, is
when Xen issues a release in close proximity to a Yocto release, the
prior stable major version of Xen (ie. 4.14 here) may remain the
preferred version for the Yocto release, so will have a recipe present
and set as preferred, alongside the recipe for the current stable
release.

I'll respin my patches.

thanks

Christopher


>
> Cheers
> Bertrand
>
> >
> >>
> >> More then that we have very near Hardknott release and meta-virtualiz=
ation was not branched
> >> so this is a really bad idea to do a version bump right now.
> >>
> >
> > I won't actually branch and declare meta-virt released for a couple of
> > weeks after the Yocto release. It takes a bit of time for retesting
> > and final stabilization. So there is some time, but yes, I'm not
> > really doing much for uprev's that will land in the release (I have
> > about 15 uprevs done locally as well that I'm deciding on). I can
> > either run a master-next for a bit, or I'll branch earlier, if we have
> > some changes that are better in tree.
> >
> >> I would suggest to:
> >> - add recipes for Xen and Xen-tools 4.15
> >> - set preferred version to 4.14
> >
> > From the Xen release pages I just read, there isn't a LTS release, is
> > there ? (or did I miss it ?).
> >
> > Without a LTS, I'd hesitate to support the three versions when we get
> > into a timing issue like this (it hits me all the time with the kernel
> > in oe-core). We only do that with the kernel in a given release due to
> > LTS support. Otherwise, it would just be two: A tagged release +
> > latest.
> >
> > If 4.15 is not the preferred version, I'd prefer it to not be in the
> > release at all, since it won't get much testing. If someone wants it,
> > I'd just point them at master.
> >
> > So my summary is, we can keep the three versions, but I'd suggest that
> > 4.15 never lands in the hardknott branch, and only master.  And for
> > the fall, we'd have 4.15 + 4.16 + the git recipe for the latest. In
> > that latter case, the patch as it stands is close to ok for master,
> > and I'll just never put it into the hardknott branch.
> >
> > Also, feel free to drop by #meta-virt to discuss more interactively.
> >
> > Bruce
> >
> >>
> >> and after branching change the preferred version to 4.15 on master.
> >>
> >> What do you think ?
> >>
> >> Regards
> >> Bertrand
> >>
> >>>
> >>> Signed-off-by: Christopher Clark <christopher.w.clark@gmail.com>
> >>> Signed-off-by: Christopher Clark <christopher.w.clark@gmail.com>
> >>> ---
> >>> ...ython-pygrub-pass-DISTUTILS-xen-4.14.patch | 66 -----------------=
--
> >>> .../{xen-tools_4.14.bb =3D> xen-tools_4.15.bb}  |  6 +-
> >>> recipes-extended/xen/xen-tools_git.bb         |  4 +-
> >>> .../xen/{xen_4.14.bb =3D> xen_4.15.bb}          |  4 +-
> >>> recipes-extended/xen/xen_git.bb               |  4 +-
> >>> 5 files changed, 9 insertions(+), 75 deletions(-)
> >>> delete mode 100644 recipes-extended/xen/files/0001-python-pygrub-pas=
s-DISTUTILS-xen-4.14.patch
> >>> rename recipes-extended/xen/{xen-tools_4.14.bb =3D> xen-tools_4.15.b=
b} (68%)
> >>> rename recipes-extended/xen/{xen_4.14.bb =3D> xen_4.15.bb} (85%)
> >>>
> >>> diff --git a/recipes-extended/xen/files/0001-python-pygrub-pass-DIST=
UTILS-xen-4.14.patch b/recipes-extended/xen/files/0001-python-pygrub-pass-D=
ISTUTILS-xen-4.14.patch
> >>> deleted file mode 100644
> >>> index f0688fd..0000000
> >>> --- a/recipes-extended/xen/files/0001-python-pygrub-pass-DISTUTILS-x=
en-4.14.patch
> >>> +++ /dev/null
> >>> @@ -1,66 +0,0 @@
> >>> -From d79dcc2002008c58683de82f06c168d6eea57991 Mon Sep 17 00:00:00 2=
001
> >>> -From: Maciej Pijanowski <maciej.pijanowski@3mdeb.com>
> >>> -Date: Fri, 19 Oct 2018 11:01:37 +0200
> >>> -Subject: [PATCH] python,pygrub: pass DISTUTILS env vars as setup.py=
 args
> >>> -
> >>> -Allow to respect the target install dir (PYTHON_SITEPACKAGES_DIR)
> >>> -as well as other parameters set by the OpenEmbedded build system.
> >>> -This is especially useful when the target libdir is not the default=
 one
> >>> -(/usr/lib), but for example /usr/lib64.
> >>> -
> >>> -Signed-off-by: Maciej Pijanowski <maciej.pijanowski@3mdeb.com>
> >>> -
> >>> -Forward-ported to Xen 4.12.0
> >>> -Signed-off-by: Christopher Clark <christopher.clark6@baesystems.com=
>
> >>> -
> >>> -Modified to support pygrub installation with python 3
> >>> -Signed-off-by: Christopher Clark <christopher.clark6@baesystems.com=
>
> >>> -
> >>> -Forward-ported to Xen 4.14.0
> >>> -Signed-off-by: Christopher Clark <christopher.clark6@baesystems.com=
>
> >>> -diff --git a/tools/pygrub/Makefile b/tools/pygrub/Makefile
> >>> -index 3063c49..513314b 100644
> >>> ---- a/tools/pygrub/Makefile
> >>> -+++ b/tools/pygrub/Makefile
> >>> -@@ -10,14 +10,17 @@ INSTALL_LOG =3D build/installed_files.txt
> >>> - all: build
> >>> - .PHONY: build
> >>> - build:
> >>> --CC=3D"$(CC)" CFLAGS=3D"$(PY_CFLAGS)" LDFLAGS=3D"$(PY_LDFLAGS)" $(P=
YTHON) setup.py build
> >>> -+CC=3D"$(CC)" CFLAGS=3D"$(PY_CFLAGS)" LDFLAGS=3D"$(PY_LDFLAGS)" $(P=
YTHON) setup.py build $(DISTUTILS_BUILD_ARGS)
> >>> -
> >>> - .PHONY: install
> >>> - install: all
> >>> - $(INSTALL_DIR) $(DESTDIR)/$(bindir)
> >>> - CC=3D"$(CC)" CFLAGS=3D"$(PY_CFLAGS)" LDFLAGS=3D"$(PY_LDFLAGS)" $(P=
YTHON) \
> >>> - setup.py install --record $(INSTALL_LOG) $(PYTHON_PREFIX_ARG) \
> >>> -- --root=3D"$(DESTDIR)" --install-scripts=3D$(LIBEXEC_BIN) --force
> >>> -+ --root=3D"$(DESTDIR)" --install-scripts=3D$(LIBEXEC_BIN) --force =
\
> >>> -+ $(DISTUTILS_INSTALL_ARGS)
> >>> -+rm -f $(DESTDIR)/$(LIBEXEC_BIN)/pygrub
> >>> -+$(INSTALL_PYTHON_PROG) src/pygrub $(DESTDIR)/$(LIBEXEC_BIN)/pygrub
> >>> - set -e; if [ $(bindir) !=3D $(LIBEXEC_BIN) -a \
> >>> -              "`readlink -f $(DESTDIR)/$(bindir)`" !=3D \
> >>> -              "`readlink -f $(LIBEXEC_BIN)`" ]; then \
> >>> -diff --git a/tools/python/Makefile b/tools/python/Makefile
> >>> -index 541858e..4d4a344 100644
> >>> ---- a/tools/python/Makefile
> >>> -+++ b/tools/python/Makefile
> >>> -@@ -10,7 +10,7 @@ INSTALL_LOG =3D build/installed_files.txt
> >>> -
> >>> - .PHONY: build
> >>> - build:
> >>> --CC=3D"$(CC)" CFLAGS=3D"$(PY_CFLAGS)" $(PYTHON) setup.py build
> >>> -+CC=3D"$(CC)" CFLAGS=3D"$(PY_CFLAGS)" $(PYTHON) setup.py build $(DI=
STUTILS_BUILD_ARGS)
> >>> -
> >>> - .PHONY: install
> >>> - install:
> >>> -@@ -18,7 +18,7 @@ install:
> >>> -
> >>> - CC=3D"$(CC)" CFLAGS=3D"$(PY_CFLAGS)" LDFLAGS=3D"$(PY_LDFLAGS)" $(P=
YTHON) \
> >>> - setup.py install --record $(INSTALL_LOG) $(PYTHON_PREFIX_ARG) \
> >>> ----root=3D"$(DESTDIR)" --force
> >>> -+--root=3D"$(DESTDIR)" --force $(DISTUTILS_INSTALL_ARGS)
> >>> -
> >>> - $(INSTALL_PYTHON_PROG) scripts/convert-legacy-stream $(DESTDIR)$(L=
IBEXEC_BIN)
> >>> - $(INSTALL_PYTHON_PROG) scripts/verify-stream-v2 $(DESTDIR)$(LIBEXE=
C_BIN)
> >>> diff --git a/recipes-extended/xen/xen-tools_4.14.bb b/recipes-extend=
ed/xen/xen-tools_4.15.bb
> >>> similarity index 68%
> >>> rename from recipes-extended/xen/xen-tools_4.14.bb
> >>> rename to recipes-extended/xen/xen-tools_4.15.bb
> >>> index a79b41d..314dc52 100644
> >>> --- a/recipes-extended/xen/xen-tools_4.14.bb
> >>> +++ b/recipes-extended/xen/xen-tools_4.15.bb
> >>> @@ -1,11 +1,11 @@
> >>> -SRCREV ?=3D "ad844aa352559a8b1f36e391a27d9d7dbddbdc36"
> >>> +SRCREV ?=3D "e25aa9939ae0cd8317605be3d5c5611b76bc4ab4"
> >>>
> >>> -XEN_REL ?=3D "4.14"
> >>> +XEN_REL ?=3D "4.15"
> >>> XEN_BRANCH ?=3D "stable-${XEN_REL}"
> >>>
> >>> SRC_URI =3D " \
> >>>    git://xenbits.xen.org/xen.git;branch=3D${XEN_BRANCH} \
> >>> -    file://0001-python-pygrub-pass-DISTUTILS-xen-4.14.patch \
> >>> +    file://0001-python-pygrub-pass-DISTUTILS-xen-4.15.patch \
> >>>    "
> >>>
> >>> LIC_FILES_CHKSUM ?=3D "file://COPYING;md5=3D419739e325a50f3d7b450133=
8e44a4e5"
> >>> diff --git a/recipes-extended/xen/xen-tools_git.bb b/recipes-extende=
d/xen/xen-tools_git.bb
> >>> index 71850ee..0188bdd 100644
> >>> --- a/recipes-extended/xen/xen-tools_git.bb
> >>> +++ b/recipes-extended/xen/xen-tools_git.bb
> >>> @@ -1,6 +1,6 @@
> >>> -SRCREV ?=3D "9dc687f155a57216b83b17f9cde55dd43e06b0cd"
> >>> +SRCREV ?=3D "e680cc48b7184d3489873d6776f84ba1fc238ced"
> >>>
> >>> -XEN_REL ?=3D "4.15"
> >>> +XEN_REL ?=3D "4.16"
> >>> XEN_BRANCH ?=3D "master"
> >>>
> >>> SRC_URI =3D " \
> >>> diff --git a/recipes-extended/xen/xen_4.14.bb b/recipes-extended/xen=
/xen_4.15.bb
> >>> similarity index 85%
> >>> rename from recipes-extended/xen/xen_4.14.bb
> >>> rename to recipes-extended/xen/xen_4.15.bb
> >>> index 653e3b6..2842c0a 100644
> >>> --- a/recipes-extended/xen/xen_4.14.bb
> >>> +++ b/recipes-extended/xen/xen_4.15.bb
> >>> @@ -1,6 +1,6 @@
> >>> -SRCREV ?=3D "ad844aa352559a8b1f36e391a27d9d7dbddbdc36"
> >>> +SRCREV ?=3D "e25aa9939ae0cd8317605be3d5c5611b76bc4ab4"
> >>>
> >>> -XEN_REL ?=3D "4.14"
> >>> +XEN_REL ?=3D "4.15"
> >>> XEN_BRANCH ?=3D "stable-${XEN_REL}"
> >>>
> >>> SRC_URI =3D " \
> >>> diff --git a/recipes-extended/xen/xen_git.bb b/recipes-extended/xen/=
xen_git.bb
> >>> index 2b62c5c..eaf3956 100644
> >>> --- a/recipes-extended/xen/xen_git.bb
> >>> +++ b/recipes-extended/xen/xen_git.bb
> >>> @@ -1,6 +1,6 @@
> >>> -SRCREV ?=3D "9dc687f155a57216b83b17f9cde55dd43e06b0cd"
> >>> +SRCREV ?=3D "e680cc48b7184d3489873d6776f84ba1fc238ced"
> >>>
> >>> -XEN_REL ?=3D "4.15"
> >>> +XEN_REL ?=3D "4.16"
> >>> XEN_BRANCH ?=3D "master"
> >>>
> >>> SRC_URI =3D " \
> >>> --
> >>> 2.25.1
> >>>
> >>>
> >>>
> >>>
> >>
> >> IMPORTANT NOTICE: The contents of this email and any attachments are =
confidential and may also be privileged. If you are not the intended recipi=
ent, please notify the sender immediately and do not disclose the contents =
to any other person, use it for any purpose, or store or copy the informati=
on in any medium. Thank you.
> >
> >
> >
> > --
> > - Thou shalt not follow the NULL pointer, for chaos and madness await
> > thee at its end
> > - "Use the force Harry" - Gandalf, Star Trek II
> >
> >
>
> IMPORTANT NOTICE: The contents of this email and any attachments are con=
fidential and may also be privileged. If you are not the intended recipient=
, please notify the sender immediately and do not disclose the contents to =
any other person, use it for any purpose, or store or copy the information =
in any medium. Thank you.
>
>=20
>
