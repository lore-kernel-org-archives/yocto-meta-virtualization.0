Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7714AC4167B
	for <webhook@archiver.kernel.org>; Mon,  4 Dec 2023 21:01:44 +0000 (UTC)
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
 by mx.groups.io with SMTP id smtpd.web11.81526.1701723699737358588
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 04 Dec 2023 13:01:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=F2h8aCvp;
 spf=pass (domain: gmail.com, ip: 209.85.222.177, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-77f0756a097so49898585a.2
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 04 Dec 2023 13:01:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701723699; x=1702328499; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=W4oMpbIpvq5LVpR2DeunxIIlbysXPtiNSCH20Pa727c=;
        b=F2h8aCvp8mo79C7KScrjTCS9cd36bNfRRYFA4dyt9zMyE0mXYBZ3d5NWuSjOTxxSS/
         oFtElQroFioF8v8G3xWZu5gDYwiMG6R7t6VqVquHU+cknM3XutouJIFRqxEsjpufZzzu
         FfQzfma17Rb3g1vtOewjcHsohylhE9wqO19fdFl/0ZTSkofCkH1ie0Xk46ACwl7w4ilT
         cyw/gu+s7lDThxym+BAl9hZxYF6PABnwxNlILWeU/9+9eA4hWLdw6McMTFAn19BriKTH
         19EodnFkl/KVAtUZP548v0wJQdjXy+s1dtnF5vJuOcwt7iuGEhPSJ8PufY0GF/xs1IBW
         q8eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701723699; x=1702328499;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W4oMpbIpvq5LVpR2DeunxIIlbysXPtiNSCH20Pa727c=;
        b=qGMAI9PIH8olTARBNzkqMCGwPw3EkR7yzmNw13MqL2jt1bPNiMDQ4HwHSIS75TC+q/
         n5fauh8iO0L/229JSOj5Iq2wNyxef5LvX4ArY5tXqNXn1iL5qo41nTip/WlzPgTtb/65
         MUCsxz2lifv8XzIuwNDrJ4Ox7hl2u2LUaXsyuf4iwcSfiBmOOPHVBZkjNnZN1MfbzemD
         vCumDB6njqjtFIeFA91QlMddjlUxv0QK3jqIjKN9DfPSVm5y2qeBwYpGcBB9CeVBl5SD
         q/jl5nVGH9wbJvVFoODxhdPAR4iuS0/A4QL8u4kES3CPHeqjP14EWFXO8ZGSa9bu1i+V
         q3sQ==
X-Gm-Message-State: AOJu0Yx4oJJ4byuZH407BCKnC+h/ay1r2Fj3yY+7uCB8RfvJKu98Ddbl
	NdcpOzeHyNXO0cjwP+aznmg=
X-Google-Smtp-Source: AGHT+IGcrArgzkQreNDuvdx2FyIVcNH5FooXHqJ4Djf+NzNeLovhipdsdTlRfNctr9LKbgxF8pWRhA==
X-Received: by 2002:a05:620a:84c:b0:77e:fe1e:592 with SMTP id u12-20020a05620a084c00b0077efe1e0592mr204518qku.48.1701723698611;
        Mon, 04 Dec 2023 13:01:38 -0800 (PST)
Received: from gmail.com ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id ou17-20020a05620a621100b0077d72f820adsm4519524qkn.115.2023.12.04.13.01.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Dec 2023 13:01:37 -0800 (PST)
Date: Mon, 4 Dec 2023 21:01:35 +0000
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Qi.Chen@windriver.com
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][PATCH] docker: remove unnecessary
 dependencies
Message-ID: <ZW4+L9pBEV5Vs9N9@gmail.com>
References: <20231128065014.3729629-1-Qi.Chen@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231128065014.3729629-1-Qi.Chen@windriver.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 04 Dec 2023 21:01:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8485

merged.

I've been meaning to clean that up, so this saves me
the effort.

The go dependencies as packages was a short lived attempt
at handling build requirements and is no longer viable!

Bruce

In message: [meta-virtualization][PATCH] docker: remove unnecessary dependencies
on 28/11/2023 Chen Qi via lists.yoctoproject.org wrote:

> From: Chen Qi <Qi.Chen@windriver.com>
> 
> The build is not using the codes from these source packages.
> Remove the dependencies.
> 
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  recipes-containers/docker/docker.inc | 17 +----------------
>  1 file changed, 1 insertion(+), 16 deletions(-)
> 
> diff --git a/recipes-containers/docker/docker.inc b/recipes-containers/docker/docker.inc
> index 4a4bc4f6..48f7d3ec 100644
> --- a/recipes-containers/docker/docker.inc
> +++ b/recipes-containers/docker/docker.inc
> @@ -1,21 +1,6 @@
>  DEPENDS = " \
> -    go-cli \
> -    go-pty \
> -    go-context \
> -    go-mux \
> -    go-patricia \
> -    go-logrus \
> -    go-fsnotify \
> -    go-dbus \
> -    go-capability \
> -    go-systemd \
>      btrfs-tools \
>      sqlite3 \
> -    go-distribution \
> -    compose-file \
> -    go-connections \
> -    notary \
> -    grpc-go \
>      libtool-native \
>      libtool \
>      "
> @@ -78,7 +63,7 @@ do_compile() {
>  	ln -sf ${WORKDIR}/git/libnetwork .gopath/src/github.com/docker/libnetwork
>  	ln -sf ${WORKDIR}/git/cli .gopath/src/github.com/docker/cli
>  
> -	export GOPATH="${S}/src/import/.gopath:${S}/src/import/vendor:${STAGING_DIR_TARGET}/${prefix}/local/go"
> +	export GOPATH="${S}/src/import/.gopath:${S}/src/import/vendor"
>  	export GOROOT="${STAGING_DIR_NATIVE}/${nonarch_libdir}/${HOST_SYS}/go"
>  
>  	# Pass the needed cflags/ldflags so that cgo
> -- 
> 2.34.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8475): https://lists.yoctoproject.org/g/meta-virtualization/message/8475
> Mute This Topic: https://lists.yoctoproject.org/mt/102846564/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


