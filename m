Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0F96F94CB2
	for <webhook@archiver.kernel.org>; Wed, 22 Apr 2026 03:26:59 +0000 (UTC)
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.65979.1776828410734352858
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 21 Apr 2026 20:26:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=f3vCpVs4;
 spf=pass (domain: gmail.com, ip: 74.125.82.54, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-12c7212836bso13055338c88.0
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 21 Apr 2026 20:26:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776828410; x=1777433210; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:in-reply-to:organization:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=fuWWFOksPAU/Gpll6T7rCxQVeu6f4AaqgOdBjudX3Iw=;
        b=f3vCpVs4cyWrUd6FwBX84/l1g0TaSTztV78ZftTbUSeDXpn2U49IStE4rXqt4y3pUc
         3+LMNJTmxgmwAr7DkWvb8YM778L1Wfgu7g4oQhtvn6cmucGMmYYsEPdt5smruyJkJbFA
         JFy1g5R7hjDZc9TkEiY8VIGIqR2P2vImC+UYe/kTHSJkqahsOlRdGXorZ41u89MT7hyC
         hKWSBo1OFHGLOqHDPEKq33RDINW6nQ2OU5hWkMYxFKkueOVxt0DZTd+Ae+HY4tjylcwE
         bN9rUtGSbgHNo62dpJRQ7f0BZxYrLwkdaZ/UFpvvm5o0JqX3a8N8YCWsrFRH7gKKGdk6
         NSiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776828410; x=1777433210;
        h=content-transfer-encoding:in-reply-to:organization:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fuWWFOksPAU/Gpll6T7rCxQVeu6f4AaqgOdBjudX3Iw=;
        b=REtBZ/j6Hw1rS4pZWGr0rVdSVRA3pY8IeZuP2fMeD2HPrHOJMCUVKnbr8K1DSSLldC
         kIkkWJ3D7Oib7VIX9iQRCfN2ef2hM29BFL3V817+H/kjLoSPLWPpcd1kqTdASDCRi+r1
         GXhZZZZDjCzKmeKQLgz5exC0VImSsni204kfn+y8Gztic9krHgjz/sVEueUb1cQMu/t7
         ofdkjZQW/YDivwY226EAXl6G1B/e++uA44kz4gEyve+zfT/6Dx8icq6W+KTSGDMzVX5R
         cBeEfehxVYnT3b1Yw0ED+0WuFJ9FTTfsAl4Ei3L4QDKfXThvbRcIYoNqgJ6KoAONbc0d
         R1pA==
X-Forwarded-Encrypted: i=1; AFNElJ9ESR837FwTgQVmA8TU7yQBAxunHT1JaiJCqtK5DDf1HhA446QBC60cVcYz7XoyyjzS5KOcEVa5Ib+BgX2sHS+cp73Y@lists.yoctoproject.org
X-Gm-Message-State: AOJu0YwxwBh2RK7jllX1oAQz7/fvZ5/2OuA/6botYSdyq86cSSb2TZfw
	wHdNVhbc1kF/kvGWPcKeGgI2Zkxv+Po/7BY+NF3eGoksnae4+/yRr8lpw48B58hq
X-Gm-Gg: AeBDievlOMzsWKaql/As/KX/di5g3D3mFaUSfiiKhlNzb7zDLt9RAmPJ2EOvka26ku9
	lyU+cYb/0z7VCU/kmQ/dBjyYLZhj8JWsaqNz2CMJUQvuvoxjvJf7TeyvTvKsXT24PhtKbrGRU7x
	N6OT4II9iXBJqyJqfr9oCuz/OCCNBo8lgJgtXxTgLKLcG8TJxu3qzfZb3zt3PfkJsG799/HxtS1
	gEZGDVpE0RcYYkE+kBCihOHsZpOsvswq3sgfvou5PRQvgrdV+0EO0PPYTxBbHK40p3+tTNoOTnB
	5ziNKu05o4qPCp2cmq1TlRoMKfsokPo53sEh0SvcR9U21hldxUDF/Lxt1wjY35Ju04oyMqnhPVR
	wqa0RNxojPH53iN5I/QvbWhJhsUj5jIMD5T+2l9yDUSxJQ28S6+nq0vKlU7GEwr4Dlx9IdfJBQu
	TYKU0so8N9bKocp5yke7VhaBSYLloFQ+gAi9/vasyCgWVhG+tnGYzUOEPzg6XbqVlxhc+ITOmUO
	Ag0ah58VkTyHdYBHm+YFcmh661bEYmwHxcE8drQdoCyHTFiJ0PHLw1hvYcSbUY7fzoiErQZ/grI
	b24kM8yNWbA5I/G8ZsJV3TFp7KwAHqtaAg==
X-Received: by 2002:a05:7022:12b:b0:11b:ec5f:1c37 with SMTP id a92af1059eb24-12c73f996d4mr11592084c88.18.1776828410002;
        Tue, 21 Apr 2026 20:26:50 -0700 (PDT)
Received: from [10.0.0.102] ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c749c422csm22241394c88.3.2026.04.21.20.26.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Apr 2026 20:26:49 -0700 (PDT)
Message-ID: <7ecfecca-4b96-49e9-b259-0370f38eafa8@gmail.com>
Date: Tue, 21 Apr 2026 20:26:48 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-virtualization][PATCH] systemd: add openssl PACKAGECONFIG
 for virtualization distro feature
To: zhixiong.chi@windriver.com, meta-virtualization@lists.yoctoproject.org
References: <20260421074617.1646975-1-zhixiong.chi@windriver.com>
Content-Language: en-US-large
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
In-Reply-To: <20260421074617.1646975-1-zhixiong.chi@windriver.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 22 Apr 2026 03:26:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9721



On 4/21/26 12:46 AM, Zhixiong Chi via lists.yoctoproject.org wrote:
> Since libvirt was upgraded to v12.1.0, the new systemd service file
> virt-secret-init-encryption.service has been introduced, and it requires
> systemd to add openssl to PACKAGECONFIG. Because systemd-creds encrypt
> command will be executed in the service file, which depends on openssl
> is enabled.
> 
> Meanwhile this service was added into the dependency chain of the main service
> libvirtd.service, and will be enabled by default by libvirtd service without
> any build dependency detection according to the original upstream commit
> https://github.com/libvirt/libvirt/commit/97758bc9a0b1fccf8c0009308658f1204b113b89
> 
> In systemd oe-core recipe, the openssl PACKAGECONFIG is disabled at default.
> Finally the service file virt-secret-init-encryption.service and libvirtd will
> be failed as the following error:
>> # systemctl status libvirtd -l
>   * libvirtd.service - libvirt legacy monolithic daemon
>       Loaded: loaded (/usr/lib/systemd/system/libvirtd.service; enabled; preset: enabled)
>       Active: inactive (dead)
>   TriggeredBy: * libvirtd.socket
>                * libvirtd-ro.socket
>                * libvirtd-admin.socket
>         Docs: man:libvirtd(8)
>               https://libvirt.org/
> 
>   systemd[1]: Dependency failed for libvirt legacy monolithic daemon.
>   systemd[1]: libvirtd.service: Job libvirtd.service/start failed with result 'dependency'
> 
>> # journalctl -xe
> 
>     A start job for unit virt-secret-init-encryption.service has begun execution.
> 
>   systemd-creds[1251]: Support for encrypted credentials not available.
>   systemd[1]: virt-secret-init-encryption.service: Main process exited, code=exited, status=1/FAILURE
> 
> The above error info "Support for encrypted credentials not available." comes
> from systemd-creds command provided by systemd without HAVE_OPENSSL option at
> the source code src/shared/creds-utils.c
> 
> Here we enable openssl for systemd when 'virtualization' is in distro feature.
> 
> Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
> ---
>   recipes-core/systemd/systemd_%.bbappend         | 1 +
>   recipes-core/systemd/systemd_virtualization.inc | 2 ++
>   2 files changed, 3 insertions(+)
>   create mode 100644 recipes-core/systemd/systemd_%.bbappend
>   create mode 100644 recipes-core/systemd/systemd_virtualization.inc
> 
> diff --git a/recipes-core/systemd/systemd_%.bbappend b/recipes-core/systemd/systemd_%.bbappend
> new file mode 100644
> index 00000000..617caccb
> --- /dev/null
> +++ b/recipes-core/systemd/systemd_%.bbappend
> @@ -0,0 +1 @@
> +require ${@bb.utils.contains('DISTRO_FEATURES', 'virtualization', '${BPN}_virtualization.inc', '', d)}
> diff --git a/recipes-core/systemd/systemd_virtualization.inc b/recipes-core/systemd/systemd_virtualization.inc
> new file mode 100644
> index 00000000..585f4c35
> --- /dev/null
> +++ b/recipes-core/systemd/systemd_virtualization.inc
> @@ -0,0 +1,2 @@
> +# libvirt acquires systemd enable openssl PACKAGECONFIG
> +PACKAGECONFIG:append = " openssl"
> 

Can this be all in the bbappend. something like below

PACKAGECONFIG:append = "${@bb.utils.contains('DISTRO_FEATURES', 
'virtualization', ' openssl', '', d)}"

> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9718): https://lists.yoctoproject.org/g/meta-virtualization/message/9718
> Mute This Topic: https://lists.yoctoproject.org/mt/118934409/1997914
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


