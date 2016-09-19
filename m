Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 3BCA7E00720; Mon, 19 Sep 2016 13:08:08 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_LOW, 
	RCVD_IN_SORBS_SPAM autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [209.85.220.175 listed in list.dnswl.org]
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.220.175 listed in dnsbl.sorbs.net]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (bruce.ashfield[at]gmail.com)
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-qk0-f175.google.com (mail-qk0-f175.google.com
	[209.85.220.175])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id ACEB0E006B3
	for <meta-virtualization@yoctoproject.org>;
	Mon, 19 Sep 2016 13:08:05 -0700 (PDT)
Received: by mail-qk0-f175.google.com with SMTP id w204so156637047qka.0
	for <meta-virtualization@yoctoproject.org>;
	Mon, 19 Sep 2016 13:08:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=pC8LZ56sb23cpIme9F5CaYU9lVlOvrw/TLRO97yBvuU=;
	b=GLMTWevPdPwADVLnYESxRYsTMjjG9OihxaFQng1wV4awUlvtS+xHHlmzqvN4cMWT5F
	eu3Dv5FWVksz6KBe4vZVTOnMi4FdzcVq/jkKIa2/qwRibUTTJYaj3YytP9AnDrkLHyW4
	kv4bgJdDKlwCXh9slRFut8AsWvCBoA4t7qgwHTngRNwTQzJ4GQrTuW85LhtkK7n9tPGC
	NaOjL5T1+nC0EsT4dFVzPvNh68/5/cG8E2obmyG1sgzAiYcF3+xBUik2UHKriXIeLDLy
	h490+kd/a/7NHjw6mJndUXe5B6xwGQrNvNfp5nwW+c27trIm7xqbWZPOcMD6gxLlwkbc
	B2JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=pC8LZ56sb23cpIme9F5CaYU9lVlOvrw/TLRO97yBvuU=;
	b=aJ0gW1HzWrDOHJ8Sodi/XGiZvFP5UtMID1fK5GQJfni3Yt7AyD2TSBAGYbgcFKn21P
	s3gWY/bU0X+zyjuqOwGEFvTxY7L/L7MPCUiORk7jq5A7mSUA+yDigFmJq1fVjw6+woZu
	KH65rchzRGwf4+nj0f+By6RQ5HZM2ssjT4XHPDcvrWkboe3SGfsjBBXDlHGd4bus2toa
	0BhD74ps+Jra1wJl+8667/umParLyZ//a//d2EjBHYQ4jPj9ApRAKS1mBOT+zfDUBZVo
	Wx7gAim+cS4pSyivvrXGnjJP0C5svsB2nluT4b+unMac2eUtJlK4PJr5ywdydHpHMq09
	SoKA==
X-Gm-Message-State: AE9vXwPxXqUuAdY9K3Oha8ICz4pYMpitVfGiIBbq/tAl7sP4f/TMS4iAl4Crp0qoK/rRdsHUkRcl0JdyX0fsYQ==
X-Received: by 10.55.81.213 with SMTP id f204mr30377726qkb.85.1474315685309;
	Mon, 19 Sep 2016 13:08:05 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.237.38.166 with HTTP; Mon, 19 Sep 2016 13:08:04 -0700 (PDT)
In-Reply-To: <1474260897-12865-1-git-send-email-wangxin2015.fnst@cn.fujitsu.com>
References: <CAPuovEKXxaP_K+x_3udNPBgwbgLu3Y9T=3u5hhHzzo8pw-+P1Q@mail.gmail.com>
	<1474260897-12865-1-git-send-email-wangxin2015.fnst@cn.fujitsu.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 19 Sep 2016 16:08:04 -0400
Message-ID: <CADkTA4P+iQiRNWyJUoafwuGAScaMRdpfTLKgjX=O5x7Lo1THxw@mail.gmail.com>
To: Wang Xin <wangxin2015.fnst@cn.fujitsu.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: ][PATCH v2] tgt: 1.0.63 -> 1.0.67
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
X-List-Received-Date: Mon, 19 Sep 2016 20:08:08 -0000
Content-Type: multipart/alternative; boundary=001a114a88e0b5b55c053ce1de89

--001a114a88e0b5b55c053ce1de89
Content-Type: text/plain; charset=UTF-8

On Mon, Sep 19, 2016 at 12:54 AM, Wang Xin <wangxin2015.fnst@cn.fujitsu.com>
wrote:

> Signed-off-by: Wang Xin <wangxin2015.fnst@cn.fujitsu.com>
>

I didn't see an answer to the question about protocol = https, but I see
that it is gone
in v2.

The shortlog was also not quite right for this .. as well as the long log
being dropped.

I fixed the shortlog, and copied the v1 long log, so I could merge this
change.

Cheers,

Bruce


> ---
>  ...rrect-the-path-of-header-files-check-in-Yocto-buil.patch | 13
> +++++++------
>  meta-openstack/recipes-support/tgt/tgt_git.bb               |  4 ++--
>  2 files changed, 9 insertions(+), 8 deletions(-)
>
> diff --git a/meta-openstack/recipes-support/tgt/files/0001-
> Correct-the-path-of-header-files-check-in-Yocto-buil.patch
> b/meta-openstack/recipes-support/tgt/files/0001-
> Correct-the-path-of-header-files-check-in-Yocto-buil.patch
> index 6106b90..6630163 100644
> --- a/meta-openstack/recipes-support/tgt/files/0001-
> Correct-the-path-of-header-files-check-in-Yocto-buil.patch
> +++ b/meta-openstack/recipes-support/tgt/files/0001-
> Correct-the-path-of-header-files-check-in-Yocto-buil.patch
> @@ -21,21 +21,22 @@ diff --git a/usr/Makefile b/usr/Makefile
>  index 453eb1a..191503d 100644
>  --- a/usr/Makefile
>  +++ b/usr/Makefile
> -@@ -1,10 +1,10 @@
> +@@ -1,11 +1,11 @@
>   sbindir ?= $(PREFIX)/sbin
> -
> + libdir ?= $(PREFIX)/lib/tgt
> +
>  -ifneq ($(shell test -e /usr/include/linux/signalfd.h && echo 1),)
>  +ifneq ($(shell test -e $(SYSROOT)/usr/include/linux/signalfd.h && echo
> 1),)
>   CFLAGS += -DUSE_SIGNALFD
>   endif
>
> --ifneq ($(shell test -e /usr/include/sys/timerfd.h && echo 1),)
> -+ifneq ($(shell test -e $(SYSROOT)/usr/include/sys/timerfd.h && echo 1),)
> +-ifneq ($(shell test -n $(shell find /usr/include -name "timerfd.h" |
> head -n1) && echo 1),)
> ++ifneq ($(shell test -n $(shell find $(SYSROOT)/usr/include -name
> "timerfd.h" | head -n1) && echo 1),)
>   CFLAGS += -DUSE_TIMERFD
>   endif
>
> -@@ -18,7 +18,7 @@ TGTD_OBJS += bs_rbd.o
> - LIBS += -lrados -lrbd
> +@@ -25,7 +25,7 @@ TGTD_OBJS += bs_rbd.o
> + CFLAGS += -DUSE_TIMERFD
>   endif
>
>  -ifneq ($(shell test -e /usr/include/sys/eventfd.h && test -e
> /usr/include/libaio.h && echo 1),)
> diff --git a/meta-openstack/recipes-support/tgt/tgt_git.bb
> b/meta-openstack/recipes-support/tgt/tgt_git.bb
> index ac240f0..af4aa4b 100644
> --- a/meta-openstack/recipes-support/tgt/tgt_git.bb
> +++ b/meta-openstack/recipes-support/tgt/tgt_git.bb
> @@ -4,8 +4,8 @@ LICENSE = "GPLv2"
>  LIC_FILES_CHKSUM = "file://scripts/tgtd.spec;beginline=7;endline=7;md5=
> 21c19ea7dad04648b9c2f791b6e29b4c"
>  DEPENDS = "sg3-utils"
>
> -SRCREV = "eca74a72d2595f126a020111943928c3ea9e6fe8"
> -PV = "1.0.63+git${SRCPV}"
> +SRCREV = "cb7971cfeecaa43c15eed4719dc82516d7e87b6c"
> +PV = "1.0.67+git${SRCPV}"
>
>  SRC_URI = "git://github.com/fujita/tgt.git \
>         file://0001-Correct-the-path-of-header-files-check-in-Yocto-buil.patch
> \
> --
> 2.7.4
>
>
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

--001a114a88e0b5b55c053ce1de89
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Mon, Sep 19, 2016 at 12:54 AM, Wang Xin <span dir=3D"ltr">&lt;<a hre=
f=3D"mailto:wangxin2015.fnst@cn.fujitsu.com" target=3D"_blank">wangxin2015.=
fnst@cn.fujitsu.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quo=
te" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"=
>Signed-off-by: Wang Xin &lt;<a href=3D"mailto:wangxin2015.fnst@cn.fujitsu.=
com">wangxin2015.fnst@cn.fujitsu.<wbr>com</a>&gt;<br></blockquote><div><br>=
</div><div>I didn&#39;t see an answer to the question about protocol =3D ht=
tps, but I see that it is gone<br></div><div>in v2.<br><br></div><div>The s=
hortlog was also not quite right for this .. as well as the long log being =
dropped.<br><br></div><div>I fixed the shortlog, and copied the v1 long log=
, so I could merge this change.<br><br></div><div>Cheers,<br><br></div><div=
>Bruce<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D=
"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
---<br>
=C2=A0...rrect-the-path-of-header-<wbr>files-check-in-Yocto-buil.<wbr>patch=
 | 13 +++++++------<br>
=C2=A0meta-openstack/recipes-<wbr>support/tgt/<a href=3D"http://tgt_git.bb"=
 rel=3D"noreferrer" target=3D"_blank">tgt_git.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 4 ++--<br>
=C2=A02 files changed, 9 insertions(+), 8 deletions(-)<br>
<br>
diff --git a/meta-openstack/recipes-<wbr>support/tgt/files/0001-<wbr>Correc=
t-the-path-of-header-<wbr>files-check-in-Yocto-buil.<wbr>patch b/meta-opens=
tack/recipes-<wbr>support/tgt/files/0001-<wbr>Correct-the-path-of-header-<w=
br>files-check-in-Yocto-buil.<wbr>patch<br>
index 6106b90..6630163 100644<br>
--- a/meta-openstack/recipes-<wbr>support/tgt/files/0001-<wbr>Correct-the-p=
ath-of-header-<wbr>files-check-in-Yocto-buil.<wbr>patch<br>
+++ b/meta-openstack/recipes-<wbr>support/tgt/files/0001-<wbr>Correct-the-p=
ath-of-header-<wbr>files-check-in-Yocto-buil.<wbr>patch<br>
@@ -21,21 +21,22 @@ diff --git a/usr/Makefile b/usr/Makefile<br>
=C2=A0index 453eb1a..191503d 100644<br>
=C2=A0--- a/usr/Makefile<br>
=C2=A0+++ b/usr/Makefile<br>
-@@ -1,10 +1,10 @@<br>
+@@ -1,11 +1,11 @@<br>
=C2=A0 sbindir ?=3D $(PREFIX)/sbin<br>
-<br>
+ libdir ?=3D $(PREFIX)/lib/tgt<br>
+<br>
=C2=A0-ifneq ($(shell test -e /usr/include/linux/signalfd.h &amp;&amp; echo=
 1),)<br>
=C2=A0+ifneq ($(shell test -e $(SYSROOT)/usr/include/linux/<wbr>signalfd.h =
&amp;&amp; echo 1),)<br>
=C2=A0 CFLAGS +=3D -DUSE_SIGNALFD<br>
=C2=A0 endif<br>
<br>
--ifneq ($(shell test -e /usr/include/sys/timerfd.h &amp;&amp; echo 1),)<br=
>
-+ifneq ($(shell test -e $(SYSROOT)/usr/include/sys/<wbr>timerfd.h &amp;&am=
p; echo 1),)<br>
+-ifneq ($(shell test -n $(shell find /usr/include -name &quot;timerfd.h&qu=
ot; | head -n1) &amp;&amp; echo 1),)<br>
++ifneq ($(shell test -n $(shell find $(SYSROOT)/usr/include -name &quot;ti=
merfd.h&quot; | head -n1) &amp;&amp; echo 1),)<br>
=C2=A0 CFLAGS +=3D -DUSE_TIMERFD<br>
=C2=A0 endif<br>
<br>
-@@ -18,7 +18,7 @@ TGTD_OBJS +=3D bs_rbd.o<br>
- LIBS +=3D -lrados -lrbd<br>
+@@ -25,7 +25,7 @@ TGTD_OBJS +=3D bs_rbd.o<br>
+ CFLAGS +=3D -DUSE_TIMERFD<br>
=C2=A0 endif<br>
<br>
=C2=A0-ifneq ($(shell test -e /usr/include/sys/eventfd.h &amp;&amp; test -e=
 /usr/include/libaio.h &amp;&amp; echo 1),)<br>
diff --git a/meta-openstack/recipes-<wbr>support/tgt/<a href=3D"http://tgt_=
git.bb" rel=3D"noreferrer" target=3D"_blank">tgt_git.bb</a> b/meta-openstac=
k/recipes-<wbr>support/tgt/<a href=3D"http://tgt_git.bb" rel=3D"noreferrer"=
 target=3D"_blank">tgt_git.bb</a><br>
index ac240f0..af4aa4b 100644<br>
--- a/meta-openstack/recipes-<wbr>support/tgt/<a href=3D"http://tgt_git.bb"=
 rel=3D"noreferrer" target=3D"_blank">tgt_git.bb</a><br>
+++ b/meta-openstack/recipes-<wbr>support/tgt/<a href=3D"http://tgt_git.bb"=
 rel=3D"noreferrer" target=3D"_blank">tgt_git.bb</a><br>
@@ -4,8 +4,8 @@ LICENSE =3D &quot;GPLv2&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://scripts/tgtd.spec;<wbr>beginline=3D=
7;endline=3D7;md5=3D<wbr>21c19ea7dad04648b9c2f791b6e29b<wbr>4c&quot;<br>
=C2=A0DEPENDS =3D &quot;sg3-utils&quot;<br>
<br>
-SRCREV =3D &quot;<wbr>eca74a72d2595f126a020111943928<wbr>c3ea9e6fe8&quot;<=
br>
-PV =3D &quot;1.0.63+git${SRCPV}&quot;<br>
+SRCREV =3D &quot;<wbr>cb7971cfeecaa43c15eed4719dc825<wbr>16d7e87b6c&quot;<=
br>
+PV =3D &quot;1.0.67+git${SRCPV}&quot;<br>
<br>
=C2=A0SRC_URI =3D &quot;git://<a href=3D"http://github.com/fujita/tgt.git" =
rel=3D"noreferrer" target=3D"_blank">github.com/fujita/tgt.<wbr>git</a> \<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-Correct-the-path-<wbr>of-header-fil=
es-check-in-<wbr>Yocto-buil.patch \<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.7.4<br>
<br>
<br>
<br>
--<br>
______________________________<wbr>_________________<br>
meta-virtualization mailing list<br>
<a href=3D"mailto:meta-virtualization@yoctoproject.org">meta-virtualization=
@<wbr>yoctoproject.org</a><br>
<a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualization" rel=
=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.<wbr>org/listi=
nfo/meta-<wbr>virtualization</a><br>
</font></span></blockquote></div><br><br clear=3D"all"><br>-- <br><div clas=
s=3D"gmail_signature" data-smartmail=3D"gmail_signature">&quot;Thou shalt n=
ot follow the NULL pointer, for chaos and madness await thee at its end&quo=
t;</div>
</div></div>

--001a114a88e0b5b55c053ce1de89--
