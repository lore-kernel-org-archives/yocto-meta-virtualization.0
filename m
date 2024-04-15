Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4323EC4345F
	for <webhook@archiver.kernel.org>; Mon, 15 Apr 2024 20:58:14 +0000 (UTC)
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
 by mx.groups.io with SMTP id smtpd.web10.4127.1713214689213922951
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 15 Apr 2024 13:58:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=B/VEGgee;
 spf=pass (domain: gmail.com, ip: 209.85.222.169, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-78a26aaefc8so210641585a.1
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 15 Apr 2024 13:58:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713214688; x=1713819488; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fJdPcjA/PBl53xtuoMQUlpQxJlgxqXEl0+z+LSAHsK8=;
        b=B/VEGgee+ieEjaG3qVs+XY7G5VCsffuKghkhz5UlOwEWJHjuU4IrrNmyk5MoP9H48y
         E1sJY/53xorvQNzrQ6WmtqGRlkd2tGrVzaUFU9LDR4CDfXqjahE+aGNUq20vcPOIcJJj
         bia+2F93TLMiQTqALor9i6qQ6dRSeSD7EjqP6A/Qp/eDY1O5y23bvy/nNoAVzShh6I/U
         KZsouX0qILD52dtLemb9iSf8J63NF66MEKOSP1y7D+/x8gEBvPj8CbXFvo7CT3zfCcq5
         Nda+3diz4GCq5YSWBzKuQdtHawqKwhJmyHj892lI1OX3PRQ3+fryVH4NekMqnZV45/3v
         8wTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713214688; x=1713819488;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fJdPcjA/PBl53xtuoMQUlpQxJlgxqXEl0+z+LSAHsK8=;
        b=uyPwv0GBBKG8V/xgAQKsTSpnGTvTHszdBTKykfCT3D/pKTqrXimENXn2eKS6sAFJXp
         cDCAjRgl/NduW9luVCmmTyUUBr2bRbaIHwCYnZgRhG9HD0VqMfcKNJjLAiBnkEDMBHAK
         3LEZ8MvuP5b/BJUTZaPAQEFsAB7ZkSIUStprPJlpZNYwIR4TPx81yQp3OFo+5+ZryX13
         N642E/ITcDD916JSZ1h3RRU+beTk77NDFMNY37ZeknX/BCvtZU63cZ1O397ZGfipyFpl
         xByzPHRMrRu0I64PUlqFOtZinmLZENJgCS7AjVFejN2GL0KPJ72NdmjhTPCzCsxrXvey
         q1Fg==
X-Gm-Message-State: AOJu0Yxomjbq0KL3fc1yM2m+mo1oMsjhPxBMc5xMdWs+8s12itfIPy4y
	LLpXlekAYBh0A/JzxtD+ZgyTx6n2vzfR8I2OjA1cPyp2UbvyWiPl
X-Google-Smtp-Source: AGHT+IEWKA2qFH+qx5U3qBcQI7G024e9DcN4rnPygkCK7w4JMAw2YjcGZ+5twcLpisFFfvpdps9+Lg==
X-Received: by 2002:a05:620a:28cc:b0:78e:eb70:c7a9 with SMTP id l12-20020a05620a28cc00b0078eeb70c7a9mr3922596qkp.53.1713214688103;
        Mon, 15 Apr 2024 13:58:08 -0700 (PDT)
Received: from gmail.com (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id bj8-20020a05620a190800b0078d5d9cdc9esm6850450qkb.21.2024.04.15.13.58.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Apr 2024 13:58:07 -0700 (PDT)
Date: Mon, 15 Apr 2024 20:58:05 +0000
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: lukasz.czechowski@thaumatec.com
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][PATCH] podman: fix location of user
 systemd service units
Message-ID: <Zh2U3d/mOAHfDJh+@gmail.com>
References: <20240415110807.63387-1-lukasz.czechowski@thaumatec.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240415110807.63387-1-lukasz.czechowski@thaumatec.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 15 Apr 2024 20:58:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8678

Thanks for the fix.

Your author field has come through misconfigured:

remote: ##############################################
remote: Invalid author Lukasz Czechowski via lists.yoctoproject.org
remote: ##############################################

So I can't push the change

See: https://docs.yoctoproject.org/dev/contributor-guide/submit-changes.html#troubleshooting-email-issues

Bruce

In message: [meta-virtualization][PATCH] podman: fix location of user systemd service units
on 15/04/2024 Lukasz Czechowski via lists.yoctoproject.org wrote:

> The value of USERSYSTEMDDIR is currently set to
> ${systemd_unitdir}/user, which might not be present in user unit
> search path.
> Use dedicated bitbake variable ${systemd_user_unitdir} instead.
> 
> Signed-off-by: Lukasz Czechowski <lukasz.czechowski@thaumatec.com>
> ---
>  recipes-containers/podman/podman_git.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/recipes-containers/podman/podman_git.bb b/recipes-containers/podman/podman_git.bb
> index 3eadd202..f69dec16 100644
> --- a/recipes-containers/podman/podman_git.bb
> +++ b/recipes-containers/podman/podman_git.bb
> @@ -62,7 +62,7 @@ do_configure[noexec] = "1"
>  EXTRA_OEMAKE = " \
>       PREFIX=${prefix} BINDIR=${bindir} LIBEXECDIR=${libexecdir} \
>       ETCDIR=${sysconfdir} TMPFILESDIR=${nonarch_libdir}/tmpfiles.d \
> -     SYSTEMDDIR=${systemd_unitdir}/system USERSYSTEMDDIR=${systemd_unitdir}/user \
> +     SYSTEMDDIR=${systemd_unitdir}/system USERSYSTEMDDIR=${systemd_user_unitdir} \
>  "
>  
>  # remove 'docker' from the packageconfig if you don't want podman to
> @@ -134,7 +134,7 @@ do_install_ptest () {
>  FILES:${PN} += " \
>      ${systemd_unitdir}/system/* \
>      ${nonarch_libdir}/systemd/* \
> -    ${systemd_unitdir}/user/* \
> +    ${systemd_user_unitdir/* \
>      ${nonarch_libdir}/tmpfiles.d/* \
>      ${datadir}/user-tmpfiles.d/* \
>      ${sysconfdir}/cni \
> -- 
> 2.34.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8675): https://lists.yoctoproject.org/g/meta-virtualization/message/8675
> Mute This Topic: https://lists.yoctoproject.org/mt/105533406/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


