Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com [209.85.222.194])
 by mx.groups.io with SMTP id smtpd.web09.11440.1605802129137526759
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 19 Nov 2020 08:08:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=HQOYfZBf;
 spf=pass (domain: gmail.com, ip: 209.85.222.194, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f194.google.com with SMTP id l2so5883122qkf.0
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 19 Nov 2020 08:08:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Q6MJnQCooL209QAOjxQnvD8odcgykGGldpHt7FJI/0I=;
        b=HQOYfZBfsLWacxtj3ypmHMBLCT5b9+xOmQMkpMITSwW9oj3plXETBJU8SKcq1O//R7
         dAmBII+7OKJlXVZHkOD50rjGQsfbJHmh2T0n1cSA8pHP18T5dj3j6iXUTJu5ppIdAwnK
         wA0m2p/IeanCJKKnoFIxDWSo5fmkWVBkerxjGDqExQJEkRUJTLcApU+gtBuoKSsBIz+n
         N1HWG0c8oQgH20rBtaFirRidRILsQkDbKmTSM8/SlAOlgLsKD4wk+EME7XCqAqvm4Hx2
         4LHq8fmLsUvPVLXdWAuKKALsFlnUwwil813IaFdmWTgsdAaLCQu11uYcNR4u2tYV1195
         GORg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Q6MJnQCooL209QAOjxQnvD8odcgykGGldpHt7FJI/0I=;
        b=O6PqAqCGQoF7oGXScT1Zf2j9XjkWXdK8PfSncGvPGCj4xuxfoSXmKgkcIGvFtKF9fY
         0WLQJVeGKhAHG6DrFYqo8OynmaCGDeHjGpv8d0AnXGAoDWXL1DIN9JYcVyPcgve9PJGr
         oeqB/3keJQatXhRxkNhTzjBcPywTJ5aAP/mQhZOpBQe37qxgXc1iTMvuTb4LWO/0kZ6l
         DGpkQHnfcnvzfX7HGvUb7p8U54t1oqT/YKun1bUJ565PUWD0XYqWz+HdlHzd1QscnXH3
         nYoVpyGEdYmxusetWstPuPq725z3G4FCyo9MlRR+dOOqb+T+Hg6IUb0cwJrHIcRjtpJy
         qMBQ==
X-Gm-Message-State: AOAM532KS46WxdtHJTElLBfNOS4w+KpQNf3Pc4tX+1leJLskYqSuE+87
	W77oZvJ/KHoAqmLpLhOhI/waDDMqfX5rFfWR
X-Google-Smtp-Source: ABdhPJxLIaO+PZB1sdKAzmiBh+oiiursa6DWXqwQhRcSU2+H8BE1O4rm6SFEYHK1t9d//Ir78icpZw==
X-Received: by 2002:a05:620a:95d:: with SMTP id w29mr10797980qkw.76.1605802128204;
        Thu, 19 Nov 2020 08:08:48 -0800 (PST)
Return-Path: <bruce.ashfield@gmail.com>
Received: from gmail.com (cpe04d4c4975b80-cm64777d5e8820.cpe.net.cable.rogers.com. [174.112.165.127])
        by smtp.gmail.com with ESMTPSA id p12sm114468qkp.88.2020.11.19.08.08.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2020 08:08:47 -0800 (PST)
Date: Thu, 19 Nov 2020 11:08:45 -0500
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: Tim Orling <ticotimo@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][PATCH] linux-yocto: add cgroup-hugetlb config
Message-ID: <20201119160844.GC9432@gmail.com>
References: <20201115034922.30940-1-ticotimo@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20201115034922.30940-1-ticotimo@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

In message: [meta-virtualization][PATCH] linux-yocto: add cgroup-hugetlb config
on 14/11/2020 Tim Orling wrote:

> From: Tim Orling <ticotimo@gmail.com>
> 
> Add kernel config fragment for CONFIG_CGROUP_HUGETLB
> 
> This is a recommended config for Kubernetes and k8s
> will throw a warning if it is not present.

In my k3s-wip branch, I have a series of kernel configs directly related
and named for kubernetes .. I had hoped to just merge this into that
effort, but as you can see from my posts, getting k3s done is taking
longer than I wanted.

So I've gone ahead and merged this, and I'll consolidate them later when
I finish k3s.

Bruce

> 
> Signed-off-by: Tim Orling <ticotimo@gmail.com>
> ---
>  recipes-kernel/linux/linux-yocto/cgroup-hugetlb.cfg | 5 +++++
>  recipes-kernel/linux/linux-yocto/cgroup-hugetlb.scc | 5 +++++
>  recipes-kernel/linux/linux-yocto_virtualization.inc | 1 +
>  3 files changed, 11 insertions(+)
>  create mode 100644 recipes-kernel/linux/linux-yocto/cgroup-hugetlb.cfg
>  create mode 100644 recipes-kernel/linux/linux-yocto/cgroup-hugetlb.scc
> 
> diff --git a/recipes-kernel/linux/linux-yocto/cgroup-hugetlb.cfg b/recipes-kernel/linux/linux-yocto/cgroup-hugetlb.cfg
> new file mode 100644
> index 0000000..417ca24
> --- /dev/null
> +++ b/recipes-kernel/linux/linux-yocto/cgroup-hugetlb.cfg
> @@ -0,0 +1,5 @@
> +# SPDX-License-Identifier: MIT
> +#
> +# This requires CONFIG_HUGETLBFS
> +
> +CONFIG_CGROUP_HUGETLB=y
> diff --git a/recipes-kernel/linux/linux-yocto/cgroup-hugetlb.scc b/recipes-kernel/linux/linux-yocto/cgroup-hugetlb.scc
> new file mode 100644
> index 0000000..7d1f999
> --- /dev/null
> +++ b/recipes-kernel/linux/linux-yocto/cgroup-hugetlb.scc
> @@ -0,0 +1,5 @@
> +# SPDX-License-Identifier: MIT
> +define KFEATURE_DESCRIPTION "Enable hugetlb cgroup"
> +define KFEATURE_COMPATIBILITY all
> +
> +kconf non-hardware cgroup-hugetlb.cfg
> diff --git a/recipes-kernel/linux/linux-yocto_virtualization.inc b/recipes-kernel/linux/linux-yocto_virtualization.inc
> index f050b3f..42a10b3 100644
> --- a/recipes-kernel/linux/linux-yocto_virtualization.inc
> +++ b/recipes-kernel/linux/linux-yocto_virtualization.inc
> @@ -5,6 +5,7 @@ SRC_URI += "file://xt-checksum.scc \
>  	    file://vswitch.scc \
>  	    file://lxc.scc \
>              file://docker.scc \
> +	    file://cgroup-hugetlb.scc \
>  	    "
>  KERNEL_FEATURES_append = " ${@bb.utils.contains('DISTRO_FEATURES', 'kvm', 'features/kvm/qemu-kvm-enable.scc', '', d)}"
>  
> -- 
> 2.25.0
> 

> 
> 
> 

