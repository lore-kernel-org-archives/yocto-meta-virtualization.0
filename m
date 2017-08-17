Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 23729E00D8C; Thu, 17 Aug 2017 08:52:41 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE, 
	RCVD_IN_SORBS_SPAM,URIBL_SBL autolearn=no version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.220.195 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.220.195 listed in dnsbl.sorbs.net]
	*  1.6 URIBL_SBL Contains an URL's NS IP listed in the SBL blocklist
	*      [URIs: yoctoproject.org]
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id EC74AE00CF4
	for <meta-virtualization@yoctoproject.org>;
	Thu, 17 Aug 2017 08:52:39 -0700 (PDT)
Received: by mail-qk0-f195.google.com with SMTP id a77so6379715qkb.2
	for <meta-virtualization@yoctoproject.org>;
	Thu, 17 Aug 2017 08:52:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=HeyWliFU4UxdkbvKBp7K0rnC4OuSgk/JwOMoA3PKeOM=;
	b=iQv7oh8wzsIaU8aIemZ0p8ZFj7uV3vXFfxoeNzGZQMdcoDU0I1NIBrVMhAL/krPT6i
	hevSozQJfq8Q8sy+TxM6ZaXQOGKqFUmiWnyo8iz3AAmAkBCbqnnWdgJ2CahzVr5X589q
	d4BGVGwWH++pfph+aJ0eOLEGUKezg+4U1OTs3YI3NtrS8J/yCnlgn2c8aUObcsh+LWoa
	/8+ABAznbiAwmofl2rxOIRA//lNQDu6w/2lfADERGzauhjsexLGNugcAjUTgp+f+R5S7
	odfrVt7xtAjaXubDJ5gd3IT4E+AUyWmChKXVYUiA0E/e8mhFRWMe7mTt8hatLNFducGl
	5r7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=HeyWliFU4UxdkbvKBp7K0rnC4OuSgk/JwOMoA3PKeOM=;
	b=eANGkNj/2fI1qJ5/mG1j7Zoclj+8XPRJLVhXNDe9JGL+9d6sCOwtivm0GHSAwB7C76
	iqiv0bGuRX5rIRMmkXQCbVAF9QAa30tZPZSbHEtC88OfLo/PWWODbDQd4VaTtRWaPUJ8
	wujXx3TSnhmkmf3rNdIQRNOQ8rD0fi3Zfr6uTDlYe5KX3+mXoBJgCzxXZ2NgjBMqaNMV
	zbdMvFMhpokpQuU+grjJx0xdNLe3mtjXaW1n0MMlVLiAuoMW7NR1tH90HqV5F6ZBfL9I
	sOmVCIrxf5wh8kl4kohsTLRf5/ZceZtzN1wOX9/nmmP5Ij7DVNM9ioIxcuZqLsJHJqks
	bG9g==
X-Gm-Message-State: AHYfb5jdR0mDQFNfeYss88fFGkPW26+kzjMNoq/CkvYvP/IUxFe1tGhj
	yRE3re9vnsWMTgq4uROYOTw7wlGeog==
X-Received: by 10.55.156.9 with SMTP id f9mr8037272qke.141.1502985158970; Thu,
	17 Aug 2017 08:52:38 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.12.194.139 with HTTP; Thu, 17 Aug 2017 08:52:38 -0700 (PDT)
In-Reply-To: <20170816045122.23963-1-Qi.Chen@windriver.com>
References: <20170816045122.23963-1-Qi.Chen@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 17 Aug 2017 11:52:38 -0400
Message-ID: <CADkTA4Ma+c7qCO=bG=CcTWHrnKKe+xj9jJqQJ81kT877HkPFNg@mail.gmail.com>
To: Chen Qi <Qi.Chen@windriver.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] openvswitch: add libcap-ng PACKAGECONFIG
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
X-List-Received-Date: Thu, 17 Aug 2017 15:52:41 -0000
Content-Type: multipart/alternative; boundary="94eb2c07593880d2bc0556f500f4"

--94eb2c07593880d2bc0556f500f4
Content-Type: text/plain; charset="UTF-8"

merged.

Bruce

On Wed, Aug 16, 2017 at 12:51 AM, Chen Qi <Qi.Chen@windriver.com> wrote:

> Add PACKAGECONFIG for libcap-ng, and default to enable it.
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  recipes-networking/openvswitch/openvswitch_git.bb | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/recipes-networking/openvswitch/openvswitch_git.bb
> b/recipes-networking/openvswitch/openvswitch_git.bb
> index 35f4ba8..b4aab35 100644
> --- a/recipes-networking/openvswitch/openvswitch_git.bb
> +++ b/recipes-networking/openvswitch/openvswitch_git.bb
> @@ -50,8 +50,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=
> 17b2c9d4c70853a09c0e143137754b35"
>
>  DPDK_INSTALL_DIR ?= "/opt/dpdk"
>
> -PACKAGECONFIG ?= ""
> +PACKAGECONFIG ?= "libcap-ng"
>  PACKAGECONFIG[dpdk] = "--with-dpdk=${STAGING_DIR_
> TARGET}${DPDK_INSTALL_DIR}/share/${TARGET_ARCH}-native-
> linuxapp-gcc,,dpdk,dpdk"
> +PACKAGECONFIG[libcap-ng] = "--enable-libcapng,--disable-
> libcapng,libcap-ng,"
>
>  # Don't compile kernel modules by default since it heavily depends on
>  # kernel version. Use the in-kernel module for now.
> --
> 2.11.0
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

--94eb2c07593880d2bc0556f500f4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">merged.<div><br></div><div>Bruce</div></div><div class=3D"=
gmail_extra"><br><div class=3D"gmail_quote">On Wed, Aug 16, 2017 at 12:51 A=
M, Chen Qi <span dir=3D"ltr">&lt;<a href=3D"mailto:Qi.Chen@windriver.com" t=
arget=3D"_blank">Qi.Chen@windriver.com</a>&gt;</span> wrote:<br><blockquote=
 class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc soli=
d;padding-left:1ex">Add PACKAGECONFIG for libcap-ng, and default to enable =
it.<br>
<br>
Signed-off-by: Chen Qi &lt;<a href=3D"mailto:Qi.Chen@windriver.com">Qi.Chen=
@windriver.com</a>&gt;<br>
---<br>
=C2=A0recipes-networking/<wbr>openvswitch/<a href=3D"http://openvswitch_git=
.bb" rel=3D"noreferrer" target=3D"_blank">openvswitch_git.bb</a> | 3 ++-<br=
>
=C2=A01 file changed, 2 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/recipes-networking/<wbr>openvswitch/<a href=3D"http://openvswi=
tch_git.bb" rel=3D"noreferrer" target=3D"_blank">openvswitch_git.bb</a> b/r=
ecipes-networking/<wbr>openvswitch/<a href=3D"http://openvswitch_git.bb" re=
l=3D"noreferrer" target=3D"_blank">openvswitch_git.bb</a><br>
index 35f4ba8..b4aab35 100644<br>
--- a/recipes-networking/<wbr>openvswitch/<a href=3D"http://openvswitch_git=
.bb" rel=3D"noreferrer" target=3D"_blank">openvswitch_git.bb</a><br>
+++ b/recipes-networking/<wbr>openvswitch/<a href=3D"http://openvswitch_git=
.bb" rel=3D"noreferrer" target=3D"_blank">openvswitch_git.bb</a><br>
@@ -50,8 +50,9 @@ LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D<wbr>17b2=
c9d4c70853a09c0e143137754b<wbr>35&quot;<br>
<br>
=C2=A0DPDK_INSTALL_DIR ?=3D &quot;/opt/dpdk&quot;<br>
<br>
-PACKAGECONFIG ?=3D &quot;&quot;<br>
+PACKAGECONFIG ?=3D &quot;libcap-ng&quot;<br>
=C2=A0PACKAGECONFIG[dpdk] =3D &quot;--with-dpdk=3D${STAGING_DIR_<wbr>TARGET=
}${DPDK_INSTALL_DIR}/<wbr>share/${TARGET_ARCH}-native-<wbr>linuxapp-gcc,,dp=
dk,dpdk&quot;<br>
+PACKAGECONFIG[libcap-ng] =3D &quot;--enable-libcapng,--disable-<wbr>libcap=
ng,libcap-ng,&quot;<br>
<br>
=C2=A0# Don&#39;t compile kernel modules by default since it heavily depend=
s on<br>
=C2=A0# kernel version. Use the in-kernel module for now.<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.11.0<br>
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

--94eb2c07593880d2bc0556f500f4--
