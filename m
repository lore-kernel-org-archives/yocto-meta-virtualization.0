Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BB57C61DA4
	for <webhook@archiver.kernel.org>; Tue,  7 Mar 2023 03:47:42 +0000 (UTC)
Received: from mail-il1-f172.google.com (mail-il1-f172.google.com [209.85.166.172])
 by mx.groups.io with SMTP id smtpd.web11.6861.1678160860262906184
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 06 Mar 2023 19:47:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Jg4REtaf;
 spf=pass (domain: gmail.com, ip: 209.85.166.172, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-il1-f172.google.com with SMTP id j8so2962265ilf.4
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 06 Mar 2023 19:47:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678160859;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KZB8wbeo+9fcTRNfm8gBK6rlCJPxc5r85AaCCffbTQc=;
        b=Jg4REtafHAXtDVyHE1ggcv/s/pwPArTq5R0xQMq2OR42+8E+8PC8cYQWUAcOKP4sf2
         PkAg6BaS4bc8QSXCpvvtctUvKHLCzmEmx8RPmzlgndQOkB6YCVuB54zSlRug7+XMar2B
         YbR6s71UnB61ZGgAtBuRTJbAW7sq06AigjQuCmWwR9SlFSUDz0Ri77nhjUK8kX/4R5A5
         MmHJNAYKwp81dXPiA9BqUfidU2iOewAlmxIrgEnfMROQaFPxtnDK4FHE5u1T+pFbfkJH
         DdFoBqZ+EzFBca9z1r0NVqDWAls9DQDJBfNyZ+y9/HHSTazk88Nq4PbsWPgBf0k4bHfY
         VRuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678160859;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KZB8wbeo+9fcTRNfm8gBK6rlCJPxc5r85AaCCffbTQc=;
        b=F6hcYEpR8/Iwf9EYUhOr/nuZtRyq3z7lswR7/UMFtImbwxB10s/SWG3IZrgDa6+Pha
         NJ8TXYjBhWOuX0i8WZ4O2qqBfmdvR/mdxUFJam0AoAvd9jOtvf7LGovToIU2GtiqjsA7
         S+qLA7c/pCXgXrFaUBdLfmSiKtbtYxH/KhQ1Q5N+WSJ6AMlpR/4RduqJx8Fzz1pzV83C
         F5RUbZvc0EnnYgAjPtdDtdqL79NBOU2ejNjImv++zFxD0JmXFFyFEuoMg6eYk6Xjs9GV
         OeMYJbceFnUD3oWwPvHUAl0/YREUIfwehF6K3bhuXWsmvVoN3B4pZ5CBFjJClK0KkufN
         nrHw==
X-Gm-Message-State: AO0yUKU9BvVIUsE5ranjWHF1N4mFlBU6WpzZcHkyVavnQByRmeudYrrh
	HNj3A4wx/pEFh12z/NryRUNKJZqqCd9KZ+hvVaZAsr0TBUQ=
X-Google-Smtp-Source: AK7set9rUfZ5Cl/gibtlJ/x5e/lJAqkfVgJVutChlZ/cconR7201jTaItFI9kpoZpXeF6Sy3z++DxnlH3ZOydwrCQL4=
X-Received: by 2002:a05:6e02:13f4:b0:310:9fc1:a92b with SMTP id
 w20-20020a056e0213f400b003109fc1a92bmr6891681ilj.0.1678160859428; Mon, 06 Mar
 2023 19:47:39 -0800 (PST)
MIME-Version: 1.0
References: <20230307024839.2150555-1-mingli.yu@eng.windriver.com>
In-Reply-To: <20230307024839.2150555-1-mingli.yu@eng.windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 6 Mar 2023 22:47:28 -0500
Message-ID: <CADkTA4PoTVSvCXT5ZrhKRMYOi4dKL7aC74XyEsXYbj+GQFhFuw@mail.gmail.com>
Subject: Re: [meta-virtualization] [PATCH] yq: Drop {LINKSHARED}
To: "Yu, Mingli" <mingli.yu@eng.windriver.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 07 Mar 2023 03:47:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7930

On Mon, Mar 6, 2023 at 9:48=E2=80=AFPM Yu, Mingli <mingli.yu@eng.windriver.=
com> wrote:
>
> From: Mingli Yu <mingli.yu@windriver.com>
>
> Drop {LINKSHARED} to fix the below build failure.
>  WARNING: /build/tmp-glibc/work/cortexa53-wrs-linux/yq/4.30.8+gitdd6cf3df=
146f3e2c0f8c765a6ef9e35780ad8cc1-r0/temp/run.do_compile.923432:185 exit 1 f=
rom 'aarch64-wrs-linux-go install -linkshared -p 48 -v -ldflags=3D"-r /usr/=
lib64/go/pkg/linux_arm64_dynlink  -I /lib64/ld-linux-aarch64.so.1  -extldfl=
ags ' -mcpu=3Dcortex-a53 -march=3Darmv8-a+crc -fstack-protector-strong  -O2=
 -D_FORTIFY_SOURCE=3D2 -Wformat -Wformat-security -Werror=3Dformat-security=
 --sysroot=3D/build/tmp-glibc/work/cortexa53-wrs-linux/yq/4.30.8+gitdd6cf3d=
f146f3e2c0f8c765a6ef9e35780ad8cc1-r0/recipe-sysroot -Wl,-rpath-link=3D/buil=
d/tmp-glibc/work/cortexa53-wrs-linux/yq/4.30.8+gitdd6cf3df146f3e2c0f8c765a6=
ef9e35780ad8cc1-r0/recipe-sysroot/usr/lib64/go/pkg/linux_arm64_dynlink -Wl,=
-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -fmacro-prefix-map=3D/build/tmp-=
glibc/work/cortexa53-wrs-linux/yq/4.30.8+gitdd6cf3df146f3e2c0f8c765a6ef9e35=
780ad8cc1-r0/yq-4.30.8+gitdd6cf3df146f3e2c0f8c765a6ef9e35780ad8cc1=3D/usr/s=
rc/debug/yq/4.30.8+gitdd6cf3df146f3e2c0f8c765a6ef9e35780ad8cc1-r0  -fdebug-=
prefix-map=3D/build/tmp-glibc/work/cortexa53-wrs-linux/yq/4.30.8+gitdd6cf3d=
f146f3e2c0f8c765a6ef9e35780ad8cc1-r0/yq-4.30.8+gitdd6cf3df146f3e2c0f8c765a6=
ef9e35780ad8cc1=3D/usr/src/debug/yq/4.30.8+gitdd6cf3df146f3e2c0f8c765a6ef9e=
35780ad8cc1-r0  -fmacro-prefix-map=3D/build/tmp-glibc/work/cortexa53-wrs-li=
nux/yq/4.30.8+gitdd6cf3df146f3e2c0f8c765a6ef9e35780ad8cc1-r0/build=3D/usr/s=
rc/debug/yq/4.30.8+gitdd6cf3df146f3e2c0f8c765a6ef9e35780ad8cc1-r0  -fdebug-=
prefix-map=3D/build/tmp-glibc/work/cortexa53-wrs-linux/yq/4.30.8+gitdd6cf3d=
f146f3e2c0f8c765a6ef9e35780ad8cc1-r0/build=3D/usr/src/debug/yq/4.30.8+gitdd=
6cf3df146f3e2c0f8c765a6ef9e35780ad8cc1-r0  -fdebug-prefix-map=3D/build/tmp-=
glibc/work/cortexa53-wrs-linux/yq/4.30.8+gitdd6cf3df146f3e2c0f8c765a6ef9e35=
780ad8cc1-r0/recipe-sysroot=3D  -fmacro-prefix-map=3D/build/tmp-glibc/work/=
cortexa53-wrs-linux/yq/4.30.8+gitdd6cf3df146f3e2c0f8c765a6ef9e35780ad8cc1-r=
0/recipe-sysroot=3D  -fdebug-prefix-map=3D/build/tmp-glibc/work/cortexa53-w=
rs-linux/yq/4.30.8+gitdd6cf3df146f3e2c0f8c765a6ef9e35780ad8cc1-r0/recipe-sy=
sroot-native=3D  -Wl,-z,relro,-z,now'" -trimpath -buildmode=3Dpie `go_list_=
packages`'
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

My preference is implement do_compile, versus go_do_compile, since the
go.bbclass rarely does the right thing by default.

There's only one other go_do_compile that slipped through my normal
checks (buildah), and I have a local patch removing it, that I'll push
to master-next shortly. buildah also had linkeshared issues :)

Bruce

> +
>  do_compile:prepend() {
>      # arrange for some of the golang built ins to be found
>      (
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7929): https://lists.yoctoproject.org/g/meta-virtuali=
zation/message/7929
> Mute This Topic: https://lists.yoctoproject.org/mt/97442079/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [=
bruce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

