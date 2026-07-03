Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14E9EC43602
	for <webhook@archiver.kernel.org>; Fri,  3 Jul 2026 15:28:27 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.95655.1783092502353269955
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 03 Jul 2026 08:28:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=QUsyVf+8;
 spf=pass (domain: gmail.com, ip: 209.85.216.44, mailfrom: ticotimo@gmail.com)
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-37e0a189b0bso431496a91.1
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 03 Jul 2026 08:28:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783092502; x=1783697302; darn=lists.yoctoproject.org;
        h=message-id:date:references:in-reply-to:cc:to:subject
         :content-transfer-encoding:content-type:mime-version:from:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=OgRmc9I0rjQRTTM5nef3rwh4RUGYKIn0G2o8KqDPMuU=;
        b=QUsyVf+8SEoLYdmW8SjwQNyTzQSyHGuM2zJhONuuX5DP4mNHvEbhscsvxf1aOgevSO
         zTF/5pQVQ7OlGSeuZtcxXAyMxekbSQjdGvCsFjpG0DSGvp6gZLmncurEVcaG4vIMIjUW
         7Uz6NXGj6YwOoHK+/Rw8VXPfu712uFkH7NOl7B+8qw7Z3Xmx/UcEYXVtHInCnv5ZE/mq
         oUzQzjd3YobanSb0St1DPzB6riIKy7iqXeC6t3C0yMF9psp2mQhFQwbrSdcF4d4AgGQ7
         45UD6a90/p29qUXV/SvSF//TOOpegIshpvDsmI5WO60H5Ze58KrvCH1tYDcQKbs7DztN
         qluA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783092502; x=1783697302;
        h=message-id:date:references:in-reply-to:cc:to:subject
         :content-transfer-encoding:content-type:mime-version:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OgRmc9I0rjQRTTM5nef3rwh4RUGYKIn0G2o8KqDPMuU=;
        b=dZRw22L5w2Ej58ry9q3YfPF5jq9HOTVv4WTuY543BzPrrj1kCQHNlkCkeXgqH8BmpS
         NFXxy+GVbrf8VVmeeNswPMakO6PiAgUcitdiZ6px0+f9ed1TwXHoDiBP+m0DYIQvd9rw
         lVnTAcKoGvnWcckqtfg/dqgLe6ZlKjAdezaHeeKK/y3wBMRmUPu1UR6ZYbnzmIkPJqnr
         KPjVXHkro2mOi4rJ7go2qO4n5PtkiIJDbDR3pg6kolgMylpuZBfYFdB6aLCSJhROEuEB
         rs6QKwxUqXhEViYNVPcmk6EgLK4sD1TCNGPsE2whKijL7+OK35wpgp0vmFKaaBtXcbny
         akAQ==
X-Forwarded-Encrypted: i=1; AHgh+RrJ5nf8MOgQzA5gApi398iPU2lQ3SwWlcr20sBJ4JTtELXR3JAk0vPd08mFp4CG4+dY6ir9SnDasMuXC3Yh80FxhNvu@lists.yoctoproject.org
X-Gm-Message-State: AOJu0YwFWIf6hBBAyk20U1uYctJsqVkoQzT93dV+aGxTCneK8Wl3kWqm
	hunGHRi0otuexWdHJ1UDebG+BfROmtUoNRTW2UJfhmNaP2JzGIO8xiTde7eg2w==
X-Gm-Gg: AfdE7clZ6Ckd1TtlO/K2itQ8+rnAhG2rbwqNMtFCns36tOjFbZfXS1fwYwRKZ/7yQa2
	VBpxZpYbVtNXGGl8Mv4rTr8UyfXZbEZ4txn92Oelkhc487/lMcnRvQHKsi1sbKsOfSVabZ573yu
	HCV4QWjSNbUw7X1bzT4VYeFIQBmsEdoqllOumEMN8C8qcg2PL8f3AMXKGV9JIp3zUkKvGe43nCP
	Pr+ZHS75zidflmyvQ9AjhuVOguNa1LtnNrsZ1EHQUSNZwEj+K+ORxStHhi0wdq4hMPn6pifdNCq
	QgBn6QUv6OwzanM3HgJW2jtuJejwvDHe0MOHuOfvNNydNuMkifnSHcA8oVX2X6mE5eQC7lv083q
	zPy/jmG/0GDqezbLn8bZRqSmS9c6ursJPmHjbk5Gf6ar7R22PtcX6NLBrq55YIX3jRlTMcXHlUa
	PGyDgdOPBW+TX37ksAlxAqmmF5Zzfla9NcRwlFXC0ouSyNglztbMjHPzNd
X-Received: by 2002:a17:90b:268f:b0:37f:df85:272f with SMTP id 98e67ed59e1d1-38293b99456mr20430a91.19.1783092501578;
        Fri, 03 Jul 2026 08:28:21 -0700 (PDT)
Received: from macbookpro.home.local ([69.9.132.159])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38127adeb21sm1142562a91.1.2026.07.03.08.28.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 08:28:20 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [meta-virtualization][PATCH 5/7] recipes-containers/images:
 add app-container-nginx
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: ticotimo@gmail.com, meta-virtualization@lists.yoctoproject.org
In-Reply-To: <6a2c4cba.ff298dd7.1b631b.63f3@mx.google.com>
References: <cover.1780104071.git.tim.orling@konsulko.com>
 <4b1e72e8de33b35f7e8b8c66bc0ef8820c722db1.1780104071.git.tim.orling@konsulko.com>
 <6a2c4cba.ff298dd7.1b631b.63f3@mx.google.com>
Date: Fri, 03 Jul 2026 08:28:19 -0700
Message-Id: <178309249987.29524.16274527706941065904.b4-reply@b4>
X-Mailer: b4 0.16-dev
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 03 Jul 2026 15:28:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9921

On 2026-06-12 11:15:22-07:00, Bruce Ashfield wrote:
> Hi Tim,
> 
> Most complex recipe in the series, and I like the the runtime-dir
> handling
> 
> A few nginx-specific things, that came up when I was searching up
> the runtime parts.
> 
> On Fri, May 29, 2026 at 18:31 -0700, Tim Orling wrote:
> 
> > Add OCI container image recipe for the NGINX web server. The image
> > uses multi-layer mode with separate base, nginx packages, nginx
> > runtime directories, and nginx log file layers.
> 
> [...]
> 
> > +NONROOT_USER = "nginx"
> 
> The biggest open question here. The nginx recipe in meta-webserver
> creates its own 'nginx' user (via useradd in inherit useradd or a
> postinst), with a uid the package picks. Now we have two paths trying
> to create user 'nginx':
> 
>   a) container-nonroot-user.bbclass adds it via extrausers as uid
>      65532 / gid 65532 (whatever NONROOT_UID/GID are set to).
> 
>   b) The nginx package's own user-creation step adds it with the
>      package's chosen uid.
> 
> Last one to run wins in /etc/passwd, but RPM/dpkg may also refuse a
> duplicate-uid useradd outright. Did you see any "user already exists"
> or uid-mismatch noise in do_rootfs? If not, the order happens to be
> fine in your build but it's fragile.
> 
> Are these options for v2 ?
> 
>   1) Override NONROOT_UID to whatever the nginx package picks for the
>      nginx user. Looks up the package's uid, set NONROOT_UID to match.
> 
>   2) Use NONROOT_USER = "nginxapp" or similar — a name that doesn't
>      collide with the package's own — and tell nginx to run as that
>      user via the conf file (`user nginxapp;`) instead of relying on
>      the implicit uid match.
> 
> Not blocking but worth a note in the recipe about which approach you
> chose and why, so we won't get cut and paste propagation without
> a reason.

Previously, our container was not even running as 'nonroot' user because of
inheritance order of image-oci and container-nonroot-user, this has been fixed.

Now, in container-nonroot-user, the UID:GID of the 'nginx' user is
changed to the 65532 'nonroot' user values in the layer which provides
/etc/passwd. The reason for keeping the 'nginx' user name is that there
are a number of places where upstream nginx uses the 'nginx' user name
explicitly. This is why the dhi.io/nginx:1.30 container sets the
'nonroot' user to have the 'nginx' user name. See for instance:
https://github.com/docker-hardened-images/catalog/blob/main/image/nginx/debian-13/stable.yaml#L81

One other issue that presented itself once we are running as uid 65532
was directory ownership. This has been fixed with the introduction of the
NONROOT_OWNED_DIRS list variable which fixes the ownership in the same
'raw' layer as the '/home/<nonroot_username>' was being fixed.

> 
> > +OCI_LAYERS = "\
> > +    base:packages:base-files+base-passwd+netbase \
> > +    nginx:packages:nginx \
> > +    nginx-dirs:directories:${localstatedir}/log/nginx+/run/nginx+${localstatedir}/volatile/tmp+${localstatedir}/volatile/log \
> > +    nginx-files:files:${localstatedir}/log/nginx/access.log+${localstatedir}/log/nginx/error.log \
> > +"
> 
> Nice mix of packages + directories + files layer types in a single
> recipe — this is exactly the scenario the multi-layer support was
> built for, glad to see it landing in a real recipe.
> 
> > +    # nginx opens the compiled-in error_log path before reading -c config.
> > +    # /var/log is typically a symlink to /var/volatile/log in a Yocto rootfs,
> > +    # so create the target path explicitly to guarantee the directory lands in
> > +    # the container layer regardless of symlink resolution order.
> > +    install -m 755 -d ${IMAGE_ROOTFS}/${localstatedir}/log
> > +    install -m 755 -d ${IMAGE_ROOTFS}/${localstatedir}/log/nginx
> > +
> > +    # nginx's compiled-in temp paths (client_body_temp, proxy_temp, etc.) all
> > +    # live under /run/nginx, which is not created by any package.
> > +    install -m 755 -d ${IMAGE_ROOTFS}/run/nginx
> 
> The /run/nginx catch is great — that's the kind of thing that bites
> you at first-request time and you can't reproduce without the right
> URL hitting the right module. Good comment too.
> 
> > +OCI_IMAGE_APP_RECIPE = "nginx"
> 
> Glad to see this in use. It's been sitting in image-oci.bbclass as
> documentation-only / hook-point, and this is the first recipe that
> actually sets it. Once we wire it up to auto-extract SRCREV/branch
> for OCI labels (the "future versions may auto-extract" hook comment
> in the bbclass), recipes that set it correctly will get the
> provenance labels for free.
> 
> Bruce



