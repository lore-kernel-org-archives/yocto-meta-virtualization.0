Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EC28C433F5
	for <webhook@archiver.kernel.org>; Mon, 10 Jan 2022 18:40:46 +0000 (UTC)
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com
 [209.85.219.44])
 by mx.groups.io with SMTP id smtpd.web11.36265.1641840045439217333
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 10 Jan 2022 10:40:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=kpG8XcRw;
 spf=pass (domain: gmail.com, ip: 209.85.219.44,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f44.google.com with SMTP id q3so15415337qvc.7
        for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 10 Jan 2022 10:40:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=GD3I8EXKtBgv3nX1ub/AQ/daBAgK13OAPWoVD2HzS9E=;
        b=kpG8XcRwoBTpaPdhMTKq9nspd7ZMGC5SrBfakoFai+Bp1xkd6pTXuAm4xJMwyxtNMR
         A3ZJ5MrXpKE/wQxuKooWZaQrF1r9oF5ROOcKKKYMK56hjWmZxn4MEsU8EmvWXQzwD/f+
         gddWz/MA8AEA0mY280TsiM2e4PHIpF4lPBVPKwDfpgcZ0CBAKc85VCNCE5L1rBl9tXIG
         xyHG1+t2Ui0/a05bkkzEKlMO7unk/DDWfQDrT4Q4Rhd4l9qKPJnEqhHp04TOolOXBMbY
         pJYzGy5vyc6ptlX7nE0M8EqbBZeOIk7meY+nTTj2OZdurVYLi90xPrfecqBO7wqReWfu
         SAPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=GD3I8EXKtBgv3nX1ub/AQ/daBAgK13OAPWoVD2HzS9E=;
        b=ehQj8ET2OMNb5BM++EHgLzau/hxIPR4NtSmldfqt1eGMdIevvcLPcqjvnukV2OGNGX
         1pt3IdXzONQHNGDf6Gb67WCW1A9q66TJWykata63iMtE8pmkalL7pJKyu/bImNfMrquE
         GSpFwI/Yix+u5tSes9kyFz5zvDr6VJmnicrdox9YonVVEJtAVHVosgPvSuQY+6cv4pHc
         c63ei+/8tKwFJQbsXH6LAid8LgOBR1SYDQjg1IrMI+Nec3iMqqBEf900ovBWlAFYD4F9
         q0Ctxs3Qbi9I3VE7wTrMtxyCRybZMVAJa0JKCzY4K8Sc99kJa5oPtsw8aIW0A57QaP2F
         ga+A==
X-Gm-Message-State: AOAM5314oaW1Pv813FdhRWtVxCtozXIYpDakob42EsPoyLvyWD2XQa2I
	FzRbIMxUg9tqNkCr/na19zU=
X-Google-Smtp-Source: 
 ABdhPJz7NmbF1nTc3Ytyhc6t1Qeyz9R8ON32zQJGYtJ1MiEMvxnH9jdbf6QHlKXo4SWw23LbnqrVZw==
X-Received: by 2002:a05:6214:1ccb:: with SMTP id
 g11mr661435qvd.97.1641840044423;
        Mon, 10 Jan 2022 10:40:44 -0800 (PST)
Received: from gmail.com
 (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.63.222])
        by smtp.gmail.com with ESMTPSA id
 m1sm5040107qkn.120.2022.01.10.10.40.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jan 2022 10:40:44 -0800 (PST)
Date: Mon, 10 Jan 2022 13:40:42 -0500
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Changqing Li <changqing.li@windriver.com>
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][PATCH V2] add option -p for mkir command
Message-ID: <20220110184041.GB58832@gmail.com>
References: <20220107052952.47904-1-changqing.li@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220107052952.47904-1-changqing.li@windriver.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 10 Jan 2022 18:40:46 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/6996

In message: [meta-virtualization][PATCH V2] add option -p for mkir command
on 07/01/2022 Changqing Li wrote:

> From: Changqing Li <changqing.li@windriver.com>
> 
> To avoid "cannot create directory '/var/log/openvswitch': File exists"

Is this happening all the time ? I've never seen it in my logs. I'm assuming
it is on some sort of stop, restart ? or on a second boot ? It is worth
capturing that in this commit message

Otherwise, this looks fine to me.

Bruce

> 
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>  ...01-ovs-use-run-instead-of-var-run-for-in-systemd-units.patch | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/recipes-networking/openvswitch/files/0001-ovs-use-run-instead-of-var-run-for-in-systemd-units.patch b/recipes-networking/openvswitch/files/0001-ovs-use-run-instead-of-var-run-for-in-systemd-units.patch
> index f7ec3fa..8bda865 100644
> --- a/recipes-networking/openvswitch/files/0001-ovs-use-run-instead-of-var-run-for-in-systemd-units.patch
> +++ b/recipes-networking/openvswitch/files/0001-ovs-use-run-instead-of-var-run-for-in-systemd-units.patch
> @@ -96,7 +96,7 @@ index 74e5acb7f..39698f238 100644
>   ExecStartPre=/bin/rm -f /run/openvswitch.useropts
>  -ExecStartPre=-/bin/mkdir /var/run/openvswitch /var/log/openvswitch
>  -ExecStartPre=-/bin/chown ${OVS_USER_ID} /var/run/openvswitch /var/log/openvswitch
> -+ExecStartPre=-/bin/mkdir /run/openvswitch /var/log/openvswitch
> ++ExecStartPre=-/bin/mkdir -p /run/openvswitch /var/log/openvswitch
>  +ExecStartPre=-/bin/chown ${OVS_USER_ID} /run/openvswitch /var/log/openvswitch
>   ExecStartPre=/bin/sh -c '/bin/echo "OVS_USER_ID=${OVS_USER_ID}" > /run/openvswitch.useropts'
>   ExecStartPre=/bin/sh -c 'if [ "$${OVS_USER_ID/:*/}" != "root" ]; then /bin/echo "OVS_USER_OPT=--ovs-user=${OVS_USER_ID}" >> /run/openvswitch.useropts; fi'
> -- 
> 2.17.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#6992): https://lists.yoctoproject.org/g/meta-virtualization/message/6992
> Mute This Topic: https://lists.yoctoproject.org/mt/88255968/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


