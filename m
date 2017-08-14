Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 8F7A8E00B49; Mon, 14 Aug 2017 09:05:49 -0700 (PDT)
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
	*      [209.85.216.181 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.216.181 listed in dnsbl.sorbs.net]
Received: from mail-qt0-f181.google.com (mail-qt0-f181.google.com
	[209.85.216.181])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6BBC5E008D2
	for <meta-virtualization@yoctoproject.org>;
	Mon, 14 Aug 2017 09:05:47 -0700 (PDT)
Received: by mail-qt0-f181.google.com with SMTP id a18so54216290qta.0
	for <meta-virtualization@yoctoproject.org>;
	Mon, 14 Aug 2017 09:05:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=pGZlCVELJxcMO8qXu/GIEpxxZoXBjVI/CqNURisPfrM=;
	b=pqOnpGHEZlkkCuL9/ubg3KykOtr8+/lKkJPR9QJoS/81SBdXS7965MGqjkL14MXF8b
	exR+J5PcajFs/MgZ3lONVfNAaB1g3xrwqYnTF5NHax48Fjsdnr/7kQiNyN9TpWrGMO4X
	6BB5DqePWbiSS2q3nComQo4bWrvW/UeYdet/3UznpZEK2p4pvWw19Frsv7qZJ/BCbrGV
	BepPyo8/roHLc7MQvKNtaGSuwF05xYuV5rVd6Bi8J95ukbPK8jedsRAqzb9JAYMtE+Wi
	kx/akyazUl+2QFPCLcUcsBGM5bSYDaNKpgJD1WQnXLvpJjZznCYHqLgFwCASRF4S0jzu
	K+6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=pGZlCVELJxcMO8qXu/GIEpxxZoXBjVI/CqNURisPfrM=;
	b=fWTxDbaUlJ4VsjCWgoojnmOArJHgLlpJMLoiVwWDSYCj/0Vol8EJBydLgQnHmmd8m+
	dKIeG/xzw1tD6FeAZxnhY63TD8AhNaJhk9EcGrt/lNtnrifBnOjdFpwePPMmPbdfAc5U
	SOpqzoQ9jwYqmKY+h7bl43c52/7d54yNss3j9nxl6gWLSmRTlLA+RLXpryTvCyzQL8hq
	i1vqQ46zOB5cLTZHUycrK1MH5XnGLc+0ihUymqP9kiMbZ+YmN144u4goVYbvJAN3aSP/
	CJ/nQxuqwUC47zFRLIE0196MhDvU5ljjaIWXi4+whhEyaRtyyblCD4ZDmPjbTy4JueVN
	V1KQ==
X-Gm-Message-State: AHYfb5jGLBTnE6jRb1E7nrxLP7B9m6XnCxnCFFG4PUNZtybtiPAW3VZ6
	paCFhaUy4SQKCFGdjb+KRbYVwt+p4A==
X-Received: by 10.200.8.152 with SMTP id v24mr34895030qth.68.1502726747208;
	Mon, 14 Aug 2017 09:05:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.12.194.139 with HTTP; Mon, 14 Aug 2017 09:05:46 -0700 (PDT)
In-Reply-To: <CACMJ4GaS4wgNiCdvPMWfSqCJoj5hWj1nm441WmfMDp7huFhtLQ@mail.gmail.com>
References: <CACMJ4GaS4wgNiCdvPMWfSqCJoj5hWj1nm441WmfMDp7huFhtLQ@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 14 Aug 2017 12:05:46 -0400
Message-ID: <CADkTA4MAETxbcU7LEjD66qPY2o0qW1X=kp4WtRVF3kTmUjh=rA@mail.gmail.com>
To: Christopher Clark <christopher.w.clark@gmail.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>, cardoe@gentoo.org
Subject: Re: [PATCH] xen: remove STAGING_DIR_HOST from runtime path for bios.bin
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
X-List-Received-Date: Mon, 14 Aug 2017 16:05:49 -0000
Content-Type: multipart/alternative; boundary="001a114550f2f640b20556b8d54b"

--001a114550f2f640b20556b8d54b
Content-Type: text/plain; charset="UTF-8"

This patch came through corrupted:

[/home/bruc...ualization]> git am -s b.mbox
Applying: xen: remove STAGING_DIR_HOST from runtime path for bios.bin
fatal: corrupt patch at line 12
Patch failed at 0001 xen: remove STAGING_DIR_HOST from runtime path for
bios.bin

Bruce

On Wed, Aug 9, 2017 at 9:06 PM, Christopher Clark <
christopher.w.clark@gmail.com> wrote:

> Bug fix: this configuration option sets a run-time search path rather
> than the location of a build-time dependency.
>
> Tested with Xen 4.9 on OpenXT.
>
> Signed-off-by: Christopher Clark <christopher.clark6@baesystems.com>
> ---
>  recipes-extended/xen/xen.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc
> index 677ab69..274d0df 100644
> --- a/recipes-extended/xen/xen.inc
> +++ b/recipes-extended/xen/xen.inc
> @@ -22,7 +22,7 @@ FLASK_POLICY_FILE ?= "xenpolicy-${PV}"
>  PACKAGECONFIG[sdl] = "--enable-sdl,--disable-sdl,virtual/libsdl,"
>  PACKAGECONFIG[xsm] =
> "--enable-xsmpolicy,--disable-xsmpolicy,checkpolicy-native,"
>  PACKAGECONFIG[systemd] = "--enable-systemd,--disable-systemd,systemd,"
> -PACKAGECONFIG[hvm] =
> "--with-system-seabios="${STAGING_DIR_HOST}/usr/share/
> firmware/bios.bin",--disable-seabios,seabios
> ipxe vgabios,"
> +PACKAGECONFIG[hvm] =
> "--with-system-seabios="/usr/share/firmware/bios.bin",--
> disable-seabios,seabios
> ipxe vgabios,"
>
>  DEPENDS = " \
>      bison-native \
> --
> 2.7.4
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--001a114550f2f640b20556b8d54b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">This patch came through corrupted:<div><div><br></div><div=
>[/home/bruc...ualization]&gt; git am -s b.mbox</div><div>Applying: xen: re=
move STAGING_DIR_HOST from runtime path for bios.bin</div><div>fatal: corru=
pt patch at line 12</div><div>Patch failed at 0001 xen: remove STAGING_DIR_=
HOST from runtime path for bios.bin</div></div><div><br></div><div>Bruce</d=
iv></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Wed, =
Aug 9, 2017 at 9:06 PM, Christopher Clark <span dir=3D"ltr">&lt;<a href=3D"=
mailto:christopher.w.clark@gmail.com" target=3D"_blank">christopher.w.clark=
@gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Bug fix:=
 this configuration option sets a run-time search path rather<br>
than the location of a build-time dependency.<br>
<br>
Tested with Xen 4.9 on OpenXT.<br>
<br>
Signed-off-by: Christopher Clark &lt;<a href=3D"mailto:christopher.clark6@b=
aesystems.com">christopher.clark6@<wbr>baesystems.com</a>&gt;<br>
---<br>
=C2=A0recipes-extended/xen/xen.inc | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc<br=
>
index 677ab69..274d0df 100644<br>
--- a/recipes-extended/xen/xen.inc<br>
+++ b/recipes-extended/xen/xen.inc<br>
@@ -22,7 +22,7 @@ FLASK_POLICY_FILE ?=3D &quot;xenpolicy-${PV}&quot;<br>
=C2=A0PACKAGECONFIG[sdl] =3D &quot;--enable-sdl,--disable-sdl,<wbr>virtual/=
libsdl,&quot;<br>
=C2=A0PACKAGECONFIG[xsm] =3D<br>
&quot;--enable-xsmpolicy,--disable-<wbr>xsmpolicy,checkpolicy-native,&quot;=
<br>
=C2=A0PACKAGECONFIG[systemd] =3D &quot;--enable-systemd,--disable-<wbr>syst=
emd,systemd,&quot;<br>
-PACKAGECONFIG[hvm] =3D<br>
&quot;--with-system-seabios=3D&quot;${<wbr>STAGING_DIR_HOST}/usr/share/<wbr=
>firmware/bios.bin&quot;,--disable-<wbr>seabios,seabios<br>
ipxe vgabios,&quot;<br>
+PACKAGECONFIG[hvm] =3D<br>
&quot;--with-system-seabios=3D&quot;/usr/<wbr>share/firmware/bios.bin&quot;=
,--<wbr>disable-seabios,seabios<br>
ipxe vgabios,&quot;<br>
<br>
=C2=A0DEPENDS =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0bison-native \<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.7.4<br>
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

--001a114550f2f640b20556b8d54b--
