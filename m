Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EE8CC6379F
	for <webhook@archiver.kernel.org>; Fri, 17 Feb 2023 13:55:44 +0000 (UTC)
Received: from mail-io1-f51.google.com (mail-io1-f51.google.com [209.85.166.51])
 by mx.groups.io with SMTP id smtpd.web11.6749.1676642138885665527
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 17 Feb 2023 05:55:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=HHXAYOe2;
 spf=pass (domain: gmail.com, ip: 209.85.166.51, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-io1-f51.google.com with SMTP id d191so430740iof.13
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 17 Feb 2023 05:55:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=dtwcpMW7x1K8REGJc6WT8i4ePdr6Ma/cj0Imtg381GM=;
        b=HHXAYOe2lVWOfY5Wnirnbs1GaZXe+2oCxhTiXUUJ+geVQM27MqpdbX0EgRuOSgRsns
         0RLeOEEyRCprh+feaEQUW8V+qvxS+Y4/0BabQrRVi70xCQsEaZ6VPxeGkMOoMXKmYUi4
         CUoOn2sRA3xwRnWc1Tfp2lSL1psz0Sap/YZqBzBLYB5bgo2qmX1p2N7OMtDjqAGs7nO0
         rCmucr8NdVM/yglEbtUhDK+d3LeQFrrEaFvp5uQN+lfKiw4AKBHGamfQhGFUSeKVjuHX
         nRW+rs+2nwfWyNkL4lRFnGR3Jc2gbZT1twXHBbc3beprr4hw7Iq9NpAA13lzvQ91CPbH
         ygKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dtwcpMW7x1K8REGJc6WT8i4ePdr6Ma/cj0Imtg381GM=;
        b=S0yDpeRZdrVFKZA1JUFKcKAtlbOaKNahJhiPe68yIl/PekTsy+HMt3gwbJpiXy4IOc
         crSCEM78vr0EVh+1LP639U6WEAHH2TyybOICqB4FI3K8o2oVeMv53MH5yXqH2LWM1uA8
         uvU5cTH5LAXoidvFv0g/oJePSqxXZ+7W78QVUB+1tVmpnf8lLu0nyEtdet9Abdl26A89
         8pnOXNwJfCduAwaDFkz9t22qtRp/NXPsZAM/aROvWkQvGbGJ8iL7R90RitNPTu0YFLsY
         BNbuSHa2fH4PoWigUDLiKCtdX5WuI5rBz4xkDpH5HPJL6QPYu12EQcljUnpl3qDSyWka
         3YQg==
X-Gm-Message-State: AO0yUKXDMZgBqHvUqn1TEbFLwxd+WSu8BrH6O3/FFBWYXHlH2zA4x56W
	QU59l1lMaIuM/xIukWYSx9S2O/cUMHf1Oz1k9ER5GWPmX+I=
X-Google-Smtp-Source: AK7set+f2YervzDxZJTgG7VVPeWrN3NZHyWgJmRphunWefcqb1zD0a56q1Jm+lsbcKek/4s6VlSjLy9D4fLVa/Zkh3c=
X-Received: by 2002:a5d:8254:0:b0:71c:1bd4:b768 with SMTP id
 n20-20020a5d8254000000b0071c1bd4b768mr2896952ioo.84.1676642137997; Fri, 17
 Feb 2023 05:55:37 -0800 (PST)
MIME-Version: 1.0
References: <20230217092014.3810-1-Qi.Chen@windriver.com> <20230217092014.3810-2-Qi.Chen@windriver.com>
In-Reply-To: <20230217092014.3810-2-Qi.Chen@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 17 Feb 2023 08:55:27 -0500
Message-ID: <CADkTA4MF-3n1bxXGjCLxdqGvg=3G8gX=ytLibEMt5_Yb_txWjg@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH 2/2] cri-o: create registries.conf to
 avoid image inspection error
To: Chen Qi <Qi.Chen@windriver.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 17 Feb 2023 13:55:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7867

On Fri, Feb 17, 2023 at 4:20 AM Chen Qi <Qi.Chen@windriver.com> wrote:
>
> When deploying a simple workload using 'kubectl appy -f', we
> met the following error.
>
>   Failed to inspect image "ubuntu:latest": rpc error: code = Unknown
>   desc = short-name "ubuntu:latest" did not resolve to an alias and
>   no containers-registries.conf(5) was found
>
> Create a registries.conf and install it to /etc/containers to fix
> this issue. The contents come from test/registries.conf in cri-o
> git repo, with test specific alias removed.

This will conflict with skopeo if both are installed in the same image.

Let's drop this patch, as I have a WIP change to create a configuration-only
package that adds files like these.

I can clean it up and push it to master-next shortly.

Bruce

>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  recipes-containers/cri-o/cri-o_git.bb          | 2 ++
>  recipes-containers/cri-o/files/registries.conf | 1 +
>  2 files changed, 3 insertions(+)
>  create mode 100644 recipes-containers/cri-o/files/registries.conf
>
> diff --git a/recipes-containers/cri-o/cri-o_git.bb b/recipes-containers/cri-o/cri-o_git.bb
> index f69dc0f..6e58b49 100644
> --- a/recipes-containers/cri-o/cri-o_git.bb
> +++ b/recipes-containers/cri-o/cri-o_git.bb
> @@ -19,6 +19,7 @@ SRC_URI = "\
>         git://github.com/kubernetes-sigs/cri-o.git;branch=release-1.25;name=cri-o;protocol=https \
>         file://0001-Makefile-force-symlinks.patch \
>          file://crio.conf \
> +        file://registries.conf \
>         "
>
>  # Apache-2.0 for docker
> @@ -100,6 +101,7 @@ do_install() {
>      install -d ${D}${localstatedir}/lib/crio
>      install -d ${D}${sysconfdir}/containers
>      install -m 0644 ${S}/src/import/contrib/policy.json ${D}${sysconfdir}/containers
> +    install -m 0644 ${WORKDIR}/registries.conf ${D}${sysconfdir}/containers
>  }
>
>  FILES:${PN}-config = "${sysconfdir}/crio/config/*"
> diff --git a/recipes-containers/cri-o/files/registries.conf b/recipes-containers/cri-o/files/registries.conf
> new file mode 100644
> index 0000000..0b929da
> --- /dev/null
> +++ b/recipes-containers/cri-o/files/registries.conf
> @@ -0,0 +1 @@
> +unqualified-search-registries = ['quay.io' ,'registry.access.redhat.com', 'registry.fedoraproject.org', 'docker.io']
> --
> 2.37.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7865): https://lists.yoctoproject.org/g/meta-virtualization/message/7865
> Mute This Topic: https://lists.yoctoproject.org/mt/97025063/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

