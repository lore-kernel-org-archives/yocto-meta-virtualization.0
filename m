Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFE2DC678D4
	for <webhook@archiver.kernel.org>; Tue,  7 Mar 2023 13:54:44 +0000 (UTC)
Received: from mail-io1-f47.google.com (mail-io1-f47.google.com [209.85.166.47])
 by mx.groups.io with SMTP id smtpd.web11.15637.1678197275774727732
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 07 Mar 2023 05:54:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=TW7RZt+J;
 spf=pass (domain: gmail.com, ip: 209.85.166.47, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-io1-f47.google.com with SMTP id y140so5424811iof.6
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 07 Mar 2023 05:54:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678197275;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YmYL8mmd1CvxEuIhEpIy8JFW80/mAiQfTnePX78TTv8=;
        b=TW7RZt+JECNhCsozeck7L0/kAcbmZ0WJjuYWhF/2CwyoI4Hg8YsrFDR1PXkPSsCqg4
         iwfboJFnKUoSnE3kkUzKZhEBI+QPXClgNvNjBPPSDI2qJ++pLtb4SAJS38m90wTx6PFs
         85nz9SylRR+SQIgHP4Ts7jtgDMZuYKnteuyhAaDPlTubMPup7NHM/j1VTWxlhnYeS3QA
         K8XHmUZ5o495SgBGKTIwMR9m6SjKNZN/sA/bk8bL0AFe2kxWimS652ePn+1kCUB6YQYk
         IPjnJzHIj38tDDen3Kc7Artn2FUTcWBihJ/605Ba2YjWeYEUfmsuvyMD7b5n+DSIC7pf
         tVZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678197275;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YmYL8mmd1CvxEuIhEpIy8JFW80/mAiQfTnePX78TTv8=;
        b=3l3yFuhOg8e9CJtMGGPs2QfPbmQaYYVhI3oEB39kBqBl7uObZhFzOYFotEr5uwTHeV
         ORiq/ZpQyiW/ugqol2cUPXg3blDURLR7RvFWpDeV+dZFWUWgVr2s1RPuXugVXQoboK9T
         gyITti+atyIOMpQK88rGxTS2FUNH6dRBBR4Xt62AX2rcGtxhn2VQlMR0FUyxegLVDsjo
         P+sRSnSMkZjy0GZGe5FNd2s1LDC+Qkp2rQOWKH4SjszW7hGACM4UyvOGw09RSzi2Uggr
         NnWozQmNuG0/Lk9RmSe/dDDXTv7Ii9F/NCqV65hQet3XOFQqQf9TqRqJTC35/H2pyNF0
         jxrg==
X-Gm-Message-State: AO0yUKUszDNdi+EmDqsjtv64P4DQ64jyqhxZC9XdrIdrSbX4J9dMjC4f
	0EqM/3qGLdn9xPsiSJXiAR3hTIitoA/Htj5QEZw=
X-Google-Smtp-Source: AK7set9a5G7MSpNdonYwelqUP8VeIGy9hLe/YaAv2JbT3yi9u73WeyETVclT/f/gXXhDt7kCNebUdeD38T8ja+8W4aY=
X-Received: by 2002:a05:6602:20c2:b0:745:4154:b571 with SMTP id
 2-20020a05660220c200b007454154b571mr6860527ioz.3.1678197274842; Tue, 07 Mar
 2023 05:54:34 -0800 (PST)
MIME-Version: 1.0
References: <20230307024839.2150555-1-mingli.yu@eng.windriver.com> <CANPvuR=WA4uQbtSk66+hMO8UJ=KY3vTgRh=9zY9gVehbOEetcw@mail.gmail.com>
In-Reply-To: <CANPvuR=WA4uQbtSk66+hMO8UJ=KY3vTgRh=9zY9gVehbOEetcw@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 7 Mar 2023 08:54:23 -0500
Message-ID: <CADkTA4Ooi+Y0Nq=eJY+KwEDVe+jUTht_tpzFqF_wmrf4kj7gBQ@mail.gmail.com>
Subject: Re: [meta-virtualization] [PATCH] yq: Drop {LINKSHARED}
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: "Yu, Mingli" <mingli.yu@eng.windriver.com>, meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 07 Mar 2023 13:54:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7932

On Tue, Mar 7, 2023 at 6:57=E2=80=AFAM Jose Quaresma <quaresma.jose@gmail.c=
om> wrote:
>
> Hi
>
> Yu, Mingli <mingli.yu@eng.windriver.com> escreveu no dia ter=C3=A7a, 7/03=
/2023 =C3=A0(s) 02:48:
>>
>> From: Mingli Yu <mingli.yu@windriver.com>
>>
>> Drop {LINKSHARED} to fix the below build failure.
>>  WARNING: /build/tmp-glibc/work/cortexa53-wrs-linux/yq/4.30.8+gitdd6cf3d=
f146f3e2c0f8c765a6ef9e35780ad8cc1-r0/temp/run.do_compile.923432:185 exit 1 =
from 'aarch64-wrs-linux-go install -linkshared -p 48 -v -ldflags=3D"-r /usr=
/lib64/go/pkg/linux_arm64_dynlink  -I /lib64/ld-linux-aarch64.so.1  -extldf=
lags ' -mcpu=3Dcortex-a53 -march=3Darmv8-a+crc -fstack-protector-strong  -O=
2 -D_FORTIFY_SOURCE=3D2 -Wformat -Wformat-security -Werror=3Dformat-securit=
y --sysroot=3D/build/tmp-glibc/work/cortexa53-wrs-linux/yq/4.30.8+gitdd6cf3=
df146f3e2c0f8c765a6ef9e35780ad8cc1-r0/recipe-sysroot -Wl,-rpath-link=3D/bui=
ld/tmp-glibc/work/cortexa53-wrs-linux/yq/4.30.8+gitdd6cf3df146f3e2c0f8c765a=
6ef9e35780ad8cc1-r0/recipe-sysroot/usr/lib64/go/pkg/linux_arm64_dynlink -Wl=
,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -fmacro-prefix-map=3D/build/tmp=
-glibc/work/cortexa53-wrs-linux/yq/4.30.8+gitdd6cf3df146f3e2c0f8c765a6ef9e3=
5780ad8cc1-r0/yq-4.30.8+gitdd6cf3df146f3e2c0f8c765a6ef9e35780ad8cc1=3D/usr/=
src/debug/yq/4.30.8+gitdd6cf3df146f3e2c0f8c765a6ef9e35780ad8cc1-r0  -fdebug=
-prefix-map=3D/build/tmp-glibc/work/cortexa53-wrs-linux/yq/4.30.8+gitdd6cf3=
df146f3e2c0f8c765a6ef9e35780ad8cc1-r0/yq-4.30.8+gitdd6cf3df146f3e2c0f8c765a=
6ef9e35780ad8cc1=3D/usr/src/debug/yq/4.30.8+gitdd6cf3df146f3e2c0f8c765a6ef9=
e35780ad8cc1-r0  -fmacro-prefix-map=3D/build/tmp-glibc/work/cortexa53-wrs-l=
inux/yq/4.30.8+gitdd6cf3df146f3e2c0f8c765a6ef9e35780ad8cc1-r0/build=3D/usr/=
src/debug/yq/4.30.8+gitdd6cf3df146f3e2c0f8c765a6ef9e35780ad8cc1-r0  -fdebug=
-prefix-map=3D/build/tmp-glibc/work/cortexa53-wrs-linux/yq/4.30.8+gitdd6cf3=
df146f3e2c0f8c765a6ef9e35780ad8cc1-r0/build=3D/usr/src/debug/yq/4.30.8+gitd=
d6cf3df146f3e2c0f8c765a6ef9e35780ad8cc1-r0  -fdebug-prefix-map=3D/build/tmp=
-glibc/work/cortexa53-wrs-linux/yq/4.30.8+gitdd6cf3df146f3e2c0f8c765a6ef9e3=
5780ad8cc1-r0/recipe-sysroot=3D  -fmacro-prefix-map=3D/build/tmp-glibc/work=
/cortexa53-wrs-linux/yq/4.30.8+gitdd6cf3df146f3e2c0f8c765a6ef9e35780ad8cc1-=
r0/recipe-sysroot=3D  -fdebug-prefix-map=3D/build/tmp-glibc/work/cortexa53-=
wrs-linux/yq/4.30.8+gitdd6cf3df146f3e2c0f8c765a6ef9e35780ad8cc1-r0/recipe-s=
ysroot-native=3D  -Wl,-z,relro,-z,now'" -trimpath -buildmode=3Dpie `go_list=
_packages`'
>>
>> Before the patch:
>>  # rpm -ql yq
>>  /usr
>>  /usr/bin
>>  /usr/bin/yq
>>
>>  # du -sh /usr/bin/yq
>>  5.2M   /usr/bin/yq
>>
>> After the patch:
>>  # rpm -ql yq
>>  /usr
>>  /usr/bin
>>  /usr/bin/yq
>>
>>  # du -sh /usr/bin/yq
>>  9.0M   /usr/bin/yq
>>
>> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
>> ---
>>  recipes-devtools/yq/yq_git.bb | 7 +++++++
>>  1 file changed, 7 insertions(+)
>>
>> diff --git a/recipes-devtools/yq/yq_git.bb b/recipes-devtools/yq/yq_git.=
bb
>> index 45f2f970..b3e00473 100644
>> --- a/recipes-devtools/yq/yq_git.bb
>> +++ b/recipes-devtools/yq/yq_git.bb
>> @@ -50,6 +50,13 @@ GO_IMPORT =3D "github.com/mikefarah/yq"
>>
>>  inherit go ptest
>>
>> +go_do_compile() {
>> +       export TMPDIR=3D"${GOTMPDIR}"
>> +       if [ -n "${GO_INSTALL}" ]; then
>> +               ${GO} install ${GOBUILDFLAGS} `go_list_packages`
>> +       fi
>> +}
>
>
> I wonder if it would be more appropriate to disable the linkshared with  =
GO_LINKSHARED =3D ""
>

That didn't fix the buildah problem, but yes, this one could be
different in the solution.

That being said, I still suggest an entirely new do_compile(), to keep
control in the recipe.

Bruce

> Jose
>
>> +
>>  do_compile:prepend() {
>>      # arrange for some of the golang built ins to be found
>>      (
>> --
>> 2.25.1
>>
>>
>>
>>
>
>
> --
> Best regards,
>
> Jos=C3=A9 Quaresma
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7931): https://lists.yoctoproject.org/g/meta-virtuali=
zation/message/7931
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

