Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9FE4E7718B
	for <webhook@archiver.kernel.org>; Sun, 29 Dec 2024 03:54:21 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web11.40120.1735444453627629608
 for <meta-virtualization@lists.yoctoproject.org>;
 Sat, 28 Dec 2024 19:54:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=i9wnbN+l;
 spf=pass (domain: gmail.com, ip: 209.85.214.177, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2165cb60719so105529735ad.0
        for <meta-virtualization@lists.yoctoproject.org>; Sat, 28 Dec 2024 19:54:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735444453; x=1736049253; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8cRhgSEEhTwMZMhT8ktWUXmTh9K+kdCcMtI3mAyIcoU=;
        b=i9wnbN+l/DX2OO17VMCcTiU+LUs/yQi+Okhucjbb9QnKhO6Ts1jCD3ANMQAaDtcsAj
         FZL1nEDe+R7JKgP365OG8XleF63G1an5FPahc7ISEcDE96psB+WcHBQ680n/QPn4SNWe
         RcZljzAUdjG3zBBRfspHUq9356lEyXwa3yWya208ByniGrY2WIEFBvPkHdmRYb9K4xl1
         DVciq/cE+gNwPI0mWG/CIE3fDcaGH8XHK9W4OcpfWexVTa/VQTb1hl5fGTClwbLzJlLb
         dxshXPdwYCXe7xL4RdamYH6Q8mbL6C2M/e7oQpgQNCUYSOF+3hBrEkbHTtXqdpcNt7/P
         HrmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735444453; x=1736049253;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8cRhgSEEhTwMZMhT8ktWUXmTh9K+kdCcMtI3mAyIcoU=;
        b=J4LIDJhsI5PaV828/yC5iuYx4BsLJRXFjKZ+G2+7Z0+3jaEvcUht5/+qIGQOMudTCL
         5MLNtmn7O40ALhEBmHWzHxi1oPLXY3A5C2/LnLmN+FV02hw44OjCEPTEpnDnbghqNm9U
         Sev34rTz2/+TKKd/7nS+u78Nwr/Za9wZf6OBQZvepVNnw2LNvJoII0SSlEhtYBiqh3AT
         WV6mWV1OxuqVOPZvMisnd3avf4jvafpCt0S9kggf0fz+4aT+Ab1XoWKOaHDgHjN5IsdL
         /5M5f6fhwYuxsdVv4tGW1ptndftvdph1++gBUGr95niCyZLVcuRBoFxUPBfhlvg9Zqfv
         lbMA==
X-Gm-Message-State: AOJu0YwWknYDU9ugshccmU8WFb5q/1huy98TVhh9xL458updBdwkcfVb
	kSjUCmxb0c9oG4IP+apm/EwEa4+fhpG1Ggp52BeEfutUxMGkwX7f7tlYhStx4W5rVCR5EpKw+0B
	6No+wA7xVWCStYWBVx3y/S6r0paetk4P7j+SnjQ==
X-Gm-Gg: ASbGncts0+z62Rwj+6XrZLeaYmWFpxHOXRBEYDF7MSfwl40EtfvdOHPXDhQeyhM2rZR
	uY/rtTbveAVyEWyPuGwFKnGX9IqYi//tGfNGCkg==
X-Google-Smtp-Source: AGHT+IG/10O0fTrXzKlW2avb9iYhbNbX2EXBTNcXWxe9GkS0X1ODG0a4F/YWxpRBkMo22bxCcP2LM7asf9tIx+rBdK0=
X-Received: by 2002:a05:6a21:3381:b0:1e1:c26d:d7fd with SMTP id
 adf61e73a8af0-1e5e081c4demr50745326637.37.1735444452880; Sat, 28 Dec 2024
 19:54:12 -0800 (PST)
MIME-Version: 1.0
References: <20241218092134.2506858-1-l.anderweit@phytec.de>
In-Reply-To: <20241218092134.2506858-1-l.anderweit@phytec.de>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Sat, 28 Dec 2024 22:54:01 -0500
Message-ID: <CADkTA4OjZUD2HGnU3U0zaOGYTUFi01EO0pF5yxVoWvS4JHNaUg@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH][styhead][master] podman-compose: Add
 runtime dependencies
To: L.Anderweit@phytec.de
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="000000000000243a18062a60a6c1"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Sun, 29 Dec 2024 03:54:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9070

--000000000000243a18062a60a6c1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I haven't forgotten about this and will address it when I return from
holidays on January 2nd.

Bruce

On Wed, Dec 18, 2024 at 4:21=E2=80=AFAM Leonard Anderweit via lists.yoctopr=
oject.org
<L.Anderweit=3Dphytec.de@lists.yoctoproject.org> wrote:

> Add missing runtime dependencies on python modules asyncio, json and
> getpass provided by unixadmin.
> Sort the dependencies alphabetically while at it.
>
> Signed-off-by: Leonard Anderweit <l.anderweit@phytec.de>
> ---
>  recipes-containers/podman-compose/podman-compose_git.bb | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/recipes-containers/podman-compose/podman-compose_git.bb
> b/recipes-containers/podman-compose/podman-compose_git.bb
> index 0ee171dc88ad..c76bf1c447b8 100644
> --- a/recipes-containers/podman-compose/podman-compose_git.bb
> +++ b/recipes-containers/podman-compose/podman-compose_git.bb
> @@ -14,6 +14,9 @@ S =3D "${WORKDIR}/git"
>  DEPENDS +=3D "python3-pyyaml-native"
>
>  RDEPENDS:${PN} +=3D "\
> -    python3-pyyaml \
> +    python3-asyncio \
>      python3-dotenv \
> +    python3-json \
> +    python3-pyyaml \
> +    python3-unixadmin \
>  "
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9061):
> https://lists.yoctoproject.org/g/meta-virtualization/message/9061
> Mute This Topic: https://lists.yoctoproject.org/mt/110177990/1050810
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

--000000000000243a18062a60a6c1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-size:small">I h=
aven&#39;t forgotten=C2=A0about this and will address it when I return from=
 holidays on January 2nd.</div><div class=3D"gmail_default" style=3D"font-s=
ize:small"><br></div><div class=3D"gmail_default" style=3D"font-size:small"=
>Bruce</div></div><br><div class=3D"gmail_quote gmail_quote_container"><div=
 dir=3D"ltr" class=3D"gmail_attr">On Wed, Dec 18, 2024 at 4:21=E2=80=AFAM L=
eonard Anderweit via <a href=3D"http://lists.yoctoproject.org">lists.yoctop=
roject.org</a> &lt;L.Anderweit=3D<a href=3D"mailto:phytec.de@lists.yoctopro=
ject.org">phytec.de@lists.yoctoproject.org</a>&gt; wrote:<br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex">Add missing runtime dependencies =
on python modules asyncio, json and<br>
getpass provided by unixadmin.<br>
Sort the dependencies alphabetically while at it.<br>
<br>
Signed-off-by: Leonard Anderweit &lt;<a href=3D"mailto:l.anderweit@phytec.d=
e" target=3D"_blank">l.anderweit@phytec.de</a>&gt;<br>
---<br>
=C2=A0recipes-containers/podman-compose/<a href=3D"http://podman-compose_gi=
t.bb" rel=3D"noreferrer" target=3D"_blank">podman-compose_git.bb</a> | 5 ++=
++-<br>
=C2=A01 file changed, 4 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/recipes-containers/podman-compose/<a href=3D"http://podman-com=
pose_git.bb" rel=3D"noreferrer" target=3D"_blank">podman-compose_git.bb</a>=
 b/recipes-containers/podman-compose/<a href=3D"http://podman-compose_git.b=
b" rel=3D"noreferrer" target=3D"_blank">podman-compose_git.bb</a><br>
index 0ee171dc88ad..c76bf1c447b8 100644<br>
--- a/recipes-containers/podman-compose/<a href=3D"http://podman-compose_gi=
t.bb" rel=3D"noreferrer" target=3D"_blank">podman-compose_git.bb</a><br>
+++ b/recipes-containers/podman-compose/<a href=3D"http://podman-compose_gi=
t.bb" rel=3D"noreferrer" target=3D"_blank">podman-compose_git.bb</a><br>
@@ -14,6 +14,9 @@ S =3D &quot;${WORKDIR}/git&quot;<br>
=C2=A0DEPENDS +=3D &quot;python3-pyyaml-native&quot;<br>
<br>
=C2=A0RDEPENDS:${PN} +=3D &quot;\<br>
-=C2=A0 =C2=A0 python3-pyyaml \<br>
+=C2=A0 =C2=A0 python3-asyncio \<br>
=C2=A0 =C2=A0 =C2=A0python3-dotenv \<br>
+=C2=A0 =C2=A0 python3-json \<br>
+=C2=A0 =C2=A0 python3-pyyaml \<br>
+=C2=A0 =C2=A0 python3-unixadmin \<br>
=C2=A0&quot;<br>
-- <br>
2.25.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#9061): <a href=3D"https://lists.yoctoproject.org/g/meta=
-virtualization/message/9061" rel=3D"noreferrer" target=3D"_blank">https://=
lists.yoctoproject.org/g/meta-virtualization/message/9061</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/110177990/105=
0810" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/m=
t/110177990/1050810</a><br>
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

--000000000000243a18062a60a6c1--

