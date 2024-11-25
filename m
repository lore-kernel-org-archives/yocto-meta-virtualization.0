Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4EA2D58D4B
	for <webhook@archiver.kernel.org>; Mon, 25 Nov 2024 13:36:54 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web10.18628.1732541806024232668
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 25 Nov 2024 05:36:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ImTRgqmJ;
 spf=pass (domain: gmail.com, ip: 209.85.214.170, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2142214abd2so21345405ad.0
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 25 Nov 2024 05:36:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732541805; x=1733146605; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lU1MT/390Ejet09nB/ulpYaVH3oqBSWBMQ1cKzr1rpA=;
        b=ImTRgqmJWkwiImBY2UAieWDfXQFZE0QUr4YfL+21eT3gypGsVxU0mGwbsppe1FaItB
         jzyfl+j77J7khQWlYmNzquPZTVr4p9Lt0HtCG16marj5PUs9K6mXvW47Ph+rkgQWaR9o
         3YvIhXXqFvTcWRiDx5Ir2kivVyIJqni74pK+cR5bXFNQgooBBBe+1B7oBRRgB7Msadr4
         Tldmcr/yosADwT1GnmembqEQCCMvWgx8542fnGs9Mh3ifCltzmu5Iks/e+d30YLKiT5U
         k7+jj9LZF79Jg8V45geiAmd93Ghj334YRLAWCqHcWNzDCSLuiAjW7veRaXsHff9mZw4X
         pWkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732541805; x=1733146605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lU1MT/390Ejet09nB/ulpYaVH3oqBSWBMQ1cKzr1rpA=;
        b=QWW3EgkrYmEWZWgLTIwQqqcDmO2IpsHNZZi7ki/9mhb9jQiCs8FVC/wxd4a6e9PXAK
         GT1/Zr3usar9z9HB7OIbxK0deK2WOhvRSqR9H/g0nYmbNyO4DeBquDOOEm+qDrFSoO4D
         kToJcLtMAO4CvfA/X06y2CSee3OQ00oewt656hf9XWQV+AcK02tTJKZ1t0abuKN/FaGU
         4nRLB356pVczS8UkkwPx4AD+7L50irTzKyiOAwysyYK/jWLgewUKHpkpj6LySHwkOock
         A8RJPGs3YaVLw6tImE2sytHU3JB0dtak50JaRXVE8Vlv/wAtxBUhMuzY701VUl9t/q5s
         dBkQ==
X-Gm-Message-State: AOJu0YxmvI/ZEq3Wt3bfEScKZNNiko3ViiN8miJSuVTdX9Pn8ggfbMqq
	VlQJRyALkLy0fM5fTPatIkqEhgeQD2nhfD0Ri51Zriea29SxGN7fz4bFJEKHL5abm31jq7QYaq7
	w8fFaN9eW+9NVOH/1RUQOVlw2x7k=
X-Gm-Gg: ASbGncszO+yBXRtc1f2jm3dkxEobRYWMeUFn+Qi4sK1bkMqBxHwwyedpuXHD/Ao+tKO
	bhCqgtba5Ok8Hvp0FPc3W05SATTenhUsC
X-Google-Smtp-Source: AGHT+IEiHuUhgz0nm2gGNbrVjfZ7rX7xIiRFzaEgFbAsVtrjqItRpeaIP/5eLZRYh4QBv561HEjD/BAn45pUoy0yDpI=
X-Received: by 2002:a17:903:41cb:b0:212:3bf9:951 with SMTP id
 d9443c01a7336-2129f65c825mr153629515ad.6.1732541805203; Mon, 25 Nov 2024
 05:36:45 -0800 (PST)
MIME-Version: 1.0
References: <20241125062832.686682-1-ryosuke.saito@linaro.org>
In-Reply-To: <20241125062832.686682-1-ryosuke.saito@linaro.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 25 Nov 2024 08:36:33 -0500
Message-ID: <CADkTA4NqDTUb9LfKmOo2K6qTT-AUoRHHz4V4wEPYOWuzEzb9+Q@mail.gmail.com>
Subject: Re: [meta-virtualization][m-c-s][PATCH] layer.conf: remove BB_DANGLINGAPPENDS_WARNONLY
To: ryosuke.saito@linaro.org
Cc: meta-virtualization@lists.yoctoproject.org, raitosyo@gmail.com
Content-Type: multipart/alternative; boundary="000000000000db983e0627bcd29b"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 25 Nov 2024 13:36:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9012

--000000000000db983e0627bcd29b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks Ryosuke!

I started a build this morning, hit the error and fixed the issue .. and
then checked mailing lists, to find your patch.

Bruce

On Mon, Nov 25, 2024 at 1:28=E2=80=AFAM Ryosuke Saito via lists.yoctoprojec=
t.org
<ryosuke.saito=3Dlinaro.org@lists.yoctoproject.org> wrote:

> Remove the use of BB_DANGLINGAPPENDS_WARNONLY as bitbake no longer
> supports this.
>
> Signed-off-by: Ryosuke Saito <ryosuke.saito@linaro.org>
> ---
>  meta-openstack/conf/layer.conf | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/meta-openstack/conf/layer.conf
> b/meta-openstack/conf/layer.conf
> index 6774aec64cc0..114e1abb5fd7 100644
> --- a/meta-openstack/conf/layer.conf
> +++ b/meta-openstack/conf/layer.conf
> @@ -8,7 +8,6 @@ BBFILE_COLLECTIONS +=3D "openstack-layer"
>  BBFILE_PATTERN_openstack-layer :=3D "^${LAYERDIR}/"
>  BBFILE_PRIORITY_openstack-layer =3D "5"
>  LAYERSERIES_COMPAT_openstack-layer =3D "styhead"
> -BB_DANGLINGAPPENDS_WARNONLY ?=3D "true"
>
>  LAYERDEPENDS_openstack-layer =3D " \
>         core \
> --
> 2.47.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9011):
> https://lists.yoctoproject.org/g/meta-virtualization/message/9011
> Mute This Topic: https://lists.yoctoproject.org/mt/109767455/1050810
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

--000000000000db983e0627bcd29b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-size:small">Tha=
nks Ryosuke!</div><div class=3D"gmail_default" style=3D"font-size:small"><b=
r></div><div class=3D"gmail_default" style=3D"font-size:small">I started a =
build this morning, hit the error and fixed the issue .. and then checked m=
ailing lists, to find your patch.</div><div class=3D"gmail_default" style=
=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D"font-s=
ize:small">Bruce</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr"=
 class=3D"gmail_attr">On Mon, Nov 25, 2024 at 1:28=E2=80=AFAM Ryosuke Saito=
 via <a href=3D"http://lists.yoctoproject.org">lists.yoctoproject.org</a> &=
lt;ryosuke.saito=3D<a href=3D"mailto:linaro.org@lists.yoctoproject.org">lin=
aro.org@lists.yoctoproject.org</a>&gt; wrote:<br></div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex">Remove the use of BB_DANGLINGAPPENDS_WARNONLY=
 as bitbake no longer<br>
supports this.<br>
<br>
Signed-off-by: Ryosuke Saito &lt;<a href=3D"mailto:ryosuke.saito@linaro.org=
" target=3D"_blank">ryosuke.saito@linaro.org</a>&gt;<br>
---<br>
=C2=A0meta-openstack/conf/layer.conf | 1 -<br>
=C2=A01 file changed, 1 deletion(-)<br>
<br>
diff --git a/meta-openstack/conf/layer.conf b/meta-openstack/conf/layer.con=
f<br>
index 6774aec64cc0..114e1abb5fd7 100644<br>
--- a/meta-openstack/conf/layer.conf<br>
+++ b/meta-openstack/conf/layer.conf<br>
@@ -8,7 +8,6 @@ BBFILE_COLLECTIONS +=3D &quot;openstack-layer&quot;<br>
=C2=A0BBFILE_PATTERN_openstack-layer :=3D &quot;^${LAYERDIR}/&quot;<br>
=C2=A0BBFILE_PRIORITY_openstack-layer =3D &quot;5&quot;<br>
=C2=A0LAYERSERIES_COMPAT_openstack-layer =3D &quot;styhead&quot;<br>
-BB_DANGLINGAPPENDS_WARNONLY ?=3D &quot;true&quot;<br>
<br>
=C2=A0LAYERDEPENDS_openstack-layer =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 core \<br>
-- <br>
2.47.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#9011): <a href=3D"https://lists.yoctoproject.org/g/meta=
-virtualization/message/9011" rel=3D"noreferrer" target=3D"_blank">https://=
lists.yoctoproject.org/g/meta-virtualization/message/9011</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/109767455/105=
0810" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/m=
t/109767455/1050810</a><br>
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

--000000000000db983e0627bcd29b--

