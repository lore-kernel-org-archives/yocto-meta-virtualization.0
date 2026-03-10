Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B720FD2D9F
	for <webhook@archiver.kernel.org>; Tue, 10 Mar 2026 14:04:48 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.40788.1773151483012220378
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 10 Mar 2026 07:04:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=go3CMqMD;
 spf=pass (domain: gmail.com, ip: 209.85.214.177, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2ae50a33ff8so67768035ad.3
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 10 Mar 2026 07:04:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773151482; cv=none;
        d=google.com; s=arc-20240605;
        b=GMrDGB9RYN2ZEMlSNQKA9ebRwPyjw4x2HbQXQyGVAjvmaWa/onpf3r3uspDreLW8iS
         obnEDs9VlPMnRIX514mdzSPYVuVEWA+W/zL6ZNVLvG/L9dnZ7/S+oG4//ObEmZMDbgz+
         Ig3vkhzdnsreAxnQRzgO7sv70VxGAvMQrjga7RQ7eEo7wH3+Q0OKh3qnKmxr3PArG/ck
         /FsM0ujRLAIbPke5pIqNfKtPEi/EJI2tD4HaS0dMUO6CAe1lwdV14i2yMTey4I7l/fbr
         4R45RzuBvF5kDmLp5E8a24E/KrZ1qKaNWdX8GcTUlTZoVrH6PvqaT5HMKMFI+DPk1n3R
         d/vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=SvOIzML6wGNaW8aZVM422Pl1aGTefclsaNq5tyugw0M=;
        fh=nyQV/CHwFtvZb3Ta59Z7ZdYsiFoOlJe74TQZPxCvDSQ=;
        b=biYQlDlaCBbr/ZdJ1qJrGjQ4HLDzyPJ2HtnzI/N3HJY9ikWUDpZDIgF07jC0TCsOCA
         r3r39RRYBrbHOCSt6n5NFvMdIS7adksqW5K73Sg4OmANLaoEPYkBm9upNKIOwj0FWXxV
         34O4wUl4Ekbwu36K7tw14LO38QagQLFm9lLmrgbqhwlecgB23XsfeodizpnDZcGZ5HJt
         pa3VWE8pXFcN7LinIWjjFUJlTS6d5HaXR/TQ6p1xjEMP+89RSfbtePSK0tn4EBV9XqDC
         RrXUEEEFOrzRjXM1Rob5OQ56RqpHpK46tR7t5g4ufFS0IHmtiKBH/p4her1XAZ2M7L/f
         Y3kA==;
        darn=lists.yoctoproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773151482; x=1773756282; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=SvOIzML6wGNaW8aZVM422Pl1aGTefclsaNq5tyugw0M=;
        b=go3CMqMD5K9orKC1rVLOjUYFamMqiOVXrK9xCQVWKJZET2gEZ286Y5ScroOZMUpUly
         J0kjSq83Ku+xP9VxKpzzN/ndkA2D7H8PK4SDnBM6tL4wtGn4eeCeOeW/N2tPUQQPzUib
         Ba1G/Y62/Ry7YkLmalgOpBpDwE03dDFevvNCR3/XXTLSg9yKlTxNcsag82gOlB6Zvkcg
         wY6gYwRXNaSQeCVHmMtiii364cb0LM/eRQ3p+Re32S2dBSSI2SQoQc4FXg3CiAaxoSSk
         0is1Y3+I1VAfm4BjEd1XbvRAfFPtQ/Ec4lK8aipfUoM7Wx7RrALO2f0gvOAdiKp0rsrw
         T0iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773151482; x=1773756282;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SvOIzML6wGNaW8aZVM422Pl1aGTefclsaNq5tyugw0M=;
        b=kufjuWZj21OaiE0guFBq50otXH1LLRnIhLv9hF0aHs/dNSOr3COY1Le8y3KXmjxOil
         Qxcr/kOay3AIBmUrOuR+kmCQPO/aSuDXPTXWcd11A5jQb8o7l3APFYxEpGCvdHbG/Y5h
         nENq/K9OKwK67kVwmj9D1tW0bxuzLMjTtCpMZOHLrbkd+woVC2pLKoLTnr3Q89pSuk+8
         /W0TqNTEmVR4NhB+PVcr3nX2HRVcuT09h9PA2DuvPUTedojAICDF27miKwA9T+0KGVPy
         16dLi6L6K7/HqhOjVbEJ2ILtY1wtmqEXkyTepztQmmEjtXkS7Q7eOJwL6lyWOpaeDKs9
         i4IA==
X-Gm-Message-State: AOJu0Ywooz3N+ZuUSnwbx0B8M29i2NKa4skSYmwpixEBN2TS3KQolFLA
	fY3uG2uhwkF5q0aLeTVSKKkTSTE/XD42skB1h4735nAexdPlAoDus17Y0rfnon6iFDPWD3um+kV
	sELGSK1MMC5yaOnDRomX1oUwBYEhmiAE=
X-Gm-Gg: ATEYQzw3NG/2lnHhFBrEQWT0dYbgR/D4zyZrMR9bumedMzuFZNrvAABD1bKVl6zlAvc
	VcK9CTq7Ysxh+ZUfe/q5srfzsp+0O5JPYOTbX0bvprdRsZDmp5JMs+8TR4ot3M2wPNZ+KG6vjm+
	u9/xLH4x74R1qGI/SoS5WbZB75ThtDOJuMerI8lUgWq2H0UY+3DUjnzKLTvyJb3VvRrjWKntvQ5
	ff0Qq0DV/RUabPDoSreC0be5a/7fjT6goOSlEx7VeLailCH1WEf9k5qD2QaCyODXZJuf380vfoL
	jcdw1e8oy1xG2zUCx561vNjCefjLqS/sHESMeA/o
X-Received: by 2002:a17:902:e790:b0:2ae:5aed:1f4d with SMTP id
 d9443c01a7336-2ae8245cd73mr142442045ad.42.1773151482139; Tue, 10 Mar 2026
 07:04:42 -0700 (PDT)
MIME-Version: 1.0
References: <20260310135815.3353144-1-martin.jansa@gmail.com> <20260310135815.3353144-2-martin.jansa@gmail.com>
In-Reply-To: <20260310135815.3353144-2-martin.jansa@gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 10 Mar 2026 10:04:30 -0400
X-Gm-Features: AaiRm51Xk6RHq-I714w5U7gQ2O28ZWarfwvkx1SiqqMuRAKEdUOJnqYBIdPqEp0
Message-ID: <CADkTA4OPcnHe9ZMV5hbDET6MGMWUDGMyhxwKn+QhZY=mYQoahQ@mail.gmail.com>
Subject: Re: [meta-virtualization] [PATCH 2/2] example-xen-guest-bundle:
 require xen and x11 in DISTRO_FEATURES
To: martin.jansa@gmail.com
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="00000000000039d7e1064cac00c9"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 10 Mar 2026 14:04:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9635

--00000000000039d7e1064cac00c9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 10, 2026 at 9:58=E2=80=AFAM Martin Jansa via lists.yoctoproject=
.org
<martin.jansa=3Dgmail.com@lists.yoctoproject.org> wrote:

> From: Martin Jansa <martin.jansa@gmail.com>
>
> to match the image recipe from XEN_GUEST_BUNDLES
>
> Fixes:
> ERROR: Nothing PROVIDES 'xen-guest-image-minimal'
> xen-guest-image-minimal was skipped: using DISTRO 'distro', which is
> missing required DISTRO_FEATURES: 'xen'
> in bitbake world builds
>

I was quite literally just doing this!

But your patch is where I wanted it (versus the bbclass one I got earlier),
so I'll just grab this instead.

Bruce


> Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
> ---
>  .../xen-guest-bundles/example-xen-guest-bundle_1.0.bb        | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/recipes-extended/xen-guest-bundles/
> example-xen-guest-bundle_1.0.bb b/recipes-extended/xen-guest-bundles/
> example-xen-guest-bundle_1.0.bb
> index 96e17275..70f12492 100644
> --- a/recipes-extended/xen-guest-bundles/example-xen-guest-bundle_1.0.bb
> +++ b/recipes-extended/xen-guest-bundles/example-xen-guest-bundle_1.0.bb
> @@ -26,7 +26,10 @@ DESCRIPTION =3D "Demonstrates xen-guest-bundle.bbclass=
 by
> bundling the \
>  LICENSE =3D "MIT"
>  LIC_FILES_CHKSUM =3D
> "file://${COMMON_LICENSE_DIR}/MIT;md5=3D0835ade698e0bcf8506ecda2f7b4f302"
>
> -inherit xen-guest-bundle
> +inherit xen-guest-bundle features_check
> +
> +# matches xen-guest-image-minimal recipe
> +REQUIRED_DISTRO_FEATURES +=3D "${@bb.utils.contains('IMAGE_FEATURES',
> 'x11', ' x11', '', d)} xen"
>
>  # Define guests to bundle
>  # Format: recipe-name[:autostart][:external]
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9634):
> https://lists.yoctoproject.org/g/meta-virtualization/message/9634
> Mute This Topic: https://lists.yoctoproject.org/mt/118241118/1050810
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

--00000000000039d7e1064cac00c9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote gmail_quote_con=
tainer"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Mar 10, 2026 at 9:58=
=E2=80=AFAM Martin Jansa via <a href=3D"http://lists.yoctoproject.org">list=
s.yoctoproject.org</a> &lt;martin.jansa=3D<a href=3D"mailto:gmail.com@lists=
.yoctoproject.org">gmail.com@lists.yoctoproject.org</a>&gt; wrote:<br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex">From: Martin Jansa &lt;<=
a href=3D"mailto:martin.jansa@gmail.com" target=3D"_blank">martin.jansa@gma=
il.com</a>&gt;<br>
<br>
to match the image recipe from XEN_GUEST_BUNDLES<br>
<br>
Fixes:<br>
ERROR: Nothing PROVIDES &#39;xen-guest-image-minimal&#39;<br>
xen-guest-image-minimal was skipped: using DISTRO &#39;distro&#39;, which i=
s missing required DISTRO_FEATURES: &#39;xen&#39;<br>
in bitbake world builds<br></blockquote><div><br></div><div class=3D"gmail_=
default" style=3D"font-size:small">I was quite literally=C2=A0just doing th=
is!</div><div class=3D"gmail_default" style=3D"font-size:small"><br></div><=
div class=3D"gmail_default" style=3D"font-size:small">But your patch is whe=
re I wanted it (versus the=C2=A0bbclass one I got earlier), so I&#39;ll jus=
t grab this instead.</div><div class=3D"gmail_default" style=3D"font-size:s=
mall"><br></div><div class=3D"gmail_default" style=3D"font-size:small">Bruc=
e</div><div class=3D"gmail_default" style=3D"font-size:small"><br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Signed-off-by: Martin Jansa &lt;<a href=3D"mailto:martin.jansa@gmail.com" t=
arget=3D"_blank">martin.jansa@gmail.com</a>&gt;<br>
---<br>
=C2=A0.../xen-guest-bundles/<a href=3D"http://example-xen-guest-bundle_1.0.=
bb" rel=3D"noreferrer" target=3D"_blank">example-xen-guest-bundle_1.0.bb</a=
>=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 5 ++++-<br>
=C2=A01 file changed, 4 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/recipes-extended/xen-guest-bundles/<a href=3D"http://example-x=
en-guest-bundle_1.0.bb" rel=3D"noreferrer" target=3D"_blank">example-xen-gu=
est-bundle_1.0.bb</a> b/recipes-extended/xen-guest-bundles/<a href=3D"http:=
//example-xen-guest-bundle_1.0.bb" rel=3D"noreferrer" target=3D"_blank">exa=
mple-xen-guest-bundle_1.0.bb</a><br>
index 96e17275..70f12492 100644<br>
--- a/recipes-extended/xen-guest-bundles/<a href=3D"http://example-xen-gues=
t-bundle_1.0.bb" rel=3D"noreferrer" target=3D"_blank">example-xen-guest-bun=
dle_1.0.bb</a><br>
+++ b/recipes-extended/xen-guest-bundles/<a href=3D"http://example-xen-gues=
t-bundle_1.0.bb" rel=3D"noreferrer" target=3D"_blank">example-xen-guest-bun=
dle_1.0.bb</a><br>
@@ -26,7 +26,10 @@ DESCRIPTION =3D &quot;Demonstrates xen-guest-bundle.bbcl=
ass by bundling the \<br>
=C2=A0LICENSE =3D &quot;MIT&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://${COMMON_LICENSE_DIR}/MIT;md5=3D083=
5ade698e0bcf8506ecda2f7b4f302&quot;<br>
<br>
-inherit xen-guest-bundle<br>
+inherit xen-guest-bundle features_check<br>
+<br>
+# matches xen-guest-image-minimal recipe<br>
+REQUIRED_DISTRO_FEATURES +=3D &quot;${@bb.utils.contains(&#39;IMAGE_FEATUR=
ES&#39;, &#39;x11&#39;, &#39; x11&#39;, &#39;&#39;, d)} xen&quot;<br>
<br>
=C2=A0# Define guests to bundle<br>
=C2=A0# Format: recipe-name[:autostart][:external]<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#9634): <a href=3D"https://lists.yoctoproject.org/g/meta=
-virtualization/message/9634" rel=3D"noreferrer" target=3D"_blank">https://=
lists.yoctoproject.org/g/meta-virtualization/message/9634</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/118241118/105=
0810" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/m=
t/118241118/1050810</a><br>
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

--00000000000039d7e1064cac00c9--

