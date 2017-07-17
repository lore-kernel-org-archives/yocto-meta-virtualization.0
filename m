Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 68799E00C2E; Mon, 17 Jul 2017 11:24:40 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE, 
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.215.67 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.215.67 listed in dnsbl.sorbs.net]
Received: from mail-lf0-f67.google.com (mail-lf0-f67.google.com
	[209.85.215.67])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1590FE00BC4
	for <meta-virtualization@yoctoproject.org>;
	Mon, 17 Jul 2017 11:24:36 -0700 (PDT)
Received: by mail-lf0-f67.google.com with SMTP id t72so13822724lff.0
	for <meta-virtualization@yoctoproject.org>;
	Mon, 17 Jul 2017 11:24:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=FOp/3q+hGJTOs3ypbH5jC41N4+O8IxvPoKKYSdlAuBs=;
	b=K2Bmn3pCXMZ2gPYC5inokJNZiSfiCO3JXHGIz0RRd1++kxL9153ArLcmJdqy+Gat72
	LWxFRVXXETE3POSDr6jUahDmfyZnt5jTeQ36RpITB77j/E2ZxB46vzpf1iFyBuKvk/5u
	wPNLau/CQp6Had9fJhK0kZ/kNpOeESaEwQY/dtTHLftnQ7oGKtDVgdIOpkVtrj9gTGam
	Tvpd3dduatYz33QlBkwiMj1P1w4osnhkeahXAgNvQs5ae4unQpiD7ZezoBUHQfBGRRdt
	q7S7Jf4CvGCiIQ8FvHr9OXtRuZty6QFp7eFarhI0GTyC1ay2nHv0yUJ4KrqVXftMRWWn
	mzYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=FOp/3q+hGJTOs3ypbH5jC41N4+O8IxvPoKKYSdlAuBs=;
	b=DI2lP3WAkFbWtil8qNpcuioKwkJz+VHG6vrQMRinoPyNBwjHho3poH+ooZl6VSCIOp
	K84zFY471qeoqyOQU+34YWGe+xD4nN8IgWTy6Kgjck/oT3D6Jo+QbesbymT2iGK+RclO
	A/ya/TaOdr+qA7678pOQwWC7N9LkHcJ0b3zbk0IuQQSG2NkKS41XGBbN/ocnlgZ7I5jq
	/+D3Li2S+Oc/F8g+NGNAfgGcE4tk4DAMCCbZMzBSkw7jahWqmFWFIA7O+d+oylqIcQtK
	vy57RdA65CPy6ZwfmjDoaFyqdn861RSC0eeZ8Mn1HY3E1GBPOwh6j4Tc5yWSZxnRr9FF
	yyQw==
X-Gm-Message-State: AIVw113l5kPKCJk6lYLayzDRE/Vcy24oXcrOdw2E9VJi0tr0toJvX2v4
	qS8hH4H/zNYW+JOt9BtzRrlTlW9uLg==
X-Received: by 10.46.19.26 with SMTP id 26mr4793337ljt.100.1500315875538; Mon,
	17 Jul 2017 11:24:35 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.46.9.137 with HTTP; Mon, 17 Jul 2017 11:24:35 -0700 (PDT)
In-Reply-To: <1499893362-8251-1-git-send-email-mark.asselstine@windriver.com>
References: <1499893362-8251-1-git-send-email-mark.asselstine@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 17 Jul 2017 14:24:35 -0400
Message-ID: <CADkTA4M_A9TyWgDq=8AjQS7aw6quj=P+LHMjPcYA_gTGyCnbLg@mail.gmail.com>
To: Mark Asselstine <mark.asselstine@windriver.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH 1/2] openvswitch: uprev to v2.7.1
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
X-List-Received-Date: Mon, 17 Jul 2017 18:24:40 -0000
Content-Type: multipart/alternative; boundary="f4030436060acfffa405548782ac"

--f4030436060acfffa405548782ac
Content-Type: text/plain; charset="UTF-8"

These two patches are now staged.

I'll be sending a consolidated list of patches once I do the push of this +
some other uprevs.

Bruce

On Wed, Jul 12, 2017 at 5:02 PM, Mark Asselstine <
mark.asselstine@windriver.com> wrote:

> Released at the end of June 2017 this is a bugfix release with no
> major functional changes. Surprisingly the patch for CVE-2017-9263 is
> still not applied upstream so we continue to carry this change.
>
> The remaining patches were audited and cleaned up as needed.
>
> Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> ---
>  ...gure-Only-link-against-libpcap-on-FreeBSD.patch | 70
> ----------------------
>  ...b29cb89e9e9fe3119b2e5dd5d4fb79141635b7cc.patch} |  0
>  recipes-networking/openvswitch/openvswitch_git.bb  |  4 +-
>  3 files changed, 2 insertions(+), 72 deletions(-)
>  delete mode 100644 recipes-networking/openvswitch/files/configure-
> Only-link-against-libpcap-on-FreeBSD.patch
>  rename recipes-networking/openvswitch/openvswitch-git/{
> openvswitch-add-ptest-c298ef781c2d35d939fe163cbc2f41ea7b1cb8d1.patch =>
> openvswitch-add-ptest-b29cb89e9e9fe3119b2e5dd5d4fb79141635b7cc.patch}
> (100%)
>
> diff --git a/recipes-networking/openvswitch/files/configure-
> Only-link-against-libpcap-on-FreeBSD.patch b/recipes-networking/
> openvswitch/files/configure-Only-link-against-libpcap-on-FreeBSD.patch
> deleted file mode 100644
> index 0a44b85..0000000
> --- a/recipes-networking/openvswitch/files/configure-
> Only-link-against-libpcap-on-FreeBSD.patch
> +++ /dev/null
> @@ -1,70 +0,0 @@
> -From d30e714ccb9d13caf39d14d5b2fc9523b678ed51 Mon Sep 17 00:00:00 2001
> -From: Ben Pfaff <blp@nicira.com>
> -Date: Thu, 14 Mar 2013 15:20:55 -0700
> -Subject: [PATCH] configure: Only link against libpcap on FreeBSD.
> -
> -commit d30e714ccb9d13caf39d14d5b2fc9523b678ed51 upstream
> -http://git.openvswitch.org/git/openvswitch
> -
> -On other platforms there is no benefit to linking against libpcap, because
> -it is not used.
> -
> -Signed-off-by: Ben Pfaff <blp@nicira.com>
> -CC: Ed Maste <emaste@freebsd.org>
> ----
> - acinclude.m4 | 7 ++++++-
> - configure.ac | 3 +--
> - 2 files changed, 7 insertions(+), 3 deletions(-)
> -
> -diff --git a/acinclude.m4 b/acinclude.m4
> -index f0610c9..19a47dd 100644
> ---- a/acinclude.m4
> -+++ b/acinclude.m4
> -@@ -1,6 +1,6 @@
> - # -*- autoconf -*-
> -
> --# Copyright (c) 2008, 2009, 2010, 2011, 2012 Nicira, Inc.
> -+# Copyright (c) 2008, 2009, 2010, 2011, 2012, 2013 Nicira, Inc.
> - #
> - # Licensed under the Apache License, Version 2.0 (the "License");
> - # you may not use this file except in compliance with the License.
> -@@ -295,6 +295,8 @@ AC_DEFUN([OVS_CHECK_IF_PACKET],
> -    fi])
> -
> - dnl Checks for net/if_dl.h.
> -+dnl
> -+dnl (We use this as a proxy for checking whether we're building on
> FreeBSD.)
> - AC_DEFUN([OVS_CHECK_IF_DL],
> -   [AC_CHECK_HEADER([net/if_dl.h],
> -                    [HAVE_IF_DL=yes],
> -@@ -303,6 +305,9 @@ AC_DEFUN([OVS_CHECK_IF_DL],
> -    if test "$HAVE_IF_DL" = yes; then
> -       AC_DEFINE([HAVE_IF_DL], [1],
> -                 [Define to 1 if net/if_dl.h is available.])
> -+
> -+      # On FreeBSD we use libpcap to access network devices.
> -+      AC_SEARCH_LIBS([pcap_open_live], [pcap])
> -    fi])
> -
> - dnl Checks for buggy strtok_r.
> -diff --git a/configure.ac b/configure.ac
> -index 1cacd29..bd49179 100644
> ---- a/configure.ac
> -+++ b/configure.ac
> -@@ -1,4 +1,4 @@
> --# Copyright (c) 2008, 2009, 2010, 2011, 2012 Nicira, Inc.
> -+# Copyright (c) 2008, 2009, 2010, 2011, 2012, 2013 Nicira, Inc.
> - #
> - # Licensed under the Apache License, Version 2.0 (the "License");
> - # you may not use this file except in compliance with the License.
> -@@ -44,7 +44,6 @@ AC_SYS_LARGEFILE
> - AC_SEARCH_LIBS([pow], [m])
> - AC_SEARCH_LIBS([clock_gettime], [rt])
> - AC_SEARCH_LIBS([timer_create], [rt])
> --AC_SEARCH_LIBS([pcap_open_live], [pcap])
> -
> - OVS_CHECK_ESX
> - OVS_CHECK_COVERAGE
> ---
> -1.8.3.2
> -
> diff --git a/recipes-networking/openvswitch/openvswitch-git/
> openvswitch-add-ptest-c298ef781c2d35d939fe163cbc2f41ea7b1cb8d1.patch
> b/recipes-networking/openvswitch/openvswitch-git/openvswitch-add-ptest-
> b29cb89e9e9fe3119b2e5dd5d4fb79141635b7cc.patch
> similarity index 100%
> rename from recipes-networking/openvswitch/openvswitch-git/
> openvswitch-add-ptest-c298ef781c2d35d939fe163cbc2f41ea7b1cb8d1.patch
> rename to recipes-networking/openvswitch/openvswitch-git/
> openvswitch-add-ptest-b29cb89e9e9fe3119b2e5dd5d4fb79141635b7cc.patch
> diff --git a/recipes-networking/openvswitch/openvswitch_git.bb
> b/recipes-networking/openvswitch/openvswitch_git.bb
> index a2893e9..3972607 100644
> --- a/recipes-networking/openvswitch/openvswitch_git.bb
> +++ b/recipes-networking/openvswitch/openvswitch_git.bb
> @@ -12,11 +12,11 @@ RDEPENDS_${PN}-ptest += "\
>         "
>
>  S = "${WORKDIR}/git"
> -PV = "2.7.0+${SRCREV}"
> +PV = "2.7.1+${SRCREV}"
>
>  FILESEXTRAPATHS_append := "${THISDIR}/${PN}-git:"
>
> -SRCREV = "c298ef781c2d35d939fe163cbc2f41ea7b1cb8d1"
> +SRCREV = "b29cb89e9e9fe3119b2e5dd5d4fb79141635b7cc"
>  SRC_URI = "file://openvswitch-switch \
>             file://openvswitch-switch-setup \
>             file://openvswitch-testcontroller \
> --
> 2.7.4
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--f4030436060acfffa405548782ac
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">These two patches are now staged.<div><br></div><div>I&#39=
;ll be sending a consolidated list of patches once I do the push of this + =
some other uprevs.</div><div><br></div><div>Bruce</div></div><div class=3D"=
gmail_extra"><br><div class=3D"gmail_quote">On Wed, Jul 12, 2017 at 5:02 PM=
, Mark Asselstine <span dir=3D"ltr">&lt;<a href=3D"mailto:mark.asselstine@w=
indriver.com" target=3D"_blank">mark.asselstine@windriver.com</a>&gt;</span=
> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex">Released at the end of June 2017=
 this is a bugfix release with no<br>
major functional changes. Surprisingly the patch for CVE-2017-9263 is<br>
still not applied upstream so we continue to carry this change.<br>
<br>
The remaining patches were audited and cleaned up as needed.<br>
<br>
Signed-off-by: Mark Asselstine &lt;<a href=3D"mailto:mark.asselstine@windri=
ver.com">mark.asselstine@windriver.com</a><wbr>&gt;<br>
---<br>
=C2=A0...gure-Only-link-against-<wbr>libpcap-on-FreeBSD.patch | 70 --------=
--------------<br>
=C2=A0...<wbr>b29cb89e9e9fe3119b2e5dd5d4fb79<wbr>141635b7cc.patch} |=C2=A0 =
0<br>
=C2=A0recipes-networking/<wbr>openvswitch/<a href=3D"http://openvswitch_git=
.bb" rel=3D"noreferrer" target=3D"_blank">openvswitch_git.bb</a>=C2=A0 |=C2=
=A0 4 +-<br>
=C2=A03 files changed, 2 insertions(+), 72 deletions(-)<br>
=C2=A0delete mode 100644 recipes-networking/<wbr>openvswitch/files/configur=
e-<wbr>Only-link-against-libpcap-on-<wbr>FreeBSD.patch<br>
=C2=A0rename recipes-networking/<wbr>openvswitch/openvswitch-git/{<wbr>open=
vswitch-add-ptest-<wbr>c298ef781c2d35d939fe163cbc2f41<wbr>ea7b1cb8d1.patch =
=3D&gt; openvswitch-add-ptest-<wbr>b29cb89e9e9fe3119b2e5dd5d4fb79<wbr>14163=
5b7cc.patch} (100%)<br>
<br>
diff --git a/recipes-networking/<wbr>openvswitch/files/configure-<wbr>Only-=
link-against-libpcap-on-<wbr>FreeBSD.patch b/recipes-networking/<wbr>openvs=
witch/files/configure-<wbr>Only-link-against-libpcap-on-<wbr>FreeBSD.patch<=
br>
deleted file mode 100644<br>
index 0a44b85..0000000<br>
--- a/recipes-networking/<wbr>openvswitch/files/configure-<wbr>Only-link-ag=
ainst-libpcap-on-<wbr>FreeBSD.patch<br>
+++ /dev/null<br>
@@ -1,70 +0,0 @@<br>
-From d30e714ccb9d13caf39d14d5b2fc95<wbr>23b678ed51 Mon Sep 17 00:00:00 200=
1<br>
-From: Ben Pfaff &lt;<a href=3D"mailto:blp@nicira.com">blp@nicira.com</a>&g=
t;<br>
-Date: Thu, 14 Mar 2013 15:20:55 -0700<br>
-Subject: [PATCH] configure: Only link against libpcap on FreeBSD.<br>
-<br>
-commit d30e714ccb9d13caf39d14d5b2fc95<wbr>23b678ed51 upstream<br>
-<a href=3D"http://git.openvswitch.org/git/openvswitch" rel=3D"noreferrer" =
target=3D"_blank">http://git.openvswitch.org/<wbr>git/openvswitch</a><br>
-<br>
-On other platforms there is no benefit to linking against libpcap, because=
<br>
-it is not used.<br>
-<br>
-Signed-off-by: Ben Pfaff &lt;<a href=3D"mailto:blp@nicira.com">blp@nicira.=
com</a>&gt;<br>
-CC: Ed Maste &lt;<a href=3D"mailto:emaste@freebsd.org">emaste@freebsd.org<=
/a>&gt;<br>
----<br>
- acinclude.m4 | 7 ++++++-<br>
- <a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank">conf=
igure.ac</a> | 3 +--<br>
- 2 files changed, 7 insertions(+), 3 deletions(-)<br>
-<br>
-diff --git a/acinclude.m4 b/acinclude.m4<br>
-index f0610c9..19a47dd 100644<br>
---- a/acinclude.m4<br>
-+++ b/acinclude.m4<br>
-@@ -1,6 +1,6 @@<br>
- # -*- autoconf -*-<br>
-<br>
--# Copyright (c) 2008, 2009, 2010, 2011, 2012 Nicira, Inc.<br>
-+# Copyright (c) 2008, 2009, 2010, 2011, 2012, 2013 Nicira, Inc.<br>
- #<br>
- # Licensed under the Apache License, Version 2.0 (the &quot;License&quot;=
);<br>
- # you may not use this file except in compliance with the License.<br>
-@@ -295,6 +295,8 @@ AC_DEFUN([OVS_CHECK_IF_PACKET]<wbr>,<br>
-=C2=A0 =C2=A0 fi])<br>
-<br>
- dnl Checks for net/if_dl.h.<br>
-+dnl<br>
-+dnl (We use this as a proxy for checking whether we&#39;re building on Fr=
eeBSD.)<br>
- AC_DEFUN([OVS_CHECK_IF_DL],<br>
-=C2=A0 =C2=A0[AC_CHECK_HEADER([net/if_dl.h]<wbr>,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [HAV=
E_IF_DL=3Dyes],<br>
-@@ -303,6 +305,9 @@ AC_DEFUN([OVS_CHECK_IF_DL],<br>
-=C2=A0 =C2=A0 if test &quot;$HAVE_IF_DL&quot; =3D yes; then<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0AC_DEFINE([HAVE_IF_DL], [1],<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[Define to 1=
 if net/if_dl.h is available.])<br>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0 # On FreeBSD we use libpcap to access network device=
s.<br>
-+=C2=A0 =C2=A0 =C2=A0 AC_SEARCH_LIBS([pcap_open_<wbr>live], [pcap])<br>
-=C2=A0 =C2=A0 fi])<br>
-<br>
- dnl Checks for buggy strtok_r.<br>
-diff --git a/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"=
_blank">configure.ac</a> b/<a href=3D"http://configure.ac" rel=3D"noreferre=
r" target=3D"_blank">configure.ac</a><br>
-index 1cacd29..bd49179 100644<br>
---- a/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank"=
>configure.ac</a><br>
-+++ b/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank"=
>configure.ac</a><br>
-@@ -1,4 +1,4 @@<br>
--# Copyright (c) 2008, 2009, 2010, 2011, 2012 Nicira, Inc.<br>
-+# Copyright (c) 2008, 2009, 2010, 2011, 2012, 2013 Nicira, Inc.<br>
- #<br>
- # Licensed under the Apache License, Version 2.0 (the &quot;License&quot;=
);<br>
- # you may not use this file except in compliance with the License.<br>
-@@ -44,7 +44,6 @@ AC_SYS_LARGEFILE<br>
- AC_SEARCH_LIBS([pow], [m])<br>
- AC_SEARCH_LIBS([clock_gettime]<wbr>, [rt])<br>
- AC_SEARCH_LIBS([timer_create], [rt])<br>
--AC_SEARCH_LIBS([pcap_open_<wbr>live], [pcap])<br>
-<br>
- OVS_CHECK_ESX<br>
- OVS_CHECK_COVERAGE<br>
---<br>
-1.8.3.2<br>
-<br>
diff --git a/recipes-networking/<wbr>openvswitch/openvswitch-git/<wbr>openv=
switch-add-ptest-<wbr>c298ef781c2d35d939fe163cbc2f41<wbr>ea7b1cb8d1.patch b=
/recipes-networking/<wbr>openvswitch/openvswitch-git/<wbr>openvswitch-add-p=
test-<wbr>b29cb89e9e9fe3119b2e5dd5d4fb79<wbr>141635b7cc.patch<br>
similarity index 100%<br>
rename from recipes-networking/<wbr>openvswitch/openvswitch-git/<wbr>openvs=
witch-add-ptest-<wbr>c298ef781c2d35d939fe163cbc2f41<wbr>ea7b1cb8d1.patch<br=
>
rename to recipes-networking/<wbr>openvswitch/openvswitch-git/<wbr>openvswi=
tch-add-ptest-<wbr>b29cb89e9e9fe3119b2e5dd5d4fb79<wbr>141635b7cc.patch<br>
diff --git a/recipes-networking/<wbr>openvswitch/<a href=3D"http://openvswi=
tch_git.bb" rel=3D"noreferrer" target=3D"_blank">openvswitch_git.bb</a> b/r=
ecipes-networking/<wbr>openvswitch/<a href=3D"http://openvswitch_git.bb" re=
l=3D"noreferrer" target=3D"_blank">openvswitch_git.bb</a><br>
index a2893e9..3972607 100644<br>
--- a/recipes-networking/<wbr>openvswitch/<a href=3D"http://openvswitch_git=
.bb" rel=3D"noreferrer" target=3D"_blank">openvswitch_git.bb</a><br>
+++ b/recipes-networking/<wbr>openvswitch/<a href=3D"http://openvswitch_git=
.bb" rel=3D"noreferrer" target=3D"_blank">openvswitch_git.bb</a><br>
@@ -12,11 +12,11 @@ RDEPENDS_${PN}-ptest +=3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
<br>
=C2=A0S =3D &quot;${WORKDIR}/git&quot;<br>
-PV =3D &quot;2.7.0+${SRCREV}&quot;<br>
+PV =3D &quot;2.7.1+${SRCREV}&quot;<br>
<br>
=C2=A0FILESEXTRAPATHS_append :=3D &quot;${THISDIR}/${PN}-git:&quot;<br>
<br>
-SRCREV =3D &quot;<wbr>c298ef781c2d35d939fe163cbc2f41<wbr>ea7b1cb8d1&quot;<=
br>
+SRCREV =3D &quot;<wbr>b29cb89e9e9fe3119b2e5dd5d4fb79<wbr>141635b7cc&quot;<=
br>
=C2=A0SRC_URI =3D &quot;file://openvswitch-switch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://openvswitch-switch-<wbr>se=
tup \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://openvswitch-<wbr>testcontr=
oller \<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.7.4<br>
<br>
--<br>
______________________________<wbr>_________________<br>
meta-virtualization mailing list<br>
<a href=3D"mailto:meta-virtualization@yoctoproject.org">meta-virtualization=
@<wbr>yoctoproject.org</a><br>
<a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualization" rel=
=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.<wbr>org/listi=
nfo/meta-<wbr>virtualization</a><br>
</font></span></blockquote></div><br><br clear=3D"all"><div><br></div>-- <b=
r><div class=3D"gmail_signature" data-smartmail=3D"gmail_signature">&quot;T=
hou shalt not follow the NULL pointer, for chaos and madness await thee at =
its end&quot;</div>
</div>

--f4030436060acfffa405548782ac--
