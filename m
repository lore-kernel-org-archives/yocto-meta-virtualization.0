Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.web11.8011.1620830044220811041
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 12 May 2021 07:34:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=MMeUZCtg;
 spf=pass (domain: gmail.com, ip: 209.85.208.46, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f46.google.com with SMTP id bf4so27347502edb.11
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 12 May 2021 07:34:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=2VQLohw5RHPrmfPPe/LA2tv2mT8SB21+nbgW04D0Nk0=;
        b=MMeUZCtg+Bzyh58RK2eGhzUNZL4ZAjyVEVCL2S8iJ02r/nZFN9m+fzxZEdgWLxeKoX
         XZem8qbIvYnlC0VYRKrpJJVsrO/eI170QWeiZoXbMbGUROW4n+g/1tSv+PrhWtbs5/Rx
         1uCJz990UVtxLFu6ozv+qQ5aDzMbYFmFIgsOv/nf2Ncs0dWhd18DR1L9vU7PvVXelStS
         /MNtBslfFXDrnFt4NFJMZyjePltWqzYOJXvR1mF6U9AmKQMrpG+xRPc/MBluztnSshSA
         I1IqFN8xIK7/LOn2U6i8V/CrvuG3RSb4BNrOspCzk820RIooTJjz4yI5M+3q3dS6q3uJ
         SVPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=2VQLohw5RHPrmfPPe/LA2tv2mT8SB21+nbgW04D0Nk0=;
        b=emRMkuPpuAWIOAvKEDmRGO3UOjeA/bd3n6NxzdqxR218LoW/auA1ZFRtAdR1rJIKUs
         jD4ZvSNzyfnBtUFOJGZP/0G9BbiY8Z/MUc+A8Qfx/ECfslYhkpIvC5Vq8yH2pRN9oDFn
         EgYbDvi0zaRqOwr9PtEvVmfiVW8Bjp8cPPlaCb2/R5BWVnw/2JUHp3DT6T/e6oVyHOM3
         QDRqiQNWgwdDiivYzBrXekfTjGzoco3zbZGzTb1efwKfa2kk7wv3GMxxaN60klBwhrSE
         qiAYK0dA2HLhf7KGCnAGRMqENJS/vL2ypCRklDq9CIiDPFaiQ/E4UjeMi0u5NV6hhmak
         vEpg==
X-Gm-Message-State: AOAM530OlIdhdpxspY4Zb2xFZtUKS2b7iQe04RbQMyA3q121o4prbG5y
	pc6c4uAJ0+zZ/G0te4IG7qW30MOA4PJGsqsOZlE=
X-Google-Smtp-Source: ABdhPJyQpSd6PZDMnYBdoEMjJTkiTsV/hz86V3zMn91+u+VbG3nljoezybvxaLNW08uLG3RZuTQEQvDmvU70i7acIQc=
X-Received: by 2002:a05:6402:11c7:: with SMTP id j7mr44436004edw.129.1620830042546;
 Wed, 12 May 2021 07:34:02 -0700 (PDT)
MIME-Version: 1.0
References: <AM6PR08MB34616BDE804C24E66C0A87A292539@AM6PR08MB3461.eurprd08.prod.outlook.com>
In-Reply-To: <AM6PR08MB34616BDE804C24E66C0A87A292539@AM6PR08MB3461.eurprd08.prod.outlook.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Wed, 12 May 2021 10:33:51 -0400
Message-ID: <CADkTA4N+JBiVs3ak7fZ6zOBDFDs9vPW2cbErH9S_hC52idP+8A@mail.gmail.com>
Subject: Re: [meta-virtualization] podman do_install issues with pseudo
To: Diego Sueiro <diego.sueiro@arm.com>
Cc: "meta-virtualization@lists.yoctoproject.org" <meta-virtualization@lists.yoctoproject.org>, nd <nd@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 11, 2021 at 1:06 PM Diego Sueiro <diego.sueiro@arm.com> wrote:
>
> Hi,
>
>
>
> We are having issues (not 100% reproducible) when building podman during=
 the do_install with the following error message:
>
> ```
>
> (cd docs; ./dckrman.sh ./build/man/*.1)
>
> install  -d -m 755 /kas_build_dir/tmp/work/armv8a-poky-linux/podman/3.0-=
rc2+gitAUTOINC+288fb68896-r0/image/usr/bin /kas_build_dir/tmp/work/armv8a-p=
oky-linux/podman/3.0-rc2+gitAUTOINC+288fb68896-r0/image/usr/share/man/man1
>
> install  -m 755 docker /kas_build_dir/tmp/work/armv8a-poky-linux/podman/=
3.0-rc2+gitAUTOINC+288fb68896-r0/image/usr/bin/docker
>
> install  -m 644 docs/build/man/docker*.1 -t /kas_build_dir/tmp/work/armv=
8a-poky-linux/podman/3.0-rc2+gitAUTOINC+288fb68896-r0/image/usr/share/man/m=
an1
>
> abort()ing pseudo client by server request. See https://wiki.yoctoprojec=
t.org/wiki/Pseudo_Abort for more details on this.
>
> Check logfile: /kas_build_dir/tmp/work/armv8a-poky-linux/podman/3.0-rc2+=
gitAUTOINC+288fb68896-r0/pseudo//pseudo.log
>
> Aborted (core dumped)
>
> make: *** [Makefile:539: install.docker] Error 134
>
> WARNING: exit code 1 from a shell command.
>
> ERROR: oe_runmake failed
>
> ```
>
>
>
> This is the content of pseudo.log:
> ```
> debug_logfile: fd 2
>
> pid 1075 [parent 1073], doing new pid setup and server start
>
> Setup complete, sending SIGUSR1 to pid 1073.
>
> creat for '/tmp/sh-thd.95cHV4' replaces existing 672168 ['/tmp/sh-thd.6D=
4hI6'].
>
> creat for '/tmp/sh-thd.986Dd3' replaces existing 672168 ['/tmp/sh-thd.95=
cHV4'].
>
> creat for '/tmp/sh-thd.XlIuyk' replaces existing 672168 ['/tmp/sh-thd.98=
6Dd3'].
>
> creat for '/tmp/ccL4aHyi.cdtor.c' replaces existing 672169 ['/tmp/sh-thd=
.o1G5U4'].
>
> creat for '/tmp/sh-thd.r5dLbv' replaces existing 672245 ['/tmp/sh-thd.vl=
5PSr'].
>
> creat for '/tmp/sh-thd.k2j5Py' replaces existing 672245 ['/tmp/sh-thd.r5=
dLbv'].
>
> path mismatch [1 link]: ino 111819501 db '/kas_build_dir/tmp/work/armv8a=
-poky-linux/podman/3.0-rc2+gitAUTOINC+288fb68896-r0/go-tmp/go-build67288955=
2/b505/_cgo_.o' req '/kas_build_dir/tmp/work/armv8a-poky-linux/podman/3.0-r=
c2+gitAUTOINC+288fb68896-r0/image/usr/share/man/man1/docker-cp.1'.
>
> db cleanup for server shutdown, 16:27:04.465
>
> memory-to-file backup complete, 16:27:04.465.
>
> db cleanup finished, 16:27:04.465
> ```
>
> Since I=E2=80=99m not familiar with pseudo I have no idea how to root ca=
use and investigate this issue.
>

I'm not seeing this on podman myself, but I have dealt with a few of
these over the past months.

The best (high level) advice is on that dumped wiki page
https://wiki.yoctoproject.org/wiki/Pseudo_Abort (but I'm not offering
any news here).

Fundamentally this means something is happening outside of the pseudo
context, and that is breaking the file tracking. podman is a
relatively simple recipe, so I can't think of what would be doing that
off the top of my head.

Bruce

> Any help is really appreciated.
>
>
>
>
>
> --
> Diego Sueiro
> Staff Software Developer =E2=80=93 Automotive and Industrial Solutions (=
CE-OSS)
>
>
>
>
>=20
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
