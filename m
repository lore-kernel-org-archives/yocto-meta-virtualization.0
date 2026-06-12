Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AEA7CD8CA8
	for <webhook@archiver.kernel.org>; Fri, 12 Jun 2026 18:15:33 +0000 (UTC)
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.76749.1781288125664532430
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 12 Jun 2026 11:15:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=eRTuwe6i;
 spf=pass (domain: gmail.com, ip: 209.85.219.41, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-8ccdef9f3d4so13663886d6.2
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 12 Jun 2026 11:15:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781288124; x=1781892924; darn=lists.yoctoproject.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to
         :subject:cc:to:from:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=By+pzd/y/G8+5PWJLOdjuTotQu6xSk0KnNF+s4JaZO8=;
        b=eRTuwe6i/Wz8GDOc1pXUjvvaLASliMpWlcmHqFXOdfpzXL6RReZc3BAOiGmX1C01X/
         sGIZrdiGfUbMimiLEKQ3lJfFY11dkiGATG6xY0nyQRz1DewpwajHEfafHMB3n6sG9hu/
         xAGp6Jqq92gFy3x9XXgqh5UhXZh5orO7kdskgMJf6l31x2fDyX+hgWW9qrfh5sJ80lSC
         he1RJQXWq2I8jMUTs6nOCYqELgIUiaVRYSQcxvevbpP3iaV+sS6sQOU9Sw2ICCILe5DX
         Vm6ec9lYWC7fNdwS6nuZripJW8UzUzVYfqrUf1ak7obUtpd9S5eS35mfPnLeX4FzBs8I
         tj8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781288124; x=1781892924;
        h=mime-version:content-transfer-encoding:references:in-reply-to
         :subject:cc:to:from:date:message-id:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=By+pzd/y/G8+5PWJLOdjuTotQu6xSk0KnNF+s4JaZO8=;
        b=Nvly35qbgS4dC999DwrlCFsbBrsd9l0R0yNikVfZpYjvnTi8fsLDiWVXoVWCoGVMiD
         gWHg+rbhJD3q1gg7zjwxRnMpJ9n2eDBeAPvz65OWV3u/1xa3FXSc5Tn2KCSu+83tmVDn
         7UDOD9RzMnXaa46tR73u8Gcs2FuTzRL42qD/7n4/pG2rt4OCPTRxVK4FbHxpySd3PNGp
         69faO4jPpllqj/hBQt7URi8QLqk9QnoTxTwUIl1f6LBrBUgvNVXaxRwatIdXH6AE+uaX
         bUpx6tIoS7fJI+c/Fg5sceMEF560Fryx+00Dh3FHo5EVix6jBt2gEYgwqEUXaU1bWvW0
         7GLg==
X-Gm-Message-State: AOJu0YxVpMv39gRyqabt7qAAI3ZN4cSr7TChIrAFS9woNliLngAsLLlj
	eZuaDd7NUErXkdEBRUk0uFk6e0cLttDk+UvYOXz+LfA9/auf4I+/sAkO
X-Gm-Gg: Acq92OGFT9nj1XZ5TEyQ45iWFDIcH1RYKnAjeF7V4HIMiIvu+lBJSIfK2ppyFc9oA/6
	OL6ZwvHERKmPXAKGniz0QCM9ByKXZE9fj/Q1s2jMq2zVwkzf3N5Lnpm6FByvvOhUSd3dl/gnoT3
	g5fsiuubAMGdh0jUrRf1Su/0leoOOd5GMZBxNzoG+iK5Uy+ZRgxeV8M+RyJVdPMpLx6ISMIhRvh
	DGuGRb8RrvZP82ogMKiow8kK0ThIamtUHL1KHmT9S0Wz+xMoAKCFAYoDxKkiQ/Hxyxn4kyEwjC9
	jngrT/4xbCIkTJgdfYPIavxAF4qBE4lS1I7R6HEKJ9gmRRH9JOL3P6MXJgyt/XFvkTRP907hB+M
	Ud8ZZPZDNbuwOiCalgMNLbXMlj/WQnOABzGzxo3tOO4LbLjG7G/SpX+uF3ao58rpHpYnDCoQwDS
	wYtgeztes5EjZ593MjFRdr2Yu0jC4vzvjTyObW1Fo/n/eaXsUa9hU/DL3U+aXn7pAVmbWDzbgq2
	DVvykPzzzpO2T2KtbTfSp3SIbYYAFR/Z3j0WjM4NfI5G/UjwL7NxpffRffu8uzYeA/UKlfjp2T8
	tDohPuIM0LIBemW0Zx29/qHA
X-Received: by 2002:ad4:5bc6:0:b0:8a2:d93c:993a with SMTP id 6a1803df08f44-8d44d04fe2dmr9819786d6.3.1781288123440;
        Fri, 12 Jun 2026 11:15:23 -0700 (PDT)
Received: from [127.0.1.1] (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8d30105fd81sm30069466d6.6.2026.06.12.11.15.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 11:15:22 -0700 (PDT)
Message-ID: <6a2c4cba.ff298dd7.1b631b.63f3@mx.google.com>
Date: Fri, 12 Jun 2026 11:15:22 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: ticotimo@gmail.com
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][PATCH 5/7] recipes-containers/images: add
 app-container-nginx
In-Reply-To: =?utf-8?q?=3C4b1e72e8de33b35f7e8b8c66bc0ef8820c722db1=2E1780104?=
 =?utf-8?q?071=2Egit=2Etim=2Eorling=40konsulko=2Ecom=3E?=
References: <cover.1780104071.git.tim.orling@konsulko.com> =?utf-8?q?=3C4b1e?=
 =?utf-8?q?72e8de33b35f7e8b8c66bc0ef8820c722db1=2E1780104071=2Egit=2Etim=2Eo?=
 =?utf-8?q?rling=40konsulko=2Ecom=3E?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 12 Jun 2026 18:15:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9874

Hi Tim,

Most complex recipe in the series, and I like the the runtime-dir
handling

A few nginx-specific things, that came up when I was searching up
the runtime parts.

On Fri, May 29, 2026 at 18:31 -0700, Tim Orling wrote:
> Add OCI container image recipe for the NGINX web server. The image
> uses multi-layer mode with separate base, nginx packages, nginx
> runtime directories, and nginx log file layers.
[...]
> +NONROOT_USER =3D "nginx"

The biggest open question here. The nginx recipe in meta-webserver
creates its own 'nginx' user (via useradd in inherit useradd or a
postinst), with a uid the package picks. Now we have two paths trying
to create user 'nginx':

  a) container-nonroot-user.bbclass adds it via extrausers as uid
     65532 / gid 65532 (whatever NONROOT_UID/GID are set to).

  b) The nginx package's own user-creation step adds it with the
     package's chosen uid.

Last one to run wins in /etc/passwd, but RPM/dpkg may also refuse a
duplicate-uid useradd outright. Did you see any "user already exists"
or uid-mismatch noise in do_rootfs? If not, the order happens to be
fine in your build but it's fragile.

Are these options for v2 ?

  1) Override NONROOT_UID to whatever the nginx package picks for the
     nginx user. Looks up the package's uid, set NONROOT_UID to match.

  2) Use NONROOT_USER =3D "nginxapp" or similar =E2=80=94 a name that doesn't
     collide with the package's own =E2=80=94 and tell nginx to run as that
     user via the conf file (`user nginxapp;`) instead of relying on
     the implicit uid match.

Not blocking but worth a note in the recipe about which approach you
chose and why, so we won't get cut and paste propagation without
a reason.

> +OCI_LAYERS =3D "\
> +    base:packages:base-files+base-passwd+netbase \
> +    nginx:packages:nginx \
> +    nginx-dirs:directories:${localstatedir}/log/nginx+/run/nginx+${localst=
atedir}/volatile/tmp+${localstatedir}/volatile/log \
> +    nginx-files:files:${localstatedir}/log/nginx/access.log+${localstatedi=
r}/log/nginx/error.log \
> +"

Nice mix of packages + directories + files layer types in a single
recipe =E2=80=94 this is exactly the scenario the multi-layer support was
built for, glad to see it landing in a real recipe.

> +    # nginx opens the compiled-in error_log path before reading -c config.
> +    # /var/log is typically a symlink to /var/volatile/log in a Yocto root=
fs,
> +    # so create the target path explicitly to guarantee the directory land=
s in
> +    # the container layer regardless of symlink resolution order.
> +    install -m 755 -d ${IMAGE_ROOTFS}/${localstatedir}/log
> +    install -m 755 -d ${IMAGE_ROOTFS}/${localstatedir}/log/nginx
> +
> +    # nginx's compiled-in temp paths (client_body_temp, proxy_temp, etc.) =
all
> +    # live under /run/nginx, which is not created by any package.
> +    install -m 755 -d ${IMAGE_ROOTFS}/run/nginx

The /run/nginx catch is great =E2=80=94 that's the kind of thing that bites
you at first-request time and you can't reproduce without the right
URL hitting the right module. Good comment too.

> +OCI_IMAGE_APP_RECIPE =3D "nginx"

Glad to see this in use. It's been sitting in image-oci.bbclass as
documentation-only / hook-point, and this is the first recipe that
actually sets it. Once we wire it up to auto-extract SRCREV/branch
for OCI labels (the "future versions may auto-extract" hook comment
in the bbclass), recipes that set it correctly will get the
provenance labels for free.

Bruce

