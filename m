Return-Path: <marek.belisko@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03EFACD80D1
	for <webhook@archiver.kernel.org>; Tue, 10 Oct 2023 13:17:39 +0000 (UTC)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
 by mx.groups.io with SMTP id smtpd.web11.90795.1696943854652258318
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 10 Oct 2023 06:17:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CE8MqyVZ;
 spf=pass (domain: gmail.com, ip: 209.85.208.172, mailfrom: marek.belisko@gmail.com)
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2bff776fe0bso73075881fa.0
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 10 Oct 2023 06:17:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696943852; x=1697548652; darn=lists.yoctoproject.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=kSHZu+0XkQ4bDhgscAaNZN8OsB9bJAb/6Jhtobo2Vwg=;
        b=CE8MqyVZO/FsnzXHnvr95+RrnrxEcvWd2sE8g4iODYujqzKYj4i8C8YVnfQGVewDsJ
         In5EsFoJZoQV27U9gnPaGwAiWvqML9ZjulHW7X8d1r/SajKmvYrvPf7KFE7OYqzOssK2
         SIvCmGRvwfQ6ky2isf1Qcriqrr7y/2EIbedKsThpHYni9ulvbKCmzyN3svaWl1b+zt2N
         96GvqAjwUL2rMi3Y05u8+FLN7OWqLVh5YxeZOaW5M9KEfOTw8wpjysFGq0NLdeGC77Ct
         ozDUb1csA/yyUU1bLMgK20lQOUVawqC2gXXmmbAlsfx/zb0Qdtf4qmAI2I3Fu+5J76yk
         81TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696943852; x=1697548652;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kSHZu+0XkQ4bDhgscAaNZN8OsB9bJAb/6Jhtobo2Vwg=;
        b=D7rYElJaitbqIM36ugNTDGeZ8oYIcAMLji/J3fUiYsUggaENMDQB9NyRtyycfBrIts
         TXgD8bPQdsQSAnbfnJMGuway+jO96ehPF2FdxC56WA/M1xe/2rQxquELmoqXPRqlORhl
         DGBhG78xEqR140/+o8YftD9N4i9qjz3pjcRymLWQKg67/IRcSlel/zvwzk9F6KTjcT3x
         lluliB40tkyAZZzrxhnw3yUFKzsK+3yObaDBLtG6a4F+9uX2KObXQIxES3PNEkaZm52B
         SvwyctSH0hHDyEn1LaQyrk4PA8ocp6pI0UPGNh7p7gJhRfEbYS2y8bvOnKjRZbgE5ZnR
         xWWw==
X-Gm-Message-State: AOJu0YxdRJjwljziQ405Up8aDencGAxoGqAFI8dHmfmW2MRQAOnJwRdK
	KTN0JyO0XHumvsKUJGdL3owvepH30PxTCgB70+Xe2glro3Q=
X-Google-Smtp-Source: AGHT+IHDqdKPqbg5OgOcYky3Kcu+orc4lBwBJ/TdowCcRLI3VyAs9RA5nXO3BLQWplWE3jZ636UsHVxrbBA+DjOEUIA=
X-Received: by 2002:a2e:b0f2:0:b0:2b9:4b2e:5420 with SMTP id
 h18-20020a2eb0f2000000b002b94b2e5420mr15649069ljl.52.1696943851960; Tue, 10
 Oct 2023 06:17:31 -0700 (PDT)
MIME-Version: 1.0
From: Belisko Marek <marek.belisko@gmail.com>
Date: Tue, 10 Oct 2023 15:17:18 +0200
Message-ID: <CAAfyv36CATBWC1vL6Bucq-JsJW4djFK50-kRHX6MxwizV9m2+g@mail.gmail.com>
Subject: backporting netavark from master to kirkstone
To: meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="00000000000080002706075c876b"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 10 Oct 2023 13:17:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8344

--00000000000080002706075c876b
Content-Type: text/plain; charset="UTF-8"

Hi,

I'm trying to backport netavark recipe 1.8.0 to kirkstone (where is 1.1.0
present) but facing some issues. I've used cargo bitbake to generate recipe
but when run build it fails with:
| DEBUG: Executing shell function do_compile
| NOTE: cargo =
/data/projects/test/project/build/tmp/work/cortexa53-crypto-poky-linux/netavark/1.8.0-r0/recipe-sysroot-native/usr/bin/cargo
| NOTE: rustc =
| NOTE: cargo build -v --target aarch64-poky-linux --release
--manifest-path=/data/projects/test/project/build/tmp/work/cortexa53-crypto-poky-linux/netavark/1.8.0-r0/git//Cargo.toml
| error: failed to get `anyhow` as a dependency of package `netavark v1.8.0
(/data/projects/test/project/build/tmp/work/cortexa53-crypto-poky-linux/netavark/1.8.0-r0/git)`
|
| Caused by:
|   failed to load source for dependency `anyhow`
|
| Caused by:
|   Unable to update registry `crates-io`
|
| Caused by:
|   failed to update replaced source registry `crates-io`
|
| Caused by:
|   failed to parse manifest at
`/data/projects/test/project/build/tmp/work/cortexa53-crypto-poky-linux/netavark/1.8.0-r0/cargo_home/bitbake/regex-1.9.5/Cargo.toml`
|
| Caused by:
|   namespaced features with the `dep:` prefix are only allowed on the
nightly channel and requires the `-Z namespaced-features` flag on the
command-line
| WARNING: exit code 101 from a shell command.


Does that mean I would also need to backport new cargo or so to compile it?
Is is even possible please?

Thanks and BR,

marek

-- 
as simple and primitive as possible
-------------------------------------------------
Marek Belisko - OPEN-NANDRA
Freelance Developer

Ruska Nova Ves 219 | Presov, 08005 Slovak Republic
Tel: +421 915 052 184
skype: marekwhite
twitter: #opennandra
web: http://open-nandra.com

--00000000000080002706075c876b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div><br></div><div>I&#39;m trying to backport netavark=
 recipe 1.8.0 to kirkstone (where is 1.1.0 present) but facing some issues.=
 I&#39;ve used cargo bitbake to generate recipe but when run build it fails=
 with:<br>| DEBUG: Executing shell function do_compile<br>| NOTE: cargo =3D=
 /data/projects/test/project/build/tmp/work/cortexa53-crypto-poky-linux/net=
avark/1.8.0-r0/recipe-sysroot-native/usr/bin/cargo<br>| NOTE: rustc =3D<br>=
| NOTE: cargo build -v --target aarch64-poky-linux --release --manifest-pat=
h=3D/data/projects/test/project/build/tmp/work/cortexa53-crypto-poky-linux/=
netavark/1.8.0-r0/git//Cargo.toml<br>| error: failed to get `anyhow` as a d=
ependency of package `netavark v1.8.0 (/data/projects/test/project/build/tm=
p/work/cortexa53-crypto-poky-linux/netavark/1.8.0-r0/git)`<br>| <br>| Cause=
d by:<br>| =C2=A0 failed to load source for dependency `anyhow`<br>| <br>| =
Caused by:<br>| =C2=A0 Unable to update registry `crates-io`<br>| <br>| Cau=
sed by:<br>| =C2=A0 failed to update replaced source registry `crates-io`<b=
r>| <br>| Caused by:<br>| =C2=A0 failed to parse manifest at `/data/project=
s/test/project/build/tmp/work/cortexa53-crypto-poky-linux/netavark/1.8.0-r0=
/cargo_home/bitbake/regex-1.9.5/Cargo.toml`<br>| <br>| Caused by:<br>| =C2=
=A0 namespaced features with the `dep:` prefix are only allowed on the nigh=
tly channel and requires the `-Z namespaced-features` flag on the command-l=
ine<br>| WARNING: exit code 101 from a shell command.<br><div><br></div><di=
v><br></div><div>Does that mean I would also need to backport new cargo or =
so to compile it? Is is even possible please?</div><div><br></div><div>Than=
ks and BR,</div><div><br></div><div>marek</div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature" data-smartmail=3D"gmail_signature">as simple and primitive as pos=
sible<br>-------------------------------------------------<br>Marek Belisko=
 - OPEN-NANDRA<br>Freelance Developer<br><br>Ruska Nova Ves 219 | Presov, 0=
8005 Slovak Republic<br>Tel: +421 915 052 184<br>skype: marekwhite<br>twitt=
er: #opennandra<br>web: <a href=3D"http://open-nandra.com" target=3D"_blank=
">http://open-nandra.com</a></div></div></div>

--00000000000080002706075c876b--

