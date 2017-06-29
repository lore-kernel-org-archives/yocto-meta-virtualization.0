Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id BCB7FE00B18; Thu, 29 Jun 2017 12:41:07 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.215.54 listed in list.dnswl.org]
Received: from mail-lf0-f54.google.com (mail-lf0-f54.google.com
	[209.85.215.54])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5DACAE0084A
	for <meta-virtualization@yoctoproject.org>;
	Thu, 29 Jun 2017 12:41:03 -0700 (PDT)
Received: by mail-lf0-f54.google.com with SMTP id h22so58693093lfk.3
	for <meta-virtualization@yoctoproject.org>;
	Thu, 29 Jun 2017 12:41:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=b7wWLNz2D/1fOHvYdhzWGQM+/1WISb+zxFsLkcFiupA=;
	b=Oz5EXke86fRKC2p2IxwXTH0JB0QuOHEefpsUMhcK/tWIsQiK8Fy3a1qJs3LwnsxocD
	rDWIoGQHZ37K7TSSEFk15LCzX+K1Zh2WXXYKX+Fmm3+2+nOV7RuXU/CAHdTTwEe/AZiw
	+atrTzD+vTl1Qb50rPLM4N7o0fPFstr5dQqG+4s1w0zk+QFUKf/jW3RtytyG8IPp45uN
	06Whnog0MKUQt50ohe7l2E6sG/nC/zL+MIGaVGkMUv0EWdWU5nB6JXBvcsvdeqmzXlFK
	ahCdYZvZM22xeKgmtTGHuSFoeDeHVrBYiWN6EbTuvg2+jWzDHEWHRy+DGmTzz2M1f2aV
	rYmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=b7wWLNz2D/1fOHvYdhzWGQM+/1WISb+zxFsLkcFiupA=;
	b=k5DQTUePmxsm6bo5KNzTpdj2prWaI/c4hsneqokjKqZ1Dbvsraof1Gzwwu2HCeC8hs
	WhF3s6nf+ov0LYNpsxkLYEf1dIwKP00lB1EAvs4vD1Is74RedOpwASJVloNwXxBRV/EB
	I41Eu6b4NbegmmHt5YSJAvgeij+uSgFfTsXsJaIO8fXqmlNM0NhgP9u/cay7O4QHNYpe
	KgrRR1DReQX4CBIuv0Oy3A3EHTfRo2bXcoic44fTQBJloOBz/NwwhaBK6jlZbm2FBlY+
	i2jPYnCl5hs6nWR4PACwadBGwmpTpnY1gnwdAzjYKDre33/FxzzmRvo5sc/w450/mIwF
	KLDg==
X-Gm-Message-State: AKS2vOyaMkYxXomqis6pTqjTj5JVgro1OkE9i47rT5M55JP+UBE8pFyr
	kRQjQJxtqiunxTxdNuM6FXXqvkWXaA==
X-Received: by 10.46.70.9 with SMTP id t9mr5668446lja.117.1498765262680; Thu,
	29 Jun 2017 12:41:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.46.9.137 with HTTP; Thu, 29 Jun 2017 12:41:02 -0700 (PDT)
In-Reply-To: <1498729759-7600-1-git-send-email-zhe.he@windriver.com>
References: <1498729759-7600-1-git-send-email-zhe.he@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 29 Jun 2017 15:41:02 -0400
Message-ID: <CADkTA4Mzz08+m0Rt=1MHX49epO=dNfys=n5x=B+YB463q4UPTQ@mail.gmail.com>
To: He Zhe <zhe.he@windriver.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] spice: Fix compilation error
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
X-List-Received-Date: Thu, 29 Jun 2017 19:41:07 -0000
Content-Type: multipart/alternative; boundary="f403045f798c15779a05531e7bfe"

--f403045f798c15779a05531e7bfe
Content-Type: text/plain; charset="UTF-8"

merged.

Bruce

On Thu, Jun 29, 2017 at 5:49 AM, <zhe.he@windriver.com> wrote:

> From: He Zhe <zhe.he@windriver.com>
>
> | ../../git/server/red_parse_qxl.c:367:18: error: 'BITMAP_FMT_IS_RGB'
> defined but not used [-Werror=unused-const-variable=]
> |  static const int BITMAP_FMT_IS_RGB[] = {0, 0, 0, 0, 0, 0, 1, 1, 1, 1,
> 1};
>
> Signed-off-by: He Zhe <zhe.he@windriver.com>
> ---
>  ...xl-Fix-BITMAP_FMT_IS_RGB-defined-but-not-.patch | 29
> ++++++++++++++++++++++
>  recipes-support/spice/spice_git.bb                 |  1 +
>  2 files changed, 30 insertions(+)
>  create mode 100644 recipes-support/spice/files/
> 0001-red_parse_qxl-Fix-BITMAP_FMT_IS_RGB-defined-but-not-.patch
>
> diff --git a/recipes-support/spice/files/0001-red_parse_qxl-Fix-BITMAP_
> FMT_IS_RGB-defined-but-not-.patch b/recipes-support/spice/files/
> 0001-red_parse_qxl-Fix-BITMAP_FMT_IS_RGB-defined-but-not-.patch
> new file mode 100644
> index 0000000..ccae5f5
> --- /dev/null
> +++ b/recipes-support/spice/files/0001-red_parse_qxl-Fix-BITMAP_
> FMT_IS_RGB-defined-but-not-.patch
> @@ -0,0 +1,29 @@
> +From 85838d4c9f2322aedb99b38fffd7da95a494d8ed Mon Sep 17 00:00:00 2001
> +From: He Zhe <zhe.he@windriver.com>
> +Date: Thu, 29 Jun 2017 08:26:35 +0000
> +Subject: [PATCH] red_parse_qxl: Fix BITMAP_FMT_IS_RGB defined but not used
> +
> +| ../../git/server/red_parse_qxl.c:367:18: error: 'BITMAP_FMT_IS_RGB'
> +defined but not used [-Werror=unused-const-variable=]
> +|  static const int BITMAP_FMT_IS_RGB[] = {0, 0, 0, 0, 0, 0, 1, 1, 1, 1,
> 1};
> +
> +Signed-off-by: He Zhe <zhe.he@windriver.com>
> +---
> + server/red_parse_qxl.c | 1 -
> + 1 file changed, 1 deletion(-)
> +
> +diff --git a/server/red_parse_qxl.c b/server/red_parse_qxl.c
> +index 6c0b0658..cfc2da95 100644
> +--- a/server/red_parse_qxl.c
> ++++ b/server/red_parse_qxl.c
> +@@ -364,7 +364,6 @@ static int bitmap_consistent(SpiceBitmap *bitmap)
> +
> + // This is based on SPICE_BITMAP_FMT_*, copied from server/red_worker.c
> + // to avoid a possible unoptimization from making it non static.
> +-static const int BITMAP_FMT_IS_RGB[] = {0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1};
> +
> + static SpiceImage *red_get_image(RedMemSlotInfo *slots, int group_id,
> +                                  QXLPHYSICAL addr, uint32_t flags, int
> is_mask)
> +--
> +2.11.0
> +
> diff --git a/recipes-support/spice/spice_git.bb b/recipes-support/spice/
> spice_git.bb
> index 828087a..6f1be3a 100644
> --- a/recipes-support/spice/spice_git.bb
> +++ b/recipes-support/spice/spice_git.bb
> @@ -35,6 +35,7 @@ SRC_URI += " \
>          file://spice-fix-CVE-2013-4282.patch \
>          file://configure.ac-add-subdir-objects-to-AM_INIT_AUTOMAKE.patch
> \
>          file://build-allow-separated-src-and-build-dirs.patch \
> +        file://0001-red_parse_qxl-Fix-BITMAP_FMT_IS_RGB-defined-but-not-.patch
> \
>          "
>
>  S = "${WORKDIR}/git"
> --
> 2.8.1
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

--f403045f798c15779a05531e7bfe
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">merged.<div><br></div><div>Bruce</div></div><div class=3D"=
gmail_extra"><br><div class=3D"gmail_quote">On Thu, Jun 29, 2017 at 5:49 AM=
,  <span dir=3D"ltr">&lt;<a href=3D"mailto:zhe.he@windriver.com" target=3D"=
_blank">zhe.he@windriver.com</a>&gt;</span> wrote:<br><blockquote class=3D"=
gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-=
left:1ex">From: He Zhe &lt;<a href=3D"mailto:zhe.he@windriver.com">zhe.he@w=
indriver.com</a>&gt;<br>
<br>
| ../../git/server/red_parse_<wbr>qxl.c:367:18: error: &#39;BITMAP_FMT_IS_R=
GB&#39;<br>
defined but not used [-Werror=3Dunused-const-<wbr>variable=3D]<br>
|=C2=A0 static const int BITMAP_FMT_IS_RGB[] =3D {0, 0, 0, 0, 0, 0, 1, 1, 1=
, 1, 1};<br>
<br>
Signed-off-by: He Zhe &lt;<a href=3D"mailto:zhe.he@windriver.com">zhe.he@wi=
ndriver.com</a>&gt;<br>
---<br>
=C2=A0...xl-Fix-BITMAP_FMT_IS_RGB-<wbr>defined-but-not-.patch | 29 ++++++++=
++++++++++++++<br>
=C2=A0recipes-support/spice/<a href=3D"http://spice_git.bb" rel=3D"noreferr=
er" target=3D"_blank">spice_<wbr>git.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 1 +<br>
=C2=A02 files changed, 30 insertions(+)<br>
=C2=A0create mode 100644 recipes-support/spice/files/<wbr>0001-red_parse_qx=
l-Fix-BITMAP_<wbr>FMT_IS_RGB-defined-but-not-.<wbr>patch<br>
<br>
diff --git a/recipes-support/spice/files/<wbr>0001-red_parse_qxl-Fix-BITMAP=
_<wbr>FMT_IS_RGB-defined-but-not-.<wbr>patch b/recipes-support/spice/files/=
<wbr>0001-red_parse_qxl-Fix-BITMAP_<wbr>FMT_IS_RGB-defined-but-not-.<wbr>pa=
tch<br>
new file mode 100644<br>
index 0000000..ccae5f5<br>
--- /dev/null<br>
+++ b/recipes-support/spice/files/<wbr>0001-red_parse_qxl-Fix-BITMAP_<wbr>F=
MT_IS_RGB-defined-but-not-.<wbr>patch<br>
@@ -0,0 +1,29 @@<br>
+From 85838d4c9f2322aedb99b38fffd7da<wbr>95a494d8ed Mon Sep 17 00:00:00 200=
1<br>
+From: He Zhe &lt;<a href=3D"mailto:zhe.he@windriver.com">zhe.he@windriver.=
com</a>&gt;<br>
+Date: Thu, 29 Jun 2017 08:26:35 +0000<br>
+Subject: [PATCH] red_parse_qxl: Fix BITMAP_FMT_IS_RGB defined but not used=
<br>
+<br>
+| ../../git/server/red_parse_<wbr>qxl.c:367:18: error: &#39;BITMAP_FMT_IS_=
RGB&#39;<br>
+defined but not used [-Werror=3Dunused-const-<wbr>variable=3D]<br>
+|=C2=A0 static const int BITMAP_FMT_IS_RGB[] =3D {0, 0, 0, 0, 0, 0, 1, 1, =
1, 1, 1};<br>
+<br>
+Signed-off-by: He Zhe &lt;<a href=3D"mailto:zhe.he@windriver.com">zhe.he@w=
indriver.com</a>&gt;<br>
+---<br>
+ server/red_parse_qxl.c | 1 -<br>
+ 1 file changed, 1 deletion(-)<br>
+<br>
+diff --git a/server/red_parse_qxl.c b/server/red_parse_qxl.c<br>
+index 6c0b0658..cfc2da95 100644<br>
+--- a/server/red_parse_qxl.c<br>
++++ b/server/red_parse_qxl.c<br>
+@@ -364,7 +364,6 @@ static int bitmap_consistent(SpiceBitmap *bitmap)<br>
+<br>
+ // This is based on SPICE_BITMAP_FMT_*, copied from server/red_worker.c<b=
r>
+ // to avoid a possible unoptimization from making it non static.<br>
+-static const int BITMAP_FMT_IS_RGB[] =3D {0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1=
};<br>
+<br>
+ static SpiceImage *red_get_image(RedMemSlotInfo *slots, int group_id,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 QXLPHYSICAL addr, uint32_t fl=
ags, int is_mask)<br>
+--<br>
+2.11.0<br>
+<br>
diff --git a/recipes-support/spice/<a href=3D"http://spice_git.bb" rel=3D"n=
oreferrer" target=3D"_blank">spice_<wbr>git.bb</a> b/recipes-support/spice/=
<a href=3D"http://spice_git.bb" rel=3D"noreferrer" target=3D"_blank">spice_=
<wbr>git.bb</a><br>
index 828087a..6f1be3a 100644<br>
--- a/recipes-support/spice/<a href=3D"http://spice_git.bb" rel=3D"noreferr=
er" target=3D"_blank">spice_<wbr>git.bb</a><br>
+++ b/recipes-support/spice/<a href=3D"http://spice_git.bb" rel=3D"noreferr=
er" target=3D"_blank">spice_<wbr>git.bb</a><br>
@@ -35,6 +35,7 @@ SRC_URI +=3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://spice-fix-CVE-2013-<wbr>4282.patch=
 \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://configure.ac-add-<wbr>subdir-objec=
ts-to-AM_INIT_<wbr>AUTOMAKE.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://build-allow-separated-<wbr>src-and=
-build-dirs.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-red_parse_qxl-Fix-<wbr>BITMAP_FMT_=
IS_RGB-defined-but-<wbr>not-.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
<br>
=C2=A0S =3D &quot;${WORKDIR}/git&quot;<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.8.1<br>
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

--f403045f798c15779a05531e7bfe--
