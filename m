Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74977CD98CF
	for <webhook@archiver.kernel.org>; Fri, 12 Jun 2026 16:54:22 +0000 (UTC)
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.75048.1781283259016050722
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 12 Jun 2026 09:54:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Ejm0KJFp;
 spf=pass (domain: gmail.com, ip: 209.85.219.45, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-8ce9df49c5fso18213196d6.1
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 12 Jun 2026 09:54:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781283258; x=1781888058; darn=lists.yoctoproject.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to
         :subject:cc:to:from:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l1pCiHv7j55KVv7XIDZeXrofTzMBnRCVKSk1C72xbyM=;
        b=Ejm0KJFpHH4+nYznuku27qq5H3Su8a/exIDwnQo2PMP2t4IEA/V7g4zrIrMSc/KKZX
         GZM47oHpXOZyeDdYIx4BR6cSQof+2F08aClz+RT7c+7ZpytYU4YxnqKzRRn+j6QOp3D/
         861DXDpsL0FeKvNyfpJyWvHcs+xIc11MzGThyZCTS+39GrbFVQgurMJtnOs0EMoqcQF5
         hD3kgtogAHbhg+pVqwzOZdRxNHS06pD++qEXftBIYZ9vHC6jXM/4sYzOtHKYvcEAAuxu
         KixtbO8zWqhxV1D3Tjgv+A1ougolWx6SjvXf1tBWUe5XqOTknoMP9XPNx3pKT68SZWcz
         PJYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781283258; x=1781888058;
        h=mime-version:content-transfer-encoding:references:in-reply-to
         :subject:cc:to:from:date:message-id:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=l1pCiHv7j55KVv7XIDZeXrofTzMBnRCVKSk1C72xbyM=;
        b=nDVRfiLOmrUAySQE9vwfqlVQlN78dODKl9QJrcqkT2QcKQ29yffRcOjIAjL+6VoJhI
         farROmsIq4+gTct9eecoI2dpAhY+nSFA842PKRJUwciD9xbptNszVLEvhkNYe8Nr+xE1
         g0g13oq1mG77N6Mv3ttVDLalYaC0ttBCrZKhDqFPTJ4ybLXexKGOhQAVjtrOw4ZXR8T6
         vUt4cLvGu6z+m9qwQ+F/CGR3MJIDoZxgaO7lh/tYjJ4M5/s1ajM6z68ty4NHSuqQI85B
         8/hxdGGw7wmmgrOH7inx8KGSp1XGSuPHlLBfWJcwythsL2lpF2S5g/ktVnUCZM1SiQo6
         PTQw==
X-Gm-Message-State: AOJu0Yxmu9i1KBSGYdfYWBHll5LlF6jhmu2D5xvFxaWbb4ugF83tN1yl
	4glq+bjafubgCy/RGi6BgVtpePCvBdEaQBdqijTW2Ta6uxZxYBwZcqDX
X-Gm-Gg: Acq92OHHHm8OZbG8kBWgbSXqoAEmCpL1FgOqSfGoXlSGdxaMU/k3y+wxYLgdKhUnbb4
	I7GZ2OR7PwyH4KYTCM4eSrMWTCDDzNgDmFGmKTSKBWsR+X2FRriMXAGVgv8BqiHjciNHXGpwsIw
	H/qRnwEuGofZ09m8Vw3xSSEm/Hk2gr7SVDpGguBzzOSQe47Fgqx9bWle+n1axu90LnhbEt4rFrQ
	o3jNHkLtLipbnTtOF85ol5EvmYRlgDbAODOxHXDP32qESUzqwHVlRNG7trytHy8ghi+ytQXMYLT
	Z5vB9aia0jhp0SxpUMd624Sq7bgtB/y+HuTVDcWmOOOWs1K0V49jEbc+Io6nlQSFEovNlv4O4V/
	+cGzrUFCpAAMkQk3p3UxSetRGkYCrvdtmb9iqZH9NT78VAJaxo43gcsnhaZ599eyGTqcxR4weRh
	Asf53XN/tjEfQAPnTfe5QY8rWNi8s2m3uNQ0wWaVCg4afW2KPaIJ/mJkqE/0/gzXQEvfbz5xz+Y
	H9i1NDXyqN25cauGBHMnEQEmgu8F30bb5kDiiYq5+oaqXwYnbcLVNxR6z18akMDiSxwlZTQgaF/
	kEeXK1prPjJEJr27UCaLADJthyeAOFGoG5A=
X-Received: by 2002:a05:620a:260e:b0:914:bd27:2d1 with SMTP id af79cd13be357-917eefc34f8mr68743685a.11.1781283257685;
        Fri, 12 Jun 2026 09:54:17 -0700 (PDT)
Received: from [127.0.1.1] (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9161a006ef0sm248812485a.24.2026.06.12.09.54.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 09:54:17 -0700 (PDT)
Message-ID: <6a2c39b9.af142770.352616.063b@mx.google.com>
Date: Fri, 12 Jun 2026 09:54:17 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: ticotimo@gmail.com
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][PATCH 1/7] classes: add
 container-nonroot-user.bbclass
In-Reply-To: =?utf-8?q?=3C3067d13e8e08136d3e8af275a4e501589f8a38a1=2E1780104?=
 =?utf-8?q?071=2Egit=2Etim=2Eorling=40konsulko=2Ecom=3E?=
References: <cover.1780104071.git.tim.orling@konsulko.com> =?utf-8?q?=3C3067?=
 =?utf-8?q?d13e8e08136d3e8af275a4e501589f8a38a1=2E1780104071=2Egit=2Etim=2Eo?=
 =?utf-8?q?rling=40konsulko=2Ecom=3E?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 12 Jun 2026 16:54:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9870

Hi Tim,

A few things on this one =E2=80=94 none of them blocking the intent, but wort=
h a
small follow-up either as a fixup in this series or a v2.

On Fri, May 29, 2026 at 18:31 -0700, Tim Orling wrote:
> For secure and production environments, we want to run containers as a
> non-root user. Some applications, such as Python, require a $HOME
> directory with proper permissions. Because OCI_LAYERS :directories:
> copies with 'cp -a --no-preserve=3Downership', we need a fixup function
> to create the proper permissions and ownership in a new raw layer.
>
> The behavior here is inspired by dhi.io/python:3 (Docker Hardened Image)
>
> Signed-off-by: Tim Orling <tim.orling@konsulko.com>

The non-root + DHI-style image is a real gap in what we ship today;
glad to see it filled.

> +inherit extrausers
> +
> +NONROOT_USER ?=3D "nonroot"
> +NONROOT_UID ?=3D "65532"
> +NONROOT_GID ?=3D "65532"
> +
> +# ------------------------------------------------------------------------=
---
> +# Create the unprivileged "nonroot" user (uid 65532, group 65532)
> +# ------------------------------------------------------------------------=
---
> +EXTRA_USERS_PARAMS =3D "\
> +    groupadd -g ${NONROOT_GID} ${NONROOT_USER}; \
> +    useradd -m -u ${NONROOT_UID} -g ${NONROOT_GID} -d /home/${NONROOT_USER=
}  ${NONROOT_USER}; \
> +"

This hard-assigns EXTRA_USERS_PARAMS rather than appending. Any image
that inherits container-nonroot-user AND wants its own extrausers (e.g.
a recipe that needs an additional service account) loses whatever else
was set, and the order of inheritance silently determines who wins.

Suggest:

  EXTRA_USERS_PARAMS +=3D " \
      groupadd -g ${NONROOT_GID} ${NONROOT_USER}; \
      useradd -m -u ${NONROOT_UID} -g ${NONROOT_GID} \
              -d /home/${NONROOT_USER} ${NONROOT_USER}; \
  "

That way the class composes cleanly with anyone else who sets
EXTRA_USERS_PARAMS earlier.

> +# Make sure we can write to e.g. /home/nonroot/.python_history
> +# using :directories: in OCI_LAYERS does not preserve permissions
> +fakeroot fix_oci_home_perms() {
> +    cd ${IMGDEPLOYDIR}
> +    image_name=3D"${IMAGE_NAME}${IMAGE_NAME_SUFFIX}-oci"
> +    layer_tar=3D"${WORKDIR}/oci-home-fix-layer.tar"
> +
> +    rm -f "$layer_tar"
> +
> +    python3 - "$layer_tar" <<'PYEOF'
> +import sys, tarfile, time
> +
> +layer_tar =3D sys.argv[1]
> +mtime =3D int(time.time())
> +
> +# (path, mode, uid, gid)
> +entries =3D [
> +    ("home",         0o755, 0,     0),
> +    ("home/${NONROOT_USER}", 0o700, ${NONROOT_UID}, ${NONROOT_GID}),
> +]

Two things about the Python heredoc:

1. The 'PYEOF' delimiter uses single quotes, which would normally suppress
   shell expansion inside the heredoc =E2=80=94 but bitbake expands ${NONROOT=
_USER}
   etc. at parse time *before* the shell ever sees the body, so the
   expansion does happen, just via a different path than the reader expects.
   Worth a one-line comment so the next person doesn't try to "fix" it.

2. While the values are simple here (alphanumeric user, integer uid/gid)
   it's fine, but if someone ever sets NONROOT_USER to something with a
   quote or backslash, the Python source is no longer well-formed. Since
   this is a meta-virt-internal class, low risk =E2=80=94 but a comment
   ("NONROOT_USER must be a bare identifier") would protect it.

> +    umoci raw add-layer --image "$image_name:${OCI_IMAGE_TAG}" "$layer_tar"
> +    rm -f "$layer_tar"
> +
> +    rm -f "$image_name.tar" "$image_name-dir.tar"
> +    ( cd "$image_name" && tar -cf "../$image_name.tar" "." )
> +    tar -cf "$image_name-dir.tar" "$image_name"
> +}
> +do_image_oci[postfuncs] +=3D "fix_oci_home_perms"

The repackaging step at the bottom assumes do_image_oci's output layout
(image_name.tar / image_name-dir.tar) is stable. If image-oci.bbclass
ever changes its packaging naming, this silently produces a broken
tarball =E2=80=94 there's no error checking against the assumption.

A defensive option: stat the expected files before rm -f / tar -cf, and
bbwarn if either is missing rather than recreating from a possibly-empty
directory. Or, if there's a helper in image-oci.bbclass that already
does the repackaging, call that instead of rebuilding by hand.

Otherwise the series looks good =E2=80=94 I'll keep going through 2/7..7/7 and
respond per-patch as I have specific notes.

Bruce

