Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8E7DC433EF
	for <webhook@archiver.kernel.org>; Mon, 17 Jan 2022 04:00:32 +0000 (UTC)
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com
 [209.85.222.170])
 by mx.groups.io with SMTP id smtpd.web08.6987.1642392031787825700
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 16 Jan 2022 20:00:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=JKRGIp9G;
 spf=pass (domain: gmail.com, ip: 209.85.222.170,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f170.google.com with SMTP id o135so7443619qke.8
        for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 16 Jan 2022 20:00:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=2yIATaqEX+GMHPxpUexv4uRsbD14LNYQ0hJU8y5nEew=;
        b=JKRGIp9GwbUnO9chBQs0AYbJ7yvHWBLmN3NsaYsAmBIEeEzsk9z//3ddHkC+Wvxdkb
         i/Nr4qHHYXNst8ezgMJB7M1GRLqp7sjwK4cfJSKhiT863FTAPx+iv85S2ruNT6MpOPTK
         QtCzRwaVeyNJ5Zdev6weIBUigvrl2HLVFpkXOHQ8oF1DE7TMH6SUbAWw2CRSlD/4IWeo
         qTgDDG6g4uTnUljvhibSIDzq8Y6oE7aaw9ZS6CIY2f2DHiS6T2eJJsUoTIwB6GQNiTH2
         fddzOftUaew9BBptp6XPG64KfAlTMv/FW4oLyFKT8IoP9yhTpeHx+N/+L+LonCtpmFga
         hdBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=2yIATaqEX+GMHPxpUexv4uRsbD14LNYQ0hJU8y5nEew=;
        b=FItzx8Ag7IDUBD2O6RMDQRqCO2qaSXE1n7vB+wFQLWAowOkc9h984e8/a45OVfijUq
         m8yERejY9CJhxMAbijGOBHYIyVEtXWTRp7DWK+WxQscbL0qp1YJXmMaXn+g7vYvbXFDm
         +DcaFCGNoQOihMyfkQ54Ok8wXmM21KBh9FgRH0eP/yRq8orR9p0iBdyDS9HKc8dFffmR
         7cn9lor0NPZMg2ixOhBdjIiaAWUK9JUCLWfE8cx0c1zWUBLY9j7P9ep1wambod7yRGu8
         ms9z5ruhfgRwrl3/VqBkEHWeV/KbAkrjGG6465g/KsPDLy3wTRx3hq+4W9d+eI3CwlC7
         3MZg==
X-Gm-Message-State: AOAM530mv9S2KMhRjW+qffAGZPrt/kPVvMAxa6WYYxxN58mEBSthHfD0
	hHai5c22v+Vff1P1EVnKSoJ3N1Pv9OlSMg==
X-Google-Smtp-Source: 
 ABdhPJzDzchxBae3BVLrEimyfSQRdWxYHH+JQrfsQ5+a4DZeM07WbfFipyEpoT52Mmdh7ASAkFb6PA==
X-Received: by 2002:a05:620a:458c:: with SMTP id
 bp12mr2172730qkb.157.1642392030787;
        Sun, 16 Jan 2022 20:00:30 -0800 (PST)
Received: from gmail.com
 (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.63.222])
        by smtp.gmail.com with ESMTPSA id
 q15sm7712887qkj.108.2022.01.16.20.00.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Jan 2022 20:00:30 -0800 (PST)
Date: Sun, 16 Jan 2022 23:00:28 -0500
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Changqing Li <changqing.li@windriver.com>
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][PATCH V3] add option -p for mkir command
Message-ID: <20220117040026.GA16879@gmail.com>
References: <20220114023911.23763-1-changqing.li@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220114023911.23763-1-changqing.li@windriver.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 17 Jan 2022 04:00:32 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7004

The shortlog was missing "openvswitch:", so I added that locally and
pushed the change.

Cheers,

Bruce

In message: [meta-virtualization][PATCH V3] add option -p for mkir command
on 14/01/2022 Changqing Li wrote:

> From: Changqing Li <changqing.li@windriver.com>
> 
> To avoid "cannot create directory '/var/log/openvswitch': File exists"
> when service is restart
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
> View/Reply Online (#7001): https://lists.yoctoproject.org/g/meta-virtualization/message/7001
> Mute This Topic: https://lists.yoctoproject.org/mt/88413091/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


