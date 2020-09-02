Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web10.12012.1599278336098887567
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 04 Sep 2020 20:58:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=bfPaFStp;
 spf=softfail (domain: gmail.com, ip: 198.145.29.25, mailfrom: bruce.ashfield@gmail.com)
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	by mail.yoctoproject.org (Postfix) with ESMTPS id ECCC238C027C
	for <meta-virtualization@yoctoproject.org>; Fri,  4 Sep 2020 20:58:55 -0700 (PDT)
Received: by mail-qv1-f44.google.com with SMTP id b13so4123286qvl.2
        for <meta-virtualization@yoctoproject.org>; Fri, 04 Sep 2020 20:58:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :in-reply-to:user-agent;
        bh=wyQeZWLx/Devz76U/MM7uWFuX+Dt8inKP7T1EIUVUZU=;
        b=bfPaFStpldzj8rkqcCtJr/fn1Lp8FKFjJtkWosOE94o0k1iUF0kN/pB0JU1hXYLzT9
         vmeQtS8go49SWCGRFf9Kklx8zxZBiZhDWMNQNN1Dy6B6Mu/XDLjSC6zT+8KcQCWytJ+N
         hKbJWeU51dgR+P303qRh7vfGuKJn8Gl4PxraDZB8xOL+VvgoZCTNs27HRizS2haFZqle
         DekvEmn/sW6KFcfQ+jL/qZTwdTBIJQ3AZhY090P6dWM+NqDqdkQxTXwP5h9+SGQXLhNe
         vN1HTKWeD+qn3HgBcJYLzce3oT9J4ExKUZgApxzbTGjNSfGC6exOWmMrIN1lXUy51efP
         uP7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=wyQeZWLx/Devz76U/MM7uWFuX+Dt8inKP7T1EIUVUZU=;
        b=M0ufHmCji2WACb1eoOpgo4K5OjhoKQakjjSmZLTj0/UUmrdCBul0OVQ26VZiizW6MR
         IUFKYg4bXB80pg3EIj0D5ZKH/ANC2X+UfsX5+saXS8+rkiCBtbf+uRKpf+xGTtfKzD+n
         E5Iq5JJSUsBy6Xt9sQVyCsAM9z4yv4eI53m0M5Pl1c00h63lJNlWCXFetwqCEFWWcJcj
         2PPY2durmI4rZdnbJRaH3mnP1ecLPctgV7eo3lbyAxp0WGaCZjcGYIlhTS6q2AKItaEM
         YPN134XiMB0y8WGtqUWbE8JEKXFEtXP5CJW2UHll4lm3Lzx7nuF36xqlU5aSfE3PF7la
         J2sw==
X-Gm-Message-State: AOAM533jm/WJWm5pc2Cxzv/eA0h96jJ9lgAHKjTizQbUM68LLjqpvPzH
	Nlr3kYk4xy2NKml9kYj5uLF93EZ6uf7lWw==
X-Google-Smtp-Source: ABdhPJwqZE+fxch88eYQ5Bhn6ayFDdzsYQnclSELdWf0/nSipiQLBW6xlJIx+Id0aB9YIeRd5we3Zg==
X-Received: by 2002:ad4:530b:: with SMTP id y11mr8514077qvr.149.1599078860374;
        Wed, 02 Sep 2020 13:34:20 -0700 (PDT)
Received: from gmail.com (CPE04d4c4975b80-CM64777d5e8820.cpe.net.cable.rogers.com. [174.112.240.214])
        by smtp.gmail.com with ESMTPSA id r34sm464668qtr.18.2020.09.02.13.34.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2020 13:34:19 -0700 (PDT)
Date: Wed, 2 Sep 2020 16:34:17 -0400
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: zangrc <zangrc.fnst@cn.fujitsu.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [meta-virtualization] [PATCH] python-django: Remove recipe
Message-ID: <20200902203416.GC18324@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1598925412-77883-3-git-send-email-zangrc.fnst@cn.fujitsu.com>
 <1598925412-77883-2-git-send-email-zangrc.fnst@cn.fujitsu.com>
 <1598925412-77883-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

merged.

Bruce

In message: [meta-virtualization] [PATCH] python-django: Remove recipe
on 01/09/2020 zangrc wrote:

> Because python is no longer maintained, delete the python2 version of the recipe.
> The python3 version already exists, located at:
> meta-openembedded/meta-python/recipes-devtools/python/python3-django_2.2.13.bb
> 
> Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
> ---
>  .../python/python-django_git.bb               | 21 -------------------
>  1 file changed, 21 deletions(-)
>  delete mode 100644 meta-openstack/recipes-devtools/python/python-django_git.bb
> 
> diff --git a/meta-openstack/recipes-devtools/python/python-django_git.bb b/meta-openstack/recipes-devtools/python/python-django_git.bb
> deleted file mode 100644
> index 2008604..0000000
> --- a/meta-openstack/recipes-devtools/python/python-django_git.bb
> +++ /dev/null
> @@ -1,21 +0,0 @@
> -DESCRIPTION = "A high-level Python Web framework"
> -HOMEPAGE = "http://www.djangoproject.com/"
> -SECTION = "devel/python"
> -LICENSE = "BSD"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=f09eb47206614a4954c51db8a94840fa"
> -
> -SRCNAME = "Django"
> -
> -PV = "1.8.6"
> -SRCREV = "80b7e9d09f2d23209b591288f9b2cf3eb3d927c8"
> -
> -SRC_URI = " \
> -    git://github.com/django/django.git;branch=stable/1.8.x \
> -    "
> -
> -S = "${WORKDIR}/git"
> -
> -inherit setuptools3
> -
> -FILES_${PN} += "${datadir}/django/*"
> -
> -- 
> 2.25.1
> 
> 
> 

> 


