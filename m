Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E940CD98CF
	for <webhook@archiver.kernel.org>; Fri, 12 Jun 2026 18:24:03 +0000 (UTC)
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.76908.1781288633946569204
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 12 Jun 2026 11:23:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=sDds/As2;
 spf=pass (domain: gmail.com, ip: 209.85.219.42, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-8ccf6a63a45so16474746d6.3
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 12 Jun 2026 11:23:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781288633; x=1781893433; darn=lists.yoctoproject.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to
         :subject:cc:to:from:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UdVMSI0afJpIaiGvjgcsGkzlijZafSGfwBZtjtKhp9E=;
        b=sDds/As2QDbeOUDl5aGHJKbacYRvMZU+ITOJ5nrHbpmgY1xEZykcqfszgA2oIMwxjK
         MxpcEIMCkYs2YRPFPmq77R0aWwsFRitJaCg0ReSpBHCBeoejXqB0OvL0cQnlBzTEipzY
         FUp2b8IRG4s8pwoMoA4Vu2lQjRhn5TbwBwyJAtRO6jAr7XVYeTEnXmI8bUZnvNZ1Z9Kc
         FNKLr8+CaMlCXke5ks9RimaR+mGT7uDwpzyeASSM8RQulXlTPqQm6mEr8IE0T+Urj/9v
         l5oBTzS8+NYpuLrvngcM8xiI85TPfcyPndY42MmJQkmOKuKbyz/8U0IZSTsfK1rAbJMz
         3LPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781288633; x=1781893433;
        h=mime-version:content-transfer-encoding:references:in-reply-to
         :subject:cc:to:from:date:message-id:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UdVMSI0afJpIaiGvjgcsGkzlijZafSGfwBZtjtKhp9E=;
        b=D6XYmjvPPS/2j1J0ZZRlJvDqdf6cS1TG6JwFvH4xToAsHsxSc7yahDsDwTe8t3urx6
         Y3EIlvMxPCYSW+ZqYSa5FlgpnPw1GgVBgpVEoVjJMe/z4T1tfnrTCiXex+yLHoT2GfHf
         1a7UZIv7pq4uqWXoGGstdMaxvoTGFCzlPqkf6EqUYoKT4cfHbY/dX6JCfjCDPAtvgbwU
         46XH+uD3mDZK4kmRKH/KLt02twfBaq7t9CN0EdZsXOxIPK9xaLEMfwhhhW4G90i6fbxf
         td6CBywn05eDI+6NdZrT+R2W9psgG7aIxXzaC0zM6quHIB/T5BzCT9d4JoDtJqqxAGm8
         qqQw==
X-Gm-Message-State: AOJu0Yxiyobolqmcdu9H2d0DSvBubMdJ1krDjhpZkkPo98lrhS3nhSZ0
	pbdpcCmWvSoS3FtlRAyiDcnAMoxrxbnj04bKS2r63kTEGOA74VqBYCda
X-Gm-Gg: Acq92OFfHh5bai3w4BHSsIU2GgipjT3x+g1SA4dlIpt+hFLWkARzSkCiGZxL8miiwl3
	kHkiXjk1A69bjJAhgqlVZKsY8NFGZN8AQ+L+nxcNsFEk7ntpQ6BB7Xnd5bzuscgUk2+SLYCapMk
	lcebUq3gGoq3sngTeQ46+mEPwvTN02YM8dJ0BfAXpq2mzQKeZMqjTqBuYa1DotK5NUc8bqmkCKi
	nO2z74V7qcJwl5ZuI0Z22H49+COuWbQWgH0Ljm1NC2FFx5CvNhPR0UGHpIUAvPL6HX3MwKEaTwS
	d9nuwDLdS0kTDwe5DpXoJz4YoSm6Ev5ldD2y8acpIOdTss2tRBImsXinE8zCnqLWXsYVZ1Ch6sl
	1zQ0Pq3GiLYjQI1o3cO7/JmbhZXo1bJ97rnVa+4ZJw4HyzdsB+4xy9yohQIlsUqal1+ACa8N9uf
	NuYnY6zDtMAhu8hL+rFlrODFsVSbabap8OZfuiKSYP7BZwGSMY5jcTcVStqkkZ99hTqjpzCOapS
	V4SC4X70diZXMll1lu8WO17su+JlddksKQj36pnDR/+QNORj01Uq8cG9ZcxiZt2wMnYeLoRbIZh
	7NvpBUDonjD7ZQ+BP80sgrURHgCSW9kI68I=
X-Received: by 2002:a05:6214:500f:b0:8ca:1ddd:a6b8 with SMTP id 6a1803df08f44-8d32c7ce63bmr75041416d6.14.1781288632856;
        Fri, 12 Jun 2026 11:23:52 -0700 (PDT)
Received: from [127.0.1.1] (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8d302211f20sm30631686d6.21.2026.06.12.11.23.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 11:23:51 -0700 (PDT)
Message-ID: <6a2c4eb7.b63906d5.2d75f7.312b@mx.google.com>
Date: Fri, 12 Jun 2026 11:23:51 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: ticotimo@gmail.com
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][PATCH 7/7] app-container-curl: use
 multilayer mode; container-nonroot-user
In-Reply-To: =?utf-8?q?=3Cf3106949b40e31f8a993419a0fd8c463ed7a642c=2E1780104?=
 =?utf-8?q?071=2Egit=2Etim=2Eorling=40konsulko=2Ecom=3E?=
References: <cover.1780104071.git.tim.orling@konsulko.com> =?utf-8?q?=3Cf310?=
 =?utf-8?q?6949b40e31f8a993419a0fd8c463ed7a642c=2E1780104071=2Egit=2Etim=2Eo?=
 =?utf-8?q?rling=40konsulko=2Ecom=3E?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 12 Jun 2026 18:24:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9876

Hi Tim,

Wrap-up patch, mostly aligns curl with the new conventions. One real
question, one observation.

On Fri, May 29, 2026 at 18:31 -0700, Tim Orling wrote:
> * Move to recipes-containers/images to show maintenance intent
> * Switch to multilayer mode to more like the other "library"/"official"
>   container recipes.
> * Change OCI_IMAGE_TAG to "latest" for similar reasons.
> * Change OCI_IMAGE_ENTRYPOINT_ARGS to "--help" to be more like upstream
>   containers.

The directory move right. no issues. recipes-demo was always
"here's an example", recipes-containers/images is "this is supported".
Same for "easy" =E2=86=92 "latest"; matches Docker convention.

The "--help" default is a small but a win ... running the image with
no args now self-documents instead of trying to hit a probably-absent
localhost:80.

> +OCI_LAYERS =3D "\
> +    base:packages:base-files+base-passwd+netbase \
> +    ${@bb.utils.contains('PACKAGECONFIG', 'dev', 'shell:packages:${CONTAIN=
ER_SHELL}', '', d)} \
> +    curl:packages:curl+ca-certificates \
> +"
[...]
> -CONTAINER_SHELL =3D "busybox"

This worries me. The old recipe had CONTAINER_SHELL =3D "busybox" at
the top level, so the variable always had a value. The new recipe
removes that line and only references ${CONTAINER_SHELL} inside the
conditional shell layer.

In non-dev mode that's fine because the whole bb.utils.contains
expression resolves to the empty string and the layer doesn't appear.

In dev mode the OCI_LAYERS line expands to:

    shell:packages:

=E2=80=A6because nothing in the recipe (or in container-nonroot-user.bbclass)
sets CONTAINER_SHELL. image-oci.bbclass's validator parses this as a
three-field entry with empty content, so it doesn't bb.fatal =E2=80=94 but no
packages get added to the auto-derived IMAGE_INSTALL, and the
resulting layer is empty. The container is silently shipped without
a shell, which is exactly the thing dev mode is supposed to provide.

Two ways to fix:

  a) Add a default in the recipe near the PACKAGECONFIG declaration:

         CONTAINER_SHELL ??=3D "busybox"

     Then anyone enabling dev gets busybox by default and the variable
     remains overridable.

  b) Push the default into container-nonroot-user.bbclass so every
     recipe that inherits it gets a consistent shell value.

I'd lean (a) =E2=80=94 the class shouldn't carry a shell concept; that's a
per-recipe choice =E2=80=94 but either works.

> +OCI_IMAGE_RUNTIME_UID =3D "${@bb.utils.contains('PACKAGECONFIG', 'dev', '0=
', '${NONROOT_UID}', d)}"

This dev-mode-overrides-uid pattern also appears in 2/7 (python). It's
clean here, and identical there =E2=80=94 another candidate for the helper
class refactor whenever the rootfs_fixup_var_volatile factor-out
happens, since it's the same shape of "PACKAGECONFIG dev means root".

> +IMAGE_INSTALL:append =3D " curl ca-certificates"

Same series-level point as the earlier recipes =E2=80=94 image-oci.bbclass
now auto-derives this from OCI_LAYERS in v2 / master-next, so the
line can go.

Bruce

