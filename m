Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BF80C83F04
	for <webhook@archiver.kernel.org>; Fri,  4 Jul 2025 01:32:04 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web11.3164.1751592714500498199
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 03 Jul 2025 18:31:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MtPnE1Cs;
 spf=pass (domain: gmail.com, ip: 209.85.216.41, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-311c95ddfb5so470183a91.2
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 03 Jul 2025 18:31:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751592714; x=1752197514; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=X+Tw2kZyqkb1gZwMHPQ7057eyR9urzX9FWI29izLGnQ=;
        b=MtPnE1CsyD2HFPwZoJe8rDSJQVIcVkotf4eAwoRIioPeTjxvb/XxZzzNjv0dvgnmkC
         72ziJ0/kv8E1gL35SVfoXniW1sji/Lj0AQXHILc4ZrCOFeYSKIUG410VsqRo5QIjwylY
         Lc7RIy1cnJquOL+K8pBgiGk1Vso1pzSyebtv/YKu9l5f8imQQs6V/+TB4Pokuhr4DplO
         Q3TOhFqJxKVqx9OXOGXKAEDk1DFbJ8F8EJkii9t/X1GhfaZoZcUpB6zowmc+hFELLUzU
         IJ8Drq4XK0H4XYg3BZ69W0/WSR+TkXhi+eCOfXCkPwpm/gJR/yA4iCLy3TY3Ak/sktf3
         Ymzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751592714; x=1752197514;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X+Tw2kZyqkb1gZwMHPQ7057eyR9urzX9FWI29izLGnQ=;
        b=QwE0WMwzdZ2yny4toKOgqmMfPjpstlf016SvVNjiTmaMt1lKQmpiYlC67oUZkhGMJg
         UlI6gv5gwUtFqFMqaicTvJQSEY37FyzYoZpqo+9UFOqLEesHLTBokBTJ9FoGv57JhTyG
         o9yC0ggTyIJGOZ5ah51A/X1R8PlY61+be+VSFdL4rDZIRR3grDGC9J3LKnTxuczY9VZX
         S5QYlKZI6EBu0n5qYh943989lGiV5dzD3uMWAihq05fcN4PXoVoLL2oqQ70hbHcIOw6J
         ilM3elEW0Mp1urWvDPnLQGjOzzH8DLGcvTwrtg0JFasgJtH5EqAZUhbcw2TO8tlXuhxk
         AfqQ==
X-Gm-Message-State: AOJu0YxdwlsKln5Z8K0/1S7t0iiD+kp48vaiopSafAoc9Q82QNDNz89y
	CuHJAntkZw4uoIGkNLJIqY6tLcTGryG4EC2+v4GERJbKT42UNBq9i446E0ybssYSvxXXz/Sl3oQ
	JNswDZrQtL4XUX+FdGikB0aJBRRum7IE=
X-Gm-Gg: ASbGncsmgKoAiz/nd62FnbsVaH1anUPmhS2KPI9i5Ih6fkvnL8AIg+/+hvfLOnqCZyO
	xL8Hyk53O2aIK26vgaurrM7SoSFmUt4L3VrJVnHsWa8bgOQIR+vcfFo+rau/5s4bUQVtCtwCL+d
	j3hSIkGyF0nUAsCcfzSzR2QjdFyxLpJakhLiVdqylJow==
X-Google-Smtp-Source: AGHT+IFYPELYtVFMC3uFEgiLFyx2F1qPg6evzb48wzY8sGevW5hRNIDY/2XsbHwre5VCWJ0vtWKq4CuXbjXhX1bK4nY=
X-Received: by 2002:a17:90b:1dd2:b0:311:df4b:4b93 with SMTP id
 98e67ed59e1d1-31aac43c653mr1097151a91.7.1751592713686; Thu, 03 Jul 2025
 18:31:53 -0700 (PDT)
MIME-Version: 1.0
References: <20250704001207.250-1-wangmy@fujitsu.com> <20250704001207.250-2-wangmy@fujitsu.com>
In-Reply-To: <20250704001207.250-2-wangmy@fujitsu.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 3 Jul 2025 21:31:42 -0400
X-Gm-Features: Ac12FXx6KuIhzk-W4_e0X6SpRra3ZAfjaYx3Ogtylhm1iJFShiYFLwsInAzf2Z4
Message-ID: <CADkTA4O+nyXT2105v+N7u5emqca0RVS_RFCAwB+g1V3ZcU32iA@mail.gmail.com>
Subject: Re: [meta-virtualization] [PATCH 2/4] nerdctl: drop unneeded S assignment
To: wangmy@fujitsu.com
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="0000000000007d978d06391075ae"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 04 Jul 2025 01:32:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9293

--0000000000007d978d06391075ae
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Check master-next, these have all been taken care of.

I'm traveling and won't push master-next -> master until I return, so use
that branch for your builds.

Bruce

On Thu, Jul 3, 2025 at 8:12=E2=80=AFPM wangmy via lists.yoctoproject.org <w=
angmy=3D
fujitsu.com@lists.yoctoproject.org> wrote:

> From: Wang Mingyu <wangmy@fujitsu.com>
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  recipes-containers/nerdctl/nerdctl_git.bb | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/recipes-containers/nerdctl/nerdctl_git.bb
> b/recipes-containers/nerdctl/nerdctl_git.bb
> index 536c470b..3f87e564 100644
> --- a/recipes-containers/nerdctl/nerdctl_git.bb
> +++ b/recipes-containers/nerdctl/nerdctl_git.bb
> @@ -28,8 +28,6 @@ LIC_FILES_CHKSUM =3D
> "file://src/import/LICENSE;md5=3D3b83ef96387f14655fc854ddc3c6bd
>
>  GO_IMPORT =3D "import"
>
> -S =3D "${WORKDIR}/git"
> -
>  PV =3D "v2.0.3"
>
>  NERDCTL_PKG =3D "github.com/containerd/nerdctl"
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9289):
> https://lists.yoctoproject.org/g/meta-virtualization/message/9289
> Mute This Topic: https://lists.yoctoproject.org/mt/113976450/1050810
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

--0000000000007d978d06391075ae
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-size:small">Che=
ck master-next, these have all been taken=C2=A0care of.</div><div class=3D"=
gmail_default" style=3D"font-size:small"><br></div><div class=3D"gmail_defa=
ult" style=3D"font-size:small">I&#39;m traveling and won&#39;t push master-=
next -&gt; master until I return, so use that branch for your builds.</div>=
<div class=3D"gmail_default" style=3D"font-size:small"><br></div><div class=
=3D"gmail_default" style=3D"font-size:small">Bruce</div></div><br><div clas=
s=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_att=
r">On Thu, Jul 3, 2025 at 8:12=E2=80=AFPM wangmy via <a href=3D"http://list=
s.yoctoproject.org">lists.yoctoproject.org</a> &lt;wangmy=3D<a href=3D"mail=
to:fujitsu.com@lists.yoctoproject.org">fujitsu.com@lists.yoctoproject.org</=
a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Fr=
om: Wang Mingyu &lt;<a href=3D"mailto:wangmy@fujitsu.com" target=3D"_blank"=
>wangmy@fujitsu.com</a>&gt;<br>
<br>
Signed-off-by: Wang Mingyu &lt;<a href=3D"mailto:wangmy@fujitsu.com" target=
=3D"_blank">wangmy@fujitsu.com</a>&gt;<br>
---<br>
=C2=A0recipes-containers/nerdctl/<a href=3D"http://nerdctl_git.bb" rel=3D"n=
oreferrer" target=3D"_blank">nerdctl_git.bb</a> | 2 --<br>
=C2=A01 file changed, 2 deletions(-)<br>
<br>
diff --git a/recipes-containers/nerdctl/<a href=3D"http://nerdctl_git.bb" r=
el=3D"noreferrer" target=3D"_blank">nerdctl_git.bb</a> b/recipes-containers=
/nerdctl/<a href=3D"http://nerdctl_git.bb" rel=3D"noreferrer" target=3D"_bl=
ank">nerdctl_git.bb</a><br>
index 536c470b..3f87e564 100644<br>
--- a/recipes-containers/nerdctl/<a href=3D"http://nerdctl_git.bb" rel=3D"n=
oreferrer" target=3D"_blank">nerdctl_git.bb</a><br>
+++ b/recipes-containers/nerdctl/<a href=3D"http://nerdctl_git.bb" rel=3D"n=
oreferrer" target=3D"_blank">nerdctl_git.bb</a><br>
@@ -28,8 +28,6 @@ LIC_FILES_CHKSUM =3D &quot;file://src/import/LICENSE;md5=
=3D3b83ef96387f14655fc854ddc3c6bd<br>
<br>
=C2=A0GO_IMPORT =3D &quot;import&quot;<br>
<br>
-S =3D &quot;${WORKDIR}/git&quot;<br>
-<br>
=C2=A0PV =3D &quot;v2.0.3&quot;<br>
<br>
=C2=A0NERDCTL_PKG =3D &quot;<a href=3D"http://github.com/containerd/nerdctl=
" rel=3D"noreferrer" target=3D"_blank">github.com/containerd/nerdctl</a>&qu=
ot;<br>
-- <br>
2.43.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#9289): <a href=3D"https://lists.yoctoproject.org/g/meta=
-virtualization/message/9289" rel=3D"noreferrer" target=3D"_blank">https://=
lists.yoctoproject.org/g/meta-virtualization/message/9289</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/113976450/105=
0810" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/m=
t/113976450/1050810</a><br>
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
rek II<br><br></div>

--0000000000007d978d06391075ae--

