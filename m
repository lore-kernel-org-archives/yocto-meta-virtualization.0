Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87284C6FD18
	for <webhook@archiver.kernel.org>; Wed, 29 Mar 2023 17:19:06 +0000 (UTC)
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com [209.85.217.45])
 by mx.groups.io with SMTP id smtpd.web10.2459.1680110336273772308
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 29 Mar 2023 10:18:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=UeJui6wW;
 spf=pass (domain: gmail.com, ip: 209.85.217.45, mailfrom: quaresma.jose@gmail.com)
Received: by mail-vs1-f45.google.com with SMTP id d18so13933461vsv.11
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 29 Mar 2023 10:18:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680110335;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GBIStDdeLTWj4tn9LjfcwFO6rOb8nByeRlOmSRX+DFQ=;
        b=UeJui6wW+QY7Ktm9gPvpT0n9lzKgIVsyq9sA0woVIcCqKd/Ydfa8L9A9+KcKpzmzuk
         JcbeQIUTdNwHirjtmZ+s89Qq+wJPqqzhkRsALg3f9ugc/v1F+ZE48PED/6SJVimZvFQ8
         jcsRB07BSBlIiqlN3tnTFyz/HbJDKHCYP4KXe3JDjFTsCs31oMlAzdLPAlic98NGgmns
         X8Vekp0tMHP5mogTLxU3rY7FCCVeyINeboRvMRSd9v7ak8591kLvRGal599hiE/NK0L3
         0FPhnYJSnx4Tb6/LZfsGj2XBfN9UHCxGCnA4oOcOjVbbwK090XirDcJfNZOKwsgq5j/b
         GeIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680110335;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GBIStDdeLTWj4tn9LjfcwFO6rOb8nByeRlOmSRX+DFQ=;
        b=ZVqnFaE7RnygcNsgTRy03uMvih+mUHTL4yVljWfdWPQTSaDE4smx+T/BBR1CBAfDN7
         x8lDvtMY4AJWlZGcxcv84j0mldmlb88G9dMZcu3PKikOeYm9kz5YBn8odOLmSWuRjUJ9
         kUzDFA8wFriu4qr8Fy8NKqUvDQS/5UQAWM6UvZ0sHHYk1y2HLZZmYhLLpKydmrJrIQeY
         KCwg6w063cO1/h7Tr+GImTu+qI62JLp411sQIwtzKKLmfeqWbnM/31SfAmjfKjh6SIPn
         P9n+qxe6kVv46WjoPUo8FdwSZnOSB6OHT0jKFuq2jkOjVcYnENItZ+P9DHwChVejhKyV
         MPyg==
X-Gm-Message-State: AAQBX9f3kA/CF60bFW9lAumyKaUXCE3zQtuTc1RhOgc1tYAQGvc4G4Y9
	YCuvSaKMuaUYAKNg3S+F4CSP9WOe9VdJH95qw6g=
X-Google-Smtp-Source: AKy350a2faIHKkRJgt8tO6QgMED++AD1Vs5xwPVl/uvnzJCCFDdF2bcaeqaYW/xdrtYj4b1gmkVIq4qCm8f20Xzdehg=
X-Received: by 2002:a67:e04d:0:b0:425:e623:360a with SMTP id
 n13-20020a67e04d000000b00425e623360amr10579119vsl.1.1680110335160; Wed, 29
 Mar 2023 10:18:55 -0700 (PDT)
MIME-Version: 1.0
References: <20230329141847.337386-1-joakimr@axis.com>
In-Reply-To: <20230329141847.337386-1-joakimr@axis.com>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Wed, 29 Mar 2023 18:18:44 +0100
Message-ID: <CANPvuRnL62+UmHEBMkiSqadLD5HnoX=kiDkep-pXoxcox+KXgg@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] upx: Bump to v3.99
To: Joakim Roubert <joakim.roubert@axis.com>
Cc: meta-virtualization@lists.yoctoproject.org, 
	Joakim Roubert <joakimr@axis.com>
Content-Type: multipart/alternative; boundary="000000000000b5f80805f80d2b98"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 29 Mar 2023 17:19:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7964

--000000000000b5f80805f80d2b98
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Joakim,

Joakim Roubert <joakim.roubert@axis.com> escreveu no dia quarta, 29/03/2023
=C3=A0(s) 15:19:

> It seems there has been recent changes to the UPX repo that make the
> current 3.96 setup here fail now. This patch mitigates that and also
> bumps UPX to version 3.99.
>
> Change-Id: I9fb718c9e98340a85997fde6c9d7c3fa1472d263
> Signed-off-by: Joakim Roubert <joakimr@axis.com>
> ---
>  recipes-extended/upx/upx_git.bb | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
>
> diff --git a/recipes-extended/upx/upx_git.bb b/recipes-extended/upx/
> upx_git.bb
> index bb8004c6..3cf82065 100644
> --- a/recipes-extended/upx/upx_git.bb
> +++ b/recipes-extended/upx/upx_git.bb
> @@ -1,13 +1,13 @@
>  HOMEPAGE =3D "http://upx.sourceforge.net"
>  SUMMARY =3D "Ultimate executable compressor."
>
> -SRCREV_upx =3D "8d1a98e03bf281b2cee459b6c27347e56d13c6a8"
> -SRCREV_vendor_doctest =3D "666e648b68fda2deb141a1fe93e3fd1e2795dd0f"
> -SRCREV_vendor_lzma_sdk =3D "9ebf8f468c689d83504e6c08c6bc26c4a1cf180f"
> -SRCREV_vendor_ucl =3D "4b58d592199dc1e5db691e1a54fb0e5e9af0ecaf"
> -SRCREV_vendor_zlib =3D "2a5b338eb173a701ed179e951d4c390e75e8d4c7"
> +SRCREV_upx =3D "feef2e38cfe7660c6d9e22b36defad4cfbf563a9"
> +SRCREV_vendor_doctest =3D "${AUTOREV}"
> +SRCREV_vendor_lzma_sdk =3D "${AUTOREV}"
> +SRCREV_vendor_ucl =3D "${AUTOREV}"
> +SRCREV_vendor_zlib =3D "${AUTOREV}"
>

The AUTOREV will break the reproducibility of this package.

Jose


>  SRCREV_FORMAT =3D "upx"
> -SRC_URI =3D "git://github.com/upx/upx;name=3Dupx;branch=3Ddevel;protocol=
=3Dhttps
> \
> +SRC_URI =3D "git://github.com/upx/upx;name=3Dupx;branch=3Dmaster;protoco=
l=3Dhttps
> \
>             git://
> github.com/upx/upx-vendor-doctest;name=3Dvendor_doctest;subdir=3Dgit/vend=
or/doctest;branch=3Dupx-vendor;protocol=3Dhttps
> \
>             git://
> github.com/upx/upx-vendor-lzma-sdk;name=3Dvendor_lzma_sdk;subdir=3Dgit/ve=
ndor/lzma-sdk;branch=3Dupx-vendor;protocol=3Dhttps
> \
>             git://
> github.com/upx/upx-vendor-ucl;name=3Dvendor_ucl;subdir=3Dgit/vendor/ucl;b=
ranch=3Dupx-vendor;protocol=3Dhttps
> \
> @@ -17,13 +17,13 @@ SRC_URI =3D "git://
> github.com/upx/upx;name=3Dupx;branch=3Ddevel;protocol=3Dhttps \
>  LICENSE =3D "GPL-2.0-only"
>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D353753597aa110e0ded3508408c63=
74a"
>
> -DEPENDS =3D "zlib libucl xz cmake-native"
> +DEPENDS =3D "cmake-native"
>
>  # inherit cmake
>
>  S =3D "${WORKDIR}/git"
>
> -PV =3D "3.96+${SRCPV}"
> +PV =3D "3.99+${SRCPV}"
>
>  EXTRA_OEMAKE +=3D " \
>      UPX_UCLDIR=3D${STAGING_DIR_TARGET} \
> --
> 2.30.2
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7963):
> https://lists.yoctoproject.org/g/meta-virtualization/message/7963
> Mute This Topic: https://lists.yoctoproject.org/mt/97929374/5052612
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [
> quaresma.jose@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--000000000000b5f80805f80d2b98
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Joakim,</div><br><div class=3D"gmail_quote"><div d=
ir=3D"ltr" class=3D"gmail_attr">Joakim Roubert &lt;<a href=3D"mailto:joakim=
.roubert@axis.com">joakim.roubert@axis.com</a>&gt; escreveu no dia quarta, =
29/03/2023 =C3=A0(s) 15:19:<br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">It seems there has been recent changes to the UPX repo that mak=
e the<br>
current 3.96 setup here fail now. This patch mitigates that and also<br>
bumps UPX to version 3.99.<br>
<br>
Change-Id: I9fb718c9e98340a85997fde6c9d7c3fa1472d263<br>
Signed-off-by: Joakim Roubert &lt;<a href=3D"mailto:joakimr@axis.com" targe=
t=3D"_blank">joakimr@axis.com</a>&gt;<br>
---<br>
=C2=A0recipes-extended/upx/<a href=3D"http://upx_git.bb" rel=3D"noreferrer"=
 target=3D"_blank">upx_git.bb</a> | 16 ++++++++--------<br>
=C2=A01 file changed, 8 insertions(+), 8 deletions(-)<br>
<br>
diff --git a/recipes-extended/upx/<a href=3D"http://upx_git.bb" rel=3D"nore=
ferrer" target=3D"_blank">upx_git.bb</a> b/recipes-extended/upx/<a href=3D"=
http://upx_git.bb" rel=3D"noreferrer" target=3D"_blank">upx_git.bb</a><br>
index bb8004c6..3cf82065 100644<br>
--- a/recipes-extended/upx/<a href=3D"http://upx_git.bb" rel=3D"noreferrer"=
 target=3D"_blank">upx_git.bb</a><br>
+++ b/recipes-extended/upx/<a href=3D"http://upx_git.bb" rel=3D"noreferrer"=
 target=3D"_blank">upx_git.bb</a><br>
@@ -1,13 +1,13 @@<br>
=C2=A0HOMEPAGE =3D &quot;<a href=3D"http://upx.sourceforge.net" rel=3D"nore=
ferrer" target=3D"_blank">http://upx.sourceforge.net</a>&quot;<br>
=C2=A0SUMMARY =3D &quot;Ultimate executable compressor.&quot;<br>
<br>
-SRCREV_upx =3D &quot;8d1a98e03bf281b2cee459b6c27347e56d13c6a8&quot;<br>
-SRCREV_vendor_doctest =3D &quot;666e648b68fda2deb141a1fe93e3fd1e2795dd0f&q=
uot;<br>
-SRCREV_vendor_lzma_sdk =3D &quot;9ebf8f468c689d83504e6c08c6bc26c4a1cf180f&=
quot;<br>
-SRCREV_vendor_ucl =3D &quot;4b58d592199dc1e5db691e1a54fb0e5e9af0ecaf&quot;=
<br>
-SRCREV_vendor_zlib =3D &quot;2a5b338eb173a701ed179e951d4c390e75e8d4c7&quot=
;<br>
+SRCREV_upx =3D &quot;feef2e38cfe7660c6d9e22b36defad4cfbf563a9&quot;<br>
+SRCREV_vendor_doctest =3D &quot;${AUTOREV}&quot;<br>
+SRCREV_vendor_lzma_sdk =3D &quot;${AUTOREV}&quot;<br>
+SRCREV_vendor_ucl =3D &quot;${AUTOREV}&quot;<br>
+SRCREV_vendor_zlib =3D &quot;${AUTOREV}&quot;<br></blockquote><div><br></d=
iv><div>The AUTOREV will break the reproducibility of this package.<br><br>=
Jose</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">
=C2=A0SRCREV_FORMAT =3D &quot;upx&quot;<br>
-SRC_URI =3D &quot;git://<a href=3D"http://github.com/upx/upx;name=3Dupx;br=
anch=3Ddevel;protocol=3Dhttps" rel=3D"noreferrer" target=3D"_blank">github.=
com/upx/upx;name=3Dupx;branch=3Ddevel;protocol=3Dhttps</a> \<br>
+SRC_URI =3D &quot;git://<a href=3D"http://github.com/upx/upx;name=3Dupx;br=
anch=3Dmaster;protocol=3Dhttps" rel=3D"noreferrer" target=3D"_blank">github=
.com/upx/upx;name=3Dupx;branch=3Dmaster;protocol=3Dhttps</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 git://<a href=3D"http://github.co=
m/upx/upx-vendor-doctest;name=3Dvendor_doctest;subdir=3Dgit/vendor/doctest;=
branch=3Dupx-vendor;protocol=3Dhttps" rel=3D"noreferrer" target=3D"_blank">=
github.com/upx/upx-vendor-doctest;name=3Dvendor_doctest;subdir=3Dgit/vendor=
/doctest;branch=3Dupx-vendor;protocol=3Dhttps</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 git://<a href=3D"http://github.co=
m/upx/upx-vendor-lzma-sdk;name=3Dvendor_lzma_sdk;subdir=3Dgit/vendor/lzma-s=
dk;branch=3Dupx-vendor;protocol=3Dhttps" rel=3D"noreferrer" target=3D"_blan=
k">github.com/upx/upx-vendor-lzma-sdk;name=3Dvendor_lzma_sdk;subdir=3Dgit/v=
endor/lzma-sdk;branch=3Dupx-vendor;protocol=3Dhttps</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 git://<a href=3D"http://github.co=
m/upx/upx-vendor-ucl;name=3Dvendor_ucl;subdir=3Dgit/vendor/ucl;branch=3Dupx=
-vendor;protocol=3Dhttps" rel=3D"noreferrer" target=3D"_blank">github.com/u=
px/upx-vendor-ucl;name=3Dvendor_ucl;subdir=3Dgit/vendor/ucl;branch=3Dupx-ve=
ndor;protocol=3Dhttps</a> \<br>
@@ -17,13 +17,13 @@ SRC_URI =3D &quot;git://<a href=3D"http://github.com/up=
x/upx;name=3Dupx;branch=3Ddevel;protocol=3Dhttps" rel=3D"noreferrer" target=
=3D"_blank">github.com/upx/upx;name=3Dupx;branch=3Ddevel;protocol=3Dhttps</=
a> \<br>
=C2=A0LICENSE =3D &quot;GPL-2.0-only&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D353753597aa110e0ded35=
08408c6374a&quot;<br>
<br>
-DEPENDS =3D &quot;zlib libucl xz cmake-native&quot;<br>
+DEPENDS =3D &quot;cmake-native&quot;<br>
<br>
=C2=A0# inherit cmake<br>
<br>
=C2=A0S =3D &quot;${WORKDIR}/git&quot;<br>
<br>
-PV =3D &quot;3.96+${SRCPV}&quot;<br>
+PV =3D &quot;3.99+${SRCPV}&quot;<br>
<br>
=C2=A0EXTRA_OEMAKE +=3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0UPX_UCLDIR=3D${STAGING_DIR_TARGET} \<br>
-- <br>
2.30.2<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#7963): <a href=3D"https://lists.yoctoproject.org/g/meta=
-virtualization/message/7963" rel=3D"noreferrer" target=3D"_blank">https://=
lists.yoctoproject.org/g/meta-virtualization/message/7963</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/97929374/5052=
612" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/mt=
/97929374/5052612</a><br>
Group Owner: <a href=3D"mailto:meta-virtualization%2Bowner@lists.yoctoproje=
ct.org" target=3D"_blank">meta-virtualization+owner@lists.yoctoproject.org<=
/a><br>
Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/meta-virtualizatio=
n/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.or=
g/g/meta-virtualization/unsub</a> [<a href=3D"mailto:quaresma.jose@gmail.co=
m" target=3D"_blank">quaresma.jose@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</div></div></div></=
div>

--000000000000b5f80805f80d2b98--

