Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF653E7718B
	for <webhook@archiver.kernel.org>; Sun, 29 Dec 2024 03:43:01 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web11.40006.1735443772190863316
 for <meta-virtualization@lists.yoctoproject.org>;
 Sat, 28 Dec 2024 19:42:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=aTxih0oo;
 spf=pass (domain: gmail.com, ip: 209.85.216.49, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-2efe25558ddso8164889a91.2
        for <meta-virtualization@lists.yoctoproject.org>; Sat, 28 Dec 2024 19:42:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735443771; x=1736048571; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Ml30QOamWSXDafL9SyhTx7RCCHREYfXbjI6SDKwvG8A=;
        b=aTxih0oo2zwiyCLCOIsEca0l95DTFMPpE7cwb2aVvYUYVg3nxdgqJtFIIlkWjejnsz
         dYqL936plRn2rYS9Gob2Mhd1UUtAQxXzYEBp4Q/d1jbMCSqb+azRpCWVuSsNWN0uZ33A
         DT02U5W+paf4fPDIDunkmbl1vD+9WoML3v0g6KZn/Au8m+ospup6cBk1bDP13YymWv2g
         pNuvN/cooLLbagboeqR+S+JZhxFbjULidfPgiIBTRhVgQl7UUCkM4VodSkyXJ5pRpgno
         I/P2dNa4vYR63TCh6UundUxn7JIP2umLrangIp0IEiC3mATOkJFTmCKfqN10deSG91qi
         JEDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735443771; x=1736048571;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ml30QOamWSXDafL9SyhTx7RCCHREYfXbjI6SDKwvG8A=;
        b=TsmaBN7cHVfB+QpHj3fBY4X0vR45A/PgWOZ7GIIDVj1XA3jEdjClUcde9MYm2vqFAp
         Z9CCcVyIChugZYntuDyZHnJHVTJEqRXZH1rIav3jvSH2YUwspB5cz62xmX9s2yLo2oeG
         DS89ZbS79Gj0q+7BdIPxOKtiVkUpUZI5UwBlMAAztv8XKbRK8/SBby2VkE1ZBMDWLekb
         XOXdGwFN0lwubhHS4w+FCRZvPfwQWh++RHGIw79qnX+Yk6VtfRx0K4mONz4fGwL2246I
         eOkiYjyFqS44pJhqRPOapTcHlyGKXTzeMna/dFui5Ywh4IlDXX5fMQoKOUM5uQCPFkry
         qUew==
X-Gm-Message-State: AOJu0Yy3bXmqHLE9SzPxe73Akvm5xHYVHVDcbLlJVOZ3eYMpoQX2TU5P
	L42yQnjzA5RdzZw7YtFuMqclE0aeieYLBn5s8YWqChIlSHWlFy6g9wp/L/UdL9X5BvEf/E8op/s
	47IoRmCiTIHtPoxl8Qn89NRLP9rY=
X-Gm-Gg: ASbGnctfklLYAN8h4Etc7DQg7c2UrTkC9xoLly1b/YiGw6IyiE39MBgNQC3c3oTSK+3
	DEpM0s2aM9ISciUnF7jeEMcHPmPRnu0wHMtVRaA==
X-Google-Smtp-Source: AGHT+IGSeKvSCX4WgA76Kg9BXVwIcqKE3JOCvrWzty1gDyGTOwfdsZ6lE/Rviv6cnJffkdIeg0hPpDpEIzAxe2vhW20=
X-Received: by 2002:a17:90b:2e0b:b0:2ee:f550:3848 with SMTP id
 98e67ed59e1d1-2f452deb50bmr49533671a91.5.1735443771330; Sat, 28 Dec 2024
 19:42:51 -0800 (PST)
MIME-Version: 1.0
References: <20241228090210.695265-1-hongxu.jia@windriver.com> <20241228090210.695265-2-hongxu.jia@windriver.com>
In-Reply-To: <20241228090210.695265-2-hongxu.jia@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Sat, 28 Dec 2024 22:42:39 -0500
Message-ID: <CADkTA4MfO5yCODtadhhceq7AudasXktVue6_USe5Nx5tpACuRw@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH 2/3] packagegroup-container: support
 target arch override
To: hongxu.jia@eng.windriver.com
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="0000000000008498d7062a607d11"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Sun, 29 Dec 2024 03:43:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9066

--0000000000008498d7062a607d11
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 28, 2024 at 4:02=E2=80=AFAM hongxu via lists.yoctoproject.org
<hongxu.jia=3Deng.windriver.com@lists.yoctoproject.org> wrote:

> In packagegroup-container, it runtime depends on conmon if DISTRO_FEATURE=
S
> contains seccomp
> but oe-core uses target override loongarch64 to disable seccomp from
> default feature [1]
>
> $ echo "MACHINE =3D 'qemuloongarch64'" >> conf/local.conf
> $ bitbake world
> ERROR: Nothing RPROVIDES 'conmon' (but
> meta-virtualization/recipes-core/packagegroups/packagegroup-container.bb
> RDEPENDS on or otherwise requires it)
> conmon was skipped: missing required distro feature 'seccomp' (not in
> DISTRO_FEATURES)
> NOTE: Runtime target 'conmon' is unbuildable, removing...
> Missing or unbuildable dependency chain was: ['conmon']
> ERROR: Required build target 'meta-world-pkgdata' has no buildable
> providers.
> Missing or unbuildable dependency chain was: ['meta-world-pkgdata',
> 'packagegroup-container', 'conmon']
>
> Set 'PACKAGE_ARCH =3D "${MACHINE_ARCH}"' to make target arch override
> loongarch64 work
>
> [1]
> https://github.com/openembedded/openembedded-core/commit/e9177bfc647ffd8d=
0346154c2673562e3585c7ef
>
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>  recipes-core/packagegroups/packagegroup-container.bb | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/recipes-core/packagegroups/packagegroup-container.bb
> b/recipes-core/packagegroups/packagegroup-container.bb
> index 3e2d2a25..ab4cbb6c 100644
> --- a/recipes-core/packagegroups/packagegroup-container.bb
> +++ b/recipes-core/packagegroups/packagegroup-container.bb
> @@ -2,6 +2,8 @@ SUMMARY =3D "All packages for container host"
>  LICENSE =3D "MIT"
>  LIC_FILES_CHKSUM =3D
> "file://${COMMON_LICENSE_DIR}/MIT;md5=3D0835ade698e0bcf8506ecda2f7b4f302"
>
> +PACKAGE_ARCH =3D "${MACHINE_ARCH}"
>

I'm no expert, but doesn't this make the packages/packagegroup machine
specific ?

If so, that is definitely not what we want.

Bruce



> +
>  inherit packagegroup goarch
>
>  COMPATIBLE_HOST =3D "^(?!(mips|riscv)).*"
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9064):
> https://lists.yoctoproject.org/g/meta-virtualization/message/9064
> Mute This Topic: https://lists.yoctoproject.org/mt/110315545/1050810
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

--0000000000008498d7062a607d11
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote gmail_quote_con=
tainer"><div dir=3D"ltr" class=3D"gmail_attr">On Sat, Dec 28, 2024 at 4:02=
=E2=80=AFAM hongxu via <a href=3D"http://lists.yoctoproject.org">lists.yoct=
oproject.org</a> &lt;hongxu.jia=3D<a href=3D"mailto:eng.windriver.com@lists=
.yoctoproject.org">eng.windriver.com@lists.yoctoproject.org</a>&gt; wrote:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">In packagegroup-=
container, it runtime depends on conmon if DISTRO_FEATURES contains seccomp=
<br>
but oe-core uses target override loongarch64 to disable seccomp from defaul=
t feature [1]<br>
<br>
$ echo &quot;MACHINE =3D &#39;qemuloongarch64&#39;&quot; &gt;&gt; conf/loca=
l.conf<br>
$ bitbake world<br>
ERROR: Nothing RPROVIDES &#39;conmon&#39; (but meta-virtualization/recipes-=
core/packagegroups/<a href=3D"http://packagegroup-container.bb" rel=3D"nore=
ferrer" target=3D"_blank">packagegroup-container.bb</a> RDEPENDS on or othe=
rwise requires it)<br>
conmon was skipped: missing required distro feature &#39;seccomp&#39; (not =
in DISTRO_FEATURES)<br>
NOTE: Runtime target &#39;conmon&#39; is unbuildable, removing...<br>
Missing or unbuildable dependency chain was: [&#39;conmon&#39;]<br>
ERROR: Required build target &#39;meta-world-pkgdata&#39; has no buildable =
providers.<br>
Missing or unbuildable dependency chain was: [&#39;meta-world-pkgdata&#39;,=
 &#39;packagegroup-container&#39;, &#39;conmon&#39;]<br>
<br>
Set &#39;PACKAGE_ARCH =3D &quot;${MACHINE_ARCH}&quot;&#39; to make target a=
rch override loongarch64 work<br>
<br>
[1] <a href=3D"https://github.com/openembedded/openembedded-core/commit/e91=
77bfc647ffd8d0346154c2673562e3585c7ef" rel=3D"noreferrer" target=3D"_blank"=
>https://github.com/openembedded/openembedded-core/commit/e9177bfc647ffd8d0=
346154c2673562e3585c7ef</a><br>
<br>
Signed-off-by: Hongxu Jia &lt;<a href=3D"mailto:hongxu.jia@windriver.com" t=
arget=3D"_blank">hongxu.jia@windriver.com</a>&gt;<br>
---<br>
=C2=A0recipes-core/packagegroups/<a href=3D"http://packagegroup-container.b=
b" rel=3D"noreferrer" target=3D"_blank">packagegroup-container.bb</a> | 2 +=
+<br>
=C2=A01 file changed, 2 insertions(+)<br>
<br>
diff --git a/recipes-core/packagegroups/<a href=3D"http://packagegroup-cont=
ainer.bb" rel=3D"noreferrer" target=3D"_blank">packagegroup-container.bb</a=
> b/recipes-core/packagegroups/<a href=3D"http://packagegroup-container.bb"=
 rel=3D"noreferrer" target=3D"_blank">packagegroup-container.bb</a><br>
index 3e2d2a25..ab4cbb6c 100644<br>
--- a/recipes-core/packagegroups/<a href=3D"http://packagegroup-container.b=
b" rel=3D"noreferrer" target=3D"_blank">packagegroup-container.bb</a><br>
+++ b/recipes-core/packagegroups/<a href=3D"http://packagegroup-container.b=
b" rel=3D"noreferrer" target=3D"_blank">packagegroup-container.bb</a><br>
@@ -2,6 +2,8 @@ SUMMARY =3D &quot;All packages for container host&quot;<br>
=C2=A0LICENSE =3D &quot;MIT&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://${COMMON_LICENSE_DIR}/MIT;md5=3D083=
5ade698e0bcf8506ecda2f7b4f302&quot;<br>
<br>
+PACKAGE_ARCH =3D &quot;${MACHINE_ARCH}&quot;<br></blockquote><div><br></di=
v><div><div class=3D"gmail_default" style=3D"font-size:small">I&#39;m no ex=
pert, but doesn&#39;t this make the packages/packagegroup machine specific =
?</div><div class=3D"gmail_default" style=3D"font-size:small"><br></div><di=
v class=3D"gmail_default" style=3D"font-size:small">If so, that is definite=
ly not what we want.</div><div class=3D"gmail_default" style=3D"font-size:s=
mall"><br></div><div class=3D"gmail_default" style=3D"font-size:small">Bruc=
e</div><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
+<br>
=C2=A0inherit packagegroup goarch<br>
<br>
=C2=A0COMPATIBLE_HOST =3D &quot;^(?!(mips|riscv)).*&quot;<br>
-- <br>
2.34.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#9064): <a href=3D"https://lists.yoctoproject.org/g/meta=
-virtualization/message/9064" rel=3D"noreferrer" target=3D"_blank">https://=
lists.yoctoproject.org/g/meta-virtualization/message/9064</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/110315545/105=
0810" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/m=
t/110315545/1050810</a><br>
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

--0000000000008498d7062a607d11--

