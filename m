Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 3D702E00B9D; Mon, 22 Oct 2018 01:48:34 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (bruce.ashfield[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.167.67 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com
	[209.85.167.67])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9D131E00872
	for <meta-virtualization@yoctoproject.org>;
	Mon, 22 Oct 2018 01:48:32 -0700 (PDT)
Received: by mail-lf1-f67.google.com with SMTP id n26-v6so11009668lfl.1
	for <meta-virtualization@yoctoproject.org>;
	Mon, 22 Oct 2018 01:48:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=IDojVTskRUaaLOoGBEXtn2WXYGU3UYzUdptOrzROS5M=;
	b=CeA/3RqDy5xliP4WP9o1O351/isPiLW9hczNGQnOfAKVPmWRMKcTFnRerqj6rA8h/Q
	Zxx1zQtM4TjtPSO0Vo0K7LSzhOscfFvIvzy7JeHrxKqB7wtJJC6LHo2CT60WNhp+d3MG
	c8kLW2IX4JVIAk3N2HjFTLB6kUVCf5haZ1pNJD/KWiCy46SsdFzbCnqeYqpg58a3JDF6
	i9DzSP9hsq6baXZt9rcNp1hvbiZ1iVZftW9itNcFn9M2nWYv1mABN2+4zDySHPfiDkGe
	PomfGrxjfcb7ZPFi+Ne9+MNBVb7MPYdlR8rQiSsKD2rh2LQjOuzTWW8eQQ24t6STWb9Q
	Ed/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=IDojVTskRUaaLOoGBEXtn2WXYGU3UYzUdptOrzROS5M=;
	b=BLRn9Cqmz/uBEWZlTF337of7douFyGUt+JSIpf2x7RKpKzbYUy48cwIgoOvfIBSOjE
	UgCT31MgqmsCTRg9qLespHS0CT09Hz3agl24uZ3CoZ0BoTuULmUL52SA9OjKfH0vZVsV
	VJ4R2XmS4JPcEmiO8nGn+3MtcFrHz1OF57P++py4F1Wd8vs9yMAHQXNx1iRf+yH+7YvH
	xKkVKdNM5UuJ+kjgCW9xvlJv//xw56oKE3KLg2pxxJn/QCgrBoKJEftxdRI931DmAY/0
	V9joy1nSyDaZ3/KwvhtJJAAJX5X4TKXmEe9OEP2LdlrBtam1WULbOzT484efrGkQPazh
	f7KA==
X-Gm-Message-State: ABuFfojfEkVNT05Ezgx+XWm1K6hzywo5PCVJb5KqFTNl80+YrGaV3vD+
	bfmJMi9bE5K/dOIYRj7xcVPvrJZNIshl7IgLIvN/oSIo
X-Google-Smtp-Source: ACcGV61O9peCnQ1+SITep//Kq7yonhy3Y9FiTkCzXrnrZgAKviyOa4yeBv04guVwaWiKmfrbaLjVTt0x1uD2/ZqGAoo=
X-Received: by 2002:a19:a686:: with SMTP id
	p128-v6mr8453623lfe.42.1540198111301; 
	Mon, 22 Oct 2018 01:48:31 -0700 (PDT)
MIME-Version: 1.0
References: <1540195702-393367-1-git-send-email-mingli.yu@windriver.com>
	<1540195971-395910-1-git-send-email-mingli.yu@windriver.com>
	<CADkTA4P9sitt8zw=UJG+NLLUrNUohqVh89eRW5EXXqrX2H-kLQ@mail.gmail.com>
	<5BCD8DCB.40408@windriver.com>
In-Reply-To: <5BCD8DCB.40408@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 22 Oct 2018 04:48:19 -0400
Message-ID: <CADkTA4OGG62C=8jhxowxwAo2yjG8p1yo=CjRT-k2hD1uvCdu7g@mail.gmail.com>
To: "Yu, Mingli" <mingli.yu@windriver.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH v2] lxc: Upgrade to 3.0.2
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
X-List-Received-Date: Mon, 22 Oct 2018 08:48:34 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 22, 2018 at 4:44 AM Yu, Mingli <mingli.yu@windriver.com> wrote:
>
>
>
> On 2018=E5=B9=B410=E6=9C=8822=E6=97=A5 16:40, Bruce Ashfield wrote:
> > What's the difference between v1 and v2 ?
>
> No content difference, just make you easy to review.
> v1:
> git format-patch -1
> v2:
> git format-patch -1 -M10
>
> Thanks,

That's what I thought, but I wanted to be sure. I was going to suggest
-M when I saw the recipe delete + add in the first diff .. but you
beat me to it.

We are close to release of 2.6, but since this is a dot release that
is fixing a real problem, and has little risk. I'll go ahead and merge
it now.

One other thing that can be helpful in these uprevs would be a log
and/or a quick list of commands that were run during testing. But no
need for a v3, we can worry about that in future updates.

Bruce

>
> >
> > Bruce
> >
> > On Mon, Oct 22, 2018 at 4:12 AM <mingli.yu@windriver.com> wrote:
> >>
> >> From: Mingli Yu <Mingli.Yu@windriver.com>
> >>
> >> * Refresh patch to avoid fuzz warnings
> >> * Update to 3.0.2 as lxc-destroy failed when
> >>    system boot in nfs rootfs in lxc 3.0.1 as below:
> >>    # lxc-destroy -n test9
> >>    lxc-destroy: test9: utils.c: _recursive_rmdir: 149 Failed to delete=
 /var/lib/lxc/test9
> >>    lxc-destroy: test9: lxccontainer.c: container_destroy: 2946 Failed =
to destroy directory "/var/lib/lxc/test9" for "test9"
> >>    Destroying test9 failed
> >>
> >>    Update to 3.0.2 to fix the above issue
> >>
> >> Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
> >> ---
> >>   ...ionally-use-base-filenames-to-report-src-fil.patch | 19 +++++++++=
----------
> >>   ...xc-1.0.0-disable-udhcp-from-busybox-template.patch |  7 ++-----
> >>   .../lxc-doc-upgrade-to-use-docbook-3.1-DTD.patch      | 13 +++++----=
----
> >>   recipes-containers/lxc/files/lxc-fix-B-S.patch        | 18 +++++++++=
++++-----
> >>   ...-make-busybox-template-compatible-with-core-.patch | 13 ++++++---=
----
> >>   ...ates-actually-create-DOWNLOAD_TEMP-directory.patch |  6 ++----
> >>   ...add-no-validate-when-using-download-template.patch | 12 +++++----=
---
> >>   .../lxc/files/tests-our-init-is-not-busybox.patch     | 10 ++++-----=
-
> >>   recipes-containers/lxc/{lxc_3.0.1.bb =3D> lxc_3.0.2.bb} |  4 ++--
> >>   9 files changed, 48 insertions(+), 54 deletions(-)
> >>   rename recipes-containers/lxc/{lxc_3.0.1.bb =3D> lxc_3.0.2.bb} (97%)
> >>
> >> diff --git a/recipes-containers/lxc/files/logs-optionally-use-base-fil=
enames-to-report-src-fil.patch b/recipes-containers/lxc/files/logs-optional=
ly-use-base-filenames-to-report-src-fil.patch
> >> index f430601..648193b 100644
> >> --- a/recipes-containers/lxc/files/logs-optionally-use-base-filenames-=
to-report-src-fil.patch
> >> +++ b/recipes-containers/lxc/files/logs-optionally-use-base-filenames-=
to-report-src-fil.patch
> >> @@ -1,8 +1,9 @@
> >> -From 4729d0f4c4d1dacd150ddfd7061dda875eb94e34 Mon Sep 17 00:00:00 200=
1
> >> -Message-Id: <4729d0f4c4d1dacd150ddfd7061dda875eb94e34.1443216870.git.=
Jim.Somerville@windriver.com>
> >> +From c50ddb2b2cf22a29e4c671b1efbd338eeba694aa Mon Sep 17 00:00:00 200=
1
> >>   From: Jim Somerville <Jim.Somerville@windriver.com>
> >>   Date: Fri, 25 Sep 2015 15:08:17 -0400
> >> -Subject: [PATCH 1/1] logs: optionally use base filenames to report sr=
c files
> >> +Subject: [PATCH] logs: optionally use base filenames to report src fi=
les
> >> +
> >> +Message-Id: <4729d0f4c4d1dacd150ddfd7061dda875eb94e34.1443216870.git.=
Jim.Somerville@windriver.com>
> >>
> >>   Problem:  Logs are nice in that they report the source file,
> >>   routine, and line number where an issue occurs.  But the
> >> @@ -22,16 +23,17 @@ machinery, and that may still be the absolute path=
name to
> >>   the file.
> >>
> >>   Signed-off-by: Jim Somerville <Jim.Somerville@windriver.com>
> >> +
> >>   ---
> >>    configure.ac  | 9 +++++++++
> >>    src/lxc/log.h | 5 +++++
> >>    2 files changed, 14 insertions(+)
> >>
> >>   diff --git a/configure.ac b/configure.ac
> >> -index deba90b..c1ed67b 100644
> >> +index 74b976a..9c561f7 100644
> >>   --- a/configure.ac
> >>   +++ b/configure.ac
> >> -@@ -356,6 +356,15 @@ AM_COND_IF([ENABLE_PYTHON],
> >> +@@ -356,6 +356,15 @@ AC_ARG_ENABLE([examples],
> >>          [], [enable_examples=3Dyes])
> >>    AM_CONDITIONAL([ENABLE_EXAMPLES], [test "x$enable_examples" =3D "xy=
es"])
> >>
> >> @@ -48,11 +50,11 @@ index deba90b..c1ed67b 100644
> >>    AC_ARG_ENABLE([mutex-debugging],
> >>          [AC_HELP_STRING([--enable-mutex-debugging], [Makes mutexes to=
 report error and provide stack trace [default=3Dno]])],
> >>   diff --git a/src/lxc/log.h b/src/lxc/log.h
> >> -index 76bd4df..4365977 100644
> >> +index 4654fd9..6885d78 100644
> >>   --- a/src/lxc/log.h
> >>   +++ b/src/lxc/log.h
> >>   @@ -77,8 +77,13 @@ struct lxc_log_locinfo {
> >> -       int             line;
> >> +       int line;
> >>    };
> >>
> >>   +#ifdef LXC_LOG_USE_BASENAME
> >> @@ -65,6 +67,3 @@ index 76bd4df..4365977 100644
> >>
> >>    /* brief logging event object */
> >>    struct lxc_log_event {
> >> ---
> >> -1.8.3.2
> >> -
> >> diff --git a/recipes-containers/lxc/files/lxc-1.0.0-disable-udhcp-from=
-busybox-template.patch b/recipes-containers/lxc/files/lxc-1.0.0-disable-ud=
hcp-from-busybox-template.patch
> >> index 07a12ff..85177c8 100644
> >> --- a/recipes-containers/lxc/files/lxc-1.0.0-disable-udhcp-from-busybo=
x-template.patch
> >> +++ b/recipes-containers/lxc/files/lxc-1.0.0-disable-udhcp-from-busybo=
x-template.patch
> >> @@ -1,4 +1,4 @@
> >> -From d7e07e7acb1cbad33806f49143a2a30b4468c369 Mon Sep 17 00:00:00 200=
1
> >> +From 74efbe7f47379375c51948dd0f86248fb9429a1b Mon Sep 17 00:00:00 200=
1
> >>   From: Bogdan Purcareata <bogdan.purcareata@freescale.com>
> >>   Date: Mon, 8 Apr 2013 18:30:19 +0300
> >>   Subject: [PATCH] lxc-0.9.0-disable-udhcp-from-busybox-template
> >> @@ -8,7 +8,7 @@ Subject: [PATCH] lxc-0.9.0-disable-udhcp-from-busybox-=
template
> >>    1 file changed, 1 deletion(-)
> >>
> >>   diff --git a/templates/lxc-busybox.in b/templates/lxc-busybox.in
> >> -index cb425ec..bb8c951 100644
> >> +index 7243b36..9637a71 100644
> >>   --- a/templates/lxc-busybox.in
> >>   +++ b/templates/lxc-busybox.in
> >>   @@ -111,7 +111,6 @@ EOF
> >> @@ -19,6 +19,3 @@ index cb425ec..bb8c951 100644
> >>    EOF
> >>
> >>      # executable
> >> ----
> >> -1.7.11.7
> >> -
> >> diff --git a/recipes-containers/lxc/files/lxc-doc-upgrade-to-use-docbo=
ok-3.1-DTD.patch b/recipes-containers/lxc/files/lxc-doc-upgrade-to-use-docb=
ook-3.1-DTD.patch
> >> index 5f9d771..085ffe8 100644
> >> --- a/recipes-containers/lxc/files/lxc-doc-upgrade-to-use-docbook-3.1-=
DTD.patch
> >> +++ b/recipes-containers/lxc/files/lxc-doc-upgrade-to-use-docbook-3.1-=
DTD.patch
> >> @@ -1,8 +1,7 @@
> >> -From 4cf207ffd64c6f815e62ecbbf25b5a378e707182 Mon Sep 17 00:00:00 200=
1
> >> -Message-Id: <4cf207ffd64c6f815e62ecbbf25b5a378e707182.1439319694.git.=
Jim.Somerville@windriver.com>
> >> +From 5190dce1a675dfcdf88e3b94bd48070ac180bacc Mon Sep 17 00:00:00 200=
1
> >>   From: Jim Somerville <Jim.Somerville@windriver.com>
> >>   Date: Tue, 11 Aug 2015 14:05:00 -0400
> >> -Subject: [PATCH 1/1] lxc: doc: upgrade to use docbook 3.1 DTD
> >> +Subject: [PATCH] lxc: doc: upgrade to use docbook 3.1 DTD
> >>
> >>   docbook2man fails to build the man pages in poky
> >>   due to missing the ancient Davenport 3.0 DTD.
> >> @@ -10,15 +9,16 @@ Poky meta has the Oasis 3.1 version so upgrade
> >>   to use that instead.
> >>
> >>   Signed-off-by: Jim Somerville <Jim.Somerville@windriver.com>
> >> +
> >>   ---
> >>    configure.ac | 2 +-
> >>    1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >>   diff --git a/configure.ac b/configure.ac
> >> -index 4972803..2e67b5e 100644
> >> +index 1acc461..74b976a 100644
> >>   --- a/configure.ac
> >>   +++ b/configure.ac
> >> -@@ -179,7 +179,7 @@ AM_CONDITIONAL([ENABLE_DOCBOOK], [test "x$db2xman=
" !=3D "x"])
> >> +@@ -213,7 +213,7 @@ AM_CONDITIONAL([ENABLE_DOCBOOK], [test "x$db2xman=
" !=3D "x"])
> >>    AM_CONDITIONAL([USE_DOCBOOK2X], [test "x$db2xman" !=3D "xdocbook2ma=
n"])
> >>
> >>    if test "x$db2xman" =3D "xdocbook2man"; then
> >> @@ -27,6 +27,3 @@ index 4972803..2e67b5e 100644
> >>    else
> >>          docdtd=3D"\"-//OASIS//DTD DocBook XML\" \"http://www.oasis-op=
en.org/docbook/xml/4.5/docbookx.dtd\""
> >>    fi
> >> ---
> >> -1.8.3.2
> >> -
> >> diff --git a/recipes-containers/lxc/files/lxc-fix-B-S.patch b/recipes-=
containers/lxc/files/lxc-fix-B-S.patch
> >> index a776b4f..6b09193 100644
> >> --- a/recipes-containers/lxc/files/lxc-fix-B-S.patch
> >> +++ b/recipes-containers/lxc/files/lxc-fix-B-S.patch
> >> @@ -1,8 +1,16 @@
> >> -Index: lxc-2.0.0/config/init/upstart/Makefile.am
> >> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >> ---- lxc-2.0.0.orig/config/init/upstart/Makefile.am
> >> -+++ lxc-2.0.0/config/init/upstart/Makefile.am
> >> -@@ -3,9 +3,9 @@
> >> +From 2fa77a1803939de2d155a14cf680b53140b92f06 Mon Sep 17 00:00:00 200=
1
> >> +From: Dmitry Eremin-Solenikov <dmitry_eremin@mentor.com>
> >> +Date: Thu, 9 Apr 2015 23:01:48 +0300
> >> +
> >> +---
> >> + config/init/upstart/Makefile.am | 4 ++--
> >> + 1 file changed, 2 insertions(+), 2 deletions(-)
> >> +
> >> +diff --git a/config/init/upstart/Makefile.am b/config/init/upstart/Ma=
kefile.am
> >> +index 5552d32..186ae3d 100644
> >> +--- a/config/init/upstart/Makefile.am
> >> ++++ b/config/init/upstart/Makefile.am
> >> +@@ -3,9 +3,9 @@ EXTRA_DIST =3D lxc.conf lxc-instance.conf lxc-net.con=
f.in
> >>    if INIT_SCRIPT_UPSTART
> >>    install-upstart: lxc.conf lxc-instance.conf lxc-net.conf
> >>          $(MKDIR_P) $(DESTDIR)$(sysconfdir)/init/
> >> diff --git a/recipes-containers/lxc/files/template-make-busybox-templa=
te-compatible-with-core-.patch b/recipes-containers/lxc/files/template-make=
-busybox-template-compatible-with-core-.patch
> >> index 1c6022b..e4bb72a 100644
> >> --- a/recipes-containers/lxc/files/template-make-busybox-template-comp=
atible-with-core-.patch
> >> +++ b/recipes-containers/lxc/files/template-make-busybox-template-comp=
atible-with-core-.patch
> >> @@ -1,7 +1,8 @@
> >> -From 0990db9b9723589606104d42ac2cf865b78e50a1 Mon Sep 17 00:00:00 200=
1
> >> +From 3a7112a38d2c44b6fa49e0da1dc4765defd88dbb Mon Sep 17 00:00:00 200=
1
> >>   From: Mark Asselstine <mark.asselstine@windriver.com>
> >>   Date: Thu, 31 May 2018 11:44:44 -0400
> >>   Subject: [PATCH] template: make busybox template compatible with
> >> +
> >>    core-image-minimal
> >>
> >>   The busybox template makes a lot of assumptions about how the busybo=
x
> >> @@ -16,12 +17,13 @@ core-image-minimal to be able to demonstrate that =
it can work as well
> >>   as to have it available for the ptests.
> >>
> >>   Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> >> +
> >>   ---
> >>    templates/lxc-busybox.in | 16 +++++++++++++---
> >>    1 file changed, 13 insertions(+), 3 deletions(-)
> >>
> >>   diff --git a/templates/lxc-busybox.in b/templates/lxc-busybox.in
> >> -index 7d00bf5..5a99103 100644
> >> +index 9637a71..45b386f 100644
> >>   --- a/templates/lxc-busybox.in
> >>   +++ b/templates/lxc-busybox.in
> >>   @@ -181,6 +181,19 @@ configure_busybox()
> >> @@ -44,8 +46,8 @@ index 7d00bf5..5a99103 100644
> >>      # symlink busybox for the commands it supports
> >>      # it would be nice to just use "chroot $rootfs busybox --install =
-s /bin"
> >>      # but that only works right in a chroot with busybox >=3D 1.19.0
> >> -@@ -191,9 +204,6 @@ configure_busybox()
> >> -       xargs -n1 ln -s busybox
> >> +@@ -189,9 +202,6 @@ configure_busybox()
> >> +     ./busybox --list | grep -v busybox | xargs -n1 ln -s busybox
> >>      )
> >>
> >>   -  # relink /sbin/init
> >> @@ -54,6 +56,3 @@ index 7d00bf5..5a99103 100644
> >>      # /etc/fstab must exist for "mount -a"
> >>      touch "${rootfs}/etc/fstab"
> >>
> >> ---
> >> -2.7.4
> >> -
> >> diff --git a/recipes-containers/lxc/files/templates-actually-create-DO=
WNLOAD_TEMP-directory.patch b/recipes-containers/lxc/files/templates-actual=
ly-create-DOWNLOAD_TEMP-directory.patch
> >> index 44959db..756cddc 100644
> >> --- a/recipes-containers/lxc/files/templates-actually-create-DOWNLOAD_=
TEMP-directory.patch
> >> +++ b/recipes-containers/lxc/files/templates-actually-create-DOWNLOAD_=
TEMP-directory.patch
> >> @@ -1,4 +1,4 @@
> >> -From 1d83b86a9bf017257c068c662ec3bf52ec0cfe90 Mon Sep 17 00:00:00 200=
1
> >> +From 68b0dd97130ffc5776de9219a42188b4a140d446 Mon Sep 17 00:00:00 200=
1
> >>   From: Mark Asselstine <mark.asselstine@windriver.com>
> >>   Date: Thu, 31 May 2018 16:21:45 -0400
> >>   Subject: [PATCH] templates: actually create DOWNLOAD_TEMP directory
> >> @@ -17,6 +17,7 @@ location and DOWNLOAD_TEMP will be consistent with t=
his location.
> >>   Upstream-Status: Pending
> >>
> >>   Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> >> +
> >>   ---
> >>    templates/lxc-download.in | 2 +-
> >>    1 file changed, 1 insertion(+), 1 deletion(-)
> >> @@ -34,6 +35,3 @@ index 973783b..015a679 100644
> >>    fi
> >>
> >>    # Simply list images
> >> ---
> >> -2.11.1
> >> -
> >> diff --git a/recipes-containers/lxc/files/tests-add-no-validate-when-u=
sing-download-template.patch b/recipes-containers/lxc/files/tests-add-no-va=
lidate-when-using-download-template.patch
> >> index 81fd15d..abddef6 100644
> >> --- a/recipes-containers/lxc/files/tests-add-no-validate-when-using-do=
wnload-template.patch
> >> +++ b/recipes-containers/lxc/files/tests-add-no-validate-when-using-do=
wnload-template.patch
> >> @@ -1,4 +1,4 @@
> >> -From 0dad69a3bd306cc701c8bd4df4ea47f0ec5f9150 Mon Sep 17 00:00:00 200=
1
> >> +From 1b334bdaf598600314a678509a702728721001a2 Mon Sep 17 00:00:00 200=
1
> >>   From: Mark Asselstine <mark.asselstine@windriver.com>
> >>   Date: Thu, 31 May 2018 15:14:26 -0400
> >>   Subject: [PATCH] tests: add '--no-validate' when using download temp=
late
> >> @@ -9,6 +9,7 @@ interest to this test at any rate so simply add '--no-=
validate' to
> >>   avoid failing due to no GPG validation.
> >>
> >>   Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> >> +
> >>   ---
> >>    src/tests/lxc-test-apparmor-mount | 2 +-
> >>    src/tests/lxc-test-autostart      | 2 +-
> >> @@ -18,10 +19,10 @@ Signed-off-by: Mark Asselstine <mark.asselstine@wi=
ndriver.com>
> >>    5 files changed, 5 insertions(+), 5 deletions(-)
> >>
> >>   diff --git a/src/tests/lxc-test-apparmor-mount b/src/tests/lxc-test-=
apparmor-mount
> >> -index ddcee8a..d3d2c49 100755
> >> +index 56d598f..573cff8 100755
> >>   --- a/src/tests/lxc-test-apparmor-mount
> >>   +++ b/src/tests/lxc-test-apparmor-mount
> >> -@@ -157,7 +157,7 @@ if [ -f /etc/lsb-release ]; then
> >> +@@ -169,7 +169,7 @@ if [ -f /etc/lsb-release ]; then
> >>        done
> >>    fi
> >>
> >> @@ -29,7 +30,7 @@ index ddcee8a..d3d2c49 100755
> >>   +run_cmd lxc-create -t download -n $cname -- --no-validate -d ubuntu=
 -r $release -a $ARCH
> >>
> >>    echo "test default confined container"
> >> - run_cmd lxc-start -n $cname -d
> >> + run_cmd lxc-start -n $cname -d -lDEBUG -o "$logfile"
> >>   diff --git a/src/tests/lxc-test-autostart b/src/tests/lxc-test-autos=
tart
> >>   index e5b651b..d15b79b 100755
> >>   --- a/src/tests/lxc-test-autostart
> >> @@ -82,6 +83,3 @@ index 3e35008..f489286 100755
> >>    run_cmd "lxc-start -n b1 -d"
> >>    p1=3D$(run_cmd "lxc-info -n b1 -p -H")
> >>
> >> ---
> >> -2.7.4
> >> -
> >> diff --git a/recipes-containers/lxc/files/tests-our-init-is-not-busybo=
x.patch b/recipes-containers/lxc/files/tests-our-init-is-not-busybox.patch
> >> index 4c9bf65..e6c71d3 100644
> >> --- a/recipes-containers/lxc/files/tests-our-init-is-not-busybox.patch
> >> +++ b/recipes-containers/lxc/files/tests-our-init-is-not-busybox.patch
> >> @@ -1,4 +1,4 @@
> >> -From b53169dc4c53f9ef64f8cb06dd9af97182577698 Mon Sep 17 00:00:00 200=
1
> >> +From 51d88d9741c30ff4a798698514cac831ae61680b Mon Sep 17 00:00:00 200=
1
> >>   From: Mark Asselstine <mark.asselstine@windriver.com>
> >>   Date: Thu, 31 May 2018 15:00:34 -0400
> >>   Subject: [PATCH] tests: our init is not busybox
> >> @@ -9,15 +9,16 @@ really only interested in the fact 'cmp' is being ru=
n and not the
> >>   result, so simplify by comparing '/sbin/init' to itself.
> >>
> >>   Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> >> +
> >>   ---
> >>    src/tests/attach.c | 2 +-
> >>    1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >>   diff --git a/src/tests/attach.c b/src/tests/attach.c
> >> -index 2c77127..1c182d6 100644
> >> +index 07e641d..aac609f 100644
> >>   --- a/src/tests/attach.c
> >>   +++ b/src/tests/attach.c
> >> -@@ -251,7 +251,7 @@ static int test_attach_cmd(struct lxc_container *=
ct)
> >> +@@ -248,7 +248,7 @@ static int test_attach_cmd(struct lxc_container *=
ct)
> >>    {
> >>          int ret;
> >>          pid_t pid;
> >> @@ -26,6 +27,3 @@ index 2c77127..1c182d6 100644
> >>          lxc_attach_command_t command =3D {"cmp", argv};
> >>          lxc_attach_options_t attach_options =3D LXC_ATTACH_OPTIONS_DE=
FAULT;
> >>
> >> ---
> >> -2.7.4
> >> -
> >> diff --git a/recipes-containers/lxc/lxc_3.0.1.bb b/recipes-containers/=
lxc/lxc_3.0.2.bb
> >> similarity index 97%
> >> rename from recipes-containers/lxc/lxc_3.0.1.bb
> >> rename to recipes-containers/lxc/lxc_3.0.2.bb
> >> index d4bfd92..9bb2866 100644
> >> --- a/recipes-containers/lxc/lxc_3.0.1.bb
> >> +++ b/recipes-containers/lxc/lxc_3.0.2.bb
> >> @@ -48,8 +48,8 @@ SRC_URI =3D "http://linuxcontainers.org/downloads/${=
BPN}-${PV}.tar.gz \
> >>          file://lxc-net \
> >>          "
> >>
> >> -SRC_URI[md5sum] =3D "8eb396dde561e5832ba2d505513a1935"
> >> -SRC_URI[sha256sum] =3D "45986c49be1c048fa127bd3e7ea1bd3347e25765c008a=
09a2e4c233151a2d5db"
> >> +SRC_URI[md5sum] =3D "72e2f1e718c7ddf3ffa9b18ec0328d8f"
> >> +SRC_URI[sha256sum] =3D "6ab7117b17066220da450c55ed77953998cf2336d4151=
43b879554364af12f5c"
> >>
> >>   S =3D "${WORKDIR}/${BPN}-${PV}"
> >>
> >> --
> >> 2.7.4
> >>
> >
> >



--=20
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

