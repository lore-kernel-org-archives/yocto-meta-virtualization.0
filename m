Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43CCBCA101F
	for <webhook@archiver.kernel.org>; Sun,  7 Sep 2025 20:19:27 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web10.3471.1757276363672582332
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 07 Sep 2025 13:19:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BVAoa8/s;
 spf=pass (domain: gmail.com, ip: 209.85.216.42, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-329e1c8e079so3059187a91.2
        for <meta-virtualization@lists.yoctoproject.org>; Sun, 07 Sep 2025 13:19:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757276363; x=1757881163; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=E+49Nvo/KliSkKj7+1IYelrSIP7WrqY2sUV0nQXKKpY=;
        b=BVAoa8/s/NFAxx1JvWHdFtnlCjD3zKelnNLU5hoaZkjoqO3dIvG9QgR8o1YEywLw/g
         I0VNhzXr8y9gUyVs98HS5XaxMc4l/sX1qBixWTJN/yzSWwMWxoE70ULaa6fkHiGUa6Nb
         63d+HsDq+NLXrjLc9ACwYeGLOBca9bP6lUUBprhetKTcEkLToEfWmb3TajJXUAkK2aJo
         iVTVG+79CqQVQVbdzBOoERV3J6QIvHfxqVGW9hwPCv2jEX6oKdEjxWE0PKuheYALIDFN
         8i9C091bGlLQonuhSkTRw6EJQwbahac935djQBgBeJUn6Yg3AjLi6dzS+Llrfza6K7Ao
         E4tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757276363; x=1757881163;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E+49Nvo/KliSkKj7+1IYelrSIP7WrqY2sUV0nQXKKpY=;
        b=lrAkCIhs2fOPE99IZB41yfe0NwfcBYjQeyL8MXhbhi50vXezLiTp3Uza5a5HCsdl0a
         9xiVDbxgOoZj3LYgTga7142UALwh75QYZ76x7UVfoMl9biIV7lzc/kvwI69zCwyV6EN2
         oaZKQ5f9ZLULIV7tFCunmJtf5RIr4kq0Ta43z0S+yCixKYVqxM9AQaKEl8QFLZKVhKwy
         Utfk5FFXRDKmxizTNhMeWep+fw77FVh+pSPVa9sTB9xEy8fQMvAIDP4WPSO/wvlAau4M
         kebVdZlqF5CnZDSzceXNNNtmzaTRI1GbBCEUE3yvWBpYMcdIM9d8D4bu4lb3NpVjQheA
         ERGQ==
X-Gm-Message-State: AOJu0Yzle8ho2h7VmoAgf9kEMXCP2jq3vQAj7nz5YYb1Rrz1EQeMFUSY
	g8uvhBmTvtEZHK/NIp1hs3+A2cSApuHe4LE/eLkwz2sNEbGiZ7mup4lLhWnDFNb/gNGWPmqeR6e
	UY6+M9/3lgENjyxeK0tMaoc9X267DQsN74kL3
X-Gm-Gg: ASbGncuu6vXdCwQ1LaIsBSRYw48SOtaj29qt+VrC39tjXZIveOK+7rQI20JRDivRMfl
	csEoCQ75QukhfkhpUfjK3h8aMvWtFGnkv4z65cLt2oS/7A9rBPPnqSDl8NXG9k4M6lsIFO7BY30
	BaQnzYkjpm3h2ZMWmrd/YzA0EzfekN9URawcvt3UdRen2UEpumORvixwnfzCMY+UR2TBGf1dKd0
	zl4nLwptlSRs0JIV1wVRurlhPPROE3yr0vo9UY=
X-Google-Smtp-Source: AGHT+IFswq8MOq8VhkallzDUZ8CI46fAn/WWwgJdCw55NDsCaEo1P/AmxkX/qR9Ouhq61IiYNtkVCAVSsyf5Uw7lD8k=
X-Received: by 2002:a17:90b:53ce:b0:311:b413:f5e1 with SMTP id
 98e67ed59e1d1-32d440c42bemr7564259a91.32.1757276362949; Sun, 07 Sep 2025
 13:19:22 -0700 (PDT)
MIME-Version: 1.0
References: <20250907105926.1650992-1-pkj@axis.com> <CADkTA4OnwS3Bxsfg6R2uEo6-9gpZSZTvaOHEWRvUbjLmxO6weA@mail.gmail.com>
In-Reply-To: <CADkTA4OnwS3Bxsfg6R2uEo6-9gpZSZTvaOHEWRvUbjLmxO6weA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Sun, 7 Sep 2025 16:19:17 -0400
X-Gm-Features: Ac12FXw8A5zZn_DiLFFTjOtV6KnC5M-_o940mMmTySHIz0HvYyXRKQ_-vTIyZ5w
Message-ID: <CADkTA4NKwaetHMUvbRian4m1Po1CYTXb7V+avOW1Fwj-RWLnsw@mail.gmail.com>
Subject: Re: [meta-virtualization] [PATCH] containerd: Remove leading "v" from PV
To: peter.kjellerstedt@axis.com
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="00000000000062ca3b063e3bc9fd"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Sun, 07 Sep 2025 20:19:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9379

--00000000000062ca3b063e3bc9fd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 7, 2025 at 4:17=E2=80=AFPM Bruce Ashfield <bruce.ashfield@gmail=
.com>
wrote:

>
>
> On Sun, Sep 7, 2025 at 6:59=E2=80=AFAM Peter Kjellerstedt via
> lists.yoctoproject.org <peter.kjellerstedt=3Daxis.com@lists.yoctoproject.=
org>
> wrote:
>
>> The leading "v" in the version otherwise makes its way into, e.g., the
>> SBOM.
>>
>> Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
>> ---
>>
>> There are another 30 recipes in meta-virtualization that have a leading
>> "v" in their versions, but this is the only one of them that we use.
>> I can send patches for the others as well if you want.
>>
>
> No thanks, to any of them.
>
> The "v" isn't by mistake. I don't see any reason to remove it.
>

What I mean by this, is that someone needs to tell me why SBOM
is broken enough that it can't handle the "v", and what problems it
causes in the SBOM.

Bruce



>
> Bruce
>
>
>
>>
>>  recipes-containers/containerd/containerd_git.bb | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/recipes-containers/containerd/containerd_git.bb
>> b/recipes-containers/containerd/containerd_git.bb
>> index bae86146..c46d1673 100644
>> --- a/recipes-containers/containerd/containerd_git.bb
>> +++ b/recipes-containers/containerd/containerd_git.bb
>> @@ -16,7 +16,7 @@ SRC_URI =3D "git://
>> github.com/containerd/containerd;branch=3Drelease/2.1;protocol=3Dht
>>  LICENSE =3D "Apache-2.0"
>>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D1269f40c0d099c21a87116398459=
0d89"
>>
>> -CONTAINERD_VERSION =3D "v2.1.4"
>> +CONTAINERD_VERSION =3D "2.1.4"
>>
>>  # EXTRA_OEMAKE +=3D "GODEBUG=3D1"
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#9377):
>> https://lists.yoctoproject.org/g/meta-virtualization/message/9377
>> Mute This Topic: https://lists.yoctoproject.org/mt/115111597/1050810
>> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
>> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub =
[
>> bruce.ashfield@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>
>>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await the=
e
> at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>
>

--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--00000000000062ca3b063e3bc9fd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote gmail_quote_con=
tainer"><div dir=3D"ltr" class=3D"gmail_attr">On Sun, Sep 7, 2025 at 4:17=
=E2=80=AFPM Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield@gmail.com">=
bruce.ashfield@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr"><div style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Sun, Sep 7, 2025 at 6:59=E2=80=AFAM Peter Kjelle=
rstedt via <a href=3D"http://lists.yoctoproject.org" target=3D"_blank">list=
s.yoctoproject.org</a> &lt;peter.kjellerstedt=3D<a href=3D"mailto:axis.com@=
lists.yoctoproject.org" target=3D"_blank">axis.com@lists.yoctoproject.org</=
a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Th=
e leading &quot;v&quot; in the version otherwise makes its way into, e.g., =
the<br>
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
><br></div><div><div style=3D"font-size:small">No thanks, to any of them.</=
div><div style=3D"font-size:small"><br></div><div style=3D"font-size:small"=
>The &quot;v&quot; isn&#39;t by mistake. I don&#39;t see any reason to remo=
ve it.</div></div></div></div></blockquote><div><br></div><div><div class=
=3D"gmail_default" style=3D"font-size:small">What I mean by this, is that s=
omeone needs to tell me why SBOM</div><div class=3D"gmail_default" style=3D=
"font-size:small">is broken enough that it can&#39;t handle the &quot;v&quo=
t;, and what problems it</div><div class=3D"gmail_default" style=3D"font-si=
ze:small">causes in the SBOM.</div><div class=3D"gmail_default" style=3D"fo=
nt-size:small"><br></div><div class=3D"gmail_default" style=3D"font-size:sm=
all">Bruce</div><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_quote"><div><div sty=
le=3D"font-size:small"><br></div><div style=3D"font-size:small">Bruce</div>=
<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">
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
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature">- Thou shalt not follow the NULL pointer, for chaos and madness a=
wait thee at its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star T=
rek II<br><br></div></div>

--00000000000062ca3b063e3bc9fd--

