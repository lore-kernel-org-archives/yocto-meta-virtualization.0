Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 12AEEE00566; Wed,  4 Jan 2017 19:35:29 -0800 (PST)
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
	*      [209.85.216.193 listed in list.dnswl.org]
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.216.193 listed in dnsbl.sorbs.net]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-qt0-f193.google.com (mail-qt0-f193.google.com
	[209.85.216.193])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9B8DFE0049F
	for <meta-virtualization@yoctoproject.org>;
	Wed,  4 Jan 2017 19:35:26 -0800 (PST)
Received: by mail-qt0-f193.google.com with SMTP id 3so41994787qtr.2
	for <meta-virtualization@yoctoproject.org>;
	Wed, 04 Jan 2017 19:35:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ZoCbT3Z8IB6UDeSKvIpJ1LBhvE4/wIFcXNYIcZF+y9g=;
	b=O21GENKAuvbchP3tviLLJF7CSvHw8r4ot9HhJPHI33FIqP8WcpfyVOeFfZ1ZNoJgBj
	M38iANNxAZMyD3elNIeBWXGuitigNiKcQ77SwmCkJV7vkCy7dboYa+8MjCDLeIC/fYmt
	mrpgki5k6v+fKwqrMfm9ZG2w6w9f+E9+IUzpLE4vehrMw34eYnFFHT0YHnTjkby/798C
	w8Y4IjeqShcgQESB/LiBTNkvBUOgppnsjMO3/hGAOOdpXDrkOf+YBR4wtasAKkY5yy1m
	Hvz/U0yO3OPUzYdXmBvrP+ol08/ST5coMJxehybklExt2+pGlIGZtCiuUlR54crB3J9a
	EXbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ZoCbT3Z8IB6UDeSKvIpJ1LBhvE4/wIFcXNYIcZF+y9g=;
	b=ZuPJgPIYxNmCUUj9+aOIMuw2zYHuVdtvG4egdRV3ZQ1XZWBivDjmWIyqsl/aqdx4/T
	32klCqEEDNuPt7gODRLuCNF5SD09JRCD/SErB6A5s6U5b892IAq5PVUzLPy0tB0NPW6+
	LERbUitBOdFHKYMa7wFb9LCDfucAqlUPjulKpgINIJU/VUCuhkHSaPXRg0OeRWeHaLga
	BSL3qSQhay4C65wWKRbgAfg3szO7TvebYO/AZvgmhhxvn+0AXokIO8aWyq80N88l9sfx
	0Ks+b1LyR2Y9IOYGY6xQPkr/3lKI0ZaJ/HYpKrgWTFi4FlSagzmvCrN8azCOllmRbIkD
	0kWg==
X-Gm-Message-State: AIkVDXKLYNO3J9dQNOjxLweVOlvVd4MJHDUVt5I0p2NqWpfdDUBpxJM0aXY6x4IRekbhxXE9xDmgd6t8PIExCw==
X-Received: by 10.200.58.231 with SMTP id x94mr156748qte.87.1483587325658;
	Wed, 04 Jan 2017 19:35:25 -0800 (PST)
MIME-Version: 1.0
Received: by 10.12.129.227 with HTTP; Wed, 4 Jan 2017 19:35:25 -0800 (PST)
In-Reply-To: <1483565249-15968-1-git-send-email-mark.asselstine@windriver.com>
References: <1483565249-15968-1-git-send-email-mark.asselstine@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 4 Jan 2017 22:35:25 -0500
Message-ID: <CADkTA4NA5JocJ4HbXf_uGr38PD-KAURx0UD+Hre6sBQDm0WZqA@mail.gmail.com>
To: Mark Asselstine <mark.asselstine@windriver.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] openvswitch: update licence checksum
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
X-List-Received-Date: Thu, 05 Jan 2017 03:35:29 -0000
Content-Type: multipart/alternative; boundary=94eb2c1254c88a14370545509749

--94eb2c1254c88a14370545509749
Content-Type: text/plain; charset=UTF-8

merged.

Bruce

On Wed, Jan 4, 2017 at 4:27 PM, Mark Asselstine <
mark.asselstine@windriver.com> wrote:

> Upstream commit a489b16854b5 [conntrack: New userspace connection
> tracker.] classified new files under existing licenses in COPYING,
> resulting in no change to the overall licenses but requires a new
> checksum.
>
> Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> ---
>  recipes-networking/openvswitch/openvswitch_git.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/recipes-networking/openvswitch/openvswitch_git.bb
> b/recipes-networking/openvswitch/openvswitch_git.bb
> index 1c6252a..4fd58bd 100644
> --- a/recipes-networking/openvswitch/openvswitch_git.bb
> +++ b/recipes-networking/openvswitch/openvswitch_git.bb
> @@ -27,7 +27,7 @@ SRC_URI += "\
>         file://openvswitch-ptest-Fix-python-path.patch \
>         "
>
> -LIC_FILES_CHKSUM = "file://COPYING;md5=247d8817aece26b21a8cd6791b3ea994"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=17b2c9d4c70853a09c0e143137754b35"
>
>  PACKAGECONFIG ?= ""
>  PACKAGECONFIG[dpdk] = "--with-dpdk=${STAGING_DIR_
> TARGET}/opt/dpdk/${TARGET_ARCH}-native-linuxapp-gcc,,dpdk,"
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

--94eb2c1254c88a14370545509749
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">merged.<div><br></div><div>Bruce</div></div><div class=3D"=
gmail_extra"><br><div class=3D"gmail_quote">On Wed, Jan 4, 2017 at 4:27 PM,=
 Mark Asselstine <span dir=3D"ltr">&lt;<a href=3D"mailto:mark.asselstine@wi=
ndriver.com" target=3D"_blank">mark.asselstine@windriver.com</a>&gt;</span>=
 wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bor=
der-left:1px #ccc solid;padding-left:1ex">Upstream commit a489b16854b5 [con=
ntrack: New userspace connection<br>
tracker.] classified new files under existing licenses in COPYING,<br>
resulting in no change to the overall licenses but requires a new<br>
checksum.<br>
<br>
Signed-off-by: Mark Asselstine &lt;<a href=3D"mailto:mark.asselstine@windri=
ver.com">mark.asselstine@windriver.com</a><wbr>&gt;<br>
---<br>
=C2=A0recipes-networking/<wbr>openvswitch/<a href=3D"http://openvswitch_git=
.bb" rel=3D"noreferrer" target=3D"_blank">openvswitch_git.bb</a> | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/recipes-networking/<wbr>openvswitch/<a href=3D"http://openvswi=
tch_git.bb" rel=3D"noreferrer" target=3D"_blank">openvswitch_git.bb</a> b/r=
ecipes-networking/<wbr>openvswitch/<a href=3D"http://openvswitch_git.bb" re=
l=3D"noreferrer" target=3D"_blank">openvswitch_git.bb</a><br>
index 1c6252a..4fd58bd 100644<br>
--- a/recipes-networking/<wbr>openvswitch/<a href=3D"http://openvswitch_git=
.bb" rel=3D"noreferrer" target=3D"_blank">openvswitch_git.bb</a><br>
+++ b/recipes-networking/<wbr>openvswitch/<a href=3D"http://openvswitch_git=
.bb" rel=3D"noreferrer" target=3D"_blank">openvswitch_git.bb</a><br>
@@ -27,7 +27,7 @@ SRC_URI +=3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 file://openvswitch-ptest-Fix-<wbr>python-path.p=
atch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
<br>
-LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D<wbr>247d8817aece26b21a8cd=
6791b3ea9<wbr>94&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D<wbr>17b2c9d4c70853a09c0e1=
43137754b<wbr>35&quot;<br>
<br>
=C2=A0PACKAGECONFIG ?=3D &quot;&quot;<br>
=C2=A0PACKAGECONFIG[dpdk] =3D &quot;--with-dpdk=3D${STAGING_DIR_<wbr>TARGET=
}/opt/dpdk/${TARGET_<wbr>ARCH}-native-linuxapp-gcc,,<wbr>dpdk,&quot;<br>
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

--94eb2c1254c88a14370545509749--
