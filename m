Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84502CDB47B
	for <webhook@archiver.kernel.org>; Wed, 11 Oct 2023 18:55:43 +0000 (UTC)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
 by mx.groups.io with SMTP id smtpd.web11.25050.1697050540260251185
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 11 Oct 2023 11:55:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=USDknOeK;
 spf=pass (domain: gmail.com, ip: 209.85.128.175, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-5a2536adaf3so2345957b3.2
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 11 Oct 2023 11:55:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697050539; x=1697655339; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=DeCxnWf6tS2YboVQSqV5jal4qejzJMfAY9zEdYoloyU=;
        b=USDknOeK+thm0O024epSEB+jQxFH/wk9I3TyJc+JKpF3lchzq+DLet+rCqdoFjvBTf
         j6eLxjHo+EsL8xgNEaRVdql41r8F3ZLtQL8HP6ohBDH/gFbslNV2OdhncqQS11WAlgT1
         0r/B5o2ylwvUJT+wSIptg/ZylP528b5RTaQVpYBw4WptS3LPiTOIJhiTJJGPNwOvMHWI
         aXR2NSjJa1/BwnWZXuJBz1lVA1gPygyzw+fPKBJSKWdOT6u0ew/Dt5YMOhoZpsUoHLPm
         88T03TA5Qucsbn7PiFiXmk4Dk17wHFh7Vt8xd9K4ki9xp/swloeIp5MBAOnFGkFvUjDR
         G+Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697050539; x=1697655339;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DeCxnWf6tS2YboVQSqV5jal4qejzJMfAY9zEdYoloyU=;
        b=LX3Ow1rjx9Jq6B5xn0/yuro7U02ObEF3WONkq3YANOkpyXmKwuPySOU/YBd1reBOkY
         BOWJfEh15szBLCwpNiu4T6zpq30XNOvXH1hpcsJT2VJA+kA+K+SMO+0s9JJdNeuZBOLz
         EqM0F0+Hfln5K09edwww49VLzJDTWuiRRKFqPPR176j2GNHvMUqThktG4l33ZBR5Txi4
         nEeQYbZT+JNpT5dmi2S1yi1RMYk0axEWdRW0hhaE+077loE9hi+oGoLjsjdsZ7wTkWbi
         vkrLf5geb5ecYbzl+wLPJyZZbfIFlTofc2IfZTF1W9bMg/QiAyOEHAsljeZGGg31IZWZ
         DUyg==
X-Gm-Message-State: AOJu0YzxqzJ4XEgS2miw/ZzinLSXJrmIIniMWUbrPkGfX/Nn8sj/UD6C
	EPyKhdPoWnM0XZtZghvPdJRX1zcWzMHmGuPoL1PAdZYp2dy9SA==
X-Google-Smtp-Source: AGHT+IGmIXZZMpueQwnyZKN6RmuxQ8JQCeOGaH28w/Q5S3u85+EE4esqg4pwHwkGX5mOKcZY7lB8kdFQh43mzOM4uKo=
X-Received: by 2002:a0d:c8c3:0:b0:59b:f8da:ffdb with SMTP id
 k186-20020a0dc8c3000000b0059bf8daffdbmr24793260ywd.29.1697050539182; Wed, 11
 Oct 2023 11:55:39 -0700 (PDT)
MIME-Version: 1.0
References: <0ea13e6963ac5988167735946d6db74673a968bb.1697014988.git.joerg.sommer@navimatix.de>
In-Reply-To: <0ea13e6963ac5988167735946d6db74673a968bb.1697014988.git.joerg.sommer@navimatix.de>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 11 Oct 2023 14:55:29 -0400
Message-ID: <CADkTA4M4km=UJsFgXdPUGrg-dbZQLUcQZF-BQXrZz41CXisKRA@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] packagegroup-container: require ipv6
 for podman
To: joerg.sommer@navimatix.de
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="0000000000008dcec60607755e56"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 11 Oct 2023 18:55:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8350

--0000000000008dcec60607755e56
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

The change looks good, but I normally try and capture a bit of the build
failure in the commit log.

That way anyone searching on that specific error, will match on the commit.

If you can spin a quick v2 with that in the log, I'll get it staged.

Bruce

On Wed, Oct 11, 2023 at 5:03=E2=80=AFAM J=C3=B6rg Sommer via lists.yoctopro=
ject.org
<joerg.sommer=3Dnavimatix.de@lists.yoctoproject.org> wrote:

> The recipe *podman* requires *ipv6* in *DISTRO_FEATURES*, which causes th=
e
> build of the whole recipe fail, even if packagegroup-podman is not used.
>
> Signed-off-by: J=C3=B6rg Sommer <joerg.sommer@navimatix.de>
> ---
>  recipes-core/packagegroups/packagegroup-container.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/recipes-core/packagegroups/packagegroup-container.bb
> b/recipes-core/packagegroups/packagegroup-container.bb
> index 8d418e9..8309a08 100644
> --- a/recipes-core/packagegroups/packagegroup-container.bb
> +++ b/recipes-core/packagegroups/packagegroup-container.bb
> @@ -9,7 +9,7 @@ PACKAGES =3D "\
>      packagegroup-lxc \
>      packagegroup-docker \
>      packagegroup-oci \
> -    ${@bb.utils.contains('DISTRO_FEATURES', 'seccomp', \
> +    ${@bb.utils.contains('DISTRO_FEATURES', 'seccomp ipv6', \
>                           'packagegroup-podman', '', d)} \
>      packagegroup-containerd \
>      "
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8347):
> https://lists.yoctoproject.org/g/meta-virtualization/message/8347
> Mute This Topic: https://lists.yoctoproject.org/mt/101893004/1050810
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

--0000000000008dcec60607755e56
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-size:small">The=
 change looks good, but I normally try and capture a bit of the build failu=
re in the commit log.</div><div class=3D"gmail_default" style=3D"font-size:=
small"><br></div><div class=3D"gmail_default" style=3D"font-size:small">Tha=
t way anyone searching on that specific error, will match on the commit.</d=
iv><div class=3D"gmail_default" style=3D"font-size:small"><br></div><div cl=
ass=3D"gmail_default" style=3D"font-size:small">If you can spin a quick v2 =
with that in the log, I&#39;ll get it staged.</div><div class=3D"gmail_defa=
ult" style=3D"font-size:small"><br></div><div class=3D"gmail_default" style=
=3D"font-size:small">Bruce</div></div><br><div class=3D"gmail_quote"><div d=
ir=3D"ltr" class=3D"gmail_attr">On Wed, Oct 11, 2023 at 5:03=E2=80=AFAM J=
=C3=B6rg Sommer via <a href=3D"http://lists.yoctoproject.org">lists.yoctopr=
oject.org</a> &lt;joerg.sommer=3D<a href=3D"mailto:navimatix.de@lists.yocto=
project.org">navimatix.de@lists.yoctoproject.org</a>&gt; wrote:<br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">The recipe *podman* require=
s *ipv6* in *DISTRO_FEATURES*, which causes the<br>
build of the whole recipe fail, even if packagegroup-podman is not used.<br=
>
<br>
Signed-off-by: J=C3=B6rg Sommer &lt;<a href=3D"mailto:joerg.sommer@navimati=
x.de" target=3D"_blank">joerg.sommer@navimatix.de</a>&gt;<br>
---<br>
=C2=A0recipes-core/packagegroups/<a href=3D"http://packagegroup-container.b=
b" rel=3D"noreferrer" target=3D"_blank">packagegroup-container.bb</a> | 2 +=
-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/recipes-core/packagegroups/<a href=3D"http://packagegroup-cont=
ainer.bb" rel=3D"noreferrer" target=3D"_blank">packagegroup-container.bb</a=
> b/recipes-core/packagegroups/<a href=3D"http://packagegroup-container.bb"=
 rel=3D"noreferrer" target=3D"_blank">packagegroup-container.bb</a><br>
index 8d418e9..8309a08 100644<br>
--- a/recipes-core/packagegroups/<a href=3D"http://packagegroup-container.b=
b" rel=3D"noreferrer" target=3D"_blank">packagegroup-container.bb</a><br>
+++ b/recipes-core/packagegroups/<a href=3D"http://packagegroup-container.b=
b" rel=3D"noreferrer" target=3D"_blank">packagegroup-container.bb</a><br>
@@ -9,7 +9,7 @@ PACKAGES =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0packagegroup-lxc \<br>
=C2=A0 =C2=A0 =C2=A0packagegroup-docker \<br>
=C2=A0 =C2=A0 =C2=A0packagegroup-oci \<br>
-=C2=A0 =C2=A0 ${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;, &#39;seccomp=
&#39;, \<br>
+=C2=A0 =C2=A0 ${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;, &#39;seccomp=
 ipv6&#39;, \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 &#39;packagegroup-podman&#39;, &#39;&#39;, d)} \<br>
=C2=A0 =C2=A0 =C2=A0packagegroup-containerd \<br>
=C2=A0 =C2=A0 =C2=A0&quot;<br>
-- <br>
2.34.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#8347): <a href=3D"https://lists.yoctoproject.org/g/meta=
-virtualization/message/8347" rel=3D"noreferrer" target=3D"_blank">https://=
lists.yoctoproject.org/g/meta-virtualization/message/8347</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/101893004/105=
0810" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/m=
t/101893004/1050810</a><br>
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

--0000000000008dcec60607755e56--

