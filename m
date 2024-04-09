Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09535CD1296
	for <webhook@archiver.kernel.org>; Tue,  9 Apr 2024 12:02:50 +0000 (UTC)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
 by mx.groups.io with SMTP id smtpd.web10.134339.1712664161826007277
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 09 Apr 2024 05:02:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YuYicilI;
 spf=pass (domain: gmail.com, ip: 209.85.128.174, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-617d25b2b97so26327737b3.0
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 09 Apr 2024 05:02:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712664161; x=1713268961; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=C6pM1t0lTDPY0ZIJ4MORvcdolUU/w+ui9GRy29zpbL0=;
        b=YuYicilIAGK6oleigPPiTU3tFwU847OuNhL/2wAD03w0WTs6R6xYKroYOB2bc3ibNQ
         s62vF/xcOIwD302QXfi1aUriHVfNZOMiC9aDmJzO64MvQJG1d1qp+LdnS31Kgqir4o0T
         fVy8X5hrGq4gl9AUrkHCqUhtrVg9240qNJDMRfwThFF9Pt+P6Ga6zx90+6GWtGHwzQ4i
         r9hOhaeqJ/PYFrdsIOTBSOOFr2WMHDC2GgIRZMFl6nVIKMUtnSoJhK6kpnSk1yQnpqex
         0Z0mEDyoMJ8EfII4Iao6E0ES8E2aBYs96u8UqDTlRkudFv9dSzlxuJyuR+bqP/aDLkaE
         BH9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712664161; x=1713268961;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C6pM1t0lTDPY0ZIJ4MORvcdolUU/w+ui9GRy29zpbL0=;
        b=bN9x7/MrLEiaaL1RuGx3vbnwudA7/eDnF9pLzBybMP5o63JHYmlaUO4WCKmOFjEiV8
         CwzNn932L7Elcwk0kJ4EWPUnU3BinftW4snNb91R+ifn9+WbjI+NVprQJ+NUUbdvxtPW
         jfatKA8paTnTZyXI8BBOflRcLTGPoLYeuVSNZ3uN2dmwSBgHSYEq92MqLAzH3LOuDezc
         Lz4Pfj2LO+gZErhO2mJXlhKtE4fXwNzJOizuRR7t0u6w71wJw8FDuNdyIz9oo9zLuB2o
         tP6gC13Z3uZQ8FAPNHDorJ7Ma1aJmyhIxknU6IxKIUjSz6OCeYGce9t+SXrBUMU/RIL5
         mkfQ==
X-Gm-Message-State: AOJu0YwhHBXjLpVvV1rY+Ns2/zpAeFYR/EY1Po9SSOk9BfaWSWuo88KY
	hj508vYrGHnU4pP8OWftOFSHh6zes+W3wo/wRUcbDvWQH9tnQ8U+dhAP/VGx5KCnPWR09DZ4nuY
	Wxo6vM5QSQGvyy3VjCZrCGhASDhU=
X-Google-Smtp-Source: AGHT+IGwt4pmrNbB0Kp6wIpsAD5fG9st1GwrX/e4zzkccjqcnM4WaYL8Cs4zM4oaHa1bLhcVWwUqa9205ttPKm/kDv0=
X-Received: by 2002:a05:6902:1149:b0:dcf:a52d:6134 with SMTP id
 p9-20020a056902114900b00dcfa52d6134mr11747699ybu.26.1712664160641; Tue, 09
 Apr 2024 05:02:40 -0700 (PDT)
MIME-Version: 1.0
References: <1712103925-28778-1-git-send-email-wangmy@fujitsu.com> <TYWPR01MB118611F3072C3E3F8AE6429A8DC072@TYWPR01MB11861.jpnprd01.prod.outlook.com>
In-Reply-To: <TYWPR01MB118611F3072C3E3F8AE6429A8DC072@TYWPR01MB11861.jpnprd01.prod.outlook.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 9 Apr 2024 08:02:28 -0400
Message-ID: <CADkTA4M9jmSq-=OFniE_S6snoA6pq+Rk96JFNc3uEcgSGEpgQw@mail.gmail.com>
Subject: Re: [meta-virtualization] [meta-cloud-services] [PATCH] layer.conf:
 use scarthgap to LAYERSERIES_COMPAT
To: wangmy@fujitsu.com
Cc: "meta-virtualization@lists.yoctoproject.org" <meta-virtualization@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="000000000000ea45690615a8b2e4"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 09 Apr 2024 12:02:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8664

--000000000000ea45690615a8b2e4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

This is on my list to do, but I'm running into some testing issues, so I
can't exactly push compatibility until they are resolved.

Bruce

On Mon, Apr 8, 2024 at 11:10=E2=80=AFPM wangmy via lists.yoctoproject.org <=
wangmy=3D
fujitsu.com@lists.yoctoproject.org> wrote:

> ping
>
> Thanks.
>
>   --
> Best Regards
> ---------------------------------------------------
> Wang Mingyu
> FUJITSU NANJING SOFTWARE TECHNOLOGY CO., LTD. (FNST)
> No.6 Wenzhu Road, Nanjing, 210012, China
> TEL=EF=BC=9A+86+25-86630566--8568
> COINS: 79988548
> FAX: +86+25-83317685
> MAIL: wangmy@fujitsu.com
>
> > -----Original Message-----
> > From: wangmy@fujitsu.com <wangmy@fujitsu.com>
> > Sent: Wednesday, April 3, 2024 8:25 AM
> > To: meta-virtualization@lists.yoctoproject.org
> > Cc: Wang, Mingyu/=E7=8E=8B =E9=B8=A3=E7=91=9C <wangmy@fujitsu.com>
> > Subject: [meta-virtualization] [meta-cloud-services] [PATCH] layer.conf=
:
> use
> > scarthgap to LAYERSERIES_COMPAT
> >
> > From: Wang Mingyu <wangmy@fujitsu.com>
> >
> > conf: mark layer compatible with scarthgap
> >
> > Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> > ---
> >  meta-openstack/conf/layer.conf | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta-openstack/conf/layer.conf
> b/meta-openstack/conf/layer.conf
> > index 24768809..b035adf7 100644
> > --- a/meta-openstack/conf/layer.conf
> > +++ b/meta-openstack/conf/layer.conf
> > @@ -7,7 +7,7 @@ BBFILES +=3D "${LAYERDIR}/recipes*/*/*.bb
> > ${LAYERDIR}/recipes*/*/*.bbappend"
> >  BBFILE_COLLECTIONS +=3D "openstack-layer"
> >  BBFILE_PATTERN_openstack-layer :=3D "^${LAYERDIR}/"
> >  BBFILE_PRIORITY_openstack-layer =3D "5"
> > -LAYERSERIES_COMPAT_openstack-layer =3D "nanbield"
> > +LAYERSERIES_COMPAT_openstack-layer =3D "scarthgap"
> >  BB_DANGLINGAPPENDS_WARNONLY ?=3D "true"
> >
> >  LAYERDEPENDS_openstack-layer =3D " \
> > --
> > 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8663):
> https://lists.yoctoproject.org/g/meta-virtualization/message/8663
> Mute This Topic: https://lists.yoctoproject.org/mt/105300002/1050810
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

--000000000000ea45690615a8b2e4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-size:small">Thi=
s is on my list to do, but I&#39;m running into some testing issues, so I c=
an&#39;t exactly push compatibility until they are resolved.</div><div clas=
s=3D"gmail_default" style=3D"font-size:small"><br></div><div class=3D"gmail=
_default" style=3D"font-size:small">Bruce</div></div><br><div class=3D"gmai=
l_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Apr 8, 2024 at 11:10=
=E2=80=AFPM wangmy via <a href=3D"http://lists.yoctoproject.org">lists.yoct=
oproject.org</a> &lt;wangmy=3D<a href=3D"mailto:fujitsu.com@lists.yoctoproj=
ect.org">fujitsu.com@lists.yoctoproject.org</a>&gt; wrote:<br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex">ping<br>
<br>
Thanks.<br>
<br>
=C2=A0 --<br>
Best Regards<br>
---------------------------------------------------<br>
Wang Mingyu<br>
FUJITSU NANJING SOFTWARE TECHNOLOGY CO., LTD. (FNST)<br>
No.6 Wenzhu Road, Nanjing, 210012, China<br>
TEL=EF=BC=9A+86+25-86630566--8568<br>
COINS: 79988548<br>
FAX: +86+25-83317685<br>
MAIL: <a href=3D"mailto:wangmy@fujitsu.com" target=3D"_blank">wangmy@fujits=
u.com</a><br>
<br>
&gt; -----Original Message-----<br>
&gt; From: <a href=3D"mailto:wangmy@fujitsu.com" target=3D"_blank">wangmy@f=
ujitsu.com</a> &lt;<a href=3D"mailto:wangmy@fujitsu.com" target=3D"_blank">=
wangmy@fujitsu.com</a>&gt;<br>
&gt; Sent: Wednesday, April 3, 2024 8:25 AM<br>
&gt; To: <a href=3D"mailto:meta-virtualization@lists.yoctoproject.org" targ=
et=3D"_blank">meta-virtualization@lists.yoctoproject.org</a><br>
&gt; Cc: Wang, Mingyu/=E7=8E=8B =E9=B8=A3=E7=91=9C &lt;<a href=3D"mailto:wa=
ngmy@fujitsu.com" target=3D"_blank">wangmy@fujitsu.com</a>&gt;<br>
&gt; Subject: [meta-virtualization] [meta-cloud-services] [PATCH] layer.con=
f: use<br>
&gt; scarthgap to LAYERSERIES_COMPAT<br>
&gt; <br>
&gt; From: Wang Mingyu &lt;<a href=3D"mailto:wangmy@fujitsu.com" target=3D"=
_blank">wangmy@fujitsu.com</a>&gt;<br>
&gt; <br>
&gt; conf: mark layer compatible with scarthgap<br>
&gt; <br>
&gt; Signed-off-by: Wang Mingyu &lt;<a href=3D"mailto:wangmy@fujitsu.com" t=
arget=3D"_blank">wangmy@fujitsu.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta-openstack/conf/layer.conf | 2 +-<br>
&gt;=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt; <br>
&gt; diff --git a/meta-openstack/conf/layer.conf b/meta-openstack/conf/laye=
r.conf<br>
&gt; index 24768809..b035adf7 100644<br>
&gt; --- a/meta-openstack/conf/layer.conf<br>
&gt; +++ b/meta-openstack/conf/layer.conf<br>
&gt; @@ -7,7 +7,7 @@ BBFILES +=3D &quot;${LAYERDIR}/recipes*/*/*.bb<br>
&gt; ${LAYERDIR}/recipes*/*/*.bbappend&quot;<br>
&gt;=C2=A0 BBFILE_COLLECTIONS +=3D &quot;openstack-layer&quot;<br>
&gt;=C2=A0 BBFILE_PATTERN_openstack-layer :=3D &quot;^${LAYERDIR}/&quot;<br=
>
&gt;=C2=A0 BBFILE_PRIORITY_openstack-layer =3D &quot;5&quot;<br>
&gt; -LAYERSERIES_COMPAT_openstack-layer =3D &quot;nanbield&quot;<br>
&gt; +LAYERSERIES_COMPAT_openstack-layer =3D &quot;scarthgap&quot;<br>
&gt;=C2=A0 BB_DANGLINGAPPENDS_WARNONLY ?=3D &quot;true&quot;<br>
&gt; <br>
&gt;=C2=A0 LAYERDEPENDS_openstack-layer =3D &quot; \<br>
&gt; --<br>
&gt; 2.34.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#8663): <a href=3D"https://lists.yoctoproject.org/g/meta=
-virtualization/message/8663" rel=3D"noreferrer" target=3D"_blank">https://=
lists.yoctoproject.org/g/meta-virtualization/message/8663</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/105300002/105=
0810" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/m=
t/105300002/1050810</a><br>
Group Owner: <a href=3D"mailto:meta-virtualization%2Bowner@lists.yoctoproje=
ct.org" target=3D"_blank">meta-virtualization+owner@lists.yoctoproject.org<=
/a><br>
Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/meta-virtualizatio=
n/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.or=
g/g/meta-virtualization/unsub</a> [<a href=3D"mailto:bruce.ashfield@gmail.c=
om" target=3D"_blank">bruce.ashfield@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature">- =
Thou shalt not follow the NULL pointer, for chaos and madness await thee at=
 its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br><b=
r></div>

--000000000000ea45690615a8b2e4--

