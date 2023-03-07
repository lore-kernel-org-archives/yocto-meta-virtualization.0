Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5926BC678D4
	for <webhook@archiver.kernel.org>; Tue,  7 Mar 2023 11:57:24 +0000 (UTC)
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com [209.85.217.45])
 by mx.groups.io with SMTP id smtpd.web11.12451.1678190235192710935
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 07 Mar 2023 03:57:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=NwL4NgUm;
 spf=pass (domain: gmail.com, ip: 209.85.217.45, mailfrom: quaresma.jose@gmail.com)
Received: by mail-vs1-f45.google.com with SMTP id v27so12040615vsa.7
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 07 Mar 2023 03:57:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678190234;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=LXmPPLLRXRlHwp2N91VVEVCKBr7wjbwQylc5xImY6X0=;
        b=NwL4NgUmblQJ9+culjiZ+PEhJngd2DJ5U6XWSYrNJX7/MnFtGYE8vAeIKmv2Tbpz0B
         lok7D2QE6Ft4Fhz8JuMW4SN72nsmZNk7iyeCu/xyLGS9OPnsncEW4gpeRxEFfF6dG6ck
         2/TXJlQQu1ESE5M7aI9Q24O7zzJkpXXQGSHy18HbezeZTvOzwT/G3LwT89xG8wGHM/wW
         Kh6kXL9E/dR6Xpk34dgt5G6HvCwzdV5HGcRs/zuwgAKSDM7w9aPm4G47tvsOEloFQYf5
         rl8x7InatnzZ7M+Na/cKOEUK1Iipz8d8oDbuOOxUS5OzX4CRSEHF5FPni36eQroWf3C1
         1AhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678190234;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LXmPPLLRXRlHwp2N91VVEVCKBr7wjbwQylc5xImY6X0=;
        b=CTB8qQU7LBMmHY9sQOryECgW7fyNmEfas1zhjszcz6dMZc8QZ/DpUsWnkg2eg9BPqe
         CzSMekKR7g8zYYqH6f0aDVXn1WFCfqvFG7Q38uAAW0JEpK3kf13ts6lXAo6DQYjeK+Ys
         zi79vlGJMezRn2qOUOlltNCXa2Oko9GUmbLhHz5FrPhHsXxyQv2ojkJEQnZM3/1Zu7E0
         S/sq7wyiaEsQFft2zNvt9Gw4UQ2+koehHvu1hQSVGLC3KU52ukUGHVp+JYMvhLffVLTL
         sbWvUwPeSEix7qTrjCyEQgluQ0IV0g5XNxFWo3FPsyb75gu8RF7Zaz0j0lxrEFM7Otmu
         WATw==
X-Gm-Message-State: AO0yUKXDWNv/i6X+Q5zZxbBtVV/BogYztTqr+apTbCj5Ss8lQa35TbSz
	NS8Rzzpa++pvMZeoMXayLIgiTrYGuweLicUmQhI=
X-Google-Smtp-Source: AK7set+CBRYmZN/6mBz3eui6lQkaRxqND04qll3pYIhBT8YJL2QvdB6beEN0RN/N8NDhR4GSD+bZcNymEE3CVuK+ReE=
X-Received: by 2002:a67:b142:0:b0:412:bca:d304 with SMTP id
 z2-20020a67b142000000b004120bcad304mr9765629vsl.7.1678190234133; Tue, 07 Mar
 2023 03:57:14 -0800 (PST)
MIME-Version: 1.0
References: <20230307024839.2150555-1-mingli.yu@eng.windriver.com>
In-Reply-To: <20230307024839.2150555-1-mingli.yu@eng.windriver.com>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Tue, 7 Mar 2023 11:57:03 +0000
Message-ID: <CANPvuR=WA4uQbtSk66+hMO8UJ=KY3vTgRh=9zY9gVehbOEetcw@mail.gmail.com>
Subject: Re: [meta-virtualization] [PATCH] yq: Drop {LINKSHARED}
To: "Yu, Mingli" <mingli.yu@eng.windriver.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="000000000000c56b6605f64e1ce6"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 07 Mar 2023 11:57:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7931

--000000000000c56b6605f64e1ce6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

Yu, Mingli <mingli.yu@eng.windriver.com> escreveu no dia ter=C3=A7a, 7/03/2=
023
=C3=A0(s) 02:48:

> From: Mingli Yu <mingli.yu@windriver.com>
>
> Drop {LINKSHARED} to fix the below build failure.
>  WARNING:
> /build/tmp-glibc/work/cortexa53-wrs-linux/yq/4.30.8+gitdd6cf3df146f3e2c0f=
8c765a6ef9e35780ad8cc1-r0/temp/run.do_compile.923432:185
> exit 1 from 'aarch64-wrs-linux-go install -linkshared -p 48 -v -ldflags=
=3D"-r
> /usr/lib64/go/pkg/linux_arm64_dynlink  -I /lib64/ld-linux-aarch64.so.1
> -extldflags ' -mcpu=3Dcortex-a53 -march=3Darmv8-a+crc -fstack-protector-s=
trong
> -O2 -D_FORTIFY_SOURCE=3D2 -Wformat -Wformat-security -Werror=3Dformat-sec=
urity
> --sysroot=3D/build/tmp-glibc/work/cortexa53-wrs-linux/yq/4.30.8+gitdd6cf3=
df146f3e2c0f8c765a6ef9e35780ad8cc1-r0/recipe-sysroot
> -Wl,-rpath-link=3D/build/tmp-glibc/work/cortexa53-wrs-linux/yq/4.30.8+git=
dd6cf3df146f3e2c0f8c765a6ef9e35780ad8cc1-r0/recipe-sysroot/usr/lib64/go/pkg=
/linux_arm64_dynlink
> -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed
> -fmacro-prefix-map=3D/build/tmp-glibc/work/cortexa53-wrs-linux/yq/4.30.8+=
gitdd6cf3df146f3e2c0f8c765a6ef9e35780ad8cc1-r0/yq-4.30.8+gitdd6cf3df146f3e2=
c0f8c765a6ef9e35780ad8cc1=3D/usr/src/debug/yq/4.30.8+gitdd6cf3df146f3e2c0f8=
c765a6ef9e35780ad8cc1-r0
> -fdebug-prefix-map=3D/build/tmp-glibc/work/cortexa53-wrs-linux/yq/4.30.8+=
gitdd6cf3df146f3e2c0f8c765a6ef9e35780ad8cc1-r0/yq-4.30.8+gitdd6cf3df146f3e2=
c0f8c765a6ef9e35780ad8cc1=3D/usr/src/debug/yq/4.30.8+gitdd6cf3df146f3e2c0f8=
c765a6ef9e35780ad8cc1-r0
> -fmacro-prefix-map=3D/build/tmp-glibc/work/cortexa53-wrs-linux/yq/4.30.8+=
gitdd6cf3df146f3e2c0f8c765a6ef9e35780ad8cc1-r0/build=3D/usr/src/debug/yq/4.=
30.8+gitdd6cf3df146f3e2c0f8c765a6ef9e35780ad8cc1-r0
> -fdebug-prefix-map=3D/build/tmp-glibc/work/cortexa53-wrs-linux/yq/4.30.8+=
gitdd6cf3df146f3e2c0f8c765a6ef9e35780ad8cc1-r0/build=3D/usr/src/debug/yq/4.=
30.8+gitdd6cf3df146f3e2c0f8c765a6ef9e35780ad8cc1-r0
> -fdebug-prefix-map=3D/build/tmp-glibc/work/cortexa53-wrs-linux/yq/4.30.8+=
gitdd6cf3df146f3e2c0f8c765a6ef9e35780ad8cc1-r0/recipe-sysroot=3D
> -fmacro-prefix-map=3D/build/tmp-glibc/work/cortexa53-wrs-linux/yq/4.30.8+=
gitdd6cf3df146f3e2c0f8c765a6ef9e35780ad8cc1-r0/recipe-sysroot=3D
> -fdebug-prefix-map=3D/build/tmp-glibc/work/cortexa53-wrs-linux/yq/4.30.8+=
gitdd6cf3df146f3e2c0f8c765a6ef9e35780ad8cc1-r0/recipe-sysroot-native=3D
> -Wl,-z,relro,-z,now'" -trimpath -buildmode=3Dpie `go_list_packages`'
>
> Before the patch:
>  # rpm -ql yq
>  /usr
>  /usr/bin
>  /usr/bin/yq
>
>  # du -sh /usr/bin/yq
>  5.2M   /usr/bin/yq
>
> After the patch:
>  # rpm -ql yq
>  /usr
>  /usr/bin
>  /usr/bin/yq
>
>  # du -sh /usr/bin/yq
>  9.0M   /usr/bin/yq
>
> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> ---
>  recipes-devtools/yq/yq_git.bb | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/recipes-devtools/yq/yq_git.bb b/recipes-devtools/yq/yq_git.b=
b
> index 45f2f970..b3e00473 100644
> --- a/recipes-devtools/yq/yq_git.bb
> +++ b/recipes-devtools/yq/yq_git.bb
> @@ -50,6 +50,13 @@ GO_IMPORT =3D "github.com/mikefarah/yq"
>
>  inherit go ptest
>
> +go_do_compile() {
> +       export TMPDIR=3D"${GOTMPDIR}"
> +       if [ -n "${GO_INSTALL}" ]; then
> +               ${GO} install ${GOBUILDFLAGS} `go_list_packages`
> +       fi
> +}
>

I wonder if it would be more appropriate to disable the linkshared
with  GO_LINKSHARED =3D ""

Jose

+
>  do_compile:prepend() {
>      # arrange for some of the golang built ins to be found
>      (
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7929):
> https://lists.yoctoproject.org/g/meta-virtualization/message/7929
> Mute This Topic: https://lists.yoctoproject.org/mt/97442079/5052612
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [
> quaresma.jose@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--000000000000c56b6605f64e1ce6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi</div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">Yu, Mingli &lt;<a href=3D"mailto:mingli.yu@eng.wind=
river.com">mingli.yu@eng.windriver.com</a>&gt; escreveu no dia ter=C3=A7a, =
7/03/2023 =C3=A0(s) 02:48:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">From: Mingli Yu &lt;<a href=3D"mailto:mingli.yu@windriver.com" t=
arget=3D"_blank">mingli.yu@windriver.com</a>&gt;<br>
<br>
Drop {LINKSHARED} to fix the below build failure.<br>
=C2=A0WARNING: /build/tmp-glibc/work/cortexa53-wrs-linux/yq/4.30.8+gitdd6cf=
3df146f3e2c0f8c765a6ef9e35780ad8cc1-r0/temp/run.do_compile.923432:185 exit =
1 from &#39;aarch64-wrs-linux-go install -linkshared -p 48 -v -ldflags=3D&q=
uot;-r /usr/lib64/go/pkg/linux_arm64_dynlink=C2=A0 -I /lib64/ld-linux-aarch=
64.so.1=C2=A0 -extldflags &#39; -mcpu=3Dcortex-a53 -march=3Darmv8-a+crc -fs=
tack-protector-strong=C2=A0 -O2 -D_FORTIFY_SOURCE=3D2 -Wformat -Wformat-sec=
urity -Werror=3Dformat-security --sysroot=3D/build/tmp-glibc/work/cortexa53=
-wrs-linux/yq/4.30.8+gitdd6cf3df146f3e2c0f8c765a6ef9e35780ad8cc1-r0/recipe-=
sysroot -Wl,-rpath-link=3D/build/tmp-glibc/work/cortexa53-wrs-linux/yq/4.30=
.8+gitdd6cf3df146f3e2c0f8c765a6ef9e35780ad8cc1-r0/recipe-sysroot/usr/lib64/=
go/pkg/linux_arm64_dynlink -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
fmacro-prefix-map=3D/build/tmp-glibc/work/cortexa53-wrs-linux/yq/4.30.8+git=
dd6cf3df146f3e2c0f8c765a6ef9e35780ad8cc1-r0/yq-4.30.8+gitdd6cf3df146f3e2c0f=
8c765a6ef9e35780ad8cc1=3D/usr/src/debug/yq/4.30.8+gitdd6cf3df146f3e2c0f8c76=
5a6ef9e35780ad8cc1-r0=C2=A0 -fdebug-prefix-map=3D/build/tmp-glibc/work/cort=
exa53-wrs-linux/yq/4.30.8+gitdd6cf3df146f3e2c0f8c765a6ef9e35780ad8cc1-r0/yq=
-4.30.8+gitdd6cf3df146f3e2c0f8c765a6ef9e35780ad8cc1=3D/usr/src/debug/yq/4.3=
0.8+gitdd6cf3df146f3e2c0f8c765a6ef9e35780ad8cc1-r0=C2=A0 -fmacro-prefix-map=
=3D/build/tmp-glibc/work/cortexa53-wrs-linux/yq/4.30.8+gitdd6cf3df146f3e2c0=
f8c765a6ef9e35780ad8cc1-r0/build=3D/usr/src/debug/yq/4.30.8+gitdd6cf3df146f=
3e2c0f8c765a6ef9e35780ad8cc1-r0=C2=A0 -fdebug-prefix-map=3D/build/tmp-glibc=
/work/cortexa53-wrs-linux/yq/4.30.8+gitdd6cf3df146f3e2c0f8c765a6ef9e35780ad=
8cc1-r0/build=3D/usr/src/debug/yq/4.30.8+gitdd6cf3df146f3e2c0f8c765a6ef9e35=
780ad8cc1-r0=C2=A0 -fdebug-prefix-map=3D/build/tmp-glibc/work/cortexa53-wrs=
-linux/yq/4.30.8+gitdd6cf3df146f3e2c0f8c765a6ef9e35780ad8cc1-r0/recipe-sysr=
oot=3D=C2=A0 -fmacro-prefix-map=3D/build/tmp-glibc/work/cortexa53-wrs-linux=
/yq/4.30.8+gitdd6cf3df146f3e2c0f8c765a6ef9e35780ad8cc1-r0/recipe-sysroot=3D=
=C2=A0 -fdebug-prefix-map=3D/build/tmp-glibc/work/cortexa53-wrs-linux/yq/4.=
30.8+gitdd6cf3df146f3e2c0f8c765a6ef9e35780ad8cc1-r0/recipe-sysroot-native=
=3D=C2=A0 -Wl,-z,relro,-z,now&#39;&quot; -trimpath -buildmode=3Dpie `go_lis=
t_packages`&#39;<br>
<br>
Before the patch:<br>
=C2=A0# rpm -ql yq<br>
=C2=A0/usr<br>
=C2=A0/usr/bin<br>
=C2=A0/usr/bin/yq<br>
<br>
=C2=A0# du -sh /usr/bin/yq<br>
=C2=A05.2M=C2=A0 =C2=A0/usr/bin/yq<br>
<br>
After the patch:<br>
=C2=A0# rpm -ql yq<br>
=C2=A0/usr<br>
=C2=A0/usr/bin<br>
=C2=A0/usr/bin/yq<br>
<br>
=C2=A0# du -sh /usr/bin/yq<br>
=C2=A09.0M=C2=A0 =C2=A0/usr/bin/yq<br>
<br>
Signed-off-by: Mingli Yu &lt;<a href=3D"mailto:mingli.yu@windriver.com" tar=
get=3D"_blank">mingli.yu@windriver.com</a>&gt;<br>
---<br>
=C2=A0recipes-devtools/yq/<a href=3D"http://yq_git.bb" rel=3D"noreferrer" t=
arget=3D"_blank">yq_git.bb</a> | 7 +++++++<br>
=C2=A01 file changed, 7 insertions(+)<br>
<br>
diff --git a/recipes-devtools/yq/<a href=3D"http://yq_git.bb" rel=3D"norefe=
rrer" target=3D"_blank">yq_git.bb</a> b/recipes-devtools/yq/<a href=3D"http=
://yq_git.bb" rel=3D"noreferrer" target=3D"_blank">yq_git.bb</a><br>
index 45f2f970..b3e00473 100644<br>
--- a/recipes-devtools/yq/<a href=3D"http://yq_git.bb" rel=3D"noreferrer" t=
arget=3D"_blank">yq_git.bb</a><br>
+++ b/recipes-devtools/yq/<a href=3D"http://yq_git.bb" rel=3D"noreferrer" t=
arget=3D"_blank">yq_git.bb</a><br>
@@ -50,6 +50,13 @@ GO_IMPORT =3D &quot;<a href=3D"http://github.com/mikefar=
ah/yq" rel=3D"noreferrer" target=3D"_blank">github.com/mikefarah/yq</a>&quo=
t;<br>
<br>
=C2=A0inherit go ptest<br>
<br>
+go_do_compile() {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0export TMPDIR=3D&quot;${GOTMPDIR}&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if [ -n &quot;${GO_INSTALL}&quot; ]; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${GO} install ${GOB=
UILDFLAGS} `go_list_packages`<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
+}<br></blockquote><div><br>I wonder if it would be more appropriate to dis=
able=C2=A0the linkshared with=C2=A0=C2=A0GO_LINKSHARED =3D &quot;&quot;</di=
v><div>=C2=A0<br>Jose<br><br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
+<br>
=C2=A0do_compile:prepend() {<br>
=C2=A0 =C2=A0 =C2=A0# arrange for some of the golang built ins to be found<=
br>
=C2=A0 =C2=A0 =C2=A0(<br>
-- <br>
2.25.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#7929): <a href=3D"https://lists.yoctoproject.org/g/meta=
-virtualization/message/7929" rel=3D"noreferrer" target=3D"_blank">https://=
lists.yoctoproject.org/g/meta-virtualization/message/7929</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/97442079/5052=
612" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/mt=
/97442079/5052612</a><br>
Group Owner: <a href=3D"mailto:meta-virtualization%2Bowner@lists.yoctoproje=
ct.org" target=3D"_blank">meta-virtualization+owner@lists.yoctoproject.org<=
/a><br>
Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/meta-virtualizatio=
n/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.or=
g/g/meta-virtualization/unsub</a> [<a href=3D"mailto:quaresma.jose@gmail.co=
m" target=3D"_blank">quaresma.jose@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</div></div></div></=
div>

--000000000000c56b6605f64e1ce6--

