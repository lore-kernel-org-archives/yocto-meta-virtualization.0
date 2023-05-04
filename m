Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA474C77B7C
	for <webhook@archiver.kernel.org>; Thu,  4 May 2023 12:54:06 +0000 (UTC)
Received: from mail-io1-f49.google.com (mail-io1-f49.google.com [209.85.166.49])
 by mx.groups.io with SMTP id smtpd.web10.48957.1683204841387169188
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 04 May 2023 05:54:01 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=c0f9q1k2;
 spf=pass (domain: gmail.com, ip: 209.85.166.49, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-io1-f49.google.com with SMTP id ca18e2360f4ac-760f29073b4so8052039f.2
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 04 May 2023 05:54:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683204840; x=1685796840;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y6mNQWQgY3s/qywd40OaJA060Dyk+g0FoVjnQ8WSKfE=;
        b=c0f9q1k24l4EiBGpvMEl0Q/sVJfG/vJIr85L8HsgpwtGSZvCfnmMEw/HqxQFBt7HAS
         nC/339fmLg0z9aNm8TZwm2pXNrd4Owo3oGI8AJsjMl+hOmLO9X4SG6DaLbU+4ssfxZOu
         +faAfaCwC0RIH+riU2+KJL/FyHVlbmouaF3Ba+xaIkQc7UJvQkpIveAeA0zn9lQaYyfq
         x0VdIZxf5HQ1fDMRf7DWU1ic+QEdm/DKHNHArMPphi2KaK4M5Q8314XVc1PIgwN92Iqb
         yn70GGeEqTE3xp7JbaJ7hCi6bbbarsb+taYjX6YI3kSE9htZJ6ZZf7NAYRy+z85Em/At
         raaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683204840; x=1685796840;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y6mNQWQgY3s/qywd40OaJA060Dyk+g0FoVjnQ8WSKfE=;
        b=DX64k6ZdafJpJrPKEBa0LjuC809d2k2f6Av9fgXWO4Ezuq9m97+6XwwUMm3rD3shzB
         R1BJJ/fZ1rj3mBQaEDvM/8864pcEtKvVf8p/Jtiwah8MurMPyuSvWCeei9jJBAu9R3Kp
         U4w6jyjH04gO5f+ftniXUWSCKp5bRjJ+0wVIusxya63k133I8H3jcLGoxf2GSfYj38To
         s1zgLJf8kGTzVa5VaEPkkF5QxnoMxUTObSWh/J7bitNG724pj+vctrbfaQzZdRE7dTEo
         jqMs7K2t5AyG9f1Px+rq0HUUkGwSFvRF8dl4AG9xYjEJQhxT0HY/fcMw+iHvTNIz8Qyz
         z/sQ==
X-Gm-Message-State: AC+VfDxoGv+4+BpkrRvBA5Kw5pQ3Tq9z+kJ23J+gPKYSKnkKbAt1suiX
	DbDzmtTMMi1G+Bq5Pto6BJcv+cD3gAmPacUv7nIDc9/3+j4=
X-Google-Smtp-Source: ACHHUZ5acomZGHQ7oUU9yV01lokZPhaPVk9AKCgjv7/uhHYzkEgQxloJBr/VnoCxZRljohBYOkq1VFjMjvwe+umgUg0=
X-Received: by 2002:a5e:dd06:0:b0:755:7b0c:6042 with SMTP id
 t6-20020a5edd06000000b007557b0c6042mr15689936iop.2.1683204840451; Thu, 04 May
 2023 05:54:00 -0700 (PDT)
MIME-Version: 1.0
References: <20230504072905.1065116-1-Martin.Jansa@gmail.com>
In-Reply-To: <20230504072905.1065116-1-Martin.Jansa@gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 4 May 2023 08:53:57 -0400
Message-ID: <CADkTA4OHOjCefJpxcGYVkKGC8zgR60fNcfq_XTfuqdBmhHkhVw@mail.gmail.com>
Subject: Re: [meta-virtualization] [PATCH] k3s, kubernetes, nagios-nrpe: fix
 Upstream-Status formatting
To: Martin Jansa <Martin.Jansa@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 04 May 2023 12:54:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8044

For my next presenter's gift, I want a regex that doesn't nitpick us
on capitals and dashes ;)

Funny that I'm not seeing this, I haven't inhibited the check completely ye=
t.

But my jest / complaint notwithstanding, thanks for the patch, I'll
queue it shortly.

Bruce

On Thu, May 4, 2023 at 3:29=E2=80=AFAM Martin Jansa <Martin.Jansa@gmail.com=
> wrote:
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  .../k3s/k3s/0001-Finding-host-local-in-usr-libexec.patch        | 2 +-
>  .../0001-hack-lib-golang.sh-use-CC-from-environment.patch       | 2 +-
>  ...1-Should-fix-235-nasty_metachars-was-not-being-returne.patch | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/recipes-containers/k3s/k3s/0001-Finding-host-local-in-usr-li=
bexec.patch b/recipes-containers/k3s/k3s/0001-Finding-host-local-in-usr-lib=
exec.patch
> index 524ac2c..12f9941 100644
> --- a/recipes-containers/k3s/k3s/0001-Finding-host-local-in-usr-libexec.p=
atch
> +++ b/recipes-containers/k3s/k3s/0001-Finding-host-local-in-usr-libexec.p=
atch
> @@ -3,7 +3,7 @@ From: Erik Jansson <erikja@axis.com>
>  Date: Wed, 16 Oct 2019 15:07:48 +0200
>  Subject: [PATCH] Finding host-local in /usr/libexec
>
> -Upstream-status: Inappropriate [embedded specific]
> +Upstream-Status: Inappropriate [embedded specific]
>  Signed-off-by: <erikja@axis.com>
>  ---
>   pkg/agent/config/config.go | 2 +-
> diff --git a/recipes-containers/kubernetes/kubernetes/0001-hack-lib-golan=
g.sh-use-CC-from-environment.patch b/recipes-containers/kubernetes/kubernet=
es/0001-hack-lib-golang.sh-use-CC-from-environment.patch
> index c81bd1a..15e8ffa 100644
> --- a/recipes-containers/kubernetes/kubernetes/0001-hack-lib-golang.sh-us=
e-CC-from-environment.patch
> +++ b/recipes-containers/kubernetes/kubernetes/0001-hack-lib-golang.sh-us=
e-CC-from-environment.patch
> @@ -5,7 +5,7 @@ Subject: [PATCH 1/2] hack/lib/golang.sh: use CC from envi=
ronment
>
>  Toolchain tupples differs, especially when using vendor provides ones.
>
> -Upstream-status: Inappropriate [embedded specific]
> +Upstream-Status: Inappropriate [embedded specific]
>  Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
>  ---
>   hack/lib/golang.sh | 5 -----
> diff --git a/recipes-extended/nagios/nagios-nrpe/0001-Should-fix-235-nast=
y_metachars-was-not-being-returne.patch b/recipes-extended/nagios/nagios-nr=
pe/0001-Should-fix-235-nasty_metachars-was-not-being-returne.patch
> index 7a12e73..fb34c5c 100644
> --- a/recipes-extended/nagios/nagios-nrpe/0001-Should-fix-235-nasty_metac=
hars-was-not-being-returne.patch
> +++ b/recipes-extended/nagios/nagios-nrpe/0001-Should-fix-235-nasty_metac=
hars-was-not-being-returne.patch
> @@ -5,7 +5,7 @@ Subject: [PATCH] Should fix #235 (nasty_metachars was not=
 being returned when
>   specified in cfg file
>
>  CVE: CVE-2020-6581
> -Upstream Status: Backport [4f7dd1199f1f3f72f9197e8565da339a4a2490b7]
> +Upstream-Status: Backport [4f7dd1199f1f3f72f9197e8565da339a4a2490b7]
>
>  Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
>  ---
> --
> 2.40.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8043): https://lists.yoctoproject.org/g/meta-virtuali=
zation/message/8043
> Mute This Topic: https://lists.yoctoproject.org/mt/98679455/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [=
bruce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

