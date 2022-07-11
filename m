Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEC74C433EF
	for <webhook@archiver.kernel.org>; Mon, 11 Jul 2022 13:32:00 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com
 [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web11.28628.1657546314380753657
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 11 Jul 2022 06:31:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=bYi5zkO6;
 spf=pass (domain: gmail.com, ip: 209.85.216.47,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj1-f47.google.com with SMTP id
 o31-20020a17090a0a2200b001ef7bd037bbso4971849pjo.0
        for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 11 Jul 2022 06:31:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=a22GQTwyYgQa90B6yWzDLRLF2i6qy2aADXQP1YnAKxU=;
        b=bYi5zkO6K7hSf5g2ohw9duo2lNKoc8Y/dYJNSreiZu5pyHy+HfotOOM7vjz3G94JYd
         DF8MeqQbqpx9TMcbj/nGSqmGPihhZtvj5CrCqtlRVBL0+SHGWwzflVMldI2BPdNNQ9JM
         DYySZr2o+j7lfbAlZZ/bIXxBimB07/vp+qim8anlT6NYtBO5dAynkVrBu8I2t+mTnHCI
         dMJrMsbnKmKDKo6mwQu/MZCiI/cwRtCLy/79P4wKd5V2Ci3elBiOcstk0MKUMjCBDnoj
         fo7X8WDk3ikzbE8g8wkX/RRLZqRYt7Kg6AM2J//8Xn2Hf0pP2jZyvJCUFF6e7UF/BB29
         Ci1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=a22GQTwyYgQa90B6yWzDLRLF2i6qy2aADXQP1YnAKxU=;
        b=tnQn4KxssCzmcds3J61IrnTh7ea/9iZgIT6Ra6n6KSnOzY+RVUqNkCbMtCgHS+auu0
         tWnSIkbh1KY4VkTynFTK1RqpBLzbjTXX6uaAVL4X8rurGPcPHPJVKN/GB0Vg4p3H9GLL
         Tw2HSR69Dyl/xhejOR3zOy2QqR21ukm7gqLGsCEqV9Zp6hrl9Vb16bfaBQkfgKbRgqby
         q/uvUKNcZMUjg5DJU5vkxnOqFT1T8U7HNmtZj8QcoulCeLETZRQgfAbNyN1iZO90IF2C
         VbBZ9hIpsP54Ayb3BKsKI2gNOlIPMe52qbexJbSNN+Vcj8sZ51tp/yiS/1o0TNdV18bB
         V5wA==
X-Gm-Message-State: AJIora8MEsOjcReGIGLy/d225cyoebiDq50sGYrkWjGpy8jXWQoPHbF/
	ldV16j4eKILqKuZfgI1UhuSX3HAWs6mJ535YAP0=
X-Google-Smtp-Source: 
 AGRyM1v92+Q5Tw/DVobpVDXRTsV3lgBr+XiF4fdKAy0zEyUBV1k94cC/uysy/Zfpyz7pomIoLl7jAPtORCoUXMl8Ig8=
X-Received: by 2002:a17:903:2285:b0:16c:33dc:8754 with SMTP id
 b5-20020a170903228500b0016c33dc8754mr12035638plh.126.1657546313763; Mon, 11
 Jul 2022 06:31:53 -0700 (PDT)
MIME-Version: 1.0
References: <20220711130110.3264816-1-andrei@gherzan.com>
 <20220711130110.3264816-3-andrei@gherzan.com>
In-Reply-To: <20220711130110.3264816-3-andrei@gherzan.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 11 Jul 2022 09:31:41 -0400
Message-ID: 
 <CADkTA4PMRv54fcxXz_+NtzJrbH6wf9XMA=0nzQaRSmLX8YCGDA@mail.gmail.com>
Subject: Re: [meta-virtualization][kirkstone][PATCH 3/3] podman: Add support
 for rootless mode
To: Andrei Gherzan <andrei@gherzan.com>
Cc: meta-virtualization@lists.yoctoproject.org,
	Andrei Gherzan <andrei.gherzan@huawei.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 11 Jul 2022 13:32:00 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7428

This is new functionality ... and while we don't have a strict rule
about not adding new features to existing releases, this is stretching
the definition, since it does have the potential to cause issues.

It is definitely fine for master, but I'm not particularly keen to
start adding new features to kirkstone.

Bruce

On Mon, Jul 11, 2022 at 9:01 AM Andrei Gherzan <andrei@gherzan.com> wrote:
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
> index 4693bd6..4dcd0f2 100644
> --- a/recipes-containers/podman/podman_git.bb
> +++ b/recipes-containers/podman/podman_git.bb
> @@ -6,6 +6,10 @@ DESCRIPTION = "Podman is a daemonless container engine for developing, \
>      `alias docker=podman`. \
>      "
>
> +# podman can run in rootless mode with the help of additional components:
> +# https://github.com/containers/podman/blob/main/docs/tutorials/rootless_tutorial.md
> +PODMAN_ROOTLESS ?= "1"
> +
>  inherit features_check
>  REQUIRED_DISTRO_FEATURES ?= "seccomp ipv6"
>
> @@ -21,6 +25,7 @@ SRCREV = "717edd7b844dcd66468f5d991991d87e9fc14c12"
>  SRC_URI = " \
>      git://github.com/containers/libpod.git;branch=v4.0;protocol=https \
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
> View/Reply Online (#7426): https://lists.yoctoproject.org/g/meta-virtualization/message/7426
> Mute This Topic: https://lists.yoctoproject.org/mt/92309185/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

