Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67A73F5A8D3
	for <webhook@archiver.kernel.org>; Tue, 21 Apr 2026 01:28:54 +0000 (UTC)
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2283.1776734924259942209
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 20 Apr 2026 18:28:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=qoBfvHZL;
 spf=pass (domain: gmail.com, ip: 209.85.160.178, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-506251815a3so31895111cf.0
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 20 Apr 2026 18:28:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776734923; x=1777339723; darn=lists.yoctoproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ib2+MECt2DD5UklqAsggxMdlO6P2xlcOsOFgQEQ/Sbo=;
        b=qoBfvHZLIZaEhkf2/ggklO4H+Iq/kikhnDQGDa+huRZpkYjaOiQzhha3SgarK1sEA0
         DrY4n/DfM7vSqTEBadhPKHGobmE7Mko6JMovbHKBm/CqVQEggnyCDb4gA53Ye9ltftsN
         9r7njD/4ihQ0EqQzuzsY56EjOmqO2ukFGFK5fc3pypcYVsO1FYdkAwcn/fqLyfv1xdS/
         Aw/CybXgeE028s7uwx9ddZWgaka9DTQrKrJUSqZE/yEUZV8P2ApvIm/XFx3pFfN0JY0T
         x17Pq5aFvZByyIY/X0Emb9VJkAo0sICmH+dUnYKBihAt7Qsqn/l0hstbnTTG5mYc5KsY
         tjyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776734923; x=1777339723;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ib2+MECt2DD5UklqAsggxMdlO6P2xlcOsOFgQEQ/Sbo=;
        b=YU0grp2b0YPlhN3xdFRvMg0AJSh2nLzCkx+oDNKMZ1QZZqvdEGVBbLvKaPI6Jlhnr8
         DXy06fLnxoiHnoW/dhwRTkHDFHZnUrn8dPmRshpNx2BhecrPVVYMuqMFAQo2QmSDHbdO
         9krUsHl8XAzAaS8feSZDKbAbJnjPpy6q3HXdmpetI/KDG+nN6VubD259P/dTZ+8VTnwb
         uDffr+53k9vRnTFvOmB742+Dv/T9dxmgiXIrZ6OlDNI/wFZqUiYoU1yiflwjcytj9d4g
         59eATo9CUqrPdHVl/Bva8pUjCW3aX4MwHObZr6wydO7nNHQPF2lxKdjqnJDePMNq77XU
         UYLg==
X-Gm-Message-State: AOJu0YzNiQixu+2D94XowsoAl6lQZCZAx1k2+0jOuDlXKtFMOwUVpdHx
	7BR3JE0iDkygWtzlT/cqOSqL1krhaqKljZhoJkZARHstJVxtWm6JT9F0
X-Gm-Gg: AeBDieuoyUxa00oDOayqFlSIvU9Zmt0IupFJy7Bz8mde2KHZQVFgg1xWxFecCfUzVCG
	CtayLWbUCeZ0F0LhRLT2OOXyOJGvz5GCmH8jNbDmWlCcPimA516Jzz82aNaCVrULFFQ0dHZJvUY
	NCjOzmRIeDY3Y0UY7Kz4L5KaIJN8SqG1McQ/hnCeeFlB0UAWVqo5YNXP98+/LU8reyKPPr0tGNK
	2oGokDk0QoXiEWCqHgZLrSUG/DGOcJkB+1gqOJu9nISsvBds3oD8pK+aAmnSPOMiyX+SzQlpERK
	6YTokjFk+nKpzIqtbr493y7ECFXoym4mtNXQqLHpTW/fr9+lEXsQ6zYDCkSG7Y4SeEDAXZxntOW
	OZhLTPLGC8ot+D/wGpEOAoRKfcK7MnMYzmspbFvwdd+CWjv+AHMS0ZEpolHNpSboD+r9sQL4aHP
	srQUlPDpeUVGwmUxBlsBw8IyR+7so+BhLOzQnHabrihKp4umjs+OyaLdzVmcSfEibYd70qqYFos
	kg48iIN1mT61JjEra+G1BAUrM6PpQp8LnxRXw/6zPS20eU=
X-Received: by 2002:a05:622a:2515:b0:50b:49e5:989b with SMTP id d75a77b69052e-50e36b3fe15mr241604531cf.22.1776734922961;
        Mon, 20 Apr 2026 18:28:42 -0700 (PDT)
Received: from gmail.com (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50e3bf260fbsm113966841cf.10.2026.04.20.18.28.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 18:28:41 -0700 (PDT)
Date: Tue, 21 Apr 2026 01:28:39 +0000
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: zhixiong.chi@windriver.com
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization] [V2][mete-virtualization][PATCH 2/2]
 libvirt: add secrets PACKAGECONFIG
Message-ID: <aebSx9hfCj6m-9mm@gmail.com>
References: <20260414045741.809844-1-zhixiong.chi@windriver.com>
 <20260414045741.809844-2-zhixiong.chi@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260414045741.809844-2-zhixiong.chi@windriver.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 21 Apr 2026 01:28:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9711

Sorry for the slow reply, I've been out of the office for the
past few days.

In message: [meta-virtualization] [V2][mete-virtualization][PATCH 2/2] libvirt: add secrets PACKAGECONFIG
on 14/04/2026 Zhixiong Chi via lists.yoctoproject.org wrote:

> After being upgraded to v12.1.0, the new virt-secret-init-encryption.service
> has been introduced, and it requires systemd to add openssl to PACKAGECONFIG.
> Because systemd-creds encrypt command will be executed in the service file.
> 
> Meanwhile this service was added into the dependency chain of the main service
> libvirtd.service, and will be enabled by default by libvirtd service without
> any build dependency detection according to the original upstream commit
> https://github.com/libvirt/libvirt/commit/97758bc9a0b1fccf8c0009308658f1204b113b89
> 
> In systemd recipe, the openssl PACKAGECONFIG is disabled at default. Finally
> the service file virt-secret-init-encryption.service and libvirtd will be
> failed as the following error:
> ># systemctl status libvirtd -l
>  * libvirtd.service - libvirt legacy monolithic daemon
>      Loaded: loaded (/usr/lib/systemd/system/libvirtd.service; enabled; preset: enabled)
>      Active: inactive (dead)
>  TriggeredBy: * libvirtd.socket
>               * libvirtd-ro.socket
>               * libvirtd-admin.socket
>        Docs: man:libvirtd(8)
>              https://libvirt.org/
> 
>  systemd[1]: Dependency failed for libvirt legacy monolithic daemon.
>  systemd[1]: libvirtd.service: Job libvirtd.service/start failed with result 'dependency'
> 
> ># journalctl -xe
> 
>    A start job for unit virt-secret-init-encryption.service has begun execution.
> 
>  systemd-creds[1251]: Support for encrypted credentials not available.
>  systemd[1]: virt-secret-init-encryption.service: Main process exited, code=exited, status=1/FAILURE
> 
> The above error info "Support for encrypted credentials not available." comes
> from systemd-creds command provided by systemd without HAVE_OPENSSL option at
> the source code src/shared/creds-utils.c
> 
> Here we add secrets PACKAGECONFIG for libvirt and conditional removal the new
> virt-secret-init-encryption in the libvirt.service.
> 
> Perhaps an alternative approach is to enable the openssl configuration for
> the systemd package—for instance, by creating a systemd.bbappend file.
> 
> However, the method here grants users the flexibility to independently select
> the specific configurations they wish to activate, thereby avoiding potential
> PACKAGECONFIG conflicts between packages.
> 
> The users can add the following configs in the conf/local.conf file, if they
> want to enable the full libvirt secrets functions:
> PACKAGECONFIG:append:pn-systemd = " openssl"
> PACKAGECONFIG:append:pn-libvirt = " secrets"
> 
> Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
> ---
>  recipes-extended/libvirt/libvirt_git.bb | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/recipes-extended/libvirt/libvirt_git.bb b/recipes-extended/libvirt/libvirt_git.bb
> index b5b0a5f2..a9e6180a 100644
> --- a/recipes-extended/libvirt/libvirt_git.bb
> +++ b/recipes-extended/libvirt/libvirt_git.bb
> @@ -177,6 +177,8 @@ PACKAGECONFIG[firewalld] = "-Dfirewalld=enabled, -Dfirewalld=disabled,"
>  PACKAGECONFIG[libpcap] = "-Dlibpcap=enabled, -Dlibpcap=disabled,libpcap,libpcap"
>  PACKAGECONFIG[numad] = "-Dnumad=enabled, -Dnumad=disabled,"
>  PACKAGECONFIG[nftables] = ""
> +# Require systemd to add openssl to PACKAGECONFIG, so disable it at default.
> +PACKAGECONFIG[secrets] = "-Ddriver_secrets=enabled, -Ddriver_secrets=disabled,"

The problem with this is that we are creating two independent configuation
items, and if they aren't both set .. it won't work.

While a distro feature is probably overkill, it is distro and image features
which are supposed to do this sort of coordination.

Maybe an image feature ? or more simply, just enable the requirement in
systemd when "virtualization" is in the image features. That can be a
bbbapend to systemd gated on the distro feature (like the rest of the
similar items in meta-virtualization.)

With that, the comment above the secrets packageconfig could be dropped.

Bruce

>  
>  CVE_STATUS[CVE-2014-8135] = "fixed-version: Fixed in 1.2.11, NVD tracks this as version-less vulnerability"
>  CVE_STATUS[CVE-2014-8136] = "fixed-version: Fixed in 1.2.11, NVD tracks this as version-less vulnerability"
> @@ -232,6 +234,16 @@ do_install:append() {
>                  mv ${D}${prefix}/lib/systemd/system/* ${D}${systemd_system_unitdir}
>                  rmdir ${D}${prefix}/lib/systemd/system ${D}${prefix}/lib/systemd
>              fi
> +
> +            # secret service is completely removed in libvritd.service dependency when secrets disabled.
> +            if ! ${@bb.utils.contains('PACKAGECONFIG', 'secrets', 'true', 'false', d)}; then
> +                sed -i \
> +                    -e '/^Requires=virt-secret-init-encryption.service/d' \
> +                    -e '/^After=virt-secret-init-encryption.service/d' \
> +                    -e '/^Environment=SECRETS_ENCRYPTION_KEY=/d' \
> +                    -e '/^LoadCredentialEncrypted=/d' \
> +                    ${D}${systemd_system_unitdir}/libvirtd.service
> +            fi
>  	fi
>  
>  	# The /run/libvirt directories created by the Makefile are 
> -- 
> 2.53.0
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9699): https://lists.yoctoproject.org/g/meta-virtualization/message/9699
> Mute This Topic: https://lists.yoctoproject.org/mt/118818275/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


