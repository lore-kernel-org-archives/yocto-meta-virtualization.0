Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D951F94CC0
	for <webhook@archiver.kernel.org>; Wed, 22 Apr 2026 03:23:19 +0000 (UTC)
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.65720.1776828189782135494
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 21 Apr 2026 20:23:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Q0CYD4Rc;
 spf=pass (domain: gmail.com, ip: 74.125.82.50, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-12c8ccc7755so3946300c88.0
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 21 Apr 2026 20:23:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776828189; x=1777432989; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:in-reply-to:organization:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ykugG2JQwGajxLflipv31BbK3pU0DwssIp3uvWBkeW8=;
        b=Q0CYD4Rc2zVRpwXH4NYOmorLZwZiPvRQvRTMSxvip3fbKNcL0ol0KGbBrSFEcRr0v0
         WkYWAZPDgPUSftqRB0q2jwN2Jrd7deqKUmq/KVOGjUrhew5RuzPI6SK3iKgGOXm7JvZw
         RvPDnXc/sngIqPndwZeoluqnYK9haQaKEXZ9yORfZKUkEuwxJUtvctFw4JZ4ZeO01ZMv
         Zkpstsqhx9JQQHgiXt/luP7N0TuJaDjnotCyFr2cKBnYU7wVIz4IKWNFe2gM3K47Ydea
         PBj26KYJJBnFHWgqZlyIKfkuR4oRiHcmxLAZRipBCQ/CALvyVWUTl4vlLOLsu4XlFsU9
         qTAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776828189; x=1777432989;
        h=content-transfer-encoding:in-reply-to:organization:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ykugG2JQwGajxLflipv31BbK3pU0DwssIp3uvWBkeW8=;
        b=V12aqlQbMZ0UVPM+3XWwV9ET+deCpuD2c8A7If9GU5achs3qb2etay26DXNrHHj4Z5
         Kf9r9yyf2r41yhYzijPIMMTn283BLJRUHCxi8OtC1FQunKTpInU9AJbPrutn1FAGqL1K
         txOMQiNtyaxOdkE+v+WRduEbv5qea6u7+mJfTy4koK+ifRT57nofFlnW8Dt44MQNAGAe
         antM8sRhLSSIBpc7XpbzOGd4qSwa3CdkqS2eQ6TDCO5myKRqz1j3SXoH4ss5gdBqU+hL
         aNOsbhFi/E4CXoEqIgWfjZlVBIsjFc+II1JuZVeGRhnPRf0Ki/jYrC39cbSpgLTNkT0K
         n0Mg==
X-Forwarded-Encrypted: i=1; AFNElJ+31uhQJGm4YCNgOIQ8SvgvYdN4AjydMdeLgU2X8RZuoxUHjcyNQDIFoz4za5VYe0/CK5EwARmigEMkjSzz3JvLC/wW@lists.yoctoproject.org
X-Gm-Message-State: AOJu0Yy319DX7vZr/K0/FqZL1GNRxgILQsLVFLmoR8kRoOdpX4hgWm/n
	LfEsc01J8vfBh2t6UCSC5oHGpKmgv0YVsH883UqS2PW6mwYBO5uNjBSo
X-Gm-Gg: AeBDievADogEbQPyJ9NCUuva42gbvZBapy7oB8mWQ40VsrvP1tRwOBiIc9r1bdkpxQ7
	zHkNK+U2AnpBkATubV1tWNE+G8zcXI9AcKFUvwPvBbNyCdGtMzjuk36wuziPgo2P9Sv9wjIWf9z
	Qb+iP3SQmL9V97Yv56tF4l0VR+RZluNcf6waNfc3kmH/5mkBnS9Hz25HUysCYAL1tEprDTr07cl
	S2ScxattA4Z6e6hvofO/A0HRGog+TwD8Qs70u2y6ExwNd7XRhM99no0BXDEf1ME3CigawfeZzMI
	wqhQ+50HPiMNFgmH1U5XXF6K7mJRXmNb/kAEQ0lobDoJd9WVYDaaBnj0e5pQMXqJ/9JlRSZ2z5A
	jO9beNxXpeBPTmTQ2eze+PZyPLBneSsJuadD5QeC7QpLOA+WU+DEyyggn+Ljt1LQb2yRY1sTRaY
	55rbjbHVsKW93wa7baS82uV8dNelcsEFoV6fyW4NduOHYFTcO6oZZBoDmcwznw2zWUrBFCyRw9b
	q1nyVPSanYhdsVduB09C0YQQZTzEMKp+p8LdZfCm8lFQk2S4XZZcZNWej6Kku8uThBPxBVA7gBR
	aCnUnal4VISCRQZ3BdpxELtIEuVqkaIK7A==
X-Received: by 2002:a05:7022:fa1:b0:12d:b8e5:5d6 with SMTP id a92af1059eb24-12db8e509d5mr1346417c88.24.1776828188889;
        Tue, 21 Apr 2026 20:23:08 -0700 (PDT)
Received: from [10.0.0.102] ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c74a20b9csm21987028c88.12.2026.04.21.20.23.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Apr 2026 20:23:08 -0700 (PDT)
Message-ID: <5851af9e-5407-414d-8f7d-d21c0e539299@gmail.com>
Date: Tue, 21 Apr 2026 20:23:07 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-virtualization][PATCH] libvirt: Drop the deprecated
 workaround
To: zhixiong.chi@windriver.com, meta-virtualization@lists.yoctoproject.org
References: <20260421074635.1647111-1-zhixiong.chi@windriver.com>
Content-Language: en-US-large
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
In-Reply-To: <20260421074635.1647111-1-zhixiong.chi@windriver.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 22 Apr 2026 03:23:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9720



On 4/21/26 12:46 AM, Zhixiong Chi via lists.yoctoproject.org wrote:
> The workaround is not needed anymore as the systemd supporting.
> The libvirtd.service Type has been changed from notify to notify-reload,
> so the final Type will be 'forking-reload', that's invalid for systemd.
> Here we delete it to avoid the following output information:
>> /lib/systemd/system/libvirtd.service:29: Failed to parse Type=forking-reload, ignoring: Invalid argument
> 
> Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
> ---
>   recipes-extended/libvirt/libvirt_git.bb | 7 -------
>   1 file changed, 7 deletions(-)
> 
> diff --git a/recipes-extended/libvirt/libvirt_git.bb b/recipes-extended/libvirt/libvirt_git.bb
> index 62931d17..b5b0a5f2 100644
> --- a/recipes-extended/libvirt/libvirt_git.bb
> +++ b/recipes-extended/libvirt/libvirt_git.bb
> @@ -232,13 +232,6 @@ do_install:append() {
>                   mv ${D}${prefix}/lib/systemd/system/* ${D}${systemd_system_unitdir}
>                   rmdir ${D}${prefix}/lib/systemd/system ${D}${prefix}/lib/systemd
>               fi
> -
> -	    # We can't use 'notify' when we don't support 'sd_notify' dbus capabilities.
> -	    # Change default LIBVIRTD_ARGS to start libvirtd in the right mode.
> -	    sed -i -e 's/Type=notify/Type=forking/' \
> -	           -e '/Type=forking/a PIDFile=/run/libvirtd.pid' \
> -	           -e 's/\(Environment=LIBVIRTD_ARGS="--timeout 120"\)/#\1\nEnvironment=LIBVIRTD_ARGS="--listen --daemon"/' \
> -		   ${D}/${systemd_system_unitdir}/libvirtd.service
>   	fi


This should be patch to source, that way it is better for tracking changes.

>   
>   	# The /run/libvirt directories created by the Makefile are
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9719): https://lists.yoctoproject.org/g/meta-virtualization/message/9719
> Mute This Topic: https://lists.yoctoproject.org/mt/118934411/1997914
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


