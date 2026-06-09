Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35310CD8CA8
	for <webhook@archiver.kernel.org>; Tue,  9 Jun 2026 21:53:13 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7084.1781041989823779019
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 09 Jun 2026 14:53:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=E5hUGOyh;
 spf=pass (domain: gmail.com, ip: 209.85.214.175, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2bf20f6be6bso47872635ad.3
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 09 Jun 2026 14:53:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781041989; cv=none;
        d=google.com; s=arc-20240605;
        b=jO/xPvvMNuVpmxHDJnZUDSGCWrGlPG5n3ycUbnkfJ+LIoCJVp8X84l51O8e6sZ107W
         6gIMp5Mh1NXUOt1ZlELwdxmDQQNA9nx/ZXWqaHnpAuKwxQOxc3v+xHmiolBZPAjMHSw9
         BPvg/kThkUP6tPUzp0StyX0IdiryZageP2Yg9nzwqiaCP3mVX8uEgu/cW5ccQIS9QYzV
         qEqOHcV3JU+dGhIgWQdNanSBUJ+NJ1duOn/YRcl2iF5FVY91aNte5gCnFF5/xYknYnZ0
         RqYWVwhdLoKUAj71vlWYLt366tacgSX49Mxt3LqOrrAtSS77jgeOrm2cNcbDfzvYSxGp
         DtyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=7DcQqJ9YimNfN+Gl2LmCqx96QDLBBAEjLeti54ZH89I=;
        fh=CaTBaIRZasr3/8kAjxOBH+uR81gY5Y/3WsbqEAWQ5ug=;
        b=TK2CMFaiWTxLbXUDOvWI3JxCOhrWhHkmjv1VNcjndSPwzPo7oqaLo+aDIbmV+GCdyT
         w5+LJF23czaFhhlacFQ/J1XoWjq7x8g2EDMN9O6Ph4jpFk2FOtQ235tHkBU1+eSMMkaR
         7jYl6mhyo4iKLNFdxnEkQ94SIjRsidNACrF0nhq/aVwL6GqOgAORK9RK1TKcXWVborB5
         10g8xv90ySJXFdXllASvuBpD7+UuxQwCgd78+H3bbgjgqylA9vBy1Daqmvp1iIPzRLq/
         Y9Tm54THmf0vOTLIf42F76fkIL6Kx2/3HRyNfAlOMsUZ5efa5B4ve3wYo6n4pLuDbFDR
         uNyg==;
        darn=lists.yoctoproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781041989; x=1781646789; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7DcQqJ9YimNfN+Gl2LmCqx96QDLBBAEjLeti54ZH89I=;
        b=E5hUGOyhFbI/flhuzGujd/SoOSo6OI+7vE46o/LSXzDIN7DVgmTSCgvkpeuJ9rZOYe
         acSp0XWAJmzGW3D7GruUUmkZcP4DLXZIYK9a3LKAFkcfxxIWETIB9ZCwuGwyUMftvu5R
         PmqrDaoAMhpaQJjmk+1YKMVj4k1Z2hQvwWZlb5RaDRpF6j4lbwU4IKkEsRhosnNurep2
         xKy64elCmkWF5yZbB5lzbFK6XJC2cRq02k/N0NFgx9r+w+6KDvBSzFf1YlIj/v3+vnPt
         7m2c0mrQWpHWI7U8u+fiWSrsgb8UN8WWmdJwcBRD1Cp/xYN6hOFaM3SLCr05b2wjbzVN
         onFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781041989; x=1781646789;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7DcQqJ9YimNfN+Gl2LmCqx96QDLBBAEjLeti54ZH89I=;
        b=JJO8xRKym4BRZeLAZPRJEqKh+oSJhzLeDkMsljSXzaZWDYG5hKWXLcd0YVqo/HCktG
         iVF1Vwo7Z4x/8LM/b5i6N3gojGdCOBBq7goLI415ka7GD52S33FawzFwfVHCAz9XlvGg
         dXKTdjjC8NqKW3isKQgTsIe2JSPteguwxB/SDt3pTOSgBJjkleks/GGJbKgSyi8rnu6T
         OM+enzAxMjJh1rbDI87haljFD3nBKVRl++eFGoPV3ixmoULvwDvTwyQtPK2Jv7ZsnCAR
         JQBXVvyaOwgVC7AlGRBch2ZmXX4jbN4Ao5M//xCD3kw+DaoDz6Hj6Wj2YTd6MKzquLoi
         Z8gQ==
X-Gm-Message-State: AOJu0YymNcyE/MooElWRbR6TyIfw1OH1wVnQ2HShv06EQd7P8wqCbYwT
	qhM0kWYqFRp+QNOvaIcYyVsxeF0EyT5rJEQgZY9MuolmxnKQsUFKTn/yQ82iGRNivAqFatoICQG
	Ecas94E1ziDZwLyPmMUjiv1N7UdFQj3E=
X-Gm-Gg: Acq92OF9CtcTh4BLhfdQ8A8vZX9dhIOUO7p5sXPk6fyhV4UsSmp3G6znbcdiUcnxrRW
	M/TgpObWoc2gEUAuGV1XzFqvvyw9ZkNLeQQOX56aa/5pvEabFg+uq7SMcsk2hX0x28kZ4eB3Mwv
	UsZF3wGICh6hZ2jWVcRx63tvWQpAZztXEbza6H2wIrvjcetXEHMdZ4yy/+3p0rxmaAUfzSSvnit
	V80eNt4fBEa37o+rOv+cDgpnuKA5/n5bEQBx3m8+GaBtiMYUMXs9Sy6RkYmxqV4vTIET7a/xJsA
	E6HvatJdanM2QOXUSiwH5BIh+GWsraOZoGT/HkWg+g9WeiOtsHxCVaHV07ScLDJuuirGcAcVnip
	DwmKFiMXDGQdUxMg3WI/76WrPVkfyRIb2rDJQ
X-Received: by 2002:a17:903:3807:b0:2bf:281c:d2d3 with SMTP id
 d9443c01a7336-2c1e7b073eemr247331015ad.9.1781041988902; Tue, 09 Jun 2026
 14:53:08 -0700 (PDT)
MIME-Version: 1.0
References: <20260604004120.97156-1-tim.orling@konsulko.com> <20260604004120.97156-2-tim.orling@konsulko.com>
In-Reply-To: <20260604004120.97156-2-tim.orling@konsulko.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 9 Jun 2026 17:52:57 -0400
X-Gm-Features: AVVi8Cc9limBsA-syJTQV3e9ow4un1J_C9bf00jwrRUv7wepA5c1mjJN6m8Q9-I
Message-ID: <CADkTA4MAogwK=33xi8bMizQjtSbOfX=BjDhAx8nAtcG1aNxE+A@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH 2/2] container-image-multiarch: add
 helper recipe
To: ticotimo@gmail.com
Cc: meta-virtualization@lists.yoctoproject.org, 
	Tim Orling <tim.orling@konsulko.com>
Content-Type: multipart/alternative; boundary="0000000000001421700653d92757"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 09 Jun 2026 21:53:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9856

--0000000000001421700653d92757
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

While I wait for my system level testing to complete, I'm going through the
pending patches.

This one brought a question to mind.

On Wed, Jun 3, 2026 at 8:41=E2=80=AFPM Tim Orling via lists.yoctoproject.or=
g
<ticotimo=3Dgmail.com@lists.yoctoproject.org> wrote:

> Similar to core-image-ptest.bb, this recipe uses mcextend to add
> multiarch support for any recipe in CONTAINER_IMAGES variable which is
> populated by the CONTAINER_IMAGES_META_VIRT variable in
> container-image-packagelists.inc.
>
> Signed-off-by: Tim Orling <tim.orling@konsulko.com>
> ---
>  .../images/container-image-multiarch.bb       | 25 +++++++++++++++++++
>  1 file changed, 25 insertions(+)
>  create mode 100644 recipes-containers/images/container-image-multiarch.b=
b
>
> diff --git a/recipes-containers/images/container-image-multiarch.bb
> b/recipes-containers/images/container-image-multiarch.bb
> new file mode 100644
> index 00000000..d3b586f4
> --- /dev/null
> +++ b/recipes-containers/images/container-image-multiarch.bb
> @@ -0,0 +1,25 @@
> +inherit features_check
> +REQUIRED_DISTRO_FEATURES =3D "vcontainer"
> +
> +require conf/distro/include/container-image-packagelists.inc
> +
> +DESCRIPTION +=3D "Enable building the ${MCNAME} multiarch image."
> +SUMMARY ?=3D "${MCNAME} multiarch image."
> +HOMEPAGE ?=3D "https://www.yoctoproject.org/"
> +LICENSE ?=3D "MIT"
> +LIC_FILES_CHKSUM ?=3D
> "file://${COREBASE}/meta/COPYING.MIT;md5=3D3da9cfbcb788c80a0384361b4de204=
20"
> +
> +
> +CONTAINER_IMAGES =3D "${CONTAINER_IMAGES_META_VIRT}"
>

This seems oddly tightly coupled to the .inc in the other patch. What's the
value
of that list being in the .inc and then consuming it here (when there are
no other
consumers).

What would be the future consumers of the variable/list ?

If this was to be something overridable, shouldn't that be a ?=3D assigneme=
nt
?

Bruce



> +
> +inherit oci-multiarch
> +
> +BBCLASSEXTEND =3D "${@' '.join(['mcextend:'+x for x in
> d.getVar('CONTAINER_IMAGES').split()])}"
> +
> +OCI_MULTIARCH_RECIPE =3D "${MCNAME}"
> +OCI_MULTIARCH_PLATFORMS =3D "aarch64 x86_64"
> +
> +python () {
> +    if not d.getVar("MCNAME"):
> +        raise bb.parse.SkipRecipe("No class extension set")
> +}
> --
> 2.54.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9848):
> https://lists.yoctoproject.org/g/meta-virtualization/message/9848
> Mute This Topic: https://lists.yoctoproject.org/mt/119639260/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [
> bruce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--0000000000001421700653d92757
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">While I wait for my system level testing to complete, I&#39;m=
 going through the pending patches.</div><div class=3D"gmail_default" style=
=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D"font-s=
ize:small">This one brought a question=C2=A0to mind.</div></div><br><div cl=
ass=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_a=
ttr">On Wed, Jun 3, 2026 at 8:41=E2=80=AFPM Tim Orling via <a href=3D"http:=
//lists.yoctoproject.org">lists.yoctoproject.org</a> &lt;ticotimo=3D<a href=
=3D"mailto:gmail.com@lists.yoctoproject.org">gmail.com@lists.yoctoproject.o=
rg</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">Similar to <a href=3D"http://core-image-ptest.bb" rel=3D"noreferrer" targ=
et=3D"_blank">core-image-ptest.bb</a>, this recipe uses mcextend to add<br>
multiarch support for any recipe in CONTAINER_IMAGES variable which is<br>
populated by the CONTAINER_IMAGES_META_VIRT variable in<br>
container-image-packagelists.inc.<br>
<br>
Signed-off-by: Tim Orling &lt;<a href=3D"mailto:tim.orling@konsulko.com" ta=
rget=3D"_blank">tim.orling@konsulko.com</a>&gt;<br>
---<br>
=C2=A0.../images/<a href=3D"http://container-image-multiarch.bb" rel=3D"nor=
eferrer" target=3D"_blank">container-image-multiarch.bb</a>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0| 25 +++++++++++++++++++<br>
=C2=A01 file changed, 25 insertions(+)<br>
=C2=A0create mode 100644 recipes-containers/images/<a href=3D"http://contai=
ner-image-multiarch.bb" rel=3D"noreferrer" target=3D"_blank">container-imag=
e-multiarch.bb</a><br>
<br>
diff --git a/recipes-containers/images/<a href=3D"http://container-image-mu=
ltiarch.bb" rel=3D"noreferrer" target=3D"_blank">container-image-multiarch.=
bb</a> b/recipes-containers/images/<a href=3D"http://container-image-multia=
rch.bb" rel=3D"noreferrer" target=3D"_blank">container-image-multiarch.bb</=
a><br>
new file mode 100644<br>
index 00000000..d3b586f4<br>
--- /dev/null<br>
+++ b/recipes-containers/images/<a href=3D"http://container-image-multiarch=
.bb" rel=3D"noreferrer" target=3D"_blank">container-image-multiarch.bb</a><=
br>
@@ -0,0 +1,25 @@<br>
+inherit features_check<br>
+REQUIRED_DISTRO_FEATURES =3D &quot;vcontainer&quot;<br>
+<br>
+require conf/distro/include/container-image-packagelists.inc<br>
+<br>
+DESCRIPTION +=3D &quot;Enable building the ${MCNAME} multiarch image.&quot=
;<br>
+SUMMARY ?=3D &quot;${MCNAME} multiarch image.&quot;<br>
+HOMEPAGE ?=3D &quot;<a href=3D"https://www.yoctoproject.org/" rel=3D"noref=
errer" target=3D"_blank">https://www.yoctoproject.org/</a>&quot;<br>
+LICENSE ?=3D &quot;MIT&quot;<br>
+LIC_FILES_CHKSUM ?=3D &quot;file://${COREBASE}/meta/COPYING.MIT;md5=3D3da9=
cfbcb788c80a0384361b4de20420&quot;<br>
+<br>
+<br>
+CONTAINER_IMAGES =3D &quot;${CONTAINER_IMAGES_META_VIRT}&quot;<br></blockq=
uote><div><br></div><div><div class=3D"gmail_default" style=3D"font-size:sm=
all">This seems oddly tightly coupled to the .inc in the other patch. What&=
#39;s the value</div><div class=3D"gmail_default" style=3D"font-size:small"=
>of that list being in the .inc and then consuming it here (when there are =
no other</div><div class=3D"gmail_default" style=3D"font-size:small">consum=
ers).</div><div class=3D"gmail_default" style=3D"font-size:small"><br></div=
><div class=3D"gmail_default" style=3D"font-size:small">What would be the f=
uture consumers of the variable/list ?</div><div class=3D"gmail_default" st=
yle=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D"fon=
t-size:small">If this was to be something overridable, shouldn&#39;t that b=
e a ?=3D assignement ?</div><div class=3D"gmail_default" style=3D"font-size=
:small"><br></div><div class=3D"gmail_default" style=3D"font-size:small">Br=
uce</div><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
+<br>
+inherit oci-multiarch<br>
+<br>
+BBCLASSEXTEND =3D &quot;${@&#39; &#39;.join([&#39;mcextend:&#39;+x for x i=
n d.getVar(&#39;CONTAINER_IMAGES&#39;).split()])}&quot;<br>
+<br>
+OCI_MULTIARCH_RECIPE =3D &quot;${MCNAME}&quot;<br>
+OCI_MULTIARCH_PLATFORMS =3D &quot;aarch64 x86_64&quot;<br>
+<br>
+python () {<br>
+=C2=A0 =C2=A0 if not d.getVar(&quot;MCNAME&quot;):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 raise bb.parse.SkipRecipe(&quot;No class exten=
sion set&quot;)<br>
+}<br>
-- <br>
2.54.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#9848): <a href=3D"https://lists.yoctoproject.org/g/meta=
-virtualization/message/9848" rel=3D"noreferrer" target=3D"_blank">https://=
lists.yoctoproject.org/g/meta-virtualization/message/9848</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/119639260/105=
0810" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/m=
t/119639260/1050810</a><br>
Group Owner: <a href=3D"mailto:meta-virtualization%2Bowner@lists.yoctoproje=
ct.org" target=3D"_blank">meta-virtualization+owner@lists.yoctoproject.org<=
/a><br>
Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/meta-virtualizatio=
n/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.or=
g/g/meta-virtualization/unsub</a> [<a href=3D"mailto:bruce.ashfield@gmail.c=
om" target=3D"_blank">bruce.ashfield@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature">- Thou shalt not follow the NULL pointer, for chaos and madness a=
wait thee at its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star T=
rek II<br><br></div></div>

--0000000000001421700653d92757--

