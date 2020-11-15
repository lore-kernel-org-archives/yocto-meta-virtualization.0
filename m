Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
 by mx.groups.io with SMTP id smtpd.web10.15785.1605412806431930394
 for <meta-virtualization@lists.yoctoproject.org>;
 Sat, 14 Nov 2020 20:00:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=TdVyccMr;
 spf=pass (domain: gmail.com, ip: 209.85.219.49, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f49.google.com with SMTP id g19so7098416qvy.2
        for <meta-virtualization@lists.yoctoproject.org>; Sat, 14 Nov 2020 20:00:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=5IjZMJNK8xTC/FZ88lUO8Ak2TOulWzBnmYUx8IuJstY=;
        b=TdVyccMryoQeKy5nwJsMu1g1f2l+oJYbr7LhvWAqfQkPGvzqfAaZ8+D9gnUi5W6lOB
         tX5TBeAt3TTO+3O72NrTs4MQI3KCkTpmRYqA0dvky+j2igti/EMuVp0LJglspeCjfXDl
         CsRMSK1ldQIcS3ajVHMNuZwtkwCb1C3oLoH31EUQ03y38I62QD94iP0mvh9EjHlrPL99
         DiuqJVfUv72Mfbx7sivERkStMiHzc9JsxehCXy/tQ/PRJt0LjSTWiYz5WKXDZzIhpvcY
         y5SFTt/QmsD9LfK2ZNS+fbKpY6wI44iFUP8sVv8ARUjSrP7I5+uPrAFem9Vszpk8k3ko
         29sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=5IjZMJNK8xTC/FZ88lUO8Ak2TOulWzBnmYUx8IuJstY=;
        b=Wm0diATMwWWbo8db9QYfKgASQU9gDiX8M33BU/ut0MyLBj/k6usTJhfPwmN7aPKOrJ
         DZoCAoKKQSOHoRCc3s7dgla8Vb2h13JwzA2pV1oAkdwnz5JuLBThbkBHdf8UzlrdMLOM
         V7oHNLwQQ0oSQLlipPS2v3sbsGO2tLRfbiVIB+tRYY9fptUc8t/5+GQDVRyq7UBsb/7O
         3cClTYxmiR/pvzeplHdn4kXyOPUCq3uyt7iBoK9ziSIqhbyBN9STu9t1kf6+qAKLiuqx
         p4FMzN+sLOVijRZPc9ppzIL9+8bt/l2B3qIOp3sYW5Vq7xVdxrlyPkcTosiZZBxzk09z
         Is7Q==
X-Gm-Message-State: AOAM533LGcb17SbZNX4Ie6ztA3rnMCUUEkSQThE5lhFS2PLpVrWjp8sa
	XwOtClxPYl4fvGBLu7UZ99m4YKeJ0qDFl/7+
X-Google-Smtp-Source: ABdhPJzQU15bur6mkjlen93gjbNIIIdZR5CDfyfd8tfRG27EnTp7OaQJN9eCrz6tDgYXMY3BOkdmQA==
X-Received: by 2002:a0c:9e53:: with SMTP id z19mr9694128qve.23.1605412805571;
        Sat, 14 Nov 2020 20:00:05 -0800 (PST)
Return-Path: <bruce.ashfield@gmail.com>
Received: from gmail.com (cpe04d4c4975b80-cm64777d5e8820.cpe.net.cable.rogers.com. [174.112.165.127])
        by smtp.gmail.com with ESMTPSA id q189sm10182258qkd.41.2020.11.14.20.00.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2020 20:00:04 -0800 (PST)
Date: Sat, 14 Nov 2020 23:00:03 -0500
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: Bertrand Marquis <bertrand.marquis@arm.com>
Cc: meta-virtualization@lists.yoctoproject.org,
	christopher.clark6@baesystems.com
Subject: Re: [meta-virtualization] [PATCH 0/2] Fix Xen compilation
Message-ID: <20201115040002.GA19607@gmail.com>
References: <cover.1604933003.git.bertrand.marquis@arm.com>
MIME-Version: 1.0
In-Reply-To: <cover.1604933003.git.bertrand.marquis@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

In message: [meta-virtualization] [PATCH 0/2] Fix Xen compilation
on 09/11/2020 Bertrand Marquis wrote:

> This serie contain 2 patches to fix Xen compilation:
> - on arm32 by adding a patch already merged in Xen master to fix gcc10
>   compilation issues.
> - on x86 to fix an issue happening when compiling xen-tools with older
>   xen versions.
> 
> Those would be good candidates to include in gatesgarth.

merged.

And yes, I haven't branched gatesgarth yet, so they will be part of that.

Bruce

> 
> Bertrand Marquis (2):
>   xen: Fix python libraries installation on multilib
>   xen: Fix xenpmd compilation error on arm32
> 
>  ...ls-xenpmd-Fix-gcc10-snprintf-warning.patch | 60 +++++++++++++++++++
>  recipes-extended/xen/xen-tools.inc            |  2 +
>  recipes-extended/xen/xen-tools_4.14.bb        |  1 +
>  recipes-extended/xen/xen-tools_git.bb         |  1 +
>  4 files changed, 64 insertions(+)
>  create mode 100644 recipes-extended/xen/files/0001-tools-xenpmd-Fix-gcc10-snprintf-warning.patch
> 
> -- 
> 2.17.1
> 

> 
> 
> 

