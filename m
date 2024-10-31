Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95652E68949
	for <webhook@archiver.kernel.org>; Thu, 31 Oct 2024 03:38:14 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web11.4884.1730345888683692205
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 30 Oct 2024 20:38:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XzPynSSN;
 spf=pass (domain: gmail.com, ip: 209.85.210.172, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-7203c431f93so398801b3a.1
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 30 Oct 2024 20:38:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730345888; x=1730950688; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=AnjzTDxaxhNsrHCjlGMvy0p+xrqlWUuMWZJzPTgIA5A=;
        b=XzPynSSN0c8JjTI8egYcnt6BaSA2KX0QQMoaBP6gQrltMgpv7dJ+eyDprJR1tAP/Uj
         j46Dl5ZCZY2z5rJuzFmKQAEJ4MroQijtLMpj8P9/O5n0LkVsKAIdxhSpNtuaZHyGUc07
         cW9AeiYQM3qLnUUMBQCWRSbU1dUD2HFKWtCWKbUpNlMD02Gx4wuJkcZKoGdXTCLt6Hjt
         1u/OoLMJK3Nw3UA6vf3zXOqND7PLfhi3tIrFVJO4pDtCBSbycuGvXKLxo80iRfGi/Wue
         Ac1lZCdppF9nTYv+OjdJ7t/gTlVIB/V/tLCYFcbehvfTX/rmBZp4fWXSWasV/cKB+zrB
         ag7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730345888; x=1730950688;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AnjzTDxaxhNsrHCjlGMvy0p+xrqlWUuMWZJzPTgIA5A=;
        b=fSc8N/tzOGBwfjfJ9M+fUaeucraFMtRvxp6oQg8SNYj+QEWkAmmI0ts2GBXrN4qTSv
         pA+WTZvDu9v+d2QkreKotO9NSRiSRV0bBlPPgpKM4FHSeT/cEBMc28wM/KFbVStTay0V
         GxdQQ9OGBlTX5/rd0GTqBHdM55rQKJ9EtAev1UHcSb9SNbOrPxfKC1UsQsoku+PT0YZI
         Dm9Mrflm5tle4quFTFzNbR2wKXmCO8zDDkp0uMhTf0Xh9l4axQEnWME1xDGjmY0FUvQp
         HMEsehK9ADbTC1NjCqxgUwkncbH9sleXNGhmyR9TKVVLlxdbflEaksmwceaUeiO9VFAG
         211A==
X-Gm-Message-State: AOJu0YwFfXjR4t4fGzAoLxvLjDQtDLqJIwv7UKEGmJ1Y5K8eRSAFfhgg
	YhVL2DFr2u57LoMSypel+sxBZ/fIg4VSbi1xzWJG/uYA87bv6yKMvLpXrxTnyvMFErl5+Sal8NS
	0EWnonNKJY/RjVgsQUf8i4dYX8xA=
X-Google-Smtp-Source: AGHT+IGXhmGAZoCjy52GZZKCCciG/uGqIunTqh3ys1zDgKMROnhwm2EGE5tkSK11kJUzMy6Hc8s9ZZv30gyt8+ketMc=
X-Received: by 2002:a05:6a00:3e27:b0:71e:6743:7599 with SMTP id
 d2e1a72fcca58-720b9bfe4f6mr2955799b3a.7.1730345887805; Wed, 30 Oct 2024
 20:38:07 -0700 (PDT)
MIME-Version: 1.0
References: <20241030-fix-upx-src_uri-v1-1-1a883085936a@linaro.org>
In-Reply-To: <20241030-fix-upx-src_uri-v1-1-1a883085936a@linaro.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 30 Oct 2024 23:37:56 -0400
Message-ID: <CADkTA4OehpRpvtQi73fsG_w29XZU3jfhH+noB5=Q3FppApmsfQ@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH v0] upx: Fetch the proper v4.2.4 git hash
To: javier.tia@linaro.org
Cc: meta-virtualization@lists.yoctoproject.org, 
	Ilias Apalodimas <ilias.apalodimas@linaro.org>, Mikko Rapeli <mikko.rapeli@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000fb39620625bd8ba3"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 31 Oct 2024 03:38:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8942

--000000000000fb39620625bd8ba3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 30, 2024 at 8:38=E2=80=AFPM Javier Tia via lists.yoctoproject.o=
rg
<javier.tia=3Dlinaro.org@lists.yoctoproject.org> wrote:

> upx recipe fails with:
>
> ERROR: upx-4.2.4+git-r0 do_fetch: Fetcher failure: Unable to find revisio=
n
> 5221596a608acbc8efed1e54f758bab1908ce7a8 in branch  even from upstream
> ERROR: upx-4.2.4+git-r0 do_fetch: gitsm: submodule download failed:
> FetchError Fetcher failure for URL: 'gitsm://
> github.com/upx/upx-vendor-valgrind.git;protocol=3Dhttps;name=3Dvendor/val=
grind;subpath=3Dvendor/valgrind;nobranch=3D1;lfs=3DTrue;bareclone=3D1;nobra=
nch=3D1'.
> Unable to fetch URL from any source.
>
> Likely, upstream rewrote the Git history.


I'll wait until I can reproduce this one myself:

bitbake -c cleanall upx; bitbake upx

I can also clone upx, reset it to the revision I'm currently using in
meta-virt and do a git submodule init without issues.

Just worked fine here. Were you doing anything different than a regular
build when you hit it ?

Bruce


> $ git clone https://github.com/upx/upx.git
> $ cd upx
> $ git rev-list -n 1 v4.2.4
> 3757579ffc6fa8710b4b7a1055529fea9dcaf149

Signed-off-by: Javier Tia <javier.tia@linaro.org>
> ---
>  recipes-extended/upx/upx_git.bb | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/recipes-extended/upx/upx_git.bb b/recipes-extended/upx/
> upx_git.bb
> index
> 870f0883569c61a7b2e8453eb35aaf87b697bbcd..d55789afccef5e39ef426b01a8e5faa=
d1ff86691
> 100644
> --- a/recipes-extended/upx/upx_git.bb
> +++ b/recipes-extended/upx/upx_git.bb
> @@ -2,7 +2,8 @@ SUMMARY =3D "Ultimate executable compressor."
>  HOMEPAGE =3D "https://upx.github.io/"
>  LICENSE =3D "GPL-2.0-only"
>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D353753597aa110e0ded3508408c63=
74a"
> -SRCREV_upx =3D "03c4184067d8f6cf7a9f7bffd3b92d0035f64eda"
> +# tag v4.2.4
> +SRCREV_upx =3D "3757579ffc6fa8710b4b7a1055529fea9dcaf149"

 PV =3D "4.2.4+git${SRCPV}"
>
>  # Note: DO NOT use released tarball in favor of the git repository with
> submodules.
>
> ---
> base-commit: 72ea52031c045bb6b4e13856f324b3ec28e333df
> change-id: 20241030-fix-upx-src_uri-00d3299f5af1
>
> Best regards,
> --
> Javier Tia <javier.tia@linaro.org>
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8941):
> https://lists.yoctoproject.org/g/meta-virtualization/message/8941
> Mute This Topic: https://lists.yoctoproject.org/mt/109307127/1050810
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

--000000000000fb39620625bd8ba3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">On Wed, Oct 30, 2024 at 8:38=E2=80=AFPM Javier Tia via <a hre=
f=3D"http://lists.yoctoproject.org">lists.yoctoproject.org</a> &lt;javier.t=
ia=3D<a href=3D"mailto:linaro.org@lists.yoctoproject.org">linaro.org@lists.=
yoctoproject.org</a>&gt; wrote:<br></div></div><div class=3D"gmail_quote"><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">upx recipe fails with:<br>
<br>
ERROR: upx-4.2.4+git-r0 do_fetch: Fetcher failure: Unable to find revision =
5221596a608acbc8efed1e54f758bab1908ce7a8 in branch=C2=A0 even from upstream=
<br>
ERROR: upx-4.2.4+git-r0 do_fetch: gitsm: submodule download failed: FetchEr=
ror Fetcher failure for URL: &#39;gitsm://<a href=3D"http://github.com/upx/=
upx-vendor-valgrind.git;protocol=3Dhttps;name=3Dvendor/valgrind;subpath=3Dv=
endor/valgrind;nobranch=3D1;lfs=3DTrue;bareclone=3D1;nobranch=3D1" rel=3D"n=
oreferrer" target=3D"_blank">github.com/upx/upx-vendor-valgrind.git;protoco=
l=3Dhttps;name=3Dvendor/valgrind;subpath=3Dvendor/valgrind;nobranch=3D1;lfs=
=3DTrue;bareclone=3D1;nobranch=3D1</a>&#39;. Unable to fetch URL from any s=
ource.<br>
<br>
Likely, upstream rewrote the Git history.</blockquote><div><br></div><div><=
div class=3D"gmail_default" style=3D"font-size:small">I&#39;ll wait until I=
 can reproduce this one myself:</div></div><div class=3D"gmail_default" sty=
le=3D"font-size:small"><br></div><div><div class=3D"gmail_default" style=3D=
"font-size:small">bitbake -c cleanall upx; bitbake upx<br></div><div class=
=3D"gmail_default" style=3D"font-size:small"><br></div><div class=3D"gmail_=
default" style=3D"font-size:small">I can also clone upx, reset it to the re=
vision I&#39;m currently using in meta-virt and do a git submodule init wit=
hout issues.</div><div class=3D"gmail_default" style=3D"font-size:small"><b=
r></div><div class=3D"gmail_default" style=3D"font-size:small">Just worked =
fine here. Were you doing anything different than a regular build when you =
hit it ?</div><div class=3D"gmail_default" style=3D"font-size:small"><br></=
div><div class=3D"gmail_default" style=3D"font-size:small">Bruce</div><div =
class=3D"gmail_default" style=3D"font-size:small">=C2=A0<br></div></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex">
$ git clone <a href=3D"https://github.com/upx/upx.git" rel=3D"noreferrer" t=
arget=3D"_blank">https://github.com/upx/upx.git</a><br>
$ cd upx<br>
$ git rev-list -n 1 v4.2.4<br>
3757579ffc6fa8710b4b7a1055529fea9dcaf149=C2=A0=C2=A0</blockquote><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex">
Signed-off-by: Javier Tia &lt;<a href=3D"mailto:javier.tia@linaro.org" targ=
et=3D"_blank">javier.tia@linaro.org</a>&gt;<br>
---<br>
=C2=A0recipes-extended/upx/<a href=3D"http://upx_git.bb" rel=3D"noreferrer"=
 target=3D"_blank">upx_git.bb</a> | 3 ++-<br>
=C2=A01 file changed, 2 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/recipes-extended/upx/<a href=3D"http://upx_git.bb" rel=3D"nore=
ferrer" target=3D"_blank">upx_git.bb</a> b/recipes-extended/upx/<a href=3D"=
http://upx_git.bb" rel=3D"noreferrer" target=3D"_blank">upx_git.bb</a><br>
index 870f0883569c61a7b2e8453eb35aaf87b697bbcd..d55789afccef5e39ef426b01a8e=
5faad1ff86691 100644<br>
--- a/recipes-extended/upx/<a href=3D"http://upx_git.bb" rel=3D"noreferrer"=
 target=3D"_blank">upx_git.bb</a><br>
+++ b/recipes-extended/upx/<a href=3D"http://upx_git.bb" rel=3D"noreferrer"=
 target=3D"_blank">upx_git.bb</a><br>
@@ -2,7 +2,8 @@ SUMMARY =3D &quot;Ultimate executable compressor.&quot;<br>
=C2=A0HOMEPAGE =3D &quot;<a href=3D"https://upx.github.io/" rel=3D"noreferr=
er" target=3D"_blank">https://upx.github.io/</a>&quot;<br>
=C2=A0LICENSE =3D &quot;GPL-2.0-only&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D353753597aa110e0ded35=
08408c6374a&quot;<br>
-SRCREV_upx =3D &quot;03c4184067d8f6cf7a9f7bffd3b92d0035f64eda&quot;<br>
+# tag v4.2.4<br>
+SRCREV_upx =3D &quot;3757579ffc6fa8710b4b7a1055529fea9dcaf149&quot;=C2=A0<=
/blockquote><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
=C2=A0PV =3D &quot;4.2.4+git${SRCPV}&quot;<br>
<br>
=C2=A0# Note: DO NOT use released tarball in favor of the git repository wi=
th submodules.<br>
<br>
---<br>
base-commit: 72ea52031c045bb6b4e13856f324b3ec28e333df<br>
change-id: 20241030-fix-upx-src_uri-00d3299f5af1<br>
<br>
Best regards,<br>
-- <br>
Javier Tia &lt;<a href=3D"mailto:javier.tia@linaro.org" target=3D"_blank">j=
avier.tia@linaro.org</a>&gt;<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#8941): <a href=3D"https://lists.yoctoproject.org/g/meta=
-virtualization/message/8941" rel=3D"noreferrer" target=3D"_blank">https://=
lists.yoctoproject.org/g/meta-virtualization/message/8941</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/109307127/105=
0810" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/m=
t/109307127/1050810</a><br>
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

--000000000000fb39620625bd8ba3--

