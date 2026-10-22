Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6349.1792695108122159022
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 22 Oct 2026 11:51:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=BD8M2r+d;
 spf=pass (domain: gmail.com, ip: 209.85.219.52, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-91c19fc50abso2107126d6.1
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 22 Oct 2026 11:51:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792695107; x=1793299907; darn=lists.yoctoproject.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:date:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xRnKN1wBaaNxdZcVdsQsseu/vDokC46XQOMC3/a965Q=;
        b=BD8M2r+dARVOe8M6z93ZaDl0S46WYo71mL5dnwomFvM2KeXDrcWLMpM1uPkeuqvqaN
         Kxh5jpvIlGjG0j5VhTnvzKQ6kjYoOUCZVRJp1jygyd9XXP8ik43+xqztTHjVuDUstuER
         VfozbmlVVRNiYjxXW26Kila9eHgh4vFtK2T+/p2WCa+5D22Js1qzUTdvLSZdMuCWR4WZ
         Kidtxn6F2M9dJ0rM+dWd8fUG/KS2NaDs5ye4fQjIIVABDibp6LmnmSQdmzMSN/H/PIvi
         ZLJH61SWoe9Kt1wAcJyikhKQ3G5tmorRBa5KGfA8laXDX7EROwcmm3brN/iYcULKDKaM
         fIfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792695107; x=1793299907;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xRnKN1wBaaNxdZcVdsQsseu/vDokC46XQOMC3/a965Q=;
        b=DE+G2yXgT/hhhLwCdHRoA62qxdUpJrPtaRvXK2S/LtiZ6mL8/o4RXZ3OSxQIpnF3ye
         GR5KKUSbcvba/BD4ytWY11qppXptSaYBuxC9/dCwFp5YEtLIujeIfHHUzHlN30hO1uVK
         kmL6FMGyxb4uwpnrBSYmPwmcgx6D4ocfrCT/QW8YIodX+LMvM7d/+fBc0XWlv2R14fQ0
         IrKA2nM20f9Zt+iqYWx6lQ8sbL4nqrgRUbiqsIa4sH8GEDWqACz/NX8eWcw2EWTj/yqG
         jDQIjHfbRYpVan+WscM/jPRK1zr8ZpV/SajLWEpzmETzsNPEAIGSzNEPW3YxSNF6QFK2
         0TsQ==
X-Gm-Message-State: AFq9FYK+USJHoi2kjuY1X37oO1gb1/3v9HyrHUxVP1NKRpy3r4Hdvw1K
	G10xrMTWj+s20VXVLUFodOZ8ywLduTQ9wv8FTd+OUAsyfpimLELZ+3bzd1KOl0bS
X-Gm-Gg: AYBFou2yMV7jmwlBxf1frZdbphLvpPvoLtMz+TSLrC9nGncVvcE7rB1u6vR42XjGFh6
	M4dXkWFlIcDA2HVEU0VBfo9gj6m9GPPyFiRFRk6h+iImdqPyqigBiqxZ0inF+dCKoZSBglbf3PW
	NDA/Wq8qGzJ5KmCR0KwqmEh7eeekZwWRHBRiBozeVsYpx7bCXoNLsTO3FW+jBg6mrlRlUCF4C5P
	PVQwYMwWp/hPEpxyGpFhNn8NQEbWeeoq2Ihs8SoarPgby4fnoi2YdjHYcIzUWKe+NxrRvmgwWoo
	hdnRXRTCqHSYhs2DDt0PrMYV4CSR762uP/ycna1YDJK05VxIAVUKAHqT8mfe0jfcVzrLcMjcOzQ
	9frtLZyNbUvAB5YqB6BJzB5vcnZ+M46Wx5VHpzTxdIA9O9SvTvMeF2XGJGYfx8dl+wEEuNw6QeW
	QIt6waiDWxdYPfdfg1MVLvUZMlj8Hhsn9T813wOVmWHdPLBu7GostkuQBO6TrHe2DjPHT7j/Ayp
	q9twDUtJKWzYbahb2GukwDkdfqYz/vp3CxF7kYg6tMqgmuqmhgYwkPS4yilvCUCncv7I2h4ckoj
	uZwZ9RRkzUptugWkBZ3VIAaM0jzjvVbQv+Vq00SB4Ga2x3cCtqPFH4w+HlZ/0ZNxV3BOtr3aSm3
	2WtlGYZwtNQjKs0RgKaSf30L9pltOBrCma100HwqACQHJdMhOQMCFFgzfyS/RJk8i+9PeDGO6Qg
	==
X-Received: by 2002:a05:6214:460b:b0:917:882c:5754 with SMTP id 6a1803df08f44-91c12eb2f44mr99896136d6.17.1792695106694;
        Thu, 22 Oct 2026 11:51:46 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from [127.0.1.1] (pool-174-112-35-248.cpe.net.cable.rogers.com. [174.112.35.248])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91c370d82b3sm4153586d6.37.2026.10.22.11.51.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 11:51:46 -0700 (PDT)
Message-ID: <6ada5b42.4bcc4235.70a25.8048@mx.google.com>
Date: Thu, 22 Oct 2026 11:51:46 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: tanguy.raufflet@savoirfairelinux.com
Subject: Re: [meta-virtualization][PATCH 1/2] image-oci: add OCI runtime bundle output
In-Reply-To: <1760387508.1766093.1791807841997.JavaMail.zimbra@savoirfairelinux.com>
References: <20260930144705.64792-1-tanguy.raufflet@savoirfairelinux.com>
 <6abd3113.e51cd04b.1fe4c8.0684@mx.google.com>
 <1760387508.1766093.1791807841997.JavaMail.zimbra@savoirfairelinux.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <meta-virtualization@lists.yoctoproject.org>; Thu, 22 Oct 2026 18:51:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/10123

Hi Tanguy,

Sorry for the slow reply, I've been busy since getting back from
OSSEU.

Dropping the postprocess-hook half clears the architectural concern,
and the real gap you've identified (runtime-spec fields with no
OCI_IMAGE_* equivalent) is worth addressing properly.

Context first, because it probably isn't in anyone else's memory
but mine (as it deals with the historcal path I took to the
current support and bundling):

Some is obvious, some isn't, but I'm stating it for the mailing
list archive.

image-oci already produces a runnable OCI runtime bundle during the
build. The umoci backend creates ${IMAGE_NAME}-oci-bundle/ with a
flat rootfs/ and config.json as a working intermediate (see
classes/image-oci-umoci.inc, the image_bundle_name variable). The
final rm at the end is the only thing that stops it being a
first-class output. The top-of-file docstring in
classes/image-oci.bbclass has walked through this flow since 2021,
including "runc run -b container-base-oci-bundle ctr-build" as the
canonical runnable form -- the capability has been there, it just
hasn't been exposed as a shippable artifact when using umoci.

So what I'm going to do:

1. Reinstate the historical dual-form tar convention described in the
   umoci backend's comment block at classes/image-oci-umoci.inc.  The
   .tar form (not -dir.tar) carries blobs/, oci-layout, index.json AND
   top-level rootfs/, config.json together, so extracting it gives
   both the OCI layout and a runnable bundle side by side. The current
   code only tars the layout contents; the comment is accurate for the
   intent, the code drifted. Fix: preserve $image_bundle_name through
   the tar step and include its contents in $image_name.tar.

   Both backends (umoci and sloci) will honor the same convention.
   Multi-layer squashing is a free consequence of umoci's own
   unpack-after-each-layer-repack flow -- the final bundle rootfs
   already reflects the full stacked tree flat.

   Rather than making this opt-in, this becomes the default output
   going forward for new builds, with the layout-only -dir.tar form
   preserved so existing users don't break.

2. Make bundles cross-installable, parallel to how
   container-cross-install.bbclass already treats docker and podman
   images. New BUNDLED_CONTAINERS flavor along the lines of
   "name:crun[:autostart]" (and/or ":runc" / ":bundle" -- naming
   TBD). The install step extracts rootfs/ + config.json from the
   .tar on-host at build time, lands them in the target rootfs at a
   stable path (/usr/share/oci-bundles/<name>/ or similar), and the
   first-boot generator writes a systemd unit that calls
   "crun run -b <path> <name>" ... similar to the existing
   generate_docker_service_from_bundle / generate_podman_service_
   from_bundle paths. Runtime (crun or runc) gets added to RDEPENDS
   when any BUNDLED_CONTAINERS entry uses the new flavor, same
   mechanism docker/podman use today.

3. First-class runtime-spec recipe variables for the fields you
   actually need to configure: mounts, capabilities, namespaces,
   readonly rootfs, no-new-privileges, resource limits as they
   surface, etc. These live in image-oci as regular recipe
   variables that control what gets emitted into config.json during
   the umoci / sloci build, so the recipe fully describes the
   container's identity end-to-end. We already have OCI_IMAGE_* for
   the image-spec fields (env, cmd, entrypoint, workingdir, user,
   labels, ports); the runtime-spec additions are the natural
   extension. Naming (keep OCI_IMAGE_* for coherence vs. introduce
   OCI_BUNDLE_* for strict spec-family hygiene) is still something
   I need to decide.

If this plan matches what you need, can you send a list of the
variables that you've identified as needed ? Along with expected
runtime results (if any) .. and with that, I can test what I've
pulled together in my WIP branches.

Cheers,

Bruce
