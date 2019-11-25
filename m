Received: from mail-qv1-f67.google.com (mail-qv1-f67.google.com [209.85.219.67])
 by mx.groups.io with SMTP id smtpd.web10.2463.1574715841298483670
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 25 Nov 2019 13:04:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Wf03W1Gc;
 spf=pass (domain: gmail.com, ip: 209.85.219.67, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f67.google.com with SMTP id n4so6366576qvq.9
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 25 Nov 2019 13:04:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=87vCn0wBbOEjJAPQUJG7izm/wpoJ2CybC6Pxt9LSy+Q=;
        b=Wf03W1GczYQu4f3RqvZXFzIrz/DiOOHKSmhpA5FMcoubQGlZPMn87hhRrvXDALewJI
         JXUsJrAI9ZuWl6HEJ5+oJ/U6bHNrRJHOQ/aEItovAlqRrHTeIZhocUNDNOOrCxZGThfU
         L4BximCn2umxfZm1kWdzRLylfoLlQM9GvjWOcRuhw3u/W6ni7i7jsCDm6EYc3R6sBASv
         1XB+ROlEu7oAqb7eo41L+mUQVzZ2S3izxmx4h4XFG8wEl5UprsifnA7SiF1ji2ZwY4xX
         aHBd66ija3BlgK/boIuCHpzKlRoH+G+vP5PYkz1/XRyhNn9wFWVKeZVe5dNyyT9D6cCL
         qJvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=87vCn0wBbOEjJAPQUJG7izm/wpoJ2CybC6Pxt9LSy+Q=;
        b=ueqwA7EU9V/T2dZnY7Cl0CUDKCE9JQ69rMkZIwHewiGKeypRd5uaI/tSaOhuWG4xYQ
         yZCjWZIGGkpnGvhPh5yBupmDkiph+j0gR2RZlkMk+rxXEZGy5NJcv0aPUWeZOIQKBEic
         d5tF0+XpHQePPwNb5NxlUl5hVUVmrNmw2dGAxuf7QUCUsUVBhu5od/k+8k3UHCuKs+0C
         tWqPCBB5uKKOvNMKHRSK4DP/ClHuGYKfZ+3ND1eJN5VDug6k4w+qsEuqVRM7dcbg0H/7
         0WLHyf9OwDI2Zl50OzlyfwkJflg4Et6ic8CrZXypISJSkpBGNaSWmcdzlECIOmCYzko5
         Ipow==
X-Gm-Message-State: APjAAAWuxe4+Slo6rGCf5bnemiHC9jcZ7mXMjyqeAr6OWhW2V1l/mpti
	UM/Rm/xINbskffzLjQckHig=
X-Google-Smtp-Source: APXvYqyFg72baV0P8h6voB7YDlu4ql49h6HBZ5unThnF+BsjiJqydQE4xjWFHTSAPJ8fbP04Cd0P3g==
X-Received: by 2002:a0c:9bd1:: with SMTP id g17mr11439302qvf.59.1574715840025;
        Mon, 25 Nov 2019 13:04:00 -0800 (PST)
Return-Path: <bruce.ashfield@gmail.com>
Received: from gmail.com (CPEe8de27b71faa-CM64777d5e8820.cpe.net.cable.rogers.com. [174.113.11.95])
        by smtp.gmail.com with ESMTPSA id r80sm3959729qke.121.2019.11.25.13.03.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Nov 2019 13:03:59 -0800 (PST)
Date: Mon, 25 Nov 2019 16:03:57 -0500
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: Ming Liu <liu.ming50@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org, stefan.agner@toradex.com
Subject: Re: [meta-virtualization][PATCH] meta-virt-default-versions.inc: fix invalid python-pyyaml version
Message-ID: <20191125210354.GA27677@gmail.com>
References: <1574711826-6354-1-git-send-email-liu.ming50@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1574711826-6354-1-git-send-email-liu.ming50@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

In message: [meta-virtualization][PATCH] meta-virt-default-versions.inc: fix invalid python-pyyaml version
on 25/11/2019 Ming Liu wrote:

> From: Ming Liu <liu.ming50@gmail.com>
> 
> The python-pyyaml recipe in this layer is 5.1.2, fix the wrong
> PREFERRED_VERSION_python-pyyaml.


merged.

Bruce

> 
> Signed-off-by: Ming Liu <liu.ming50@gmail.com>
> ---
>  conf/distro/include/meta-virt-default-versions.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/conf/distro/include/meta-virt-default-versions.inc b/conf/distro/include/meta-virt-default-versions.inc
> index 27e7b90..06ff9e8 100644
> --- a/conf/distro/include/meta-virt-default-versions.inc
> +++ b/conf/distro/include/meta-virt-default-versions.inc
> @@ -3,7 +3,7 @@
>  PREFERRED_VERSION_python-blinker = "1.3"
>  PREFERRED_VERSION_python-gevent = "1.0.1"
>  PREFERRED_VERSION_python-m2crypto = "0.22.3"
> -PREFERRED_VERSION_python-pyyaml = "3.11"
> +PREFERRED_VERSION_python-pyyaml = "5.1.2"
>  PREFERRED_VERSION_python-redis = "2.10.3"
>  PREFERRED_VERSION_python-sqlalchemy = "1.1.5"
>  PREFERRED_VERSION_python-werkzeug = "0.10.4"
> -- 
> 2.7.4
> 

> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> 
> View/Reply Online (#4738): https://lists.yoctoproject.org/g/meta-virtualization/message/4738
> Mute This Topic: https://lists.yoctoproject.org/mt/61947151/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub  [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-

