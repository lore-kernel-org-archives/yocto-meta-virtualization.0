Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD983C433EF
	for <webhook@archiver.kernel.org>; Thu, 19 May 2022 21:10:27 +0000 (UTC)
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com
 [209.85.219.175])
 by mx.groups.io with SMTP id smtpd.web12.1161.1652994625176184043
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 19 May 2022 14:10:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=SjMbCRdH;
 spf=pass (domain: gmail.com, ip: 209.85.219.175,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-yb1-f175.google.com with SMTP id j2so11213431ybu.0
        for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 19 May 2022 14:10:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tr3453rh5w7RYu6zaec/qCF3aI+zxuDavrD953sGx2w=;
        b=SjMbCRdHJfVLZ9Qvjv76/yWNCevN74hJKd7ZS+uMNM2n5XKjTt3dzb6cv0FCIu0l+t
         EIKEnkyoZiDxWh+c73+lg8w7s4Qwbv5EKPR7Lm5g5TwlN/jGNGiqyIKORB9Hf4LClSBW
         IokVbawHGNWuQj8ryoTyYeKNqYoS10COqTkHKBtAfa3HiSg+ud+cOt2phFzsnac9y1w3
         HTslyJxuTbX2bZUSKtWZf5/GW9kDOH9QXEj51r15WqN8KOuXxAwZ/3wmPz6DWbiInd6l
         jrbddZZ0yHZXozjHklhqclzWZLKvs6AiqGaIwkTvpyU4zzvkwglgSlqluIoq5zzwEfpO
         /mPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tr3453rh5w7RYu6zaec/qCF3aI+zxuDavrD953sGx2w=;
        b=sS8utZegmDcI8OGnvTsWf1LM0BLa/HsPOeLqqR4Px+k9c4OSUvwffjI5fGf9rnl9RZ
         8j3izt38L6j8KC3a2EG8CUKZaKe+aDkKPxNOTGbJp261pL5M5iAauxBAZJcRHOEr7p/B
         2dtOd512l2YL0Wx9uBA7zlayLaQKCgOrxsSIksXlx1XZk2bqT693R3Y7aybz6oYCNln8
         Tyg+MuDvc8svQmMhzRIJRw+nvQA+htV5HXNd51lcDK2SOS1vwwG6RICJ8hOgHTre+xbd
         VeWuRVvD3U1w8PYwwLsJfz4IsHmJvgP+kAdhsbjP6UbN26L7WF09o+u2RUUQ1ZOVR6Fx
         o12Q==
X-Gm-Message-State: AOAM530lkbF2R35gxjfReGa5GylRYYUK6Po0tZvqj3Zp6gi9MQISiTto
	7jdTOHFX0ypmlI3VLFZAnQVlwrrBOj4c4Sy1EeMB+Oh/Nvw=
X-Google-Smtp-Source: 
 ABdhPJwU5azhQDDs7zo32QbCM86Dio7HrJI1B6/UfGGApHLnvxlfouBhvBWRjpqej4RwOGd7i73oN1IVQkzZcBZgk94=
X-Received: by 2002:a25:32c4:0:b0:64b:dc56:4966 with SMTP id
 y187-20020a2532c4000000b0064bdc564966mr6141490yby.382.1652994624213; Thu, 19
 May 2022 14:10:24 -0700 (PDT)
MIME-Version: 1.0
References: <20220519195157.8270-1-sakib.sajal@windriver.com>
In-Reply-To: <20220519195157.8270-1-sakib.sajal@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 19 May 2022 17:10:12 -0400
Message-ID: 
 <CADkTA4OUJ83_WvYFPsUJaQ3rimGiwFd-dfReF+dsUYsFRxnAPQ@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] buildah: add recipe for buildah
 v1.26
To: Sakib Sajal <sakib.sajal@windriver.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 19 May 2022 21:10:27 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7294

On Thu, May 19, 2022 at 3:52 PM <sakib.sajal@windriver.com> wrote:
>
> buildah is a tool that facilitates building OCI container images.
>

We need a better description here.

What is the intent of the recipe ? Is it being run on the target (it
isn't a -native recipe, so that is the implication). How would someone
use it ? How would I test it ?

Those sorts of things. Then I can move onto more questions :)

> Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
> ---
>  recipes-containers/buildah/buildah_git.bb | 57 +++++++++++++++++++++++
>  1 file changed, 57 insertions(+)
>  create mode 100644 recipes-containers/buildah/buildah_git.bb
>
> diff --git a/recipes-containers/buildah/buildah_git.bb b/recipes-containers/buildah/buildah_git.bb
> new file mode 100644
> index 0000000..024e82c
> --- /dev/null
> +++ b/recipes-containers/buildah/buildah_git.bb
> @@ -0,0 +1,57 @@
> +HOMEPAGE = "https://buildah.io"
> +SUMMARY = "A tool that facilitates building OCI container images."
> +DESCRIPTION = "A tool that facilitates building OCI container images."
> +
> +# Apache-2.0 for containerd
> +LICENSE = "Apache-2.0"
> +LIC_FILES_CHKSUM = "file://src/github.com/containers/buildah/LICENSE;md5=e3fc50a88d0a364313df4b21ef20c29e"
> +
> +S = "${WORKDIR}/git"
> +
> +BUILDAH_VERSION = "1.26"
> +SRCREV_buildah = "0a9d6e6eaef2e2e7936313d449a4e226022eb865"
> +
> +PV = "${BUILDAH_VERSION}"
> +
> +inherit go
> +inherit goarch
> +inherit pkgconfig
> +
> +GO_IMPORT = "github.com/containers/buildah"
> +GO_INSTALL = "${GO_IMPORT}"
> +GO_WORKDIR = "${GO_INSTALL}"
> +GOBUILDFLAGS += "-mod vendor"
> +
> +SRC_URI = " \
> +    git://github.com/containers/buildah;branch=release-${BUILDAH_VERSION};name=buildah;protocol=https \
> +    "
> +
> +DEPENDS = "libdevmapper btrfs-tools gpgme"
> +RDEPENDS:${PN} = "cgroup-lite fuse-overlayfs libdevmapper podman"
> +RDEPENDS:${PN}-dev = "bash perl"
> +
> +do_compile:prepend() {
> +    cd ${S}/src/github.com/containers/buildah
> +}

What is do_compile actually doing ? Does buildah have a Makefile (it
does, I peeked).

Since you have a secondary do_compile .. I'm not sure what the buildah
Makefile isn't doing that requires the go_do_compile().

> +
> +go_do_compile() {
> +        export TMPDIR="${GOTMPDIR}"
> +        if [ -n "${GO_INSTALL}" ]; then

It's unclear why you are copying the format of the go.bbclass's go_do_compile.

You don't really need to check either of the variables you are
checking, since this is not general purpose and is only building this
package, not attempting to be generic.

Summary .. I think this can be simplified, or the default
go_do_compile only used.

> +                if [ -n "${GO_LINKSHARED}" ]; then
> +                        ${GO} install ${GOBUILDFLAGS} ./cmd/buildah
> +                        ${GO} install ${GOBUILDFLAGS} ./tests/imgtype/imgtype.go
> +                        ${GO} install ${GOBUILDFLAGS} ./tests/copy/copy.go
> +                        rm -rf ${B}/bin
> +                fi
> +                ${GO} install ${GO_LINKSHARED} ${GOBUILDFLAGS} ./cmd/buildah
> +                ${GO} install ${GO_LINKSHARED} ${GOBUILDFLAGS} ./tests/imgtype/imgtype.go
> +                ${GO} install ${GO_LINKSHARED} ${GOBUILDFLAGS} ./tests/copy/copy.go
> +        fi
> +}
> +
> +do_install:append() {
> +    dest_dir=${D}/${sysconfdir}/containers
> +    mkdir -p ${dest_dir}
> +    install -m 666 ${S}/src/github.com/containers/buildah/docs/samples/registries.conf ${dest_dir}/buildah.registries.conf.sample
> +    install -m 666 ${S}/src/github.com/containers/buildah/tests/policy.json ${dest_dir}/buildah.policy.json.sample

Minor 'nit, but the spacing is different in this append, versus the
other functions.

Bruce

> +}
> --
> 2.33.0
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7292): https://lists.yoctoproject.org/g/meta-virtualization/message/7292
> Mute This Topic: https://lists.yoctoproject.org/mt/91216742/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


--
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

