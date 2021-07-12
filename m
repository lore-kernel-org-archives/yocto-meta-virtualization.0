Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web09.9.1626120008508764494
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 12 Jul 2021 13:00:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=SLRdcyGI;
 spf=pass (domain: gmail.com, ip: 209.85.218.48, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f48.google.com with SMTP id hr1so36940122ejc.1
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 12 Jul 2021 13:00:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=KEVBTbFBFMsnTB/0Hsp6qQbQ3nYnr2QYphxqkGEzV5k=;
        b=SLRdcyGI7Lxu/AktkACoyr0B9LFTMUZKJHtI1A3agNL7dTItbreBvcjPhJ036Wl69z
         nojlWkVv/yOTy23DFjJaKDdp5mS3LrEzjeMqxCId1eHodqrdHQjqwVHwD4HDX0haf4FL
         LiLlu8iHraBGz1K/KO1/pkIax6EVUKpg7iTW8M91+xgvFkks0aYMxBE5LoDwkMpGD8Qg
         k3eS5IO0UUm/x52psNCFhgPtnzrkUbTzwhUJnVy4lh6zxsgCWcxP8xNDQ7RRIo94gUZl
         NaMiBxcZVfe0tmUCppMV1zcR8Ypk0qK1/caSTbJUPhwl6n7Bsad2bhU0NUNZgTCzPnL9
         UVnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=KEVBTbFBFMsnTB/0Hsp6qQbQ3nYnr2QYphxqkGEzV5k=;
        b=Dv/6+K12wSitYP2JrvF0fjQP09ZJbsPFdfNE/ay7o8dilag2UrMZUz8KCSGWoAS88Z
         3w5YL1hLQ6Gl4aAOhil79Auz5H+58KfDVAerX5wG6oODbZxRbrhsv43j1D/W2t+si7ND
         n1LHINVV9try4RH+9UvPg0XNb5CqsA7q6tAox9ybx58uPfqawdPuAF0ZjASvy3xUQ6NF
         rD67YuutaVF1bn0MNnkBDkI7PSv7PC87hyqEB+yAk+vaRZiLnkp12Gujhb3Ntv89VD/g
         4FRo+eAtMMWKxd66go/nBu383vv623PDh+Wp523MG5+Ao6uWgeUAmsc6IR4da0+nsQaz
         BnyQ==
X-Gm-Message-State: AOAM530+Y/6wpIcvI4zGVbL1tdCcchE7gFTIYgagAEujZdsE2Y9sIm0o
	+ZrwyzFqH1+nosAOR615TBSowCJnqGOi1iL6HZ8=
X-Google-Smtp-Source: ABdhPJwEpMGsyqColfB4ZR+1J6iI8XU745E+4fkOtcWApojOUkB8TXPECC6qmsP06Zqn17V5/NyQ4PdZ0n1vqOfKWMM=
X-Received: by 2002:a17:907:77ca:: with SMTP id kz10mr886576ejc.22.1626120006939;
 Mon, 12 Jul 2021 13:00:06 -0700 (PDT)
MIME-Version: 1.0
References: <20210709074451.14442-1-jainsaloni0918@gmail.com>
In-Reply-To: <20210709074451.14442-1-jainsaloni0918@gmail.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Mon, 12 Jul 2021 15:59:55 -0400
Message-ID: <CADkTA4PRa8=zz8_Mu1c=VEPDTY2EGhPDL-GYh=RHSMh=iS+EAg@mail.gmail.com>
Subject: Re: [meta-virtualization] [meta-vitualization][master][dunfell][PATCH] start: handle CLONE_PIDFD on arm64
To: Saloni Jain <jainsaloni0918@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org, 
	"Saloni.Jain" <saloni.jain@kpit.com>, Christian Brauner <christian.brauner@ubuntu.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Unfortunately the patch itself doesn't apply to lxc in meta-virt
master or dunfell.

I did bump the version in master, since that change is already included.

But for dunfell, you'll need to do a new patch that applies to the source:

NOTE: Executing Tasks
ERROR: lxc-4.0.6-r0 do_patch: Command Error: 'quilt --quiltrc
/opt/bruce/poky-dunfell/build/tmp/work/mips32r2-poky-linux/lxc/4.0.6-r0/re=
cipe-sysroot-native/etc/quiltrc
push' exited with 0  Output:
Applying patch lxc_remove_CLONE_PIDFD_support.patch
patching file src/lxc/start.c
Hunk #1 FAILED at 1714.
1 out of 1 hunk FAILED -- rejects in file src/lxc/start.c
Patch lxc_remove_CLONE_PIDFD_support.patch does not apply (enforce with -f=
)
ERROR: Logfile of failure stored in:
/opt/bruce/poky-dunfell/build/tmp/work/mips32r2-poky-linux/lxc/4.0.6-r0/te=
mp/log.do_patch.1248727
ERROR: Task (/opt/bruce/poky-dunfell/meta-virtualization/recipes-container=
s/lxc/lxc_4.0.6.bb:do_patch)
failed with exit code '1'


Cheers,

Bruce



On Fri, Jul 9, 2021 at 3:45 AM Saloni Jain <jainsaloni0918@gmail.com> wrot=
e:
>
> From: "Saloni.Jain" <saloni.jain@kpit.com>
>
> It doesn't work with kernels older than 5.2.
>
> https://man7.org/linux/man-pages/man2/clone.2.html
>
> "       CLONE_PIDFD (since Linux 5.2)"
>
> Fix lxc container startup error:
>
> clone3({flags=3DCLONE_PIDFD|CLONE_NEWNS|CLONE_NEWUTS|CLONE_NEWIPC|CLONE_=
NEWPID|0x200000000, pidfd=3D0x55904a09a0, exit_signal=3DSIGCHLD, stack=3DNU=
LL, stack_size=3D0, /* bytes 80..87 */ "\x17\x00\x00\x00\x00\x00\x00\x00"},=
 88) =3D -1 ENOSYS (Function not implemented)
> clone3({flags=3DCLONE_PIDFD|CLONE_NEWNS|CLONE_NEWUTS|CLONE_NEWIPC|CLONE_=
NEWPID, pidfd=3D0x55904a09a0, exit_signal=3DSIGCHLD, stack=3DNULL, stack_si=
ze=3D0}, 64) =3D -1 ENOSYS (Function not implemented)
> clone(child_stack=3DNULL, flags=3DCLONE_PIDFD|CLONE_NEWNS|CLONE_NEWUTS|C=
LONE_NEWIPC|CLONE_NEWPID|SIGCHLD, parent_tid=3D0x55904a09a0) =3D -1 EINVAL =
(Invalid argument)
>
> Reported-by: Ondrej Kubik <ondrej.kubik@canonical.com>
> Signed-off-by: Christian Brauner <christian.brauner@ubuntu.com>
> Signed-off-by: Saloni Jain <jainsaloni0918@gmail.com>
> ---
>  .../lxc_remove_CLONE_PIDFD_support.patch      | 56 +++++++++++++++++++
>  recipes-containers/lxc/lxc_4.0.6.bb           |  1 +
>  2 files changed, 57 insertions(+)
>  create mode 100644 recipes-containers/lxc/files/lxc_remove_CLONE_PIDFD_=
support.patch
>
> diff --git a/recipes-containers/lxc/files/lxc_remove_CLONE_PIDFD_support=
.patch b/recipes-containers/lxc/files/lxc_remove_CLONE_PIDFD_support.patch
> new file mode 100644
> index 0000000..9da1757
> --- /dev/null
> +++ b/recipes-containers/lxc/files/lxc_remove_CLONE_PIDFD_support.patch
> @@ -0,0 +1,56 @@
> +commit c07b6837e30b8d969060ce7d3f95a30abec637de
> +Author: Christian Brauner <christian.brauner@ubuntu.com>
> +Date:   Fri Mar 5 19:50:28 2021 +0100
> +
> +
> +start: handle CLONE_PIDFD on arm64
> +
> +It doesn't work with kernels older than 5.2.
> +
> +https://man7.org/linux/man-pages/man2/clone.2.html
> +
> +"       CLONE_PIDFD (since Linux 5.2)"
> +
> +Fix lxc container startup error:
> +
> +clone3({flags=3DCLONE_PIDFD|CLONE_NEWNS|CLONE_NEWUTS|CLONE_NEWIPC|CLONE=
_NEWPID|0x200000000, pidfd=3D0x55904a09a0, exit_signal=3DSIGCHLD, stack=3DN=
ULL, stack_size=3D0, /* bytes 80..87 */ "\x17\x00\x00\x00\x00\x00\x00\x00"}=
, 88) =3D -1 ENOSYS (Function not implemented)
> +clone3({flags=3DCLONE_PIDFD|CLONE_NEWNS|CLONE_NEWUTS|CLONE_NEWIPC|CLONE=
_NEWPID, pidfd=3D0x55904a09a0, exit_signal=3DSIGCHLD, stack=3DNULL, stack_s=
ize=3D0}, 64) =3D -1 ENOSYS (Function not implemented)
> +clone(child_stack=3DNULL, flags=3DCLONE_PIDFD|CLONE_NEWNS|CLONE_NEWUTS|=
CLONE_NEWIPC|CLONE_NEWPID|SIGCHLD, parent_tid=3D0x55904a09a0) =3D -1 EINVAL=
 (Invalid argument)
> +
> +Reported-by: Ondrej Kubik <ondrej.kubik@canonical.com>
> +Cc: stable-4.0
> +Signed-off-by: Christian Brauner <christian.brauner@ubuntu.com>
> +Signed-off-by: Saloni Jain <jainsaloni0918@gmail.com>
> +Upstream-Status: Pending
> +
> +diff --git a/src/lxc/start.c b/src/lxc/start.c
> +index 301b81a..f2737a2 100644
> +--- a/src/lxc/start.c
> ++++ b/src/lxc/start.c
> +@@ -1714,7 +1714,26 @@ static int lxc_spawn(struct lxc_handler *handler=
)
> +                /* Kernel might be too old for clone3(). */
> +                if (handler->pid < 0) {
> +                        SYSTRACE("Failed to spawn container via clone3(=
)");
> ++
> ++               /*
> ++                * In contrast to all other architectures arm64 verifie=
s that
> ++                * the argument we use to retrieve the pidfd with is
> ++                * initialized to 0. But we need to be able to initiali=
ze it to
> ++                * a negative value such as our customary -EBADF so we =
can
> ++                * detect whether this kernel supports pidfds. If the s=
yscall
> ++                * returns and the pidfd variable is set to something >=
=
=3D 0 then
> ++                * we know this is a kernel supporting pidfds. But if w=
e can't
> ++                * set it to -EBADF then this won't work since 0 is a v=
alid
> ++                * file descriptor too. And since legacy clone silently=
 ignores
> ++                * unknown flags we are left without any way to detect =
support
> ++                * for pidfds. So let's special-case arm64 to not fail =
starting
> ++                * containers.
> ++                */
> ++               #if defined(__aarch64__)
> ++                       handler->pid =3D lxc_raw_legacy_clone(handler->=
clone_flags & ~CLONE_PIDFD, NULL);
> ++               #else
> +                        handler->pid =3D lxc_raw_legacy_clone(handler->=
clone_flags, &handler->pidfd);
> ++               #endif
> +                }
> +
> +                if (handler->pid < 0) {
> diff --git a/recipes-containers/lxc/lxc_4.0.6.bb b/recipes-containers/lx=
c/lxc_4.0.6.bb
> index c9bf3d0..105caa0 100644
> --- a/recipes-containers/lxc/lxc_4.0.6.bb
> +++ b/recipes-containers/lxc/lxc_4.0.6.bb
> @@ -51,6 +51,7 @@ SRC_URI =3D "http://linuxcontainers.org/downloads/${BP=
N}/${BPN}-${PV}.tar.gz \
>         file://lxc-net \
>         file://configure-skip-libseccomp-tests-if-it-is-disabled.patch \
>         file://commands-fix-check-for-seccomp-notify-support.patch \
> +        file://lxc_remove_CLONE_PIDFD_support.patch \
>         "
>
>  SRC_URI[md5sum] =3D "732571c7cb4ab845068afb227bf35256"
> --
> 2.17.1
>
>
>=20
>


--
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
