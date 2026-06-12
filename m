Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BFA3CD8CA8
	for <webhook@archiver.kernel.org>; Fri, 12 Jun 2026 18:06:43 +0000 (UTC)
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.76458.1781287593453930810
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 12 Jun 2026 11:06:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=qQANxq6L;
 spf=pass (domain: gmail.com, ip: 209.85.160.173, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-5177945a22eso8638351cf.1
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 12 Jun 2026 11:06:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781287592; x=1781892392; darn=lists.yoctoproject.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to
         :subject:cc:to:from:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jf6h10/Y5NfK9bPBVzHRf0rw3JDcjg3Ps4xXKvgYu/c=;
        b=qQANxq6LJ32pFRT+j3sgDP6qtXbdyfcbsewZKUybyl7UuXqXm1D4BpIkgGWMLySL6M
         XH6sTgGq+1P7+Yt1jjOfpcreg3PXIOBgaNhlZV+0jjNMxzuVA6kh+OnokzkOHvwOZ9fx
         1qOiMqdqz/Nc9umKSkKvd+AwM1SU1VxzzIymcfXZkl8UCj7ufTyrxPorHHLZgNUTPWGp
         e4AyIXlVMn/vQQVtDghwqcBCFKtPUpt2QKaqRVlJvhGfFn+Y5exC/f1OIgGzEl9XuxXq
         LJyVcP3BuZiA1tT7SVue6LkEwh1R9vCaqEv0hztkbtnKZcJQrE1d8Eu1o38lBepsMnEF
         6S9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781287592; x=1781892392;
        h=mime-version:content-transfer-encoding:references:in-reply-to
         :subject:cc:to:from:date:message-id:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jf6h10/Y5NfK9bPBVzHRf0rw3JDcjg3Ps4xXKvgYu/c=;
        b=SCFdAfuqTWQ3xzs29PR5X8Gpl9SNt/LNA6l9g97TODCd02GNksarGofoqe22NGWrEH
         xUMLvj+KmRdKX+r7w3Vvi/+2SlwI8XrCGLUWcg6E44MsK7362jFH3GShy+sSSL6YiN57
         DJuaZPElmw4IuB+U/0o2Vcxb1Dw90D2XG+4MPGbFszebtMU57f4sknkPthtV2GE/ML+n
         ZjuZIhp93TZ59gVxfXP/QuJXmTdg1wDrHKorADXyjNCtyjgQUDnmkZAhFJdj5O1H8vLU
         fheK5KYN96wG4CiJWozFLsBcWFG/WaRR8Uki+I/llv1OgW46l3vK9+zGYO+aRlRfQaZ5
         LxLQ==
X-Gm-Message-State: AOJu0Yz1t9GapMlGp8kxwAAPX9Ejuswod4iTZqhiYLvXtiDIgMpa8zSm
	zJEFoA6G5WdOxMYH40EBRRisciMM5L/8Jv7r2UYhtomVw+mbfA1FJTho
X-Gm-Gg: Acq92OEdlmcAQ9vS8J5SzNK9hqdYHIzcBn8atq4Brryq3tEhk5y2sih5R/8K/fVanGh
	Z3IEMNUzA/LAEK5QGY6w0+ox3Ix3V/mMw1Xf+b1wJUMU+Pyjp0viBHKUbwVhJiy8aEsOV48ch2l
	EyeyZdqAlzYX7K7jSQilP0ekdbLeUb0EKOjTn1ELuhrD7/Y9rOMaM4BBU/dz/bxEXE2KT0Kyzc1
	vrSDTsGUOqKS0N4rvbAfC0/S95G6EFG/fHcnWsZj417R1/2U4JPjP1GiKr6zVJwvJyrXK0p+WEi
	pdTSwXWHBcgDRjSvUePbEGCpZ2xuN+uhw0vZgU5/M6S0lVPPGQ0b1HxgZJVR4xWqk7sJy11H77m
	cAuwf5C7+plNNMmubKSZojqhbRWC12fbvZAgMHDgo3Lrl3ow1PTMwa8YgAyElLQqY9MSJm8XXxb
	4CvepwXszY0xp2V9fB00GPyS/iqamoH2TLto0tFWmkzsbTPuQdqwiIgoJIKfRcKNuxZI0Vl7On7
	qbKR+DRmZm+NyW5W/d1bZehrw+ar3nFwyjqKydpOi0+6eMcMOcbRhGWfTIfiWKtBYJXEShwzRmh
	crXM9xl8Q9PnBie678neQ1LA20Xo+PWNSL8=
X-Received: by 2002:a05:622a:a887:b0:517:899b:7f76 with SMTP id d75a77b69052e-517fe5bb4bdmr57120991cf.35.1781287592166;
        Fri, 12 Jun 2026 11:06:32 -0700 (PDT)
Received: from [127.0.1.1] (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-517fb7dacdfsm28912771cf.20.2026.06.12.11.06.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 11:06:31 -0700 (PDT)
Message-ID: <6a2c4aa7.5059f1c4.36e2b7.af06@mx.google.com>
Date: Fri, 12 Jun 2026 11:06:31 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: ticotimo@gmail.com
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][PATCH 3/7] recipes-containers/images: add
 app-container-mosquitto
In-Reply-To: =?utf-8?q?=3C8e68815affff4412c88b8a1139d6f916074bb3d1=2E1780104?=
 =?utf-8?q?071=2Egit=2Etim=2Eorling=40konsulko=2Ecom=3E?=
References: <cover.1780104071.git.tim.orling@konsulko.com> =?utf-8?q?=3C8e68?=
 =?utf-8?q?815affff4412c88b8a1139d6f916074bb3d1=2E1780104071=2Egit=2Etim=2Eo?=
 =?utf-8?q?rling=40konsulko=2Ecom=3E?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 12 Jun 2026 18:06:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9872

Hi Tim,

A few comments — most are series-level patterns that show up here for
the first time. I won't repeat them later to not waste our time

On Fri, May 29, 2026 at 18:31 -0700, Tim Orling wrote:
> Add OCI container image recipe for the Eclipse Mosquitto MQTT broker.
> The image uses multi-layer mode with separate base and mosquitto layers,
> exposes standard MQTT (1883) and WebSocket (9001) ports, and launches
> mosquitto with its default config file as the entrypoint.
>
> Inherit container-nonroot-user to run as 'nonroot' with UID 65532.

> +OCI_LAYERS = "\
> +    base:packages:base-files+base-passwd+netbase \
> +    mosquitto:packages:mosquitto \
> +"
[...]
> +IMAGE_INSTALL = " \
> +    base-files \
> +    base-passwd \
> +    netbase \
> +    mosquitto \
> +"

Same point as 2/7 — image-oci.bbclass now folds packages: layers into
IMAGE_INSTALL automatically (I pushed to master-next). When you respin,
this block can go.

> +# Workaround /var/volatile for now
> +ROOTFS_POSTPROCESS_COMMAND += "rootfs_fixup_var_volatile ; "
> +rootfs_fixup_var_volatile () {
> +    install -m 1777 -d ${IMAGE_ROOTFS}/${localstatedir}/volatile/tmp
> +    install -m 755 -d ${IMAGE_ROOTFS}/${localstatedir}/volatile/log
> +}

This same function appears in 3/7 (mosquitto), 4/7 (valkey), 5/7
(nginx), and 7/7 (curl) — four near-identical copies. Worth factoring
into a small helper bbclass (e.g. container-volatile-fixup.bbclass) that
each recipe can inherit, or rolling it into container-nonroot-user.bbclass
since every recipe that uses the fixup also inherits the nonroot class.
Not blocking — but it's a smell that's easy to silence in v2.

> +OCI_IMAGE_ENTRYPOINT = "${sbindir}/mosquitto"
> +OCI_IMAGE_ENTRYPOINT_ARGS = "-c '${sysconfdir}/mosquitto/mosquitto.conf'"

Two questions about running mosquitto as our nonroot (uid 65532):

1. The mosquitto package usually creates a 'mosquitto' system user
   (low uid, varies by build) and ships a default config that
   references paths under /var/lib/mosquitto/ and /var/log/mosquitto/
   owned by that user. As nonroot we won't be the package's expected
   user. Does mosquitto -c on the stock config actually start cleanly
   for you, or did you need to tweak the conf?

   I assume it runs fie, since you've been testing it for a while

2. If persistence is enabled in the stock mosquitto.conf (persistence
   true; persistence_location /var/lib/mosquitto/), we need a
   writable /var/lib/mosquitto for our nonroot user — same flavour of
   gap the rootfs_fixup_var_volatile workaround addresses, just for
   a different path. If you've already validated that persistence is
   off in the stock conf (or that mosquitto degrades gracefully when
   the persistence dir isn't writable), a one-line comment in the
   recipe explaining the trade-off would save the next person from
   re-deriving it.

Bruce

> +OCI_IMAGE_PORTS = "1883/tcp 9001/tcp"
> +OCI_IMAGE_TAG = "latest"

