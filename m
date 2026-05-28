Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF02ECD5BC9
	for <webhook@archiver.kernel.org>; Thu, 28 May 2026 03:01:16 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3132.1779937274973409801
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 27 May 2026 20:01:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=M7NZGnBt;
 spf=pass (domain: gmail.com, ip: 209.85.216.47, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-36931e4f5e8so11459864a91.2
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 27 May 2026 20:01:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779937274; cv=none;
        d=google.com; s=arc-20240605;
        b=QC2DDfCms5eSzlVD40QdL+3u8t6y+3mu7pDUEJ9+EmBNJ9zhCHnicMjjUJoAveNJ0C
         kI9ZI04cQrIWDDB4x8A08iSeq2K089JzlvFAPDQUXsfnbnBW+kEOLihuOY3qORS6scly
         yxNT9+lbHcHwbNzYNTqfTM+x9qP8KhRXkU1BtuwFxZdznk0J9UGKQkQgc/1VQwCVTD0m
         xuJwc/zoyIwcxmLjpkRyMZUfM7eaukg6jEmO6vtjoMBjg9t3XtDEv/Q+t94tfifnTYgy
         fOnsqLzR21StARTNdb4LnYvPCU1TKd0V7tNfiyBf20x5LRcpxJz6nQZJzMkeMBK9wZlf
         wGqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=eZrSX/xUKc5nHGuyGmPtybPkLzUvH1iCysIL4al1Vhc=;
        fh=T1fsFJFZd3expnPhH4HQBhUXgCpxpAql7h9peGDMJdM=;
        b=czMAku48Tf2Qg6rtpsfudQbEbWWBx1e8A92t1EqpRubmFKKPdq/ach3uPrSTE7oG4Z
         O3fO+rLRT7K868qIukEgZnaNaDm4bU5++tuzQaqK/X2KlQG2gV+jEjmENiuYTjm4T346
         1BVsCsnne5UrJjU9oprWRXbRODbZeXUL0h3SADMohWwomJRxM7pGOFlId9dlTxpfvQd8
         +6LQUYYwmlkI8gGiyAr4dT9x2pXIxOTErVXaAfS+4STVlX+Vq4aWy7G8wQpXD4jQCk2P
         ygbge6Y0oQYrw0W2Sos3VhkIM/M5Uj1ZrNmzxw+2mKpTjc4NrMYyhPiKeMSM+7zVHDdx
         gF0g==;
        darn=lists.yoctoproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779937274; x=1780542074; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=eZrSX/xUKc5nHGuyGmPtybPkLzUvH1iCysIL4al1Vhc=;
        b=M7NZGnBtwP3ZSE5ziCv6nnD+AUX0DxZ24ExI26xqeGsMI1WgwVZuDPgaaVzccfdfmd
         8UKsbEsVZNKGQbIS3iuaS4KtFUWN2SRzvLrJ9+o489AwKJEKZ2FecUIeLZH84KRgV4OT
         yy+fe7KvRjdScXVqDgSom9JlobQrf4JZSoo2XNnPro+No8P3k3pt2Z7/xfuhflfGuMjU
         /MGMG/7fTkpi0RliQDA4fwNvA03dhVlh1f3LLaUVAHPLa0rVzvx4jXgR5cQ3E7mdufRB
         33ml4XR8NM9MTgc1qxevxGiXJ0FYLSvI0M3qUJqQ9S6eQ+YMP7+4Zkzq3utCNMOUZcnl
         phZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779937274; x=1780542074;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eZrSX/xUKc5nHGuyGmPtybPkLzUvH1iCysIL4al1Vhc=;
        b=BQBfp54sNCeVZ2AnNBgVgIlKUdPKoxXvHE0WgS7RRairbYoUI5R9DfYD+TdjlknG3R
         Ek/7+5KoZ1prfQ0Aikj1QgNskWlsgJWyI/MdWKXyhMjl8jsZjleNkKe9COupY3aTsEhr
         0QRQsU5YSfmLbhxuXd1wZT028oMiSJDEUH+G7vuzxCNQXhWFtmtyqPlzhZna2X8RwkpG
         dAl/j0TMM8vGXi0zJKb5uVUPtCNgIJ0mdhKTu1D/5SV56JKZESm0NKMOjk97Y+UcQThs
         YUjXmfSnwMGU6qho2h0nWq95RzxDjmDi2Yu2R9ynMNmttxlHUig+NtgXiwULV0X3sV27
         VXrg==
X-Gm-Message-State: AOJu0YxOs0O6sqJaQFEGLKVo/dIU/WDYPl2Q8Dsjb5rum7KE1gul5trd
	PfWJVGnr9PQ5mMPd+TOoDu/hicIXiBLMq5i88XlFMWJi5l2pbBrP4zEoJJNoNs6OQmnZ32wWtyJ
	1x7sdcRUtqWH4a9NPWHjgeqYfZHCnvIQGXYl3
X-Gm-Gg: Acq92OEzeZ9I6eQHLBMSTQC5aZRvuTt4RQWDqXsKPDpFSrrpMtQj8QcRi+E/bL2IbhW
	098u/fGVQAEtbTVDJlfhZ9FM2DFonxqOg6wbzGRMnJPFslmkk63LM+qpIzAie3IOYLYSSymEikP
	OUYp6OGatOY22cnQ7lClcotHsR1dmrmUJAAvbUOrfB0Y+BOP3mT+Ywb9NjnODqHcsXiiS+F7Pt3
	uOr/u4STTJQww490bwUanFw3qQ4sUz7n9DRXj+I4gYkM4D7P0mBI8+X1He64tFh7V2TaHy+odQE
	gxOk6B4ws1Ln5neq/Um+eNfQl2TggPvjQe4JLsMqpwYOIbn7KQlfOZcyMyYbtbftCR9Vou/V7HU
	sAxhezh7Es4tPsGLkR9pwBM1fDEgyhUnDnsoV
X-Received: by 2002:a17:90b:3c0c:b0:36b:75:6387 with SMTP id
 98e67ed59e1d1-36b00756915mr10150064a91.8.1779937274206; Wed, 27 May 2026
 20:01:14 -0700 (PDT)
MIME-Version: 1.0
References: <20260523012522.793412-1-zhixiong.chi@windriver.com>
In-Reply-To: <20260523012522.793412-1-zhixiong.chi@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 27 May 2026 23:01:02 -0400
X-Gm-Features: AVHnY4JY-GATd4ND7wcNL6tMmvwPxINFAQqMnEODtkLsfUCShv6B5HPwDqZbF0o
Message-ID: <CADkTA4PnXvUAsus4W64yjgELvWQu6bXfbi=9VJVWnXAnoqE=pg@mail.gmail.com>
Subject: Re: [meta-virtualization][wrynose][PATCH] nerdctl: fix PV value
To: zhixiong.chi@windriver.com
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="000000000000f39c000652d7f036"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 28 May 2026 03:01:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9820

--000000000000f39c000652d7f036
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hah,

I did mess this up. I've fixed my update scripts to handle this.

I've merged this to wrynose and will uprev past it shortly on master, but
have put it there as well.

Bruce

On Fri, May 22, 2026 at 9:25=E2=80=AFPM Zhixiong Chi via lists.yoctoproject=
.org
<zhixiong.chi=3Dwindriver.com@lists.yoctoproject.org> wrote:

> During the last upgradeing, the source has been upgraded to v2.2.1,
> but the PV is not. So make it be accurate.
>
> Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
> ---
>  recipes-containers/nerdctl/nerdctl_git.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/recipes-containers/nerdctl/nerdctl_git.bb
> b/recipes-containers/nerdctl/nerdctl_git.bb
> index f73667a4..143673f2 100644
> --- a/recipes-containers/nerdctl/nerdctl_git.bb
> +++ b/recipes-containers/nerdctl/nerdctl_git.bb
> @@ -40,7 +40,7 @@ LIC_FILES_CHKSUM =3D
> "file://src/import/LICENSE;md5=3D3b83ef96387f14655fc854ddc3c6bd
>
>  GO_IMPORT =3D "import"
>
> -PV =3D "v2.2.0"
> +PV =3D "v2.2.1"
>
>  NERDCTL_PKG =3D "github.com/containerd/nerdctl"
>
> --
> 2.49.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9802):
> https://lists.yoctoproject.org/g/meta-virtualization/message/9802
> Mute This Topic: https://lists.yoctoproject.org/mt/119450020/1050810
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

--000000000000f39c000652d7f036
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-size:small">Hah=
,</div><div class=3D"gmail_default" style=3D"font-size:small"><br></div><di=
v class=3D"gmail_default" style=3D"font-size:small">I did mess this up. I&#=
39;ve fixed my update scripts to handle this.</div><div class=3D"gmail_defa=
ult" style=3D"font-size:small"><br></div><div class=3D"gmail_default" style=
=3D"font-size:small">I&#39;ve merged this to wrynose and will uprev past it=
 shortly on master, but have put it there as well.</div><div class=3D"gmail=
_default" style=3D"font-size:small"><br></div><div class=3D"gmail_default" =
style=3D"font-size:small">Bruce</div></div><br><div class=3D"gmail_quote gm=
ail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, May 22, =
2026 at 9:25=E2=80=AFPM Zhixiong Chi via <a href=3D"http://lists.yoctoproje=
ct.org">lists.yoctoproject.org</a> &lt;zhixiong.chi=3D<a href=3D"mailto:win=
driver.com@lists.yoctoproject.org">windriver.com@lists.yoctoproject.org</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Duri=
ng the last upgradeing, the source has been upgraded to v2.2.1,<br>
but the PV is not. So make it be accurate.<br>
<br>
Signed-off-by: Zhixiong Chi &lt;<a href=3D"mailto:zhixiong.chi@windriver.co=
m" target=3D"_blank">zhixiong.chi@windriver.com</a>&gt;<br>
---<br>
=C2=A0recipes-containers/nerdctl/<a href=3D"http://nerdctl_git.bb" rel=3D"n=
oreferrer" target=3D"_blank">nerdctl_git.bb</a> | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/recipes-containers/nerdctl/<a href=3D"http://nerdctl_git.bb" r=
el=3D"noreferrer" target=3D"_blank">nerdctl_git.bb</a> b/recipes-containers=
/nerdctl/<a href=3D"http://nerdctl_git.bb" rel=3D"noreferrer" target=3D"_bl=
ank">nerdctl_git.bb</a><br>
index f73667a4..143673f2 100644<br>
--- a/recipes-containers/nerdctl/<a href=3D"http://nerdctl_git.bb" rel=3D"n=
oreferrer" target=3D"_blank">nerdctl_git.bb</a><br>
+++ b/recipes-containers/nerdctl/<a href=3D"http://nerdctl_git.bb" rel=3D"n=
oreferrer" target=3D"_blank">nerdctl_git.bb</a><br>
@@ -40,7 +40,7 @@ LIC_FILES_CHKSUM =3D &quot;file://src/import/LICENSE;md5=
=3D3b83ef96387f14655fc854ddc3c6bd<br>
<br>
=C2=A0GO_IMPORT =3D &quot;import&quot;<br>
<br>
-PV =3D &quot;v2.2.0&quot;<br>
+PV =3D &quot;v2.2.1&quot;<br>
<br>
=C2=A0NERDCTL_PKG =3D &quot;<a href=3D"http://github.com/containerd/nerdctl=
" rel=3D"noreferrer" target=3D"_blank">github.com/containerd/nerdctl</a>&qu=
ot;<br>
<br>
-- <br>
2.49.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#9802): <a href=3D"https://lists.yoctoproject.org/g/meta=
-virtualization/message/9802" rel=3D"noreferrer" target=3D"_blank">https://=
lists.yoctoproject.org/g/meta-virtualization/message/9802</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/119450020/105=
0810" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/m=
t/119450020/1050810</a><br>
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

--000000000000f39c000652d7f036--

