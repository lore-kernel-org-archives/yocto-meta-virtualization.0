Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35A0AC4332F
	for <webhook@archiver.kernel.org>; Thu, 14 Dec 2023 19:59:41 +0000 (UTC)
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
 by mx.groups.io with SMTP id smtpd.web10.38352.1702583977780959683
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 14 Dec 2023 11:59:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=g2SC5Zom;
 spf=pass (domain: gmail.com, ip: 209.85.219.44, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-67a9febb2bfso58948706d6.1
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 14 Dec 2023 11:59:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702583977; x=1703188777; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XxixlZIWy0SgSDm0w5EnxjPdALsjvUNnkdwHtLoIzeY=;
        b=g2SC5ZomZk7NyL1mcTJ+OuxCF4apXVy8zujvSeMKH0XrbWYGirh9v1J+9MxOzzEKKq
         wPN8pRgTeMKSHl56RdkW6zFtbfjiTqrz7oWvGBQooEX/5D9im6l0+nLjeR8Dfz0jGwYc
         tbNro3zToZRWMMWnwQEcA1s8s46H+YsCrjb6Wh2g5HbBmDcaQrykxcBJ/GTIslqIyvan
         +WqfgLbicn6qBLDM7a8GWDAtKCsVHXdB90l3ep+MbbYYRBxu8caNenorXB+pZGydgc4Z
         EJSVBcY/npfvPRsz83caQLdTznWVsKhTnNrxfvMiAW3WV2kK0ghEhF6JqzEixnHpWPdn
         nlTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702583977; x=1703188777;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XxixlZIWy0SgSDm0w5EnxjPdALsjvUNnkdwHtLoIzeY=;
        b=lYQ6GbIENbH8/VJkqJ0ddBUL2sTVrzM5sNtOeNQUD1L6EHqS36Ul3fZfddE/4nhtJE
         qA3BjoMXS/Orsv9AmP2ADT7ONCsYygtydYCq4bhTZhJMgFNL4WTT6QTkslpEuW1/n0xo
         QDD8ECA7xLX+0iUBXMUV/0WwSWObkV2ZTrYCuJVau97VbwSKHQD2CgnvMtl0CzilnAWG
         39yd9bl/BkBNsZxd0xuPW4qrLwbGjiPWQLqlo4HrX4tuIy4IujE3ftx5Yd0qliHQn3xU
         1v6OVFzTN9W1o4cAGJKOJOZix2aP0eeBWOHpbX1awytShnCoROLr9Bvo9FgokfJgz8SF
         jNlw==
X-Gm-Message-State: AOJu0YxsabmnHVE7x2Q17KqrQ31zUYub/FtUmL/eySCNIXKLqLYUK/Wp
	/yq5SPi+zHNjj4IqyzxvS/o=
X-Google-Smtp-Source: AGHT+IE9hU2bUcdJuYQ4p37T0IlH/7x7fZen+OO5nuXGkwnnbDDnQk2Lv3xRxt141lYXvILNcawdvA==
X-Received: by 2002:a0c:ecc3:0:b0:67e:fa37:a656 with SMTP id o3-20020a0cecc3000000b0067efa37a656mr3382929qvq.5.1702583976753;
        Thu, 14 Dec 2023 11:59:36 -0800 (PST)
Received: from gmail.com ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id u15-20020a0ced2f000000b00677adcfd261sm344357qvq.89.2023.12.14.11.59.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Dec 2023 11:59:36 -0800 (PST)
Date: Thu, 14 Dec 2023 19:59:33 +0000
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Ming Liu <liu.ming50@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization] [kirkstone] [PATCH 0/3] cni: cherry pick
 fixes from master
Message-ID: <ZXtepQ1Dy8yVQ/bl@gmail.com>
References: <20231211095320.10874-1-liu.ming50@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231211095320.10874-1-liu.ming50@gmail.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 14 Dec 2023 19:59:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8507

In message: [meta-virtualization] [kirkstone] [PATCH 0/3] cni: cherry pick fixes from master
on 11/12/2023 Ming Liu wrote:

> From: Ming Liu <liu.ming50@gmail.com>
> 
> We observed some library relocating issues on cni recipe, cherry pick
> some fixes from master.
> 
> Bruce Ashfield (1):
>   cni: reproducible builds: pass -trimpath
> 
> Changqing Li (1):
>   cni: clean dir ${B}/plugins before do_compile
> 
> Chen Qi (1):
>   cni: fix textrel QA issue

merged to kirkstone.

Bruce

> 
>  recipes-networking/cni/cni_git.bb | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> -- 
> 2.34.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8491): https://lists.yoctoproject.org/g/meta-virtualization/message/8491
> Mute This Topic: https://lists.yoctoproject.org/mt/103105934/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


