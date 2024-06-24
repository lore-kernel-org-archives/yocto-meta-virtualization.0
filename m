Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA977C2BD09
	for <webhook@archiver.kernel.org>; Mon, 24 Jun 2024 21:05:30 +0000 (UTC)
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
 by mx.groups.io with SMTP id smtpd.web11.153926.1719263123689525070
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 24 Jun 2024 14:05:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mTJYc8hk;
 spf=pass (domain: gmail.com, ip: 209.85.160.178, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-444de4ff4bdso11703901cf.0
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 24 Jun 2024 14:05:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719263123; x=1719867923; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZQdkbfgYLkH9rAyWtAnsjtaYgBeCtYOlKAsGta4jHLA=;
        b=mTJYc8hkZ/mpkp2pbTVdpDTW36hKXCX8yzH+xQm0LUznSaN2savCxtJCFannNpbGU3
         AbxteJDRzqOSSJ4iPJY7vdkpc7g02f8jV6q6kkvqPoEokBl+L74qNXA7ExfHPcT9kJHw
         Km8krhMxzkGNFwqjmD7sgAonJzy55fR4Uqna41N+ZvNRlCfGscMPjs+kM1Tuo05bknzY
         278VGnWmDdncaWsVsAMsmuFW63tsxaX3khrgc9rD5FIgJISiBnYdyIVJgzwU+RN7DAms
         2NWpaw7G3OvpqMgY788IiDgBDsZ4O3zWc60uC0UeECj8g/88QcvlQ5UYgJYzb2nDMtP6
         sClg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719263123; x=1719867923;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZQdkbfgYLkH9rAyWtAnsjtaYgBeCtYOlKAsGta4jHLA=;
        b=TGrBOdJPUI+k5//xr6N16heAJjz66jF8Vm/hu3X7Pwq/QkvxHh9Nu/Q4fRadyy3Cyf
         fLXS4BnGk3gJguwgWwt13bXxDRx0qqqZJKCdz9dkMrr9v7fm4RiU2tWQaiUBXNuz1jHy
         DbykQt1cKT9jE3cPV3eIlVvhRMd2l8BQzij0CM2WKo7BkgLoLhvNI92PNbXGVwR8/OQT
         4nD/4AKLlX503tzZIXAv6Jy1q0Zo2xsss0wHGA1Sya1sPc+f7BkidbM6U9fQmTBPOuq9
         ROSs1iorl2edRusAEWsI0dOiVEfWWq9wX+x2HwaYUaNk+mPqLQ3cAcvM1SKKegcki8mv
         6/VQ==
X-Gm-Message-State: AOJu0YxWoelrPH6v1OP4nrm3GBefzcbBBsPVyRUJ91ldv69JzSuJRyp3
	bCQ5aVYP2YEik0qvOmE3eEINze2IxBS5W9J57bgy2FgvGMLRrozieQxcjhNC
X-Google-Smtp-Source: AGHT+IHL+47CUck2yenscsg3MZrz3KctvonopyhHCm4aPsFxjVYVD9d8LkWe5wz/WxQOdoby9S+GZg==
X-Received: by 2002:ad4:4e8a:0:b0:6b2:aeff:73db with SMTP id 6a1803df08f44-6b5633085ecmr26117756d6.8.1719263122510;
        Mon, 24 Jun 2024 14:05:22 -0700 (PDT)
Received: from gmail.com (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6b52cb35a1esm27650316d6.55.2024.06.24.14.05.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jun 2024 14:05:22 -0700 (PDT)
Date: Mon, 24 Jun 2024 21:05:20 +0000
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: wangmy@fujitsu.com
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization] [meta-cloud-services] [PATCH]
 nss-pam-ldapd: Start WORKDIR -> UNPACKDIR transition
Message-ID: <ZnnfkJzJpwrHXWCm@gmail.com>
References: <1718611999-8852-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1718611999-8852-1-git-send-email-wangmy@fujitsu.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 24 Jun 2024 21:05:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8810

merged!

Bruce

In message: [meta-virtualization] [meta-cloud-services] [PATCH] nss-pam-ldapd: Start WORKDIR -> UNPACKDIR transition
on 17/06/2024 wangmy via lists.yoctoproject.org wrote:

> From: Wang Mingyu <wangmy@fujitsu.com>
> 
> Replace references of WORKDIR with UNPACKDIR where it makes sense to do so in preparation for changing the default value of UNPACKDIR.
> 
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  recipes-support/nss-pam-ldapd/nss-pam-ldapd_0.9.12.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/recipes-support/nss-pam-ldapd/nss-pam-ldapd_0.9.12.bb b/recipes-support/nss-pam-ldapd/nss-pam-ldapd_0.9.12.bb
> index 7f3b9e38..582f7592 100644
> --- a/recipes-support/nss-pam-ldapd/nss-pam-ldapd_0.9.12.bb
> +++ b/recipes-support/nss-pam-ldapd/nss-pam-ldapd_0.9.12.bb
> @@ -43,14 +43,14 @@ FILES:${PN}-dbg += "${base_libdir}/security/.debug"
>  LDAP_DN ?= "dc=my-domain,dc=com"
>  
>  do_install:append() {
> -	install -D -m 0755 ${WORKDIR}/nslcd.init ${D}${sysconfdir}/init.d/nslcd
> +	install -D -m 0755 ${UNPACKDIR}/nslcd.init ${D}${sysconfdir}/init.d/nslcd
>  
>  	sed -i -e 's/^uid nslcd/# uid nslcd/;' ${D}${sysconfdir}/nslcd.conf
>  	sed -i -e 's/^gid nslcd/# gid nslcd/;' ${D}${sysconfdir}/nslcd.conf
>  	sed -i -e 's/^base dc=example,dc=com/base ${LDAP_DN}/;' ${D}${sysconfdir}/nslcd.conf
>  
>  	install -d ${D}${systemd_unitdir}/system
> -	install -m 0644 ${WORKDIR}/nslcd.service ${D}${systemd_unitdir}/system
> +	install -m 0644 ${UNPACKDIR}/nslcd.service ${D}${systemd_unitdir}/system
>  }
>  
>  inherit update-rc.d systemd
> -- 
> 2.34.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8798): https://lists.yoctoproject.org/g/meta-virtualization/message/8798
> Mute This Topic: https://lists.yoctoproject.org/mt/106717039/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


