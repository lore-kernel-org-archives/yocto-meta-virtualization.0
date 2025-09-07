Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48BD4CA1017
	for <webhook@archiver.kernel.org>; Sun,  7 Sep 2025 20:17:57 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web10.3433.1757276267417818975
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 07 Sep 2025 13:17:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=acpn/QA1;
 spf=pass (domain: gmail.com, ip: 209.85.216.41, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-329b760080fso3444744a91.1
        for <meta-virtualization@lists.yoctoproject.org>; Sun, 07 Sep 2025 13:17:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757276267; x=1757881067; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=OGK6aVRUm41L1V2EfH6ecpjQfL+H+N+fQWKAu+JdmdA=;
        b=acpn/QA1Bhv0XnA9gSd+UiD1AgMQrTkhW7udHG6fQPoMJUvMQ5fUYD+aaAlo2ADBnD
         tULknN40SeahKv16osdtHq1AYxrvqN5u6e0m/Beb7ATlAe313cS5Ce26hOB5xu/7qR+y
         cgP0fr1g6psRB5wxvqaTwHBk7RcnWCVO3Xj9qx0TQajXu76CLSuH6r24CTEX+0SRzPl/
         lF9Pv/adpEwKdBMxj+jjWcSgxC9BSkfIgWINCv4oGSBTqu891sFA40mmkXqHPWtgln8T
         LVugeDqgzbT7iiRwbxjLM9nTuzBNHNBbjdi5Hq+WjyIhQmNjX4HAudVz5cv2RePpCAIQ
         VVXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757276267; x=1757881067;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OGK6aVRUm41L1V2EfH6ecpjQfL+H+N+fQWKAu+JdmdA=;
        b=CPlfEmZqR56YIpC2gJTV6yivt0CSs4hZ/m/fpES7kStje7kP76/y67OqOhwbM8nX3J
         qUbhm3HYIDcGQ9OsdpuRZOlfacwn6q4EmjA0d54SIBgvHVmKH5FibT1cKGtcnRv89Yk+
         koorTK9wqh5knDQx6wR6Oakdw1QcGruaTv6s0lEZ1/YiKTdANMH7k/n1/FjKFhkoaFpi
         JwiTRTZFrrZT2LAieZKjnpgy67Me5uPCAxXRAWi69i/DwNkuRKEs9n0tFUVP/m+1g9wI
         XppnRGMBELo4Txw2FNKcliiWhPV+NyhRVr/01+Yo9eX3JBeAY4UiOx0uUFrnxLBgRDXh
         KSow==
X-Gm-Message-State: AOJu0YyQEY9RCBEndHpDa9sy70tXfFSd3NQha23P9Q7ohJhmrnrokKd3
	XtIssdzrbiPFbbiPeF/E133hlSoYvB/Xkh8sh6J+dAnMlYJlAUA8jdVgId/vdeDcmdsMnaMetuM
	sU49ZFqXpdZpEnuvO1nHIUFUqtjY3ZKo=
X-Gm-Gg: ASbGncvpKtvHKGlVKmVJ1jLZCNwG9gl4v9reWI6HmD6qSKzpF2ERJFiaRongOPTfUWq
	kDEzsGBg//wzlI3Vb8LmHOk4A+tBYiZMf5LcAbKy11PtJypf9bLfqL3NwMAkuiLgbzRIrqcYU6g
	K12TvT7l+H/3ulAEGU/5HQWu/NDBXhIJf7Phd1fBXmhrLr5umttkxfZRYR3cVPhGGo+aqy5t+pX
	B5BMJLVf63jCJ9kvRFaoElhBPXpv+VWMrs9Cld/27hdUPbZWQ==
X-Google-Smtp-Source: AGHT+IEfBg7EU5Y+GL+vCdr3J3VHOVzPmDvrJmSjuI9JQTOsuRCs1DfMTTWAkfh3vcWS+I2STSf/WXFgTMrgn3S83Xs=
X-Received: by 2002:a17:90b:2d86:b0:32b:d8af:b636 with SMTP id
 98e67ed59e1d1-32d43f6105emr7856298a91.19.1757276266634; Sun, 07 Sep 2025
 13:17:46 -0700 (PDT)
MIME-Version: 1.0
References: <20250907105926.1650992-1-pkj@axis.com>
In-Reply-To: <20250907105926.1650992-1-pkj@axis.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Sun, 7 Sep 2025 16:17:40 -0400
X-Gm-Features: Ac12FXwHrq9jGHKDLdNiNKR_asJcpxTBL1qYYrYrtGcgkhFzBRSozIFuoBbdjzE
Message-ID: <CADkTA4OnwS3Bxsfg6R2uEo6-9gpZSZTvaOHEWRvUbjLmxO6weA@mail.gmail.com>
Subject: Re: [meta-virtualization] [PATCH] containerd: Remove leading "v" from PV
To: peter.kjellerstedt@axis.com
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="000000000000a524c4063e3bc3e5"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Sun, 07 Sep 2025 20:17:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9378

--000000000000a524c4063e3bc3e5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 7, 2025 at 6:59=E2=80=AFAM Peter Kjellerstedt via lists.yoctopr=
oject.org
<peter.kjellerstedt=3Daxis.com@lists.yoctoproject.org> wrote:

> The leading "v" in the version otherwise makes its way into, e.g., the
> SBOM.
>
> Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> ---
>
> There are another 30 recipes in meta-virtualization that have a leading
> "v" in their versions, but this is the only one of them that we use.
> I can send patches for the others as well if you want.
>

No thanks, to any of them.

The "v" isn't by mistake. I don't see any reason to remove it.

Bruce



>
>  recipes-containers/containerd/containerd_git.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/recipes-containers/containerd/containerd_git.bb
> b/recipes-containers/containerd/containerd_git.bb
> index bae86146..c46d1673 100644
> --- a/recipes-containers/containerd/containerd_git.bb
> +++ b/recipes-containers/containerd/containerd_git.bb
> @@ -16,7 +16,7 @@ SRC_URI =3D "git://
> github.com/containerd/containerd;branch=3Drelease/2.1;protocol=3Dht
>  LICENSE =3D "Apache-2.0"
>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D1269f40c0d099c21a871163984590=
d89"
>
> -CONTAINERD_VERSION =3D "v2.1.4"
> +CONTAINERD_VERSION =3D "2.1.4"
>
>  # EXTRA_OEMAKE +=3D "GODEBUG=3D1"
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9377):
> https://lists.yoctoproject.org/g/meta-virtualization/message/9377
> Mute This Topic: https://lists.yoctoproject.org/mt/115111597/1050810
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

--000000000000a524c4063e3bc3e5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote gmail_quote_con=
tainer"><div dir=3D"ltr" class=3D"gmail_attr">On Sun, Sep 7, 2025 at 6:59=
=E2=80=AFAM Peter Kjellerstedt via <a href=3D"http://lists.yoctoproject.org=
">lists.yoctoproject.org</a> &lt;peter.kjellerstedt=3D<a href=3D"mailto:axi=
s.com@lists.yoctoproject.org">axis.com@lists.yoctoproject.org</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">The leading &q=
uot;v&quot; in the version otherwise makes its way into, e.g., the<br>
SBOM.<br>
<br>
Signed-off-by: Peter Kjellerstedt &lt;<a href=3D"mailto:peter.kjellerstedt@=
axis.com" target=3D"_blank">peter.kjellerstedt@axis.com</a>&gt;<br>
---<br>
<br>
There are another 30 recipes in meta-virtualization that have a leading<br>
&quot;v&quot; in their versions, but this is the only one of them that we u=
se.<br>
I can send patches for the others as well if you want.<br></blockquote><div=
><br></div><div><div class=3D"gmail_default" style=3D"font-size:small">No t=
hanks, to any of them.</div><div class=3D"gmail_default" style=3D"font-size=
:small"><br></div><div class=3D"gmail_default" style=3D"font-size:small">Th=
e &quot;v&quot; isn&#39;t by mistake. I don&#39;t see any reason to remove =
it.</div><div class=3D"gmail_default" style=3D"font-size:small"><br></div><=
div class=3D"gmail_default" style=3D"font-size:small">Bruce</div><br></div>=
<div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
=C2=A0recipes-containers/containerd/<a href=3D"http://containerd_git.bb" re=
l=3D"noreferrer" target=3D"_blank">containerd_git.bb</a> | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/recipes-containers/containerd/<a href=3D"http://containerd_git=
.bb" rel=3D"noreferrer" target=3D"_blank">containerd_git.bb</a> b/recipes-c=
ontainers/containerd/<a href=3D"http://containerd_git.bb" rel=3D"noreferrer=
" target=3D"_blank">containerd_git.bb</a><br>
index bae86146..c46d1673 100644<br>
--- a/recipes-containers/containerd/<a href=3D"http://containerd_git.bb" re=
l=3D"noreferrer" target=3D"_blank">containerd_git.bb</a><br>
+++ b/recipes-containers/containerd/<a href=3D"http://containerd_git.bb" re=
l=3D"noreferrer" target=3D"_blank">containerd_git.bb</a><br>
@@ -16,7 +16,7 @@ SRC_URI =3D &quot;git://<a href=3D"http://github.com/cont=
ainerd/containerd;branch=3Drelease/2.1;protocol=3Dht" rel=3D"noreferrer" ta=
rget=3D"_blank">github.com/containerd/containerd;branch=3Drelease/2.1;proto=
col=3Dht</a><br>
=C2=A0LICENSE =3D &quot;Apache-2.0&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D1269f40c0d099c21a8711=
63984590d89&quot;<br>
<br>
-CONTAINERD_VERSION =3D &quot;v2.1.4&quot;<br>
+CONTAINERD_VERSION =3D &quot;2.1.4&quot;<br>
<br>
=C2=A0# EXTRA_OEMAKE +=3D &quot;GODEBUG=3D1&quot;<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#9377): <a href=3D"https://lists.yoctoproject.org/g/meta=
-virtualization/message/9377" rel=3D"noreferrer" target=3D"_blank">https://=
lists.yoctoproject.org/g/meta-virtualization/message/9377</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/115111597/105=
0810" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/m=
t/115111597/1050810</a><br>
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

--000000000000a524c4063e3bc3e5--

