Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 8910EE00AF0; Mon, 24 Apr 2017 19:52:25 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_LOW, 
	RCVD_IN_SORBS_SPAM autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.216.180 listed in list.dnswl.org]
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.216.180 listed in dnsbl.sorbs.net]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-qt0-f180.google.com (mail-qt0-f180.google.com
	[209.85.216.180])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8D22CE00AE0
	for <meta-virtualization@yoctoproject.org>;
	Mon, 24 Apr 2017 19:52:23 -0700 (PDT)
Received: by mail-qt0-f180.google.com with SMTP id c45so129660807qtb.1
	for <meta-virtualization@yoctoproject.org>;
	Mon, 24 Apr 2017 19:52:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=saL2FNdf5OPkZvZymdkTIMTQJAzYPscXsI49CpV3JVw=;
	b=eozhF30hR9ZC9aVIzfUdZZ4PcXC82na8h4SX96BrM6ZL5tlHyf4ZVk2kX5zE4yQKx3
	Z6occTXANmZLDdlLSie9O9JwPZhjvrH/TrNamq+A68B9qcuEVq9lORDYQXpa/zzmLuWx
	rn7Cws+1+yTS7GXwowi9E3IQNvxdC0Ydisp8+DhEFcaP6zqdlIaAcGhV811T1OAGMRCE
	3SUt/hTygH020oUwe+8a33htPbUItvXEDr5eJkr7Z/KRMacBO/eP8BrGLqvgnnkRpVq0
	sRzNP1F98rAB7uf1hDh2wzr5hxzhfO7qfXOYx9u8OErwgcjluWyfPoYK2jjTVosIkVL2
	qngg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=saL2FNdf5OPkZvZymdkTIMTQJAzYPscXsI49CpV3JVw=;
	b=LGgZcMpjH9aG4ALg1r07FTtjN3hTvrOFIwl4Jo9MG/OJytZqdvh5/N5OkcbtsKDQj4
	2T0z+l6VFL8qr0GygcXWehHdU+wlWY1/iDiFzQNMfqD194PCeieWM+vyN/DBcCr4GN7U
	M1YiSj8maqjBcAHcwbVmwrVzB+AkqOoV9xoBdNwgRsC6/0XT/XkYuUZ+Z5w4YzkHkFfJ
	IaJ5hVtbJieClXJieUEfPr8+vvDoerdN2Pqb4WoizopMK5PDO1Bsd6ZhpZyKm29nUitx
	HvO5SdZqSh+bynQH89EhiOf3GBzJZeV1SQOR654nExiM4ioFVLW4URE+e2C60fFLTBml
	PrBQ==
X-Gm-Message-State: AN3rC/7E7yYdWb5gaOSWh0+va2CsjPIWZ3D6FPKMU2eZy/4GHfeKDXAP
	yQtX4w83FiIAwz5e8R3pimHb7dsq+Q==
X-Received: by 10.237.39.146 with SMTP id a18mr28546595qtd.5.1493088743307;
	Mon, 24 Apr 2017 19:52:23 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.12.145.143 with HTTP; Mon, 24 Apr 2017 19:52:22 -0700 (PDT)
In-Reply-To: <1493065890-16039-1-git-send-email-mark.asselstine@windriver.com>
References: <1493065890-16039-1-git-send-email-mark.asselstine@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 24 Apr 2017 22:52:22 -0400
Message-ID: <CADkTA4ONn2+qhi_PDpf0i0WFULxGV5U81FFdh+YNkmTyd45oVQ@mail.gmail.com>
To: Mark Asselstine <mark.asselstine@windriver.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH 1/3] crui: update selinux patch to apply to v2.5
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
X-List-Received-Date: Tue, 25 Apr 2017 02:52:25 -0000
Content-Type: multipart/alternative; boundary=f403045f31bc29c0a3054df4d0a2

--f403045f31bc29c0a3054df4d0a2
Content-Type: text/plain; charset=UTF-8

I normally let things sit longer .. but since this is already horribly
broken, I went ahead
and merged the series.

Bruce

On Mon, Apr 24, 2017 at 4:31 PM, Mark Asselstine <
mark.asselstine@windriver.com> wrote:

> I am not sure how the uprev to v2.5 was completed without seeing this
> patch failure but regardless the file being patched was moved to the
> 'criu' directory as part of the v2.5 release. Update the path found in
> the patch and update the context in the patch such that it applies.
>
> Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> ---
>  .../criu/files/disable-selinux.patch               | 35
> +++++++++++++++-------
>  1 file changed, 24 insertions(+), 11 deletions(-)
>
> diff --git a/recipes-containers/criu/files/disable-selinux.patch
> b/recipes-containers/criu/files/disable-selinux.patch
> index da881dd..5d5d035 100644
> --- a/recipes-containers/criu/files/disable-selinux.patch
> +++ b/recipes-containers/criu/files/disable-selinux.patch
> @@ -1,3 +1,8 @@
> +From bd2eeaddfc1f12f87184d870cc9a1adde1cf0b10 Mon Sep 17 00:00:00 2001
> +From: Mark Asselstine <mark.asselstine@windriver.com>
> +Date: Mon, 24 Apr 2017 13:08:48 -0400
> +Subject: [PATCH] criu/Makefile.config: explicitly remove selinux support
> +
>  Upstream-Status: Inappropriate [disable feature]
>
>  It shows warning when build crius if libselinux has been built already:
> @@ -7,20 +12,28 @@ It shows warning when build crius if libselinux has
> been built already:
>  Apply this patch to disable selinux support when 'selinux' is not in
> PACKAGECONF.
>
>  Signed-off-by: Kai Kang <kai.kang@windriver.com>
> +[MA: Context updated to apply against criu v2.5]
> +Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> +---
> + criu/Makefile.config | 5 -----
> + 1 file changed, 5 deletions(-)
>
> -diff --git a/Makefile.config b/Makefile.config
> -index ce4b8d8..3ac2780 100644
> ---- a/Makefile.config
> -+++ b/Makefile.config
> -@@ -8,11 +8,6 @@ ifeq ($(call try-cc,$(LIBBSD_DEV_TEST),-lbsd),y)
> -       DEFINES += -DCONFIG_HAS_LIBBSD
> +diff --git a/criu/Makefile.config b/criu/Makefile.config
> +index f531b3b..37216f8 100644
> +--- a/criu/Makefile.config
> ++++ b/criu/Makefile.config
> +@@ -7,11 +7,6 @@ ifeq ($(call try-cc,$(FEATURE_TEST_LIBBSD_
> DEV),-lbsd),true)
> +         FEATURE_DEFINES       += -DCONFIG_HAS_LIBBSD
>   endif
>
>  -ifeq ($(call pkg-config-check,libselinux),y)
> --      LIBS := -lselinux $(LIBS)
> --      DEFINES += -DCONFIG_HAS_SELINUX
> +-        LIBS          += -lselinux
> +-        FEATURE_DEFINES       += -DCONFIG_HAS_SELINUX
>  -endif
>  -
> - $(CONFIG): scripts/utilities.mak scripts/feature-tests.mak
> include/config-base.h
> -       $(E) "  GEN     " $@
> -       $(Q) @echo '#ifndef __CR_CONFIG_H__' > $@
> + export DEFINES += $(FEATURE_DEFINES)
> + export CFLAGS += $(FEATURE_DEFINES)
> +
> +--
> +2.7.4
> +
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

--f403045f31bc29c0a3054df4d0a2
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I normally let things sit longer .. but since this is alre=
ady horribly broken, I went ahead<div>and merged the series.</div><div><br>=
</div><div>Bruce</div></div><div class=3D"gmail_extra"><br><div class=3D"gm=
ail_quote">On Mon, Apr 24, 2017 at 4:31 PM, Mark Asselstine <span dir=3D"lt=
r">&lt;<a href=3D"mailto:mark.asselstine@windriver.com" target=3D"_blank">m=
ark.asselstine@windriver.com</a>&gt;</span> wrote:<br><blockquote class=3D"=
gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-=
left:1ex">I am not sure how the uprev to v2.5 was completed without seeing =
this<br>
patch failure but regardless the file being patched was moved to the<br>
&#39;criu&#39; directory as part of the v2.5 release. Update the path found=
 in<br>
the patch and update the context in the patch such that it applies.<br>
<br>
Signed-off-by: Mark Asselstine &lt;<a href=3D"mailto:mark.asselstine@windri=
ver.com">mark.asselstine@windriver.com</a><wbr>&gt;<br>
---<br>
=C2=A0.../criu/files/disable-<wbr>selinux.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0| 35 +++++++++++++++-------<br>
=C2=A01 file changed, 24 insertions(+), 11 deletions(-)<br>
<br>
diff --git a/recipes-containers/criu/<wbr>files/disable-selinux.patch b/rec=
ipes-containers/criu/<wbr>files/disable-selinux.patch<br>
index da881dd..5d5d035 100644<br>
--- a/recipes-containers/criu/<wbr>files/disable-selinux.patch<br>
+++ b/recipes-containers/criu/<wbr>files/disable-selinux.patch<br>
@@ -1,3 +1,8 @@<br>
+From bd2eeaddfc1f12f87184d870cc9a1a<wbr>dde1cf0b10 Mon Sep 17 00:00:00 200=
1<br>
+From: Mark Asselstine &lt;<a href=3D"mailto:mark.asselstine@windriver.com"=
>mark.asselstine@windriver.com</a><wbr>&gt;<br>
+Date: Mon, 24 Apr 2017 13:08:48 -0400<br>
+Subject: [PATCH] criu/Makefile.config: explicitly remove selinux support<b=
r>
+<br>
=C2=A0Upstream-Status: Inappropriate [disable feature]<br>
<br>
=C2=A0It shows warning when build crius if libselinux has been built alread=
y:<br>
@@ -7,20 +12,28 @@ It shows warning when build crius if libselinux has been=
 built already:<br>
=C2=A0Apply this patch to disable selinux support when &#39;selinux&#39; is=
 not in PACKAGECONF.<br>
<br>
=C2=A0Signed-off-by: Kai Kang &lt;<a href=3D"mailto:kai.kang@windriver.com"=
>kai.kang@windriver.com</a>&gt;<br>
+[MA: Context updated to apply against criu v2.5]<br>
+Signed-off-by: Mark Asselstine &lt;<a href=3D"mailto:mark.asselstine@windr=
iver.com">mark.asselstine@windriver.com</a><wbr>&gt;<br>
+---<br>
+ criu/Makefile.config | 5 -----<br>
+ 1 file changed, 5 deletions(-)<br>
<br>
-diff --git a/Makefile.config b/Makefile.config<br>
-index ce4b8d8..3ac2780 100644<br>
---- a/Makefile.config<br>
-+++ b/Makefile.config<br>
-@@ -8,11 +8,6 @@ ifeq ($(call try-cc,$(LIBBSD_DEV_TEST),-<wbr>lbsd),y)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0DEFINES +=3D -DCONFIG_HAS_LIBBSD<br>
+diff --git a/criu/Makefile.config b/criu/Makefile.config<br>
+index f531b3b..37216f8 100644<br>
+--- a/criu/Makefile.config<br>
++++ b/criu/Makefile.config<br>
+@@ -7,11 +7,6 @@ ifeq ($(call try-cc,$(FEATURE_TEST_LIBBSD_<wbr>DEV),-lbsd=
),true)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0FEATURE_DEFINES=C2=A0 =C2=A0 =C2=A0 =C2=
=A0+=3D -DCONFIG_HAS_LIBBSD<br>
=C2=A0 endif<br>
<br>
=C2=A0-ifeq ($(call pkg-config-check,libselinux),<wbr>y)<br>
--=C2=A0 =C2=A0 =C2=A0 LIBS :=3D -lselinux $(LIBS)<br>
--=C2=A0 =C2=A0 =C2=A0 DEFINES +=3D -DCONFIG_HAS_SELINUX<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 LIBS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 +=3D -=
lselinux<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 FEATURE_DEFINES=C2=A0 =C2=A0 =C2=A0 =C2=A0+=
=3D -DCONFIG_HAS_SELINUX<br>
=C2=A0-endif<br>
=C2=A0-<br>
- $(CONFIG): scripts/utilities.mak scripts/feature-tests.mak include/config=
-base.h<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0$(E) &quot;=C2=A0 GEN=C2=A0 =C2=A0 =C2=A0&quot;=
 $@<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0$(Q) @echo &#39;#ifndef __CR_CONFIG_H__&#39; &g=
t; $@<br>
+ export DEFINES +=3D $(FEATURE_DEFINES)<br>
+ export CFLAGS +=3D $(FEATURE_DEFINES)<br>
+<br>
+--<br>
+2.7.4<br>
+<br>
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

--f403045f31bc29c0a3054df4d0a2--
