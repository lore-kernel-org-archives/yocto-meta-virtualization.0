Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75088EE57C9
	for <webhook@archiver.kernel.org>; Wed, 11 Sep 2024 17:34:45 +0000 (UTC)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
 by mx.groups.io with SMTP id smtpd.web11.27851.1726076075569782140
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 11 Sep 2024 10:34:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QKL+hI3S;
 spf=pass (domain: gmail.com, ip: 209.85.128.176, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-6db20e22c85so750687b3.0
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 11 Sep 2024 10:34:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726076075; x=1726680875; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=uNxWL4d0RgbBSlIEGmNo4f7+5lt35Z7CeO9IEeJ736A=;
        b=QKL+hI3S+I2bGopG+KGPbRoRJxDBUxViVJLk02NUQ6MuaDimff3Poln9E11JR90g/v
         32nScKQFAXv/p/lTI0Z//YfQTobg2EAflzCyBxIAeUYjb3Yd56h9cS7NgWj+mlGSuf1X
         H9N/LhamGb2O7tkb4co9K/9HVKSxYt7daPGU3EYh29KEb9zG39giQE0iu1rHGelX7jsl
         X5f0QFcd4jDOXJr4WstsY1HTdili1e01U0B3sbi4F8ZnpfQBvjvZbuh4nzIAApjmaKaM
         8kkt9aY5BdK9GyTG4asQ303moQSAKH7bndipmc7ZzcoocnrOqZglXufQOf5qDJNOEwFt
         ysJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726076075; x=1726680875;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uNxWL4d0RgbBSlIEGmNo4f7+5lt35Z7CeO9IEeJ736A=;
        b=G1+0THDiUkyb2EOf02xvH6b2wiZZKE2SaUvZ+sZm5rJIsAk3KUhpuGKGB8lkFpy0fg
         NbmqT8yFw4f5RS+2PUgd+Mf77N+bKOz2ErKhZsKlsNJgsueEZDXPnqwt42fCSVH7lFkn
         VLnCKit7A4686Po4xS0Qw/pRIfjf8Tqlyny7Hw9+9+prvhW7R+sayTskZvu0flpmyVje
         BOwn7xVtZE7d82xnyeHPLjuDZXGxh/49GX3UzlWlyWEE0PW/Hwra2g6TG8tchqvs0wEU
         zrvyWLLSfdHkl5zd6BKN3x2T0jpauaBhbeDtLIHShBD7ZKzVoWKxrQab27oAQzCXrVbc
         UgLQ==
X-Gm-Message-State: AOJu0YyWoS/Z9Fsvk/DZzw0nKAsrnp8SePO1GOarJtemieXq1Haqq/h5
	uYDZR8r/u6AvCjCQZblpsDzilboLCGGvJR4PK8GmDYmEYlFbivfP6QsjMfrpywFiHZ/dyptyDrJ
	Dm9fOwaT8fgUukpkh1Dbz1du//YE=
X-Google-Smtp-Source: AGHT+IHAwTIMMSoc8eX5G7pJ2d+6S2sQMGprD44Q6J4Eyai7ilxRcZEpyNXEcDhLqJmJ70WV98NJnh4y5u3+yTg+8cs=
X-Received: by 2002:a05:690c:6806:b0:6be:2044:935b with SMTP id
 00721157ae682-6dbb6b541f0mr3356857b3.25.1726076074330; Wed, 11 Sep 2024
 10:34:34 -0700 (PDT)
MIME-Version: 1.0
References: <20240911093107.85557-1-michal.orzel@amd.com> <CADkTA4NYi4S9zDWVTE6OvPgkPk6s3CTbP+qEbvZL-UizzkJMYg@mail.gmail.com>
 <6e9e999d-ca62-4dd1-bea2-4e7cbd89c91f@amd.com>
In-Reply-To: <6e9e999d-ca62-4dd1-bea2-4e7cbd89c91f@amd.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 11 Sep 2024 13:34:15 -0400
Message-ID: <CADkTA4MBX+CnDpL2L62TTD2Xhw4-BMZ26xgaoHVZYQJhGmsiUQ@mail.gmail.com>
Subject: Re: [PATCH] xen: Fix XEN_REL of xen-tools_git.bb
To: Michal Orzel <michal.orzel@amd.com>
Cc: meta-virtualization@lists.yoctoproject.org, christopher.w.clark@gmail.com
Content-Type: multipart/alternative; boundary="0000000000004414da0621db67bc"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 11 Sep 2024 17:34:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8883

--0000000000004414da0621db67bc
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 11, 2024 at 12:32=E2=80=AFPM Michal Orzel <michal.orzel@amd.com=
> wrote:

>
>
> On 11/09/2024 15:50, Bruce Ashfield wrote:
> >
> >
> >
> >
> >
> > On Wed, Sep 11, 2024 at 5:31=E2=80=AFAM Michal Orzel <michal.orzel@amd.=
com
> <mailto:michal.orzel@amd.com>> wrote:
> >
> >     It should match the master recipe of Xen hypervisor which sets
> XEN_REL
> >     to 4.19.
> >
> >
> > While on the master branch, the current SRCREV of the tools is 4.18 bas=
ed
> > (at least in my checking). I was going to bump _git just before the
> release as
> > I didn't want to it to exactly match 4.19 when I was adding the new
> recipes.
> If both xen and xen_tools specify the same commit SHA, we should use the
> same XEN_REL.
> Otherwise it looks strange. The issue is also with scarthgap, where we
> observe warnings
> due to this difference (i.e. tools specify 4.18 instead of 4.19).
>

The xen_git is incorrect (fom the maintenance perspective), and
hadn't noticed iit. I think I've mentioned before (on the list, not in
this Xen context) that versioning shouldn't be aspirational.

If there's no tag or -rc in play, then it  normally uses the last
tag/release + git<srcrev>. The +git keeps the version separate
and moving forward until the tag. I'd rather not have many
exceptions based on the myriad of ways projects do
their tagging and versioning.

But let's leave it as-is in master (for now), as I'd rather not have
version numbers going backwards as we need to use PE to fix
package feeds, etc. master will be fixed when I move _git to 4.20+

As for scarthgap, it could be fixable via a move to 4.18 and the
addition of PE to keep the number going forward. The _git
recipes are largely there for dev purposes (and hedging some
bets), so they aren't checked as heavily.

See the recent discussion about adding the 4.19 recipes to
scarthgap (but leaving the default on 4.18), since that would get
us a more supportable 4.19 than the _git recipes typically provide.


>
> >
> >
> >
> >     Also, take opportunity to remove no longer needed patches.
> >
> >
> > We should log why they are unneeded in the commit. Yes it is obvious
> > in most cases, but a one line statement for them helps me when I'm
> > looking later.
> Ok.
>
> >
> >
> >
> >
> >     Signed-off-by: Michal Orzel <michal.orzel@amd.com <mailto:
> michal.orzel@amd.com>>
> >     ---
> >     We could also update xen and tools to 4.20 right away to reflect th=
e
> current
> >     development version but I'm not sure if we want to do it at this
> point.
> >
> >
> > See above: that is already my plan for the next few weeks. I'll move _g=
it
> > away from 4.19 so the _git will be available in the release. It is ok f=
or
> > them to be unfinished and in development in that recipe.
> Do you mean that we should drop this patch completely because you are
> going to
> bump master recipes to XEN_REL ?=3D 4.20 development branch (i.e. current
> master)
> in the upcoming weeks?
>

I can just clean them up locally, or send the patch for that. Either
works. I wouldn't couple it to work on rel 4.20.

When I dropped 4.17, I zombied the patches and didn't notice.


> >
> >
> >
> >     Unrelated question:
> >     When vmsep is enabled, the tools recipe RRECOMMENDS qemu-x86_64 and
> qemu-i386.
> >     What is the reason behind it given that the only qemu that is neede=
d
> in the
> >     target rootfs for Xen is qemu-system-i386? What would be the best
> way to build
> >     only the QEMU required by Xen (upstream) and not all the possible
> combinations?
> >
> >
> > I'm not concerned about extra building of qemu components, it is only
> I am concerned. It takes definitely more time which is something we can
> observe in our upstream Xen CI.
> The less time we spend in the CI loop, the more patches we can test.
>

RRECOMMDENDs are just packages. There's going to be no difference
in build time by changing  them.  All of qemu is build no matter what, just
how they are put into packages changes based on the recipe and then
pulled in via rdepends/rreccomends. If we were removing the entire
dependency by dropping them from rrecommends, then we'd save build
time.


>
> > an issue if they are installed on the target (which of course they are
> > if images are configured to add rreccomends automatically).
> Yes, both user and system qemu for all the arches gets installed in the
> target.
>
>
Definitely. I was just providing context to say that at the moment it is
intentional via the history of the packaging and what we needed before.



> >
> > That's why meta-virt was the first part of the ecosystem to even offer
> > split qemu packages. It was all or nothing before that. You can see
> > that in some of the image  recipes that I'm still working on fixing up.
> > This is an artifact / holdover from that history.
> >
> > The vmsep based splitting covers quite a few different runtimes so it i=
s
> > a bit different than OEcore splitting, and I've kept it for
> compatibility with
> > other layers.
> >
> > We can absolutely change our rrecommends in the recipes. In the short
> > term, you could always :remove the packages you don't want and/or
> > configure your build to not automatically install rreccomends (but that
> > is more drastic and will likely break more).
> >
> > IIRC (and as you are saying) xen uses i366-system regardless of the
> > xen-host (target) architecture, so it does look like we should move
> > to qemu-i386-system for that rrecommend.
> Yes, that's what I'm saying. Will you look into it or should I send a
> patch?
>


Yup. Just be warned that it won't help build time, but will make the
runtime smaller.

Bruce



>
> ~Michal
>
> >
> > Bruce
> >
> >
> >     ---
> >      ...ython-pygrub-pass-DISTUTILS-xen-4.15.patch | 73
> -------------------
> >      ...enstored_control.c-correctly-print-t.patch | 34 ---------
> >      recipes-extended/xen/xen-tools_git.bb <http://xen-tools_git.bb>
>      |  2 +-
> >      3 files changed, 1 insertion(+), 108 deletions(-)
> >      delete mode 100644
> recipes-extended/xen/files/0001-python-pygrub-pass-DISTUTILS-xen-4.15.pat=
ch
> >      delete mode 100644
> recipes-extended/xen/files/0001-tools-xenstore-xenstored_control.c-correc=
tly-print-t.patch
> >
> >     diff --git
> a/recipes-extended/xen/files/0001-python-pygrub-pass-DISTUTILS-xen-4.15.p=
atch
> b/recipes-extended/xen/files/0001-python-pygrub-pass-DISTUTILS-xen-4.15.p=
atch
> >     deleted file mode 100644
> >     index 476f5ddcf1c6..000000000000
> >     ---
> a/recipes-extended/xen/files/0001-python-pygrub-pass-DISTUTILS-xen-4.15.p=
atch
> >     +++ /dev/null
> >     @@ -1,73 +0,0 @@
> >     -From 6db88791d923167f160afbcadeffad84a4cbdbc5 Mon Sep 17 00:00:00
> 2001
> >     -Message-Id: <
> 6db88791d923167f160afbcadeffad84a4cbdbc5.1612262706.git.bertrand.marquis@=
arm.com
> <mailto:
> 6db88791d923167f160afbcadeffad84a4cbdbc5.1612262706.git.bertrand.marquis@=
arm.com
> >>
> >     -From: Maciej Pijanowski <maciej.pijanowski@3mdeb.com <mailto:
> maciej.pijanowski@3mdeb.com>>
> >     -Date: Fri, 19 Oct 2018 11:01:37 +0200
> >     -Subject: [PATCH] python,pygrub: pass DISTUTILS env vars as setup.p=
y
> args
> >     -
> >     -Upstream-Status: Inappropriate [oe specific, python install issues=
]
> >     -
> >     -Allow to respect the target install dir (PYTHON_SITEPACKAGES_DIR)
> >     -as well as other parameters set by the OpenEmbedded build system.
> >     -This is especially useful when the target libdir is not the defaul=
t
> one
> >     -(/usr/lib), but for example /usr/lib64.
> >     -
> >     -Signed-off-by: Maciej Pijanowski <maciej.pijanowski@3mdeb.com
> <mailto:maciej.pijanowski@3mdeb.com>>
> >     -
> >     -Forward-ported to Xen 4.12.0
> >     -Signed-off-by: Christopher Clark <christopher.clark6@baesystems.co=
m
> <mailto:christopher.clark6@baesystems.com>>
> >     -
> >     -Modified to support pygrub installation with python 3
> >     -Signed-off-by: Christopher Clark <christopher.clark6@baesystems.co=
m
> <mailto:christopher.clark6@baesystems.com>>
> >     -
> >     -Forward-ported to Xen 4.14.0
> >     -Signed-off-by: Christopher Clark <christopher.clark6@baesystems.co=
m
> <mailto:christopher.clark6@baesystems.com>>
> >     -
> >     -Forward-ported to Xen 4.15.0
> >     -Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com <mailto:
> bertrand.marquis@arm.com>>
> >     -
> >     ----
> >     - tools/pygrub/Makefile | 7 +++++--
> >     - tools/python/Makefile | 2 +-
> >     - 2 files changed, 6 insertions(+), 3 deletions(-)
> >     -
> >     -diff --git a/tools/pygrub/Makefile b/tools/pygrub/Makefile
> >     -index 37b2146214..ffb9270065 100644
> >     ---- a/tools/pygrub/Makefile
> >     -+++ b/tools/pygrub/Makefile
> >     -@@ -10,7 +10,7 @@ INSTALL_LOG =3D build/installed_files.txt
> >     - all: build
> >     - .PHONY: build
> >     - build:
> >     --      CC=3D"$(CC)" CFLAGS=3D"$(PY_CFLAGS)" LDSHARED=3D"$(CC)"
> LDFLAGS=3D"$(PY_LDFLAGS)" $(PYTHON) setup.py build
> >     -+      CC=3D"$(CC)" CFLAGS=3D"$(PY_CFLAGS)" LDSHARED=3D"$(CC)"
> LDFLAGS=3D"$(PY_LDFLAGS)" $(PYTHON) setup.py build $(DISTUTILS_BUILD_ARGS=
)
> >     -
> >     - .PHONY: install
> >     - install: all
> >     -@@ -18,7 +18,10 @@ install: all
> >     -       CC=3D"$(CC)" CFLAGS=3D"$(PY_CFLAGS)" LDSHARED=3D"$(CC)" \
> >     -               LDFLAGS=3D"$(PY_LDFLAGS)" $(PYTHON) setup.py instal=
l \
> >     -               --record $(INSTALL_LOG) $(PYTHON_PREFIX_ARG) \
> >     --               --root=3D"$(DESTDIR)"
> --install-scripts=3D$(LIBEXEC_BIN) --force
> >     -+               --root=3D"$(DESTDIR)"
> --install-scripts=3D$(LIBEXEC_BIN) --force \
> >     -+               $(DISTUTILS_INSTALL_ARGS)
> >     -+      rm -f $(DESTDIR)/$(LIBEXEC_BIN)/pygrub
> >     -+      $(INSTALL_PYTHON_PROG) src/pygrub
> $(DESTDIR)/$(LIBEXEC_BIN)/pygrub
> >     -       set -e; if [ $(bindir) !=3D $(LIBEXEC_BIN) -a \
> >     -                    "`readlink -f $(DESTDIR)/$(bindir)`" !=3D \
> >     -                    "`readlink -f $(LIBEXEC_BIN)`" ]; then \
> >     -diff --git a/tools/python/Makefile b/tools/python/Makefile
> >     -index cc76423647..5cb11ae453 100644
> >     ---- a/tools/python/Makefile
> >     -+++ b/tools/python/Makefile
> >     -@@ -12,7 +12,7 @@ setup.py =3D CC=3D"$(CC)" CFLAGS=3D"$(PY_CFLAGS)=
"
> LDSHARED=3D"$(CC)" LDFLAGS=3D"$(PY_LDFLA
> >     -            SHLIB_libxenctrl=3D"$(SHLIB_libxenctrl)" \
> >     -            SHLIB_libxenguest=3D"$(SHLIB_libxenguest)" \
> >     -            SHLIB_libxenstore=3D"$(SHLIB_libxenstore)" \
> >     --           $(PYTHON) setup.py
> >     -+           $(PYTHON) setup.py $(DISTUTILS_BUILD_ARGS)
> >     -
> >     - .PHONY: build
> >     - build:
> >     ---
> >     -2.17.1
> >     -
> >     diff --git
> a/recipes-extended/xen/files/0001-tools-xenstore-xenstored_control.c-corr=
ectly-print-t.patch
> b/recipes-extended/xen/files/0001-tools-xenstore-xenstored_control.c-corr=
ectly-print-t.patch
> >     deleted file mode 100644
> >     index bf99f5e8c54c..000000000000
> >     ---
> a/recipes-extended/xen/files/0001-tools-xenstore-xenstored_control.c-corr=
ectly-print-t.patch
> >     +++ /dev/null
> >     @@ -1,34 +0,0 @@
> >     -From c7c43c4531fe1cd188f62d9905c3f5c7a29a6fb0 Mon Sep 17 00:00:00
> 2001
> >     -From: Alexander Kanavin <alex@linutronix.de <mailto:
> alex@linutronix.de>>
> >     -Date: Wed, 12 Apr 2023 10:30:18 +0200
> >     -Subject: [PATCH] tools/xenstore/xenstored_control.c: correctly
> print time_t
> >     -
> >     -On 32 bit systems with 64 bit time_t (hello, Y2038 problem),
> >     -the following error occurs otherwise:
> >     -
> >     -| xenstored_control.c: In function 'lu_reject_reason':
> >     -| xenstored_control.c:646:70: error: format '%ld' expects argument
> of type 'long int', but argument 5 has type 'time_t' {aka 'long long int'=
}
> [-Werror=3Dformat=3D]
> >     -
> >     -Upstream-Status: Submitted [by email to
> xen-devel@lists.xenproject.org <mailto:xen-devel@lists.xenproject.org>
> and maintainers as suggested by add_maintainers.pl <
> http://add_maintainers.pl> script]
> >     -Signed-off-by: Alexander Kanavin <alex@linutronix.de <mailto:
> alex@linutronix.de>>
> >     ----
> >     - tools/xenstore/xenstored_control.c | 4 ++--
> >     - 1 file changed, 2 insertions(+), 2 deletions(-)
> >     -
> >     -diff --git a/tools/xenstore/xenstored_control.c
> b/tools/xenstore/xenstored_control.c
> >     -index d1aaa00bf4..8d318c0399 100644
> >     ---- a/tools/xenstore/xenstored_control.c
> >     -+++ b/tools/xenstore/xenstored_control.c
> >     -@@ -643,10 +643,10 @@ static const char *lu_reject_reason(const
> void *ctx)
> >     -       list_for_each_entry(conn, &connections, list) {
> >     -               if (conn->ta_start_time &&
> >     -                   (now - conn->ta_start_time >=3D
> lu_status->timeout)) {
> >     --                      ret =3D talloc_asprintf(ctx, "%s\nDomain %u=
:
> %ld s",
> >     -+                      ret =3D talloc_asprintf(ctx, "%s\nDomain %u=
:
> %jd s",
> >     -                                             ret ? : "Domains with
> long running transactions:",
> >     -                                             conn->id,
> >     --                                            now -
> conn->ta_start_time);
> >     -+                                            (intmax_t)now -
> conn->ta_start_time);
> >     -               }
> >     -       }
> >     -
> >     diff --git a/recipes-extended/xen/xen-tools_git.bb <
> http://xen-tools_git.bb> b/recipes-extended/xen/xen-tools_git.bb <
> http://xen-tools_git.bb>
> >     index 8397178e8d4b..b443b13eeab3 100644
> >     --- a/recipes-extended/xen/xen-tools_git.bb <http://xen-tools_git.b=
b
> >
> >     +++ b/recipes-extended/xen/xen-tools_git.bb <http://xen-tools_git.b=
b
> >
> >     @@ -1,7 +1,7 @@
> >      # master status on 2023-05-26
> >      SRCREV ?=3D "03cf7ca23e0e876075954c558485b267b7d02406"
> >
> >     -XEN_REL ?=3D "4.18"
> >     +XEN_REL ?=3D "4.19"
> >      XEN_BRANCH ?=3D "master"
> >
> >      SRC_URI =3D " \
> >     --
> >     2.25.1
> >
> >
> >
> > --
> > - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> > - "Use the force Harry" - Gandalf, Star Trek II
> >
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--0000000000004414da0621db67bc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Wed, Sep 11, 2024 at 12:32=E2=80=AFPM Michal Orz=
el &lt;<a href=3D"mailto:michal.orzel@amd.com">michal.orzel@amd.com</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
<br>
On 11/09/2024 15:50, Bruce Ashfield wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; On Wed, Sep 11, 2024 at 5:31=E2=80=AFAM Michal Orzel &lt;<a href=3D"ma=
ilto:michal.orzel@amd.com" target=3D"_blank">michal.orzel@amd.com</a> &lt;m=
ailto:<a href=3D"mailto:michal.orzel@amd.com" target=3D"_blank">michal.orze=
l@amd.com</a>&gt;&gt; wrote:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0It should match the master recipe of Xen hypervisor=
 which sets XEN_REL<br>
&gt;=C2=A0 =C2=A0 =C2=A0to 4.19.<br>
&gt; <br>
&gt; <br>
&gt; While on the master branch, the current SRCREV of the tools is 4.18 ba=
sed<br>
&gt; (at least in my checking). I was going to bump _git just before the re=
lease as<br>
&gt; I didn&#39;t want to it to exactly match 4.19 when I was adding the ne=
w recipes.<br>
If both xen and xen_tools specify the same commit SHA, we should use the sa=
me XEN_REL.<br>
Otherwise it looks strange. The issue is also with scarthgap, where we obse=
rve warnings<br>
due to this difference (i.e. tools specify 4.18 instead of 4.19).<br></bloc=
kquote><div><br></div><div><div class=3D"gmail_default" style=3D"font-size:=
small">The xen_git is incorrect (fom the maintenance perspective), and=C2=
=A0</div><div class=3D"gmail_default" style=3D"font-size:small">hadn&#39;t =
noticed iit. I think I&#39;ve mentioned before (on the list, not in</div><d=
iv class=3D"gmail_default" style=3D"font-size:small">this Xen context) that=
 versioning shouldn&#39;t be aspirational.=C2=A0</div><div class=3D"gmail_d=
efault" style=3D"font-size:small"><br></div><div class=3D"gmail_default" st=
yle=3D"font-size:small">If there&#39;s no tag or -rc in play, then it=C2=A0=
 normally uses the last=C2=A0</div><div class=3D"gmail_default" style=3D"fo=
nt-size:small">tag/release=C2=A0+ git&lt;srcrev&gt;. The=C2=A0+git keeps th=
e version separate</div><div class=3D"gmail_default" style=3D"font-size:sma=
ll">and moving forward until the tag. I&#39;d rather not have many</div><di=
v class=3D"gmail_default" style=3D"font-size:small">exceptions based on the=
 myriad of ways projects do</div><div class=3D"gmail_default" style=3D"font=
-size:small">their tagging and versioning.</div><div class=3D"gmail_default=
" style=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D=
"font-size:small">But let&#39;s leave it as-is in master (for now), as I&#3=
9;d rather not have</div><div class=3D"gmail_default" style=3D"font-size:sm=
all">version numbers going backwards as we need to use PE to fix</div><div =
class=3D"gmail_default" style=3D"font-size:small">package feeds, etc. maste=
r will be fixed when I move _git to 4.20+</div><div class=3D"gmail_default"=
 style=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D"=
font-size:small">As for scarthgap, it could be fixable via a move to 4.18 a=
nd the</div><div class=3D"gmail_default" style=3D"font-size:small">addition=
 of PE to keep the number going forward. The _git</div><div class=3D"gmail_=
default" style=3D"font-size:small">recipes are largely there for dev purpos=
es (and hedging some</div><div class=3D"gmail_default" style=3D"font-size:s=
mall">bets), so they aren&#39;t checked as heavily.=C2=A0</div><div class=
=3D"gmail_default" style=3D"font-size:small"><br></div><div class=3D"gmail_=
default" style=3D"font-size:small">See the recent discussion about adding t=
he 4.19 recipes to</div><div class=3D"gmail_default" style=3D"font-size:sma=
ll">scarthgap=C2=A0(but leaving the default on 4.18), since that would get<=
/div><div class=3D"gmail_default" style=3D"font-size:small">us a more suppo=
rtable 4.19 than the _git recipes typically provide.</div><div class=3D"gma=
il_default" style=3D"font-size:small">=C2=A0</div></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
<br>
&gt; =C2=A0<br>
&gt; <br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Also, take opportunity to remove no longer needed p=
atches.<br>
&gt; <br>
&gt; <br>
&gt; We should log why they are unneeded in the commit. Yes it is obvious<b=
r>
&gt; in most cases, but a one line statement for them helps me when I&#39;m=
<br>
&gt; looking later.<br>
Ok.<br>
<br>
&gt; <br>
&gt; =C2=A0<br>
&gt; <br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Signed-off-by: Michal Orzel &lt;<a href=3D"mailto:m=
ichal.orzel@amd.com" target=3D"_blank">michal.orzel@amd.com</a> &lt;mailto:=
<a href=3D"mailto:michal.orzel@amd.com" target=3D"_blank">michal.orzel@amd.=
com</a>&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0---<br>
&gt;=C2=A0 =C2=A0 =C2=A0We could also update xen and tools to 4.20 right aw=
ay to reflect the current<br>
&gt;=C2=A0 =C2=A0 =C2=A0development version but I&#39;m not sure if we want=
 to do it at this point.<br>
&gt; <br>
&gt; <br>
&gt; See above: that is already my plan for the next few weeks. I&#39;ll mo=
ve _git<br>
&gt; away from 4.19 so the _git will be available in the release. It is ok =
for<br>
&gt; them to be unfinished and in development in that recipe.<br>
Do you mean that we should drop this patch completely because you are going=
 to<br>
bump master recipes to XEN_REL ?=3D 4.20 development branch (i.e. current m=
aster)<br>
in the upcoming weeks?<br></blockquote><div><br></div><div><div class=3D"gm=
ail_default" style=3D"font-size:small">I can just clean them up locally, or=
 send the patch for that. Either</div><div class=3D"gmail_default" style=3D=
"font-size:small">works. I wouldn&#39;t couple it to work on rel 4.20.</div=
><div class=3D"gmail_default" style=3D"font-size:small"><br></div><div clas=
s=3D"gmail_default" style=3D"font-size:small">When I dropped 4.17, I zombie=
d the patches and didn&#39;t notice.</div></div><div><div class=3D"gmail_de=
fault" style=3D"font-size:small"><br></div></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex">
<br>
&gt; <br>
&gt; =C2=A0<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Unrelated question:<br>
&gt;=C2=A0 =C2=A0 =C2=A0When vmsep is enabled, the tools recipe RRECOMMENDS=
 qemu-x86_64 and qemu-i386.<br>
&gt;=C2=A0 =C2=A0 =C2=A0What is the reason behind it given that the only qe=
mu that is needed in the<br>
&gt;=C2=A0 =C2=A0 =C2=A0target rootfs for Xen is qemu-system-i386? What wou=
ld be the best way to build<br>
&gt;=C2=A0 =C2=A0 =C2=A0only the QEMU required by Xen (upstream) and not al=
l the possible combinations?<br>
&gt; <br>
&gt; <br>
&gt; I&#39;m not concerned about extra building of qemu components, it is o=
nly<br>
I am concerned. It takes definitely more time which is something we can obs=
erve in our upstream Xen CI.<br>
The less time we spend in the CI loop, the more patches we can test.<br></b=
lockquote><div><br></div><div><div class=3D"gmail_default" style=3D"font-si=
ze:small">RRECOMMDENDs are just packages. There&#39;s going to be no differ=
ence</div><div class=3D"gmail_default" style=3D"font-size:small">in build t=
ime by changing=C2=A0 them.=C2=A0 All of qemu is build no matter what, just=
</div></div><div class=3D"gmail_default" style=3D"font-size:small">how they=
 are put into packages changes based on the recipe and then</div><div class=
=3D"gmail_default" style=3D"font-size:small">pulled in via rdepends/rreccom=
ends. If we were removing the entire</div><div class=3D"gmail_default" styl=
e=3D"font-size:small">dependency by dropping them from rrecommends, then we=
&#39;d save build</div><div class=3D"gmail_default" style=3D"font-size:smal=
l">time.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">
<br>
&gt; an issue if they are installed on the target (which of course they are=
<br>
&gt; if images are configured to add rreccomends automatically).=C2=A0<br>
Yes, both user and system qemu for all the arches gets installed in the tar=
get.<br>
<br></blockquote><div><br></div><div><div class=3D"gmail_default" style=3D"=
font-size:small">Definitely. I was just providing context to say that at th=
e moment it is=C2=A0</div><div class=3D"gmail_default" style=3D"font-size:s=
mall">intentional via the history of the packaging and what we needed befor=
e.</div><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
&gt; <br>
&gt; That&#39;s why meta-virt was the first part of the ecosystem to even o=
ffer<br>
&gt; split qemu packages. It was all or nothing before that. You can see<br=
>
&gt; that in some of the image=C2=A0 recipes that I&#39;m still working on =
fixing up.<br>
&gt; This is an artifact / holdover from that history.<br>
&gt; <br>
&gt; The vmsep=C2=A0based splitting covers quite a few different runtimes s=
o it is<br>
&gt; a bit different than OEcore splitting, and I&#39;ve kept it for compat=
ibility with<br>
&gt; other layers.=C2=A0<br>
&gt; <br>
&gt; We can absolutely change our rrecommends in the recipes. In the short<=
br>
&gt; term, you could always :remove the packages you don&#39;t want and/or=
=C2=A0<br>
&gt; configure your build to not automatically install rreccomends (but tha=
t<br>
&gt; is more drastic and will likely break more).<br>
&gt; <br>
&gt; IIRC (and as you are saying) xen uses i366-system regardless of the<br=
>
&gt; xen-host (target) architecture, so it does look like we should move=C2=
=A0<br>
&gt; to qemu-i386-system for that rrecommend.<br>
Yes, that&#39;s what I&#39;m saying. Will you look into it or should I send=
 a patch?<br></blockquote><div><br></div><div><div class=3D"gmail_default" =
style=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D"f=
ont-size:small">Yup. Just be warned that it won&#39;t help build time, but =
will make the</div><div class=3D"gmail_default" style=3D"font-size:small">r=
untime smaller.</div><div class=3D"gmail_default" style=3D"font-size:small"=
><br></div><div class=3D"gmail_default" style=3D"font-size:small">Bruce</di=
v><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex">
<br>
~Michal<br>
<br>
&gt; <br>
&gt; Bruce=C2=A0<br>
&gt; =C2=A0<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0---<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0...ython-pygrub-pass-DISTUTILS-xen-4.15.patch=
 | 73 -------------------<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0...enstored_control.c-correctly-print-t.patch=
 | 34 ---------<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0recipes-extended/xen/<a href=3D"http://xen-to=
ols_git.bb" rel=3D"noreferrer" target=3D"_blank">xen-tools_git.bb</a> &lt;<=
a href=3D"http://xen-tools_git.bb" rel=3D"noreferrer" target=3D"_blank">htt=
p://xen-tools_git.bb</a>&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 2 +-<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A03 files changed, 1 insertion(+), 108 deletion=
s(-)<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0delete mode 100644 recipes-extended/xen/files=
/0001-python-pygrub-pass-DISTUTILS-xen-4.15.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0delete mode 100644 recipes-extended/xen/files=
/0001-tools-xenstore-xenstored_control.c-correctly-print-t.patch<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0diff --git a/recipes-extended/xen/files/0001-python=
-pygrub-pass-DISTUTILS-xen-4.15.patch b/recipes-extended/xen/files/0001-pyt=
hon-pygrub-pass-DISTUTILS-xen-4.15.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0deleted file mode 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0index 476f5ddcf1c6..000000000000<br>
&gt;=C2=A0 =C2=A0 =C2=A0--- a/recipes-extended/xen/files/0001-python-pygrub=
-pass-DISTUTILS-xen-4.15.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0+++ /dev/null<br>
&gt;=C2=A0 =C2=A0 =C2=A0@@ -1,73 +0,0 @@<br>
&gt;=C2=A0 =C2=A0 =C2=A0-From 6db88791d923167f160afbcadeffad84a4cbdbc5 Mon =
Sep 17 00:00:00 2001<br>
&gt;=C2=A0 =C2=A0 =C2=A0-Message-Id: &lt;<a href=3D"mailto:6db88791d923167f=
160afbcadeffad84a4cbdbc5.1612262706.git.bertrand.marquis@arm.com" target=3D=
"_blank">6db88791d923167f160afbcadeffad84a4cbdbc5.1612262706.git.bertrand.m=
arquis@arm.com</a> &lt;mailto:<a href=3D"mailto:6db88791d923167f160afbcadef=
fad84a4cbdbc5.1612262706.git.bertrand.marquis@arm.com" target=3D"_blank">6d=
b88791d923167f160afbcadeffad84a4cbdbc5.1612262706.git.bertrand.marquis@arm.=
com</a>&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0-From: Maciej Pijanowski &lt;<a href=3D"mailto:maci=
ej.pijanowski@3mdeb.com" target=3D"_blank">maciej.pijanowski@3mdeb.com</a> =
&lt;mailto:<a href=3D"mailto:maciej.pijanowski@3mdeb.com" target=3D"_blank"=
>maciej.pijanowski@3mdeb.com</a>&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0-Date: Fri, 19 Oct 2018 11:01:37 +0200<br>
&gt;=C2=A0 =C2=A0 =C2=A0-Subject: [PATCH] python,pygrub: pass DISTUTILS env=
 vars as setup.py args<br>
&gt;=C2=A0 =C2=A0 =C2=A0-<br>
&gt;=C2=A0 =C2=A0 =C2=A0-Upstream-Status: Inappropriate [oe specific, pytho=
n install issues]<br>
&gt;=C2=A0 =C2=A0 =C2=A0-<br>
&gt;=C2=A0 =C2=A0 =C2=A0-Allow to respect the target install dir (PYTHON_SI=
TEPACKAGES_DIR)<br>
&gt;=C2=A0 =C2=A0 =C2=A0-as well as other parameters set by the OpenEmbedde=
d build system.<br>
&gt;=C2=A0 =C2=A0 =C2=A0-This is especially useful when the target libdir i=
s not the default one<br>
&gt;=C2=A0 =C2=A0 =C2=A0-(/usr/lib), but for example /usr/lib64.<br>
&gt;=C2=A0 =C2=A0 =C2=A0-<br>
&gt;=C2=A0 =C2=A0 =C2=A0-Signed-off-by: Maciej Pijanowski &lt;<a href=3D"ma=
ilto:maciej.pijanowski@3mdeb.com" target=3D"_blank">maciej.pijanowski@3mdeb=
.com</a> &lt;mailto:<a href=3D"mailto:maciej.pijanowski@3mdeb.com" target=
=3D"_blank">maciej.pijanowski@3mdeb.com</a>&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0-<br>
&gt;=C2=A0 =C2=A0 =C2=A0-Forward-ported to Xen 4.12.0<br>
&gt;=C2=A0 =C2=A0 =C2=A0-Signed-off-by: Christopher Clark &lt;<a href=3D"ma=
ilto:christopher.clark6@baesystems.com" target=3D"_blank">christopher.clark=
6@baesystems.com</a> &lt;mailto:<a href=3D"mailto:christopher.clark6@baesys=
tems.com" target=3D"_blank">christopher.clark6@baesystems.com</a>&gt;&gt;<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0-<br>
&gt;=C2=A0 =C2=A0 =C2=A0-Modified to support pygrub installation with pytho=
n 3<br>
&gt;=C2=A0 =C2=A0 =C2=A0-Signed-off-by: Christopher Clark &lt;<a href=3D"ma=
ilto:christopher.clark6@baesystems.com" target=3D"_blank">christopher.clark=
6@baesystems.com</a> &lt;mailto:<a href=3D"mailto:christopher.clark6@baesys=
tems.com" target=3D"_blank">christopher.clark6@baesystems.com</a>&gt;&gt;<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0-<br>
&gt;=C2=A0 =C2=A0 =C2=A0-Forward-ported to Xen 4.14.0<br>
&gt;=C2=A0 =C2=A0 =C2=A0-Signed-off-by: Christopher Clark &lt;<a href=3D"ma=
ilto:christopher.clark6@baesystems.com" target=3D"_blank">christopher.clark=
6@baesystems.com</a> &lt;mailto:<a href=3D"mailto:christopher.clark6@baesys=
tems.com" target=3D"_blank">christopher.clark6@baesystems.com</a>&gt;&gt;<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0-<br>
&gt;=C2=A0 =C2=A0 =C2=A0-Forward-ported to Xen 4.15.0<br>
&gt;=C2=A0 =C2=A0 =C2=A0-Signed-off-by: Bertrand Marquis &lt;<a href=3D"mai=
lto:bertrand.marquis@arm.com" target=3D"_blank">bertrand.marquis@arm.com</a=
> &lt;mailto:<a href=3D"mailto:bertrand.marquis@arm.com" target=3D"_blank">=
bertrand.marquis@arm.com</a>&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0-<br>
&gt;=C2=A0 =C2=A0 =C2=A0----<br>
&gt;=C2=A0 =C2=A0 =C2=A0- tools/pygrub/Makefile | 7 +++++--<br>
&gt;=C2=A0 =C2=A0 =C2=A0- tools/python/Makefile | 2 +-<br>
&gt;=C2=A0 =C2=A0 =C2=A0- 2 files changed, 6 insertions(+), 3 deletions(-)<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0-<br>
&gt;=C2=A0 =C2=A0 =C2=A0-diff --git a/tools/pygrub/Makefile b/tools/pygrub/=
Makefile<br>
&gt;=C2=A0 =C2=A0 =C2=A0-index 37b2146214..ffb9270065 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0---- a/tools/pygrub/Makefile<br>
&gt;=C2=A0 =C2=A0 =C2=A0-+++ b/tools/pygrub/Makefile<br>
&gt;=C2=A0 =C2=A0 =C2=A0-@@ -10,7 +10,7 @@ INSTALL_LOG =3D build/installed_=
files.txt<br>
&gt;=C2=A0 =C2=A0 =C2=A0- all: build<br>
&gt;=C2=A0 =C2=A0 =C2=A0- .PHONY: build<br>
&gt;=C2=A0 =C2=A0 =C2=A0- build:<br>
&gt;=C2=A0 =C2=A0 =C2=A0--=C2=A0 =C2=A0 =C2=A0 CC=3D&quot;$(CC)&quot; CFLAG=
S=3D&quot;$(PY_CFLAGS)&quot; LDSHARED=3D&quot;$(CC)&quot; LDFLAGS=3D&quot;$=
(PY_LDFLAGS)&quot; $(PYTHON) setup.py build<br>
&gt;=C2=A0 =C2=A0 =C2=A0-+=C2=A0 =C2=A0 =C2=A0 CC=3D&quot;$(CC)&quot; CFLAG=
S=3D&quot;$(PY_CFLAGS)&quot; LDSHARED=3D&quot;$(CC)&quot; LDFLAGS=3D&quot;$=
(PY_LDFLAGS)&quot; $(PYTHON) setup.py build $(DISTUTILS_BUILD_ARGS)<br>
&gt;=C2=A0 =C2=A0 =C2=A0-<br>
&gt;=C2=A0 =C2=A0 =C2=A0- .PHONY: install<br>
&gt;=C2=A0 =C2=A0 =C2=A0- install: all<br>
&gt;=C2=A0 =C2=A0 =C2=A0-@@ -18,7 +18,10 @@ install: all<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0CC=3D&quot;$(CC)&quot; =
CFLAGS=3D&quot;$(PY_CFLAGS)&quot; LDSHARED=3D&quot;$(CC)&quot; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0LDFLAGS=3D&quot;$(PY_LDFLAGS)&quot; $(PYTHON) setup.py install \<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0--record $(INSTALL_LOG) $(PYTHON_PREFIX_ARG) \<br>
&gt;=C2=A0 =C2=A0 =C2=A0--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0--root=3D&quot;$(DESTDIR)&quot; --install-scripts=3D$(LIBEXEC_BIN) --=
force<br>
&gt;=C2=A0 =C2=A0 =C2=A0-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0--root=3D&quot;$(DESTDIR)&quot; --install-scripts=3D$(LIBEXEC_BIN) --=
force \<br>
&gt;=C2=A0 =C2=A0 =C2=A0-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0$(DISTUTILS_INSTALL_ARGS)<br>
&gt;=C2=A0 =C2=A0 =C2=A0-+=C2=A0 =C2=A0 =C2=A0 rm -f $(DESTDIR)/$(LIBEXEC_B=
IN)/pygrub<br>
&gt;=C2=A0 =C2=A0 =C2=A0-+=C2=A0 =C2=A0 =C2=A0 $(INSTALL_PYTHON_PROG) src/p=
ygrub $(DESTDIR)/$(LIBEXEC_BIN)/pygrub<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0set -e; if [ $(bindir) =
!=3D $(LIBEXEC_BIN) -a \<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 &quot;`readlink -f $(DESTDIR)/$(bindir)`&quot; !=3D \<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 &quot;`readlink -f $(LIBEXEC_BIN)`&quot; ]; then \<br>
&gt;=C2=A0 =C2=A0 =C2=A0-diff --git a/tools/python/Makefile b/tools/python/=
Makefile<br>
&gt;=C2=A0 =C2=A0 =C2=A0-index cc76423647..5cb11ae453 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0---- a/tools/python/Makefile<br>
&gt;=C2=A0 =C2=A0 =C2=A0-+++ b/tools/python/Makefile<br>
&gt;=C2=A0 =C2=A0 =C2=A0-@@ -12,7 +12,7 @@ setup.py =3D CC=3D&quot;$(CC)&qu=
ot; CFLAGS=3D&quot;$(PY_CFLAGS)&quot; LDSHARED=3D&quot;$(CC)&quot; LDFLAGS=
=3D&quot;$(PY_LDFLA<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 SHLIB_li=
bxenctrl=3D&quot;$(SHLIB_libxenctrl)&quot; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 SHLIB_li=
bxenguest=3D&quot;$(SHLIB_libxenguest)&quot; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 SHLIB_li=
bxenstore=3D&quot;$(SHLIB_libxenstore)&quot; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(PYTHON=
) setup.py<br>
&gt;=C2=A0 =C2=A0 =C2=A0-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(PYTHON=
) setup.py $(DISTUTILS_BUILD_ARGS)<br>
&gt;=C2=A0 =C2=A0 =C2=A0-<br>
&gt;=C2=A0 =C2=A0 =C2=A0- .PHONY: build<br>
&gt;=C2=A0 =C2=A0 =C2=A0- build:<br>
&gt;=C2=A0 =C2=A0 =C2=A0---<br>
&gt;=C2=A0 =C2=A0 =C2=A0-2.17.1<br>
&gt;=C2=A0 =C2=A0 =C2=A0-<br>
&gt;=C2=A0 =C2=A0 =C2=A0diff --git a/recipes-extended/xen/files/0001-tools-=
xenstore-xenstored_control.c-correctly-print-t.patch b/recipes-extended/xen=
/files/0001-tools-xenstore-xenstored_control.c-correctly-print-t.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0deleted file mode 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0index bf99f5e8c54c..000000000000<br>
&gt;=C2=A0 =C2=A0 =C2=A0--- a/recipes-extended/xen/files/0001-tools-xenstor=
e-xenstored_control.c-correctly-print-t.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0+++ /dev/null<br>
&gt;=C2=A0 =C2=A0 =C2=A0@@ -1,34 +0,0 @@<br>
&gt;=C2=A0 =C2=A0 =C2=A0-From c7c43c4531fe1cd188f62d9905c3f5c7a29a6fb0 Mon =
Sep 17 00:00:00 2001<br>
&gt;=C2=A0 =C2=A0 =C2=A0-From: Alexander Kanavin &lt;<a href=3D"mailto:alex=
@linutronix.de" target=3D"_blank">alex@linutronix.de</a> &lt;mailto:<a href=
=3D"mailto:alex@linutronix.de" target=3D"_blank">alex@linutronix.de</a>&gt;=
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0-Date: Wed, 12 Apr 2023 10:30:18 +0200<br>
&gt;=C2=A0 =C2=A0 =C2=A0-Subject: [PATCH] tools/xenstore/xenstored_control.=
c: correctly print time_t<br>
&gt;=C2=A0 =C2=A0 =C2=A0-<br>
&gt;=C2=A0 =C2=A0 =C2=A0-On 32 bit systems with 64 bit time_t (hello, Y2038=
 problem),<br>
&gt;=C2=A0 =C2=A0 =C2=A0-the following error occurs otherwise:<br>
&gt;=C2=A0 =C2=A0 =C2=A0-<br>
&gt;=C2=A0 =C2=A0 =C2=A0-| xenstored_control.c: In function &#39;lu_reject_=
reason&#39;:<br>
&gt;=C2=A0 =C2=A0 =C2=A0-| xenstored_control.c:646:70: error: format &#39;%=
ld&#39; expects argument of type &#39;long int&#39;, but argument 5 has typ=
e &#39;time_t&#39; {aka &#39;long long int&#39;} [-Werror=3Dformat=3D]<br>
&gt;=C2=A0 =C2=A0 =C2=A0-<br>
&gt;=C2=A0 =C2=A0 =C2=A0-Upstream-Status: Submitted [by email to <a href=3D=
"mailto:xen-devel@lists.xenproject.org" target=3D"_blank">xen-devel@lists.x=
enproject.org</a> &lt;mailto:<a href=3D"mailto:xen-devel@lists.xenproject.o=
rg" target=3D"_blank">xen-devel@lists.xenproject.org</a>&gt; and maintainer=
s as suggested by <a href=3D"http://add_maintainers.pl" rel=3D"noreferrer" =
target=3D"_blank">add_maintainers.pl</a> &lt;<a href=3D"http://add_maintain=
ers.pl" rel=3D"noreferrer" target=3D"_blank">http://add_maintainers.pl</a>&=
gt; script]<br>
&gt;=C2=A0 =C2=A0 =C2=A0-Signed-off-by: Alexander Kanavin &lt;<a href=3D"ma=
ilto:alex@linutronix.de" target=3D"_blank">alex@linutronix.de</a> &lt;mailt=
o:<a href=3D"mailto:alex@linutronix.de" target=3D"_blank">alex@linutronix.d=
e</a>&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0----<br>
&gt;=C2=A0 =C2=A0 =C2=A0- tools/xenstore/xenstored_control.c | 4 ++--<br>
&gt;=C2=A0 =C2=A0 =C2=A0- 1 file changed, 2 insertions(+), 2 deletions(-)<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0-<br>
&gt;=C2=A0 =C2=A0 =C2=A0-diff --git a/tools/xenstore/xenstored_control.c b/=
tools/xenstore/xenstored_control.c<br>
&gt;=C2=A0 =C2=A0 =C2=A0-index d1aaa00bf4..8d318c0399 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0---- a/tools/xenstore/xenstored_control.c<br>
&gt;=C2=A0 =C2=A0 =C2=A0-+++ b/tools/xenstore/xenstored_control.c<br>
&gt;=C2=A0 =C2=A0 =C2=A0-@@ -643,10 +643,10 @@ static const char *lu_reject=
_reason(const void *ctx)<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0list_for_each_entry(con=
n, &amp;connections, list) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0if (conn-&gt;ta_start_time &amp;&amp;<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0(now - conn-&gt;ta_start_time &gt;=3D lu_status-&gt;tim=
eout)) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D talloc_asprintf(ctx, &quot;%s\nDomain %=
u: %ld s&quot;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D talloc_asprintf(ctx, &quot;%s\nDomain %=
u: %jd s&quot;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret ? : &quot;Domains with long runni=
ng transactions:&quot;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0conn-&gt;id,<br>
&gt;=C2=A0 =C2=A0 =C2=A0--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 now - conn-&gt;ta_start_time);<br>
&gt;=C2=A0 =C2=A0 =C2=A0-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (intmax_t)now - conn-&gt;ta_start_time);<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0}<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0 =C2=A0-<br>
&gt;=C2=A0 =C2=A0 =C2=A0diff --git a/recipes-extended/xen/<a href=3D"http:/=
/xen-tools_git.bb" rel=3D"noreferrer" target=3D"_blank">xen-tools_git.bb</a=
> &lt;<a href=3D"http://xen-tools_git.bb" rel=3D"noreferrer" target=3D"_bla=
nk">http://xen-tools_git.bb</a>&gt; b/recipes-extended/xen/<a href=3D"http:=
//xen-tools_git.bb" rel=3D"noreferrer" target=3D"_blank">xen-tools_git.bb</=
a> &lt;<a href=3D"http://xen-tools_git.bb" rel=3D"noreferrer" target=3D"_bl=
ank">http://xen-tools_git.bb</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0index 8397178e8d4b..b443b13eeab3 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0--- a/recipes-extended/xen/<a href=3D"http://xen-to=
ols_git.bb" rel=3D"noreferrer" target=3D"_blank">xen-tools_git.bb</a> &lt;<=
a href=3D"http://xen-tools_git.bb" rel=3D"noreferrer" target=3D"_blank">htt=
p://xen-tools_git.bb</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+++ b/recipes-extended/xen/<a href=3D"http://xen-to=
ols_git.bb" rel=3D"noreferrer" target=3D"_blank">xen-tools_git.bb</a> &lt;<=
a href=3D"http://xen-tools_git.bb" rel=3D"noreferrer" target=3D"_blank">htt=
p://xen-tools_git.bb</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0@@ -1,7 +1,7 @@<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0# master status on 2023-05-26<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0SRCREV ?=3D &quot;03cf7ca23e0e876075954c55848=
5b267b7d02406&quot;<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0-XEN_REL ?=3D &quot;4.18&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+XEN_REL ?=3D &quot;4.19&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0XEN_BRANCH ?=3D &quot;master&quot;<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0SRC_URI =3D &quot; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0-- <br>
&gt;=C2=A0 =C2=A0 =C2=A02.25.1<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; -- <br>
&gt; - Thou shalt not follow the NULL pointer, for chaos and madness await =
thee at its end<br>
&gt; - &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br>
&gt; <br>
</blockquote></div><br clear=3D"all"><div><br></div><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature">- =
Thou shalt not follow the NULL pointer, for chaos and madness await thee at=
 its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br><b=
r></div></div>

--0000000000004414da0621db67bc--

