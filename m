Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB863C54EE9
	for <webhook@archiver.kernel.org>; Tue, 20 Sep 2022 12:45:47 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
 [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web12.11424.1663677944818291565
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 20 Sep 2022 05:45:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=DuwABrrR;
 spf=pass (domain: gmail.com, ip: 209.85.214.170,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pl1-f170.google.com with SMTP id w10so1367818pll.11
        for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 20 Sep 2022 05:45:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date;
        bh=5pQ4YyA0i9mqsspuS1U0JKkk7PbAmlWs55foRuFoxbo=;
        b=DuwABrrRE0KSJm1JUAyooR1vXlBtt4O5fMI7Eiux+tXhC2kkKSXh27UebyblXwWxoI
         eiLwEsmAFdwH+so386W3zWZzxi1XODskbN/GJc/KBGL7IS41qgSQVrgWW5SxgUnlRAzg
         VhXXWxbjw2zn2Sfiz52/j4kzPiU8xNiZUjuUJivCirKQwHGDyk1rRAUYHBSA1B75bIy1
         kNsqOZNZsOiguCQv8aEwNe9cAyfgmt25tgM/7uX4rEm13b8LGMv817SG1XeQSFleL+eh
         ycA4ETIbKTIB9TbAyoBpLE9XQxIPIJviAZBObUoZ4WLm6l5l6g0QjYQvwRLLPOyyM+I4
         lZng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date;
        bh=5pQ4YyA0i9mqsspuS1U0JKkk7PbAmlWs55foRuFoxbo=;
        b=iBp77S3de3WnYn4XkgyORIwK0gNjh602d2sk76cOTkXI4HnjnWvgpTRXKS7G7Q4Su0
         u2CmqBgmzKjUJSF8Lu+sxKBD4fz7Q3N3fpaT+PHPE/uj9O77fvStXReU8a0+0HJzXFfh
         7+dpCD+3vYA2tOGl8dVL8ZdJNoIW2ddFh1jwDzSpVMqxvqGNBnkRJuMD3FKrlf8qYxu6
         LCQHld+aGoDRENDm2bLPQVmm+aQStrjTlaR9up6iMjA3m9sKKUs1LSf6mrHxOLCd4Rls
         PF8PlL5YnkBfLVyfhFHKJdtrA5o6NPxh9UAKXF2hN3LFbcpuw+AhFzjo12bXuD6IaoZ8
         vf7Q==
X-Gm-Message-State: ACrzQf2fjFhkVKvv5RAiwvBJ0pzhR3MEfjU+bMia17aSYDuUT6MhI786
	P4ZCeVbnX7ejJsqOrC2Fm1VhHA0QvVOl4Uphakc=
X-Google-Smtp-Source: 
 AMsMyM70cIGYGV6Vyt2RwYKnMqAVIS2PXMRsT/7bqug5WeR1eWeRIq0pmNVYmbTwVBj8Gs0+czbfFFrP/s2sJfYRM5Q=
X-Received: by 2002:a17:902:ab15:b0:178:cdb:b98c with SMTP id
 ik21-20020a170902ab1500b001780cdbb98cmr4778080plb.57.1663677944149; Tue, 20
 Sep 2022 05:45:44 -0700 (PDT)
MIME-Version: 1.0
References: <20220920114609.495910-1-jose.quaresma@foundries.io>
In-Reply-To: <20220920114609.495910-1-jose.quaresma@foundries.io>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 20 Sep 2022 08:45:33 -0400
Message-ID: 
 <CADkTA4NYkryDK5oGDFhA3aWXTtd7t6RTUz9eMKOrbjTrJ7KHDg@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] docker: don't use -linkshared
 uncondictional
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org, ricardo@foundries.io,
	Jose Quaresma <jose.quaresma@foundries.io>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 20 Sep 2022 12:45:47 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7624

Jose,

There were a few typos in the patch, I've fixed them up, and tweaked
the shortlog.

I've relocated this to the .inc file, as both docker-moby and
docker-ce should be consistent with this possible tweak.

I also added a comment above the export to indicate that the default
value comes from go.bbclass and that currently only libnetwork / proxy
will leverage it.

The result is on master-next, have a look and let me know if it
addresses your issue.

Bruce

On Tue, Sep 20, 2022 at 7:46 AM Jose Quaresma <quaresma.jose@gmail.com> wro=
te:
>
> The linkshared is not supported in some machines like riscv64 and
> when supported we can use the GO_LINKSHARED instaed.
> So export GO_LINKSHARED on the recipe to be available for Makafile.
>
> Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
> ---
>  recipes-containers/docker/docker-ce_git.bb                    | 3 +++
>  .../docker/files/0001-libnetwork-use-GO-instead-of-go.patch   | 4 ++--
>  2 files changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/recipes-containers/docker/docker-ce_git.bb b/recipes-contain=
ers/docker/docker-ce_git.bb
> index b36ac0d..f010648 100644
> --- a/recipes-containers/docker/docker-ce_git.bb
> +++ b/recipes-containers/docker/docker-ce_git.bb
> @@ -55,3 +55,6 @@ DOCKER_VERSION =3D "20.10.17-ce"
>  PV =3D "${DOCKER_VERSION}+git${SRCREV_docker}"
>
>  CVE_PRODUCT =3D "docker"
> +
> +# to be used in the Makefile
> +export GO_LINKSHARED
> diff --git a/recipes-containers/docker/files/0001-libnetwork-use-GO-inste=
ad-of-go.patch b/recipes-containers/docker/files/0001-libnetwork-use-GO-ins=
tead-of-go.patch
> index d4f84e3..b9b41de 100644
> --- a/recipes-containers/docker/files/0001-libnetwork-use-GO-instead-of-g=
o.patch
> +++ b/recipes-containers/docker/files/0001-libnetwork-use-GO-instead-of-g=
o.patch
> @@ -34,8 +34,8 @@ Index: git/libnetwork/Makefile
>         @echo "=F0=9F=90=B3 $@"
>  -      go build -o "bin/dnet-$$GOOS-$$GOARCH" ./cmd/dnet
>  -      go build -o "bin/docker-proxy-$$GOOS-$$GOARCH" ./cmd/proxy
> -+      @$(GO) build -trimpath -linkshared $(GOBUILDFLAGS) -o "bin/docker=
-proxy-$$GOOS-$$GOARCH" ./cmd/proxy
> -+      @$(GO) build -trimpath -linkshared $(GOBUILDFLAGS) -o "bin/dnet-$=
$GOOS-$$GOARCH" ./cmd/dnet
> ++      @$(GO) build -trimpath $(GO_LINKSHARED) $(GOBUILDFLAGS) -o "bin/d=
ocker-proxy-$$GOOS-$$GOARCH" ./cmd/proxy
> ++      @$(GO) build -trimpath $(GO_LINKSHARED) $(GOBUILDFLAGS) -o "bin/d=
net-$$GOOS-$$GOARCH" ./cmd/dnet
>
>   # Rebuild protocol buffers.
>   # These may need to be rebuilt after vendoring updates, so .proto files=
 are declared .PHONY so they are always rebuilt.
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7621): https://lists.yoctoproject.org/g/meta-virtuali=
zation/message/7621
> Mute This Topic: https://lists.yoctoproject.org/mt/93801294/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [=
bruce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

