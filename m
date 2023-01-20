Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7397C25B4E
	for <webhook@archiver.kernel.org>; Fri, 20 Jan 2023 17:18:39 +0000 (UTC)
Received: from mail-io1-f52.google.com (mail-io1-f52.google.com [209.85.166.52])
 by mx.groups.io with SMTP id smtpd.web11.80603.1674235110890257417
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 20 Jan 2023 09:18:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=c1aBHyB9;
 spf=pass (domain: gmail.com, ip: 209.85.166.52, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-io1-f52.google.com with SMTP id 203so2729157iou.13
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 20 Jan 2023 09:18:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qShtvBMNcHQPH2gvfh4yQrR6k4wVpQVXl+79OAzZd6s=;
        b=c1aBHyB9DWHztW09jSq2DbInvJRJen3dJm0gY1JPRwtMjFUCk/Nr5HMo9MzIFI9BKB
         EkLv/T2aCV0F2w5BjUHOkNaRaKXsf+0LvnAyEHEn3EaFVKzHkf1VOARdfatpNGmU5IS5
         pPF0PAw/8EXIJf8Zp8/JtijMJoAfvnbj4Cb9Tw/Irmed/mbHQjp4h9dmydIf2nOGaNfl
         dTadV307TFfv+acIaN5y1QjObNpqcnmoI4RfWiS2pxfQw3VsJD3Sv8L7qC3kzD28XYX4
         V4uErpDy8NuTo1TkOoFJMVm9DuY8sywLBx6NL9J9VmSu5SZQqDjEKKf2xsvgJstHojAZ
         w09g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qShtvBMNcHQPH2gvfh4yQrR6k4wVpQVXl+79OAzZd6s=;
        b=SdKGn/H+deNvYAsqiCvCIw/IQiZkq1ZPPCGNIa4uSCshWhR9byvNRDrChe7ys591uj
         XP9YVPxAYTdpuKeLny8KGX7i1H9rpiX18Fh7bqHPM/5peyC6nMK/ukB8Sq0oaHDT8eE+
         71n2GpSgM0Lh3EwznX3ofDAfvus6rMTM/jEQTjDegLeucf1iWpQbHt/sfg+jLRFeuCkd
         8oF3kQKtv+xWxJNxKw8fe1TFY/BZse4cAgCBGxwrb7kZqgtXjWkhzoRWXTriBxw1pkEt
         sT6EWiVpCgOx9JBTw/5OWBIPABGbv/Gl5FZyoNTschblEedl0nN0Dl0/KasXvLHewz4+
         i/pw==
X-Gm-Message-State: AFqh2kp1d0+gDHKE+Jvr2vp2AlLmu2jfMfvFigUOlZkAgB9hPT/0cSNu
	JP20kVftBFwHGmy9ln43DjzN/Zm3Dvthuj3faCA=
X-Google-Smtp-Source: AMrXdXs3nG/0HiUarv0aLWCcH5zsDedowM4DTfz9edoF403cr9ouhQnTxgekkyBJkH6mpEzgTfK0SjRudT0snxx16cw=
X-Received: by 2002:a02:7a5a:0:b0:3a4:723d:54cc with SMTP id
 z26-20020a027a5a000000b003a4723d54ccmr1722740jad.70.1674235110156; Fri, 20
 Jan 2023 09:18:30 -0800 (PST)
MIME-Version: 1.0
References: <20230106144630.23637-1-michal.orzel@amd.com> <20230106144630.23637-3-michal.orzel@amd.com>
In-Reply-To: <20230106144630.23637-3-michal.orzel@amd.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 20 Jan 2023 12:18:18 -0500
Message-ID: <CADkTA4Oj+KB6CiVjPJVSkR6ETvJq=K8C6u=-fdckjjAy2B7ayQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] xen: Add recipes for stable Xen 4.17 release and
 update master
To: Michal Orzel <michal.orzel@amd.com>
Cc: meta-virtualization@lists.yoctoproject.org, christopher.w.clark@gmail.com, 
	bertrand.marquis@arm.com, stefano.stabellini@amd.com, 
	stewart.hildebrand@amd.com
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 20 Jan 2023 17:18:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7827

On Fri, Jan 6, 2023 at 9:46 AM Michal Orzel <michal.orzel@amd.com> wrote:
>
> Add recipes for xen and tools for the newly released 4.17 version and
> take the opportunity to update master recipes.
>
> Reflect 4.17 tools changes in xen-tools.inc:
>  - add test-paging-mempool to test package,
>  - add init-dom0less script to xl package,
>  - add localstatedir to xencommons package (this is needed as from 4.17
>    onwards, there is no /var/lib/xenstored resulting in /var being
>    installed but not shipped in any package).

It looks like not a whole lot of folks are building 4.17 with systemd
as the init system.

I ran into a packaging area with the xenstored.mount packaging (it
isn't present in 4.17 as you noted in this commit).

I've moved that systemd package to the 4.16 versioned recipe and
pushed it to master.

Bruce

>
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
> ---
> Changes in v2:
>  - add init-dom0less to xl package
>  - add localstatedir to xencommons package
> ---
>  recipes-extended/xen/xen-tools.inc     |  3 +++
>  recipes-extended/xen/xen-tools_4.17.bb | 19 +++++++++++++++++++
>  recipes-extended/xen/xen-tools_git.bb  |  8 ++++----
>  recipes-extended/xen/xen_4.17.bb       | 19 +++++++++++++++++++
>  recipes-extended/xen/xen_git.bb        |  8 ++++----
>  5 files changed, 49 insertions(+), 8 deletions(-)
>  create mode 100644 recipes-extended/xen/xen-tools_4.17.bb
>  create mode 100644 recipes-extended/xen/xen_4.17.bb
>
> diff --git a/recipes-extended/xen/xen-tools.inc b/recipes-extended/xen/xen-tools.inc
> index d47309a72b1c..95da2bfbb6ce 100644
> --- a/recipes-extended/xen/xen-tools.inc
> +++ b/recipes-extended/xen/xen-tools.inc
> @@ -616,6 +616,7 @@ FILES:${PN}-xl = "\
>      ${libdir}/xen/bin/libxl-save-helper \
>      ${sbindir}/xl \
>      ${libdir}/xen/bin/xen-init-dom0 \
> +    ${libdir}/xen/bin/init-dom0less \
>      "
>
>  FILES:${PN}-xl-examples = "\
> @@ -658,6 +659,7 @@ FILES:${PN}-xencommons += "\
>      ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '${systemd_unitdir}/system/xen-init-dom0.service', '', d)} \
>      ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '${systemd_unitdir}/system/xenstored.service', '', d)} \
>      ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '${systemd_unitdir}/system/var-lib-xenstored.mount', '', d)} \
> +    ${localstatedir} \
>      "
>
>  FILES:${PN}-xend += " \
> @@ -688,6 +690,7 @@ FILES:${PN}-test += "\
>      ${libdir}/xen/bin/test-resource \
>      ${libdir}/xen/bin/test-cpu-policy \
>      ${libdir}/xen/bin/test-tsx \
> +    ${libdir}/xen/bin/test-paging-mempool \
>      "
>
>  # test-xenstore and test-resource currently only exist in 4.16
> diff --git a/recipes-extended/xen/xen-tools_4.17.bb b/recipes-extended/xen/xen-tools_4.17.bb
> new file mode 100644
> index 000000000000..0f323cb32aac
> --- /dev/null
> +++ b/recipes-extended/xen/xen-tools_4.17.bb
> @@ -0,0 +1,19 @@
> +# xen 4.17.0 release sha
> +SRCREV ?= "11560248ffda3f00f20bbdf3ae088af474f7f2a3"
> +
> +XEN_REL ?= "4.17"
> +XEN_BRANCH ?= "stable-${XEN_REL}"
> +
> +SRC_URI = " \
> +    git://xenbits.xen.org/xen.git;branch=${XEN_BRANCH} \
> +    file://0001-python-pygrub-pass-DISTUTILS-xen-4.15.patch \
> +    "
> +
> +LIC_FILES_CHKSUM ?= "file://COPYING;md5=d1a1e216f80b6d8da95fec897d0dbec9"
> +
> +PV = "${XEN_REL}+stable${SRCPV}"
> +
> +S = "${WORKDIR}/git"
> +
> +require xen.inc
> +require xen-tools.inc
> diff --git a/recipes-extended/xen/xen-tools_git.bb b/recipes-extended/xen/xen-tools_git.bb
> index a450a7d6574a..fd42cf2963b4 100644
> --- a/recipes-extended/xen/xen-tools_git.bb
> +++ b/recipes-extended/xen/xen-tools_git.bb
> @@ -1,7 +1,7 @@
> -# master status on 2022-04-05
> -SRCREV ?= "14dd241aad8af447680ac73e8579990e2c09c1e7"
> +# master status on 2022-12-29
> +SRCREV ?= "7eef80e06ed2282bbcec3619d860c6aacb0515d8"
>
> -XEN_REL ?= "4.17"
> +XEN_REL ?= "4.18"
>  XEN_BRANCH ?= "master"
>
>  SRC_URI = " \
> @@ -9,7 +9,7 @@ SRC_URI = " \
>      file://0001-python-pygrub-pass-DISTUTILS-xen-4.15.patch \
>      "
>
> -LIC_FILES_CHKSUM ?= "file://COPYING;md5=419739e325a50f3d7b4501338e44a4e5"
> +LIC_FILES_CHKSUM ?= "file://COPYING;md5=d1a1e216f80b6d8da95fec897d0dbec9"
>
>  PV = "${XEN_REL}+git${SRCPV}"
>
> diff --git a/recipes-extended/xen/xen_4.17.bb b/recipes-extended/xen/xen_4.17.bb
> new file mode 100644
> index 000000000000..f35689d4120f
> --- /dev/null
> +++ b/recipes-extended/xen/xen_4.17.bb
> @@ -0,0 +1,19 @@
> +# xen 4.17.0 release sha
> +SRCREV ?= "11560248ffda3f00f20bbdf3ae088af474f7f2a3"
> +
> +XEN_REL ?= "4.17"
> +XEN_BRANCH ?= "stable-${XEN_REL}"
> +
> +SRC_URI = " \
> +    git://xenbits.xen.org/xen.git;branch=${XEN_BRANCH} \
> +    file://0001-menuconfig-mconf-cfg-Allow-specification-of-ncurses-location.patch \
> +    "
> +
> +LIC_FILES_CHKSUM ?= "file://COPYING;md5=d1a1e216f80b6d8da95fec897d0dbec9"
> +
> +PV = "${XEN_REL}+stable${SRCPV}"
> +
> +S = "${WORKDIR}/git"
> +
> +require xen.inc
> +require xen-hypervisor.inc
> diff --git a/recipes-extended/xen/xen_git.bb b/recipes-extended/xen/xen_git.bb
> index ebd1b76ff420..2138424406f9 100644
> --- a/recipes-extended/xen/xen_git.bb
> +++ b/recipes-extended/xen/xen_git.bb
> @@ -1,7 +1,7 @@
> -# master status on 2022-04-05
> -SRCREV ?= "14dd241aad8af447680ac73e8579990e2c09c1e7"
> +# master status on 2022-12-29
> +SRCREV ?= "7eef80e06ed2282bbcec3619d860c6aacb0515d8"
>
> -XEN_REL ?= "4.17"
> +XEN_REL ?= "4.18"
>  XEN_BRANCH ?= "master"
>
>  SRC_URI = " \
> @@ -9,7 +9,7 @@ SRC_URI = " \
>      file://0001-menuconfig-mconf-cfg-Allow-specification-of-ncurses-location.patch \
>      "
>
> -LIC_FILES_CHKSUM ?= "file://COPYING;md5=419739e325a50f3d7b4501338e44a4e5"
> +LIC_FILES_CHKSUM ?= "file://COPYING;md5=d1a1e216f80b6d8da95fec897d0dbec9"
>
>  PV = "${XEN_REL}+git${SRCPV}"
>
> --
> 2.25.1
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

