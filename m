Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6452BEE49AB
	for <webhook@archiver.kernel.org>; Wed, 11 Sep 2024 13:51:24 +0000 (UTC)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
 by mx.groups.io with SMTP id smtpd.web11.22197.1726062679610604036
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 11 Sep 2024 06:51:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=k3ur+7Mz;
 spf=pass (domain: gmail.com, ip: 209.85.128.180, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-6d7073a39dcso8832107b3.1
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 11 Sep 2024 06:51:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726062679; x=1726667479; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=iT9ntbSHtf2uWSL9nGqdRRs3ZLL9zdaFHg02BuV9xfI=;
        b=k3ur+7MzNPwGssmUZdw8aoZHqWk0mK3ZEXU3E/exvveFa1ejcOhRnaa6c9eVdpeOoA
         0BHM5AMz/0HuCtWO3PBNuvZz+afT1rzR4ckVSY3IhdS6mwNWgBTz03E090bIgvCf4CVF
         PFDHlvTSx9BUBTJOIkAqE/HO3Dz3ulz7LXupabfcgqVVHjBhbwyIymVrHh7vbeX4E8to
         K1zfaRLvwIBTEmxrLqwq/A6b3mvKifC2KI0vlbZFXX11gA79TmK84n1uJl+GRNQZ+sgc
         aEeg91V2lQuV0xwSTGJZu5Qit0zwxP2KSNiy4fcZuZN6f1+mpCfvLvaJXe7gJERPBBEh
         lq0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726062679; x=1726667479;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iT9ntbSHtf2uWSL9nGqdRRs3ZLL9zdaFHg02BuV9xfI=;
        b=ppit7yZ5zdkYADFIH9wZD9wp+YBWNM7IGvH2cNql14borumsF3Fwef8tgiOgEm06jo
         MVeWU8H5rLdZH9Lo3Ywrz+NKOYJ+s099YW+qDuo6QGmzqRwgQn2TKNCsg1W1fr+r9Bzl
         6QNeXGF5ElzdKs2sQKKgHw40D9+U+Q2mkYFZv3JvTzxzhVLjDLwO3fqiI7IRyhMc+4yx
         sS1pq4Pi7F+eIlMwCuKM3ONiF7S9ZDN61ktLGgE6CwOm4vYo4BXWGgm2MG0Z1MzSE7Du
         tgGwQlU5Hq5FLH1ARVjFAarjcrvoPI38DUPe2mrIAHtZrWCUW33/+nnHZ0ql50PfpQMr
         A6YQ==
X-Gm-Message-State: AOJu0YxFXY6UKzudhcoLNKUHbCpr2UN9Og9+B2evCb2RXAmEIcCtmu+l
	DK+ANq7pP/1FkmzVMP0cKclMIkzV8YKFywWe1mSKL8S16ejJwRmVAnfSeJuUEz7Tbvi4VWAd7Er
	C0JShyT66IyHwCG7yQNO7DsXL+5M=
X-Google-Smtp-Source: AGHT+IHab9PNAvKEsIm63fhyrEDBdqKrFVgCifsgDQlsi55iQprij2bLYdeMl7vTFiH/TSt10kG3AUdr8SuNF6GJzbA=
X-Received: by 2002:a81:7e0a:0:b0:6db:a7d3:63fe with SMTP id
 00721157ae682-6dba7d364c8mr15004807b3.14.1726062678580; Wed, 11 Sep 2024
 06:51:18 -0700 (PDT)
MIME-Version: 1.0
References: <20240911093107.85557-1-michal.orzel@amd.com>
In-Reply-To: <20240911093107.85557-1-michal.orzel@amd.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 11 Sep 2024 09:50:56 -0400
Message-ID: <CADkTA4NYi4S9zDWVTE6OvPgkPk6s3CTbP+qEbvZL-UizzkJMYg@mail.gmail.com>
Subject: Re: [PATCH] xen: Fix XEN_REL of xen-tools_git.bb
To: Michal Orzel <michal.orzel@amd.com>
Cc: meta-virtualization@lists.yoctoproject.org, christopher.w.clark@gmail.com
Content-Type: multipart/alternative; boundary="000000000000d1271c0621d8488f"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 11 Sep 2024 13:51:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8879

--000000000000d1271c0621d8488f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 11, 2024 at 5:31=E2=80=AFAM Michal Orzel <michal.orzel@amd.com>=
 wrote:

> It should match the master recipe of Xen hypervisor which sets XEN_REL
> to 4.19.
>

While on the master branch, the current SRCREV of the tools is 4.18 based
(at least in my checking). I was going to bump _git just before the release
as
I didn't want to it to exactly match 4.19 when I was adding the new recipes=
.


>
> Also, take opportunity to remove no longer needed patches.
>

We should log why they are unneeded in the commit. Yes it is obvious
in most cases, but a one line statement for them helps me when I'm
looking later.



>
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
> ---
> We could also update xen and tools to 4.20 right away to reflect the
> current
> development version but I'm not sure if we want to do it at this point.
>
>
See above: that is already my plan for the next few weeks. I'll move _git
away from 4.19 so the _git will be available in the release. It is ok for
them to be unfinished and in development in that recipe.



> Unrelated question:
> When vmsep is enabled, the tools recipe RRECOMMENDS qemu-x86_64 and
> qemu-i386.
> What is the reason behind it given that the only qemu that is needed in t=
he
> target rootfs for Xen is qemu-system-i386? What would be the best way to
> build
> only the QEMU required by Xen (upstream) and not all the possible
> combinations?
>

I'm not concerned about extra building of qemu components, it is only
an issue if they are installed on the target (which of course they are
if images are configured to add rreccomends automatically).

That's why meta-virt was the first part of the ecosystem to even offer
split qemu packages. It was all or nothing before that. You can see
that in some of the image  recipes that I'm still working on fixing up.
This is an artifact / holdover from that history.

The vmsep based splitting covers quite a few different runtimes so it is
a bit different than OEcore splitting, and I've kept it for compatibility
with
other layers.

We can absolutely change our rrecommends in the recipes. In the short
term, you could always :remove the packages you don't want and/or
configure your build to not automatically install rreccomends (but that
is more drastic and will likely break more).

IIRC (and as you are saying) xen uses i366-system regardless of the
xen-host (target) architecture, so it does look like we should move
to qemu-i386-system for that rrecommend.

Bruce


> ---
>  ...ython-pygrub-pass-DISTUTILS-xen-4.15.patch | 73 -------------------
>  ...enstored_control.c-correctly-print-t.patch | 34 ---------
>  recipes-extended/xen/xen-tools_git.bb         |  2 +-
>  3 files changed, 1 insertion(+), 108 deletions(-)
>  delete mode 100644
> recipes-extended/xen/files/0001-python-pygrub-pass-DISTUTILS-xen-4.15.pat=
ch
>  delete mode 100644
> recipes-extended/xen/files/0001-tools-xenstore-xenstored_control.c-correc=
tly-print-t.patch
>
> diff --git
> a/recipes-extended/xen/files/0001-python-pygrub-pass-DISTUTILS-xen-4.15.p=
atch
> b/recipes-extended/xen/files/0001-python-pygrub-pass-DISTUTILS-xen-4.15.p=
atch
> deleted file mode 100644
> index 476f5ddcf1c6..000000000000
> ---
> a/recipes-extended/xen/files/0001-python-pygrub-pass-DISTUTILS-xen-4.15.p=
atch
> +++ /dev/null
> @@ -1,73 +0,0 @@
> -From 6db88791d923167f160afbcadeffad84a4cbdbc5 Mon Sep 17 00:00:00 2001
> -Message-Id: <
> 6db88791d923167f160afbcadeffad84a4cbdbc5.1612262706.git.bertrand.marquis@=
arm.com
> >
> -From: Maciej Pijanowski <maciej.pijanowski@3mdeb.com>
> -Date: Fri, 19 Oct 2018 11:01:37 +0200
> -Subject: [PATCH] python,pygrub: pass DISTUTILS env vars as setup.py args
> -
> -Upstream-Status: Inappropriate [oe specific, python install issues]
> -
> -Allow to respect the target install dir (PYTHON_SITEPACKAGES_DIR)
> -as well as other parameters set by the OpenEmbedded build system.
> -This is especially useful when the target libdir is not the default one
> -(/usr/lib), but for example /usr/lib64.
> -
> -Signed-off-by: Maciej Pijanowski <maciej.pijanowski@3mdeb.com>
> -
> -Forward-ported to Xen 4.12.0
> -Signed-off-by: Christopher Clark <christopher.clark6@baesystems.com>
> -
> -Modified to support pygrub installation with python 3
> -Signed-off-by: Christopher Clark <christopher.clark6@baesystems.com>
> -
> -Forward-ported to Xen 4.14.0
> -Signed-off-by: Christopher Clark <christopher.clark6@baesystems.com>
> -
> -Forward-ported to Xen 4.15.0
> -Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
> -
> ----
> - tools/pygrub/Makefile | 7 +++++--
> - tools/python/Makefile | 2 +-
> - 2 files changed, 6 insertions(+), 3 deletions(-)
> -
> -diff --git a/tools/pygrub/Makefile b/tools/pygrub/Makefile
> -index 37b2146214..ffb9270065 100644
> ---- a/tools/pygrub/Makefile
> -+++ b/tools/pygrub/Makefile
> -@@ -10,7 +10,7 @@ INSTALL_LOG =3D build/installed_files.txt
> - all: build
> - .PHONY: build
> - build:
> --      CC=3D"$(CC)" CFLAGS=3D"$(PY_CFLAGS)" LDSHARED=3D"$(CC)"
> LDFLAGS=3D"$(PY_LDFLAGS)" $(PYTHON) setup.py build
> -+      CC=3D"$(CC)" CFLAGS=3D"$(PY_CFLAGS)" LDSHARED=3D"$(CC)"
> LDFLAGS=3D"$(PY_LDFLAGS)" $(PYTHON) setup.py build $(DISTUTILS_BUILD_ARGS=
)
> -
> - .PHONY: install
> - install: all
> -@@ -18,7 +18,10 @@ install: all
> -       CC=3D"$(CC)" CFLAGS=3D"$(PY_CFLAGS)" LDSHARED=3D"$(CC)" \
> -               LDFLAGS=3D"$(PY_LDFLAGS)" $(PYTHON) setup.py install \
> -               --record $(INSTALL_LOG) $(PYTHON_PREFIX_ARG) \
> --               --root=3D"$(DESTDIR)" --install-scripts=3D$(LIBEXEC_BIN)
> --force
> -+               --root=3D"$(DESTDIR)" --install-scripts=3D$(LIBEXEC_BIN)
> --force \
> -+               $(DISTUTILS_INSTALL_ARGS)
> -+      rm -f $(DESTDIR)/$(LIBEXEC_BIN)/pygrub
> -+      $(INSTALL_PYTHON_PROG) src/pygrub $(DESTDIR)/$(LIBEXEC_BIN)/pygru=
b
> -       set -e; if [ $(bindir) !=3D $(LIBEXEC_BIN) -a \
> -                    "`readlink -f $(DESTDIR)/$(bindir)`" !=3D \
> -                    "`readlink -f $(LIBEXEC_BIN)`" ]; then \
> -diff --git a/tools/python/Makefile b/tools/python/Makefile
> -index cc76423647..5cb11ae453 100644
> ---- a/tools/python/Makefile
> -+++ b/tools/python/Makefile
> -@@ -12,7 +12,7 @@ setup.py =3D CC=3D"$(CC)" CFLAGS=3D"$(PY_CFLAGS)"
> LDSHARED=3D"$(CC)" LDFLAGS=3D"$(PY_LDFLA
> -            SHLIB_libxenctrl=3D"$(SHLIB_libxenctrl)" \
> -            SHLIB_libxenguest=3D"$(SHLIB_libxenguest)" \
> -            SHLIB_libxenstore=3D"$(SHLIB_libxenstore)" \
> --           $(PYTHON) setup.py
> -+           $(PYTHON) setup.py $(DISTUTILS_BUILD_ARGS)
> -
> - .PHONY: build
> - build:
> ---
> -2.17.1
> -
> diff --git
> a/recipes-extended/xen/files/0001-tools-xenstore-xenstored_control.c-corr=
ectly-print-t.patch
> b/recipes-extended/xen/files/0001-tools-xenstore-xenstored_control.c-corr=
ectly-print-t.patch
> deleted file mode 100644
> index bf99f5e8c54c..000000000000
> ---
> a/recipes-extended/xen/files/0001-tools-xenstore-xenstored_control.c-corr=
ectly-print-t.patch
> +++ /dev/null
> @@ -1,34 +0,0 @@
> -From c7c43c4531fe1cd188f62d9905c3f5c7a29a6fb0 Mon Sep 17 00:00:00 2001
> -From: Alexander Kanavin <alex@linutronix.de>
> -Date: Wed, 12 Apr 2023 10:30:18 +0200
> -Subject: [PATCH] tools/xenstore/xenstored_control.c: correctly print
> time_t
> -
> -On 32 bit systems with 64 bit time_t (hello, Y2038 problem),
> -the following error occurs otherwise:
> -
> -| xenstored_control.c: In function 'lu_reject_reason':
> -| xenstored_control.c:646:70: error: format '%ld' expects argument of
> type 'long int', but argument 5 has type 'time_t' {aka 'long long int'}
> [-Werror=3Dformat=3D]
> -
> -Upstream-Status: Submitted [by email to xen-devel@lists.xenproject.org
> and maintainers as suggested by add_maintainers.pl script]
> -Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ----
> - tools/xenstore/xenstored_control.c | 4 ++--
> - 1 file changed, 2 insertions(+), 2 deletions(-)
> -
> -diff --git a/tools/xenstore/xenstored_control.c
> b/tools/xenstore/xenstored_control.c
> -index d1aaa00bf4..8d318c0399 100644
> ---- a/tools/xenstore/xenstored_control.c
> -+++ b/tools/xenstore/xenstored_control.c
> -@@ -643,10 +643,10 @@ static const char *lu_reject_reason(const void *ct=
x)
> -       list_for_each_entry(conn, &connections, list) {
> -               if (conn->ta_start_time &&
> -                   (now - conn->ta_start_time >=3D lu_status->timeout)) =
{
> --                      ret =3D talloc_asprintf(ctx, "%s\nDomain %u: %ld =
s",
> -+                      ret =3D talloc_asprintf(ctx, "%s\nDomain %u: %jd =
s",
> -                                             ret ? : "Domains with long
> running transactions:",
> -                                             conn->id,
> --                                            now - conn->ta_start_time);
> -+                                            (intmax_t)now -
> conn->ta_start_time);
> -               }
> -       }
> -
> diff --git a/recipes-extended/xen/xen-tools_git.bb b/recipes-extended/xen=
/
> xen-tools_git.bb
> index 8397178e8d4b..b443b13eeab3 100644
> --- a/recipes-extended/xen/xen-tools_git.bb
> +++ b/recipes-extended/xen/xen-tools_git.bb
> @@ -1,7 +1,7 @@
>  # master status on 2023-05-26
>  SRCREV ?=3D "03cf7ca23e0e876075954c558485b267b7d02406"
>
> -XEN_REL ?=3D "4.18"
> +XEN_REL ?=3D "4.19"
>  XEN_BRANCH ?=3D "master"
>
>  SRC_URI =3D " \
> --
> 2.25.1
>
>

--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--000000000000d1271c0621d8488f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Wed, Sep 11, 2024 at 5:31=E2=80=AFAM Michal Orze=
l &lt;<a href=3D"mailto:michal.orzel@amd.com" target=3D"_blank">michal.orze=
l@amd.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">It should match the master recipe of Xen hypervisor which sets X=
EN_REL<br>
to 4.19.<br></blockquote><div><br></div><div><div class=3D"gmail_default" s=
tyle=3D"font-size:small">While on the master branch, the current SRCREV of =
the tools is 4.18 based</div><div class=3D"gmail_default" style=3D"font-siz=
e:small">(at least in my checking). I was going to bump _git just before th=
e release as</div><div class=3D"gmail_default" style=3D"font-size:small">I =
didn&#39;t want to it to exactly match 4.19 when I was adding the new recip=
es.</div></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">
<br>
Also, take opportunity to remove no longer needed patches.<br></blockquote>=
<div><br></div><div><div class=3D"gmail_default" style=3D"font-size:small">=
We should log why they are unneeded in the commit. Yes it is obvious</div><=
div class=3D"gmail_default" style=3D"font-size:small">in most cases, but a =
one line statement for them helps me when I&#39;m</div><div class=3D"gmail_=
default" style=3D"font-size:small">looking later.</div><br></div><div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Signed-off-by: Michal Orzel &lt;<a href=3D"mailto:michal.orzel@amd.com" tar=
get=3D"_blank">michal.orzel@amd.com</a>&gt;<br>
---<br>
We could also update xen and tools to 4.20 right away to reflect the curren=
t<br>
development version but I&#39;m not sure if we want to do it at this point.=
<br>
<br></blockquote><div><br></div><div><div class=3D"gmail_default" style=3D"=
font-size:small">See above: that is already my plan for the next few weeks.=
 I&#39;ll move _git</div><div class=3D"gmail_default" style=3D"font-size:sm=
all">away from 4.19 so the _git will be available in the release. It is ok =
for</div><div class=3D"gmail_default" style=3D"font-size:small">them to be =
unfinished and in development in that recipe.</div><br></div><div>=C2=A0</d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex">
Unrelated question:<br>
When vmsep is enabled, the tools recipe RRECOMMENDS qemu-x86_64 and qemu-i3=
86.<br>
What is the reason behind it given that the only qemu that is needed in the=
<br>
target rootfs for Xen is qemu-system-i386? What would be the best way to bu=
ild<br>
only the QEMU required by Xen (upstream) and not all the possible combinati=
ons?<br></blockquote><div><br></div><div><div class=3D"gmail_default" style=
=3D"font-size:small">I&#39;m not concerned about extra building of qemu com=
ponents, it is only</div><div class=3D"gmail_default" style=3D"font-size:sm=
all">an issue if they are installed on the target (which of course they are=
</div><div class=3D"gmail_default" style=3D"font-size:small">if images are =
configured to add rreccomends automatically).=C2=A0</div><div class=3D"gmai=
l_default" style=3D"font-size:small"><br></div><div class=3D"gmail_default"=
 style=3D"font-size:small">That&#39;s why meta-virt was the first part of t=
he ecosystem to even offer</div><div class=3D"gmail_default" style=3D"font-=
size:small">split qemu packages. It was all or nothing before that. You can=
 see</div><div class=3D"gmail_default" style=3D"font-size:small">that in so=
me of the image=C2=A0 recipes that I&#39;m still working on fixing up.</div=
><div class=3D"gmail_default" style=3D"font-size:small">This is an artifact=
 / holdover from that history.</div><div class=3D"gmail_default" style=3D"f=
ont-size:small"><br></div></div><div class=3D"gmail_default" style=3D"font-=
size:small">The vmsep=C2=A0based splitting covers quite a few different run=
times so it is</div><div class=3D"gmail_default" style=3D"font-size:small">=
a bit different than OEcore splitting, and I&#39;ve kept it for compatibili=
ty with</div><div class=3D"gmail_default" style=3D"font-size:small">other l=
ayers.=C2=A0</div><div class=3D"gmail_default" style=3D"font-size:small"><b=
r></div><div class=3D"gmail_default" style=3D"font-size:small">We can absol=
utely change our rrecommends in the recipes. In the short</div><div class=
=3D"gmail_default" style=3D"font-size:small">term, you could always :remove=
 the packages you don&#39;t want and/or=C2=A0</div><div class=3D"gmail_defa=
ult" style=3D"font-size:small">configure your build to not automatically in=
stall rreccomends (but that</div><div class=3D"gmail_default" style=3D"font=
-size:small">is more drastic and will likely break more).</div><div class=
=3D"gmail_default" style=3D"font-size:small"><br></div><div class=3D"gmail_=
default" style=3D"font-size:small">IIRC (and as you are saying) xen uses i3=
66-system regardless of the</div><div class=3D"gmail_default" style=3D"font=
-size:small">xen-host (target) architecture, so it does look like we should=
 move=C2=A0</div><div class=3D"gmail_default" style=3D"font-size:small">to =
qemu-i386-system for that rrecommend.</div><div class=3D"gmail_default" sty=
le=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D"font=
-size:small">Bruce=C2=A0</div><div>=C2=A0</div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex">
---<br>
=C2=A0...ython-pygrub-pass-DISTUTILS-xen-4.15.patch | 73 ------------------=
-<br>
=C2=A0...enstored_control.c-correctly-print-t.patch | 34 ---------<br>
=C2=A0recipes-extended/xen/<a href=3D"http://xen-tools_git.bb" rel=3D"noref=
errer" target=3D"_blank">xen-tools_git.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0|=C2=A0 2 +-<br>
=C2=A03 files changed, 1 insertion(+), 108 deletions(-)<br>
=C2=A0delete mode 100644 recipes-extended/xen/files/0001-python-pygrub-pass=
-DISTUTILS-xen-4.15.patch<br>
=C2=A0delete mode 100644 recipes-extended/xen/files/0001-tools-xenstore-xen=
stored_control.c-correctly-print-t.patch<br>
<br>
diff --git a/recipes-extended/xen/files/0001-python-pygrub-pass-DISTUTILS-x=
en-4.15.patch b/recipes-extended/xen/files/0001-python-pygrub-pass-DISTUTIL=
S-xen-4.15.patch<br>
deleted file mode 100644<br>
index 476f5ddcf1c6..000000000000<br>
--- a/recipes-extended/xen/files/0001-python-pygrub-pass-DISTUTILS-xen-4.15=
.patch<br>
+++ /dev/null<br>
@@ -1,73 +0,0 @@<br>
-From 6db88791d923167f160afbcadeffad84a4cbdbc5 Mon Sep 17 00:00:00 2001<br>
-Message-Id: &lt;<a href=3D"mailto:6db88791d923167f160afbcadeffad84a4cbdbc5=
.1612262706.git.bertrand.marquis@arm.com" target=3D"_blank">6db88791d923167=
f160afbcadeffad84a4cbdbc5.1612262706.git.bertrand.marquis@arm.com</a>&gt;<b=
r>
-From: Maciej Pijanowski &lt;<a href=3D"mailto:maciej.pijanowski@3mdeb.com"=
 target=3D"_blank">maciej.pijanowski@3mdeb.com</a>&gt;<br>
-Date: Fri, 19 Oct 2018 11:01:37 +0200<br>
-Subject: [PATCH] python,pygrub: pass DISTUTILS env vars as setup.py args<b=
r>
-<br>
-Upstream-Status: Inappropriate [oe specific, python install issues]<br>
-<br>
-Allow to respect the target install dir (PYTHON_SITEPACKAGES_DIR)<br>
-as well as other parameters set by the OpenEmbedded build system.<br>
-This is especially useful when the target libdir is not the default one<br=
>
-(/usr/lib), but for example /usr/lib64.<br>
-<br>
-Signed-off-by: Maciej Pijanowski &lt;<a href=3D"mailto:maciej.pijanowski@3=
mdeb.com" target=3D"_blank">maciej.pijanowski@3mdeb.com</a>&gt;<br>
-<br>
-Forward-ported to Xen 4.12.0<br>
-Signed-off-by: Christopher Clark &lt;<a href=3D"mailto:christopher.clark6@=
baesystems.com" target=3D"_blank">christopher.clark6@baesystems.com</a>&gt;=
<br>
-<br>
-Modified to support pygrub installation with python 3<br>
-Signed-off-by: Christopher Clark &lt;<a href=3D"mailto:christopher.clark6@=
baesystems.com" target=3D"_blank">christopher.clark6@baesystems.com</a>&gt;=
<br>
-<br>
-Forward-ported to Xen 4.14.0<br>
-Signed-off-by: Christopher Clark &lt;<a href=3D"mailto:christopher.clark6@=
baesystems.com" target=3D"_blank">christopher.clark6@baesystems.com</a>&gt;=
<br>
-<br>
-Forward-ported to Xen 4.15.0<br>
-Signed-off-by: Bertrand Marquis &lt;<a href=3D"mailto:bertrand.marquis@arm=
.com" target=3D"_blank">bertrand.marquis@arm.com</a>&gt;<br>
-<br>
----<br>
- tools/pygrub/Makefile | 7 +++++--<br>
- tools/python/Makefile | 2 +-<br>
- 2 files changed, 6 insertions(+), 3 deletions(-)<br>
-<br>
-diff --git a/tools/pygrub/Makefile b/tools/pygrub/Makefile<br>
-index 37b2146214..ffb9270065 100644<br>
---- a/tools/pygrub/Makefile<br>
-+++ b/tools/pygrub/Makefile<br>
-@@ -10,7 +10,7 @@ INSTALL_LOG =3D build/installed_files.txt<br>
- all: build<br>
- .PHONY: build<br>
- build:<br>
--=C2=A0 =C2=A0 =C2=A0 CC=3D&quot;$(CC)&quot; CFLAGS=3D&quot;$(PY_CFLAGS)&q=
uot; LDSHARED=3D&quot;$(CC)&quot; LDFLAGS=3D&quot;$(PY_LDFLAGS)&quot; $(PYT=
HON) setup.py build<br>
-+=C2=A0 =C2=A0 =C2=A0 CC=3D&quot;$(CC)&quot; CFLAGS=3D&quot;$(PY_CFLAGS)&q=
uot; LDSHARED=3D&quot;$(CC)&quot; LDFLAGS=3D&quot;$(PY_LDFLAGS)&quot; $(PYT=
HON) setup.py build $(DISTUTILS_BUILD_ARGS)<br>
- <br>
- .PHONY: install<br>
- install: all<br>
-@@ -18,7 +18,10 @@ install: all<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0CC=3D&quot;$(CC)&quot; CFLAGS=3D&quot;$(PY_CFLA=
GS)&quot; LDSHARED=3D&quot;$(CC)&quot; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0LDFLAGS=3D&quot;$(P=
Y_LDFLAGS)&quot; $(PYTHON) setup.py install \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--record $(INSTALL_=
LOG) $(PYTHON_PREFIX_ARG) \<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--root=3D&quot;$(D=
ESTDIR)&quot; --install-scripts=3D$(LIBEXEC_BIN) --force<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--root=3D&quot;$(D=
ESTDIR)&quot; --install-scripts=3D$(LIBEXEC_BIN) --force \<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(DISTUTILS_INSTAL=
L_ARGS)<br>
-+=C2=A0 =C2=A0 =C2=A0 rm -f $(DESTDIR)/$(LIBEXEC_BIN)/pygrub<br>
-+=C2=A0 =C2=A0 =C2=A0 $(INSTALL_PYTHON_PROG) src/pygrub $(DESTDIR)/$(LIBEX=
EC_BIN)/pygrub<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0set -e; if [ $(bindir) !=3D $(LIBEXEC_BIN) -a \=
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quo=
t;`readlink -f $(DESTDIR)/$(bindir)`&quot; !=3D \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quo=
t;`readlink -f $(LIBEXEC_BIN)`&quot; ]; then \<br>
-diff --git a/tools/python/Makefile b/tools/python/Makefile<br>
-index cc76423647..5cb11ae453 100644<br>
---- a/tools/python/Makefile<br>
-+++ b/tools/python/Makefile<br>
-@@ -12,7 +12,7 @@ setup.py =3D CC=3D&quot;$(CC)&quot; CFLAGS=3D&quot;$(PY_=
CFLAGS)&quot; LDSHARED=3D&quot;$(CC)&quot; LDFLAGS=3D&quot;$(PY_LDFLA<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 SHLIB_libxenctrl=3D&quot;$(SHLIB=
_libxenctrl)&quot; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 SHLIB_libxenguest=3D&quot;$(SHLI=
B_libxenguest)&quot; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 SHLIB_libxenstore=3D&quot;$(SHLI=
B_libxenstore)&quot; \<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(PYTHON) setup.py<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(PYTHON) setup.py $(DISTUTILS_B=
UILD_ARGS)<br>
- <br>
- .PHONY: build<br>
- build:<br>
--- <br>
-2.17.1<br>
-<br>
diff --git a/recipes-extended/xen/files/0001-tools-xenstore-xenstored_contr=
ol.c-correctly-print-t.patch b/recipes-extended/xen/files/0001-tools-xensto=
re-xenstored_control.c-correctly-print-t.patch<br>
deleted file mode 100644<br>
index bf99f5e8c54c..000000000000<br>
--- a/recipes-extended/xen/files/0001-tools-xenstore-xenstored_control.c-co=
rrectly-print-t.patch<br>
+++ /dev/null<br>
@@ -1,34 +0,0 @@<br>
-From c7c43c4531fe1cd188f62d9905c3f5c7a29a6fb0 Mon Sep 17 00:00:00 2001<br>
-From: Alexander Kanavin &lt;<a href=3D"mailto:alex@linutronix.de" target=
=3D"_blank">alex@linutronix.de</a>&gt;<br>
-Date: Wed, 12 Apr 2023 10:30:18 +0200<br>
-Subject: [PATCH] tools/xenstore/xenstored_control.c: correctly print time_=
t<br>
-<br>
-On 32 bit systems with 64 bit time_t (hello, Y2038 problem),<br>
-the following error occurs otherwise:<br>
-<br>
-| xenstored_control.c: In function &#39;lu_reject_reason&#39;:<br>
-| xenstored_control.c:646:70: error: format &#39;%ld&#39; expects argument=
 of type &#39;long int&#39;, but argument 5 has type &#39;time_t&#39; {aka =
&#39;long long int&#39;} [-Werror=3Dformat=3D]<br>
-<br>
-Upstream-Status: Submitted [by email to <a href=3D"mailto:xen-devel@lists.=
xenproject.org" target=3D"_blank">xen-devel@lists.xenproject.org</a> and ma=
intainers as suggested by <a href=3D"http://add_maintainers.pl" rel=3D"nore=
ferrer" target=3D"_blank">add_maintainers.pl</a> script]<br>
-Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex@linutronix.de"=
 target=3D"_blank">alex@linutronix.de</a>&gt;<br>
----<br>
- tools/xenstore/xenstored_control.c | 4 ++--<br>
- 1 file changed, 2 insertions(+), 2 deletions(-)<br>
-<br>
-diff --git a/tools/xenstore/xenstored_control.c b/tools/xenstore/xenstored=
_control.c<br>
-index d1aaa00bf4..8d318c0399 100644<br>
---- a/tools/xenstore/xenstored_control.c<br>
-+++ b/tools/xenstore/xenstored_control.c<br>
-@@ -643,10 +643,10 @@ static const char *lu_reject_reason(const void *ctx)=
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0list_for_each_entry(conn, &amp;connections, lis=
t) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (conn-&gt;ta_sta=
rt_time &amp;&amp;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(now =
- conn-&gt;ta_start_time &gt;=3D lu_status-&gt;timeout)) {<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 ret =3D talloc_asprintf(ctx, &quot;%s\nDomain %u: %ld s&quot;,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 ret =3D talloc_asprintf(ctx, &quot;%s\nDomain %u: %jd s&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0ret ? : &quot;Domains with long running transactions:&quot;,<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0conn-&gt;id,<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 now - conn-&gt;ta_start_time);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 (intmax_t)now - conn-&gt;ta_start_time);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
- <br>
diff --git a/recipes-extended/xen/<a href=3D"http://xen-tools_git.bb" rel=
=3D"noreferrer" target=3D"_blank">xen-tools_git.bb</a> b/recipes-extended/x=
en/<a href=3D"http://xen-tools_git.bb" rel=3D"noreferrer" target=3D"_blank"=
>xen-tools_git.bb</a><br>
index 8397178e8d4b..b443b13eeab3 100644<br>
--- a/recipes-extended/xen/<a href=3D"http://xen-tools_git.bb" rel=3D"noref=
errer" target=3D"_blank">xen-tools_git.bb</a><br>
+++ b/recipes-extended/xen/<a href=3D"http://xen-tools_git.bb" rel=3D"noref=
errer" target=3D"_blank">xen-tools_git.bb</a><br>
@@ -1,7 +1,7 @@<br>
=C2=A0# master status on 2023-05-26<br>
=C2=A0SRCREV ?=3D &quot;03cf7ca23e0e876075954c558485b267b7d02406&quot;<br>
<br>
-XEN_REL ?=3D &quot;4.18&quot;<br>
+XEN_REL ?=3D &quot;4.19&quot;<br>
=C2=A0XEN_BRANCH ?=3D &quot;master&quot;<br>
<br>
=C2=A0SRC_URI =3D &quot; \<br>
-- <br>
2.25.1<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature">- =
Thou shalt not follow the NULL pointer, for chaos and madness await thee at=
 its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br><b=
r></div></div>

--000000000000d1271c0621d8488f--

