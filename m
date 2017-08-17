Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 1E88FE00D8C; Thu, 17 Aug 2017 08:52:30 -0700 (PDT)
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
	*      [209.85.216.194 listed in list.dnswl.org]
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.216.194 listed in dnsbl.sorbs.net]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-qt0-f194.google.com (mail-qt0-f194.google.com
	[209.85.216.194])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5D87EE00CF4
	for <meta-virtualization@yoctoproject.org>;
	Thu, 17 Aug 2017 08:52:28 -0700 (PDT)
Received: by mail-qt0-f194.google.com with SMTP id i19so6570259qte.1
	for <meta-virtualization@yoctoproject.org>;
	Thu, 17 Aug 2017 08:52:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=fYLM3ySuIgO4wQs+fXvUXoqZ880+xklo+jya4IfZJXw=;
	b=Kq/vjQ1JS6voBCY16n+WBynwBYug2k+tbC/Bywziv6FgSx3T+LfoBD7lpshepl/xwl
	r0n0JnFIvep+NsQIm6w/z0xFvzvH72c383TQm1uMZq8/SGNNqCYs5bUdi82Bzt/sSwu6
	mSj0z9RQNYjAzBaCvACTxzxOmnelMbkcUhxS1phpNkZLLG4pLZM+Xhy1wwiDsps1FqjJ
	5D8oObyhcmBz5dwlT8ujr6ezBYCL/bKw4Ew8i6CEkQtMae18YCeyCRaHGrJgWqFHpSOC
	GdxHksYAcxrVK8XlR9CguNo2S3KRrJvLeuX1qoPNDdMnFi8Ezxet0Gj4zyG3LCsQH7no
	CXgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=fYLM3ySuIgO4wQs+fXvUXoqZ880+xklo+jya4IfZJXw=;
	b=anTttBrKkXddKmt1NeHfOV9RYm6hWDWwy2DFMzubmCJYwqgjtd9HtjBeOJ7LogOH2q
	U2zk2WO/6FV2aemTRfqNBbniz2DQAFG1+ZVkzbZ27coVK+OUE1SLfXjNXObnZc1wxfPa
	43IZ666gOO1Ff4vihoP3grRn9M4AoAJ2IzeEIvUzjuNMgCw9fANXoINsbGORPlWH3ypG
	Er/EvqrSYBY463Z1jTwcHI7XzvNMgUqBD/199jfhRMs8RZhCr64helq5bqM6F8u+BhWx
	PH3snaqIHfpATPZsdHQ6tXOIKqA+lye2m4C21oFLI7S4qkUyzSTZoeV3GH83TnutCNFT
	2grQ==
X-Gm-Message-State: AHYfb5gE0EsC6QaXI7sMUWxYdZ42DEcWHizl1aMAQziQ1Z8nadWZLeM8
	AOtJKmyrV7UPRLfRuvTq6C3SZsrWDQ==
X-Received: by 10.200.9.43 with SMTP id t40mr7805386qth.237.1502985148429;
	Thu, 17 Aug 2017 08:52:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.12.194.139 with HTTP; Thu, 17 Aug 2017 08:52:27 -0700 (PDT)
In-Reply-To: <1502741098-5880-1-git-send-email-christopher.w.clark@gmail.com>
References: <1502741098-5880-1-git-send-email-christopher.w.clark@gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 17 Aug 2017 11:52:27 -0400
Message-ID: <CADkTA4MrdOVT5C121MwVZ0wKjR=DOFhGFt8fbdNRh+_=t4rSJg@mail.gmail.com>
To: Christopher Clark <christopher.w.clark@gmail.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>, Doug Goldstein <cardoe@gentoo.org>
Subject: Re: [PATCH resend] xen: remove STAGING_DIR_HOST from the runtime search path for bios.bin
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
X-List-Received-Date: Thu, 17 Aug 2017 15:52:30 -0000
Content-Type: multipart/alternative; boundary="001a1143acb2e002700556f4ff66"

--001a1143acb2e002700556f4ff66
Content-Type: text/plain; charset="UTF-8"

merged.

Bruce

On Mon, Aug 14, 2017 at 4:04 PM, <christopher.w.clark@gmail.com> wrote:

> From: Christopher Clark <christopher.w.clark@gmail.com>
>
> This configuration option sets a run-time search path rather
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
> index a28d474..6a0f226 100644
> --- a/recipes-extended/xen/xen.inc
> +++ b/recipes-extended/xen/xen.inc
> @@ -22,7 +22,7 @@ FLASK_POLICY_FILE ?= "xenpolicy-${PV}"
>  PACKAGECONFIG[sdl] = "--enable-sdl,--disable-sdl,virtual/libsdl,"
>  PACKAGECONFIG[xsm] = "--enable-xsmpolicy,--disable-
> xsmpolicy,checkpolicy-native,"
>  PACKAGECONFIG[systemd] = "--enable-systemd,--disable-systemd,systemd,"
> -PACKAGECONFIG[hvm] = "--with-system-seabios="${
> STAGING_DIR_HOST}/usr/share/firmware/bios.bin",--disable-seabios,seabios
> ipxe vgabios,"
> +PACKAGECONFIG[hvm] = "--with-system-seabios="/usr/
> share/firmware/bios.bin",--disable-seabios,seabios ipxe vgabios,"
>
>  DEPENDS = " \
>      bison-native \
> --
> 2.7.4
>
>


-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--001a1143acb2e002700556f4ff66
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">merged.<div><br></div><div>Bruce</div></div><div class=3D"=
gmail_extra"><br><div class=3D"gmail_quote">On Mon, Aug 14, 2017 at 4:04 PM=
,  <span dir=3D"ltr">&lt;<a href=3D"mailto:christopher.w.clark@gmail.com" t=
arget=3D"_blank">christopher.w.clark@gmail.com</a>&gt;</span> wrote:<br><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #=
ccc solid;padding-left:1ex">From: Christopher Clark &lt;<a href=3D"mailto:c=
hristopher.w.clark@gmail.com">christopher.w.clark@gmail.com</a><wbr>&gt;<br=
>
<br>
This configuration option sets a run-time search path rather<br>
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
index a28d474..6a0f226 100644<br>
--- a/recipes-extended/xen/xen.inc<br>
+++ b/recipes-extended/xen/xen.inc<br>
@@ -22,7 +22,7 @@ FLASK_POLICY_FILE ?=3D &quot;xenpolicy-${PV}&quot;<br>
=C2=A0PACKAGECONFIG[sdl] =3D &quot;--enable-sdl,--disable-sdl,<wbr>virtual/=
libsdl,&quot;<br>
=C2=A0PACKAGECONFIG[xsm] =3D &quot;--enable-xsmpolicy,--disable-<wbr>xsmpol=
icy,checkpolicy-native,&quot;<br>
=C2=A0PACKAGECONFIG[systemd] =3D &quot;--enable-systemd,--disable-<wbr>syst=
emd,systemd,&quot;<br>
-PACKAGECONFIG[hvm] =3D &quot;--with-system-seabios=3D&quot;${<wbr>STAGING_=
DIR_HOST}/usr/share/<wbr>firmware/bios.bin&quot;,--disable-<wbr>seabios,sea=
bios ipxe vgabios,&quot;<br>
+PACKAGECONFIG[hvm] =3D &quot;--with-system-seabios=3D&quot;/usr/<wbr>share=
/firmware/bios.bin&quot;,--<wbr>disable-seabios,seabios ipxe vgabios,&quot;=
<br>
<br>
=C2=A0DEPENDS =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0bison-native \<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.7.4<br>
<br>
</font></span></blockquote></div><br><br clear=3D"all"><div><br></div>-- <b=
r><div class=3D"gmail_signature" data-smartmail=3D"gmail_signature">&quot;T=
hou shalt not follow the NULL pointer, for chaos and madness await thee at =
its end&quot;</div>
</div>

--001a1143acb2e002700556f4ff66--
