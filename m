Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5D1BC43334
	for <webhook@archiver.kernel.org>; Mon, 11 Jul 2022 13:39:00 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com
 [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web10.28607.1657546739148542510
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 11 Jul 2022 06:38:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=R+B3tf+M;
 spf=pass (domain: gmail.com, ip: 209.85.216.46,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj1-f46.google.com with SMTP id
 t5-20020a17090a6a0500b001ef965b262eso4960356pjj.5
        for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 11 Jul 2022 06:38:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=E6OMyAHULu2WVcM4SQK8hMMPL3x0jvKaNWe2WxkYYjk=;
        b=R+B3tf+MdGawlZb62iCHOLF3xqfn5JM4SVRTZEOyeVxFtJj5GkwrwLQn0+s1VDtiPa
         r5xJ6Yn9Ln0Cnw7iSjOIAi9SiEqvz25lHpixpCVobhzh1LE/oUXKg4l5AQFdrjd98wp0
         Si906Gbsx35fZTmb3rO3rRO64xMYpz3XJ+/KSzZUFSrRHJV+RyIRg7l2VuqSAti7Z3am
         LqoB18OxdSSCVwBk+SKe7ewnANQ1UUVPKg3TAJyiHhP9Ug8QMmc9UrIWrbMBOdqIfAHQ
         JhjVpUTkWABf43HiBfrZaTa9bpMv/3sDNWQY8pFKsek/YPfaO+z8lyn0jcVlgwiiUWSO
         CvNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=E6OMyAHULu2WVcM4SQK8hMMPL3x0jvKaNWe2WxkYYjk=;
        b=tFV7TVMOBWWf708F+5iNmpKLBazoT7IGfK45ue8UHNr+qGNq9fAAxL1CtB8g+dIBX1
         0kydWBGy5dd1ggOZaqDEakN/LzlJwBcXMOtmtyAN7MEBVthPvaBFFgG5pbq4j0hqef8M
         P2FE+BKgZb9MaawQVHCyqb0BcqFvNck2B2sQQ6kfD4MAZDdkn2a17wfRPKpXsMYuwF5z
         6onFKE/2AXb6R3jKSynlEF0SaGgvisMCVm54+++C5Xv1ijvTxG8e9Rrk0YPHUslHtMjE
         kjaxSebnGQus4FiNnDYgXQwlocVXqo4PkGDALUFW7smHEb8+U5YeIA66xnXCJByOynqQ
         0M3A==
X-Gm-Message-State: AJIora+DA3kH7L/7Q3K7TM57797MCGk3HUsBiWZCZd5Z0F3zDCkTKPYq
	ZuEo0WtJJpuSs8VFdz6i+0dYQ93hy3sfyTDJBCs=
X-Google-Smtp-Source: 
 AGRyM1via1NIeDBNw4Ed/wNLLNBiXYXSotYQ9wtzfJgfWtTxOn2foN1KI0g/6SGa/f18aVFMcUKH3yafM8OVpTABWEI=
X-Received: by 2002:a17:90b:1807:b0:1ef:8aa5:1158 with SMTP id
 lw7-20020a17090b180700b001ef8aa51158mr17970242pjb.163.1657546738575; Mon, 11
 Jul 2022 06:38:58 -0700 (PDT)
MIME-Version: 1.0
References: <20220711130022.3264142-1-andrei@gherzan.com>
 <20220711130022.3264142-3-andrei@gherzan.com>
In-Reply-To: <20220711130022.3264142-3-andrei@gherzan.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 11 Jul 2022 09:38:46 -0400
Message-ID: 
 <CADkTA4NiCLaqUR5=odkgpy41-oQD5oXSnFGgu45qLP+ch7ebbA@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH 3/3] podman: Add support for rootless
 mode
To: Andrei Gherzan <andrei@gherzan.com>,
 Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: meta-virtualization@lists.yoctoproject.org,
	Andrei Gherzan <andrei.gherzan@huawei.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 11 Jul 2022 13:39:00 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7429

On Mon, Jul 11, 2022 at 9:00 AM Andrei Gherzan <andrei@gherzan.com> wrote:
>
> From: Andrei Gherzan <andrei.gherzan@huawei.com>
>
> Signed-off-by: Andrei Gherzan <andrei.gherzan@huawei.com>
> ---
>  docs/00-INDEX                                     |  3 +++
>  docs/podman.txt                                   | 15 +++++++++++++++
>  docs/podman.txt.license                           |  3 +++
>  .../podman/podman/00-podman-rootless.conf         |  6 ++++++
>  recipes-containers/podman/podman_git.bb           | 15 ++++++++++++++-
>  5 files changed, 41 insertions(+), 1 deletion(-)
>  create mode 100644 docs/podman.txt
>  create mode 100644 docs/podman.txt.license
>  create mode 100644 recipes-containers/podman/podman/00-podman-rootless.conf
>
> diff --git a/docs/00-INDEX b/docs/00-INDEX
> index 5aa1b3c..6659fbe 100644
> --- a/docs/00-INDEX
> +++ b/docs/00-INDEX
> @@ -11,5 +11,8 @@ alphabetical order as well.
>  openvswitch.txt
>         - example on how to setup openvswitch with qemu/kvm.
>
> +podman.txt
> +       - documentation on podman container engine integration.
> +
>  xvisor.txt
>         - example on how to setup Xvisor for RISC-V QEMU.
> diff --git a/docs/podman.txt b/docs/podman.txt
> new file mode 100644
> index 0000000..9f35501
> --- /dev/null
> +++ b/docs/podman.txt
> @@ -0,0 +1,15 @@
> +Podman
> +======
> +
> +Rootless mode
> +-------------
> +
> +Podman is a daemonless container engine that has as one of its features the
> +ability to run in rootless mode. This requires a set of configurations and
> +additional components. The OE/Yocto integration configures podman with this
> +support enabled by default. This can be changed via configuration files
> +(distro, local.conf, etc.) or bbaappends using the `PODMAN_ROOTLESS` variable.
> +
> +To disable rootless support set the variable to '0':
> +
> +PODMAN_ROOTLESS = "0"
> diff --git a/docs/podman.txt.license b/docs/podman.txt.license
> new file mode 100644
> index 0000000..940435e
> --- /dev/null
> +++ b/docs/podman.txt.license
> @@ -0,0 +1,3 @@
> +SPDX-FileCopyrightText: Huawei Inc.
> +
> +SPDX-License-Identifier: Apache-2.0

I haven't been following along closely enough to the copyright thread
that Richard started, but these jumped out at me.

Aren't most of the .conf files considered MIT (i.e. part of the meta
data / recipe space) ? And are we putting copyright's in conf files
and .txt files now ? I'm definitely not an expert (at all!!) but that
doesn't seem quite right to me, when they are configuration files that
follow standard practices for the packages we are integrating.


> diff --git a/recipes-containers/podman/podman/00-podman-rootless.conf b/recipes-containers/podman/podman/00-podman-rootless.conf
> new file mode 100644
> index 0000000..2aca663
> --- /dev/null
> +++ b/recipes-containers/podman/podman/00-podman-rootless.conf
> @@ -0,0 +1,6 @@
> +# SPDX-FileCopyrightText: Huawei Inc.
> +#
> +# SPDX-License-Identifier: Apache-2.0
> +
> +# User namespaces are required for rootless containers.
> +user.max_user_namespaces       = 15000
> diff --git a/recipes-containers/podman/podman_git.bb b/recipes-containers/podman/podman_git.bb
> index 961cd18..2680f40 100644
> --- a/recipes-containers/podman/podman_git.bb
> +++ b/recipes-containers/podman/podman_git.bb
> @@ -6,6 +6,10 @@ DESCRIPTION = "Podman is a daemonless container engine for developing, \
>      `alias docker=podman`. \
>      "
>
> +# podman can run in rootless mode with the help of additional components:
> +# https://github.com/containers/podman/blob/main/docs/tutorials/rootless_tutorial.md
> +PODMAN_ROOTLESS ?= "1"

Isn't there a way to do this with PACKAGECONFIG ? We could just as
easily check for the option in that, and then we have a place for
extra rdepends, etc,as required.

Bruce

> +
>  inherit features_check
>  REQUIRED_DISTRO_FEATURES ?= "seccomp ipv6"
>
> @@ -21,6 +25,7 @@ SRCREV = "cedbbfa543651a13055a1fe093a4d0a2a28ccdfd"
>  SRC_URI = " \
>      git://github.com/containers/libpod.git;branch=v4.1;protocol=https \
>      file://0001-Rename-BUILDFLAGS-to-GOBUILDFLAGS.patch;patchdir=src/import \
> +    ${@bb.utils.contains('PODMAN_ROOTLESS', '1', 'file://00-podman-rootless.conf', '', d)} \
>  "
>
>  LICENSE = "Apache-2.0"
> @@ -97,6 +102,11 @@ do_install() {
>         # Silence docker emulation warnings.
>         mkdir -p ${D}/etc/containers
>         touch ${D}/etc/containers/nodocker
> +
> +       if [ "${PODMAN_ROOTLESS}" = "1" ]; then
> +               install -d "${D}${sysconfdir}/sysctl.d"
> +               install -m 0644 "${WORKDIR}/00-podman-rootless.conf" "${D}${sysconfdir}/sysctl.d"
> +       fi
>  }
>
>  FILES:${PN} += " \
> @@ -112,6 +122,9 @@ SYSTEMD_SERVICE:${PN} = "podman.service podman.socket"
>  # that busybox is configured with nsenter
>  VIRTUAL-RUNTIME_base-utils-nsenter ?= "util-linux-nsenter"
>
> -RDEPENDS:${PN} += "conmon virtual-runc iptables cni skopeo ${VIRTUAL-RUNTIME_base-utils-nsenter}"
> +RDEPENDS:${PN} += "\
> +       conmon virtual-runc iptables cni skopeo ${VIRTUAL-RUNTIME_base-utils-nsenter} \
> +       ${@bb.utils.contains('PODMAN_ROOTLESS', '1', 'fuse-overlayfs slirp4netns', '', d)} \
> +"
>  RRECOMMENDS:${PN} += "slirp4netns kernel-module-xt-masquerade kernel-module-xt-comment"
>  RCONFLICTS:${PN} = "${@bb.utils.contains('PACKAGECONFIG', 'docker', 'docker', '', d)}"
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7423): https://lists.yoctoproject.org/g/meta-virtualization/message/7423
> Mute This Topic: https://lists.yoctoproject.org/mt/92309177/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


--
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

