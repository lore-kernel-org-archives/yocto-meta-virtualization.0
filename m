Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
 by mx.groups.io with SMTP id smtpd.web12.4182.1638418018767059919
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 01 Dec 2021 20:06:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=gTVFODGl;
 spf=pass (domain: gmail.com, ip: 209.85.222.175, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f175.google.com with SMTP id i9so33457582qki.3
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 01 Dec 2021 20:06:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=qa5zZmWOeaEqg/bmMRjPmXKX2SFPqJQLXZMhrEA8pFI=;
        b=gTVFODGl4BiCoo9JstUckqLvlq3cr2KN3VlQz86+LKL3nkxXbNEWMN7kU/MmThYvE6
         CNKpmF9jNHYE7mWPF8GUoCiIgH6KJ5Rng34tf/+645jVKJtCng0vCnJy5rOXqAJePzjp
         lgzSujT4u2e5cWnW2iSNkEXltNwwVGEVK49nY2dnqadzLaQ/1yHJDEvNjYUzkA+LM1Xu
         wf+ajtnvQUYnf0btZShlhM9loAlNpRiH0+tE9eMa9eYUS7PmHCFnQzUM+JoIJISlsNnE
         CDqaLmal4gazPUCgVghTFsduhui3BY8fKaXZZvpey0VU5fM4YxI/S12LHcHIC2ZJFTus
         i6qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=qa5zZmWOeaEqg/bmMRjPmXKX2SFPqJQLXZMhrEA8pFI=;
        b=u/FXLZjqN7MuPUFJKP1kW9tqeRzI3GG9iM4fzsZtFNQ/zvVvxP+pm3TH8v8tGpcbLR
         MtBIIuM/d1enZ2TFckIxmI9lvlSNr5D21QDH+gs52Rm7xxB6YdYbTUicMqYEBkyWQMyc
         gtttN/G53VqgKmMUSnbTJr0slWIkRh9DBeWcKdObRFBJ1tNjfdEzkzPR9VrTTezAzCjm
         V8ZCIyIcz4gNQPYbLvOLHtbaTuqZqzANZKQA2tIqfBvY/si/TjRU3b86vMAUH9FkNu+/
         AB5Rnomh9eGqqIyec0lu6nKgwseY4v1UkSHGEn2mk66SnbLKx/d9iGvNumQZ4P81bPLD
         fN+A==
X-Gm-Message-State: AOAM53183Lyy0GUOT/nCRL79QDb+dbUUGVc6lH9Bfg8n6e35TXGKOYCa
	fH0t9Q8OhFCI2wKWn4mFk3Q3wmo3z2VHew==
X-Google-Smtp-Source: ABdhPJyjbDT03vBvuTxFduCeAeq9uNuKUJ5E87CQiehHNrIroSoLSeyLgextJk+KAJ5hiI02PMeP5A==
X-Received: by 2002:a05:620a:1790:: with SMTP id ay16mr10582576qkb.43.1638418017858;
        Wed, 01 Dec 2021 20:06:57 -0800 (PST)
Return-Path: <bruce.ashfield@gmail.com>
Received: from gmail.com (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.63.222])
        by smtp.gmail.com with ESMTPSA id e17sm992984qtw.18.2021.12.01.20.06.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Dec 2021 20:06:57 -0800 (PST)
Date: Wed, 1 Dec 2021 23:06:55 -0500
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization] [PATCH] qemu-package-split.inc: Correct a typo
Message-ID: <20211202040653.GA17955@gmail.com>
References: <20211201123357.11531-1-pkj@axis.com>
MIME-Version: 1.0
In-Reply-To: <20211201123357.11531-1-pkj@axis.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

In message: [meta-virtualization] [PATCH] qemu-package-split.inc: Correct a typo
on 01/12/2021 Peter Kjellerstedt wrote:

I had noticed this myself, and swear that I fixed it .. but I can't
find any trace of the change now.

This is merged.

Bruce

> Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> ---
>  recipes-devtools/qemu/qemu-package-split.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/recipes-devtools/qemu/qemu-package-split.inc b/recipes-devtools/qemu/qemu-package-split.inc
> index f9db331..f1d8932 100644
> --- a/recipes-devtools/qemu/qemu-package-split.inc
> +++ b/recipes-devtools/qemu/qemu-package-split.inc
> @@ -10,7 +10,7 @@ PACKAGES:prepend:class-target = "${PN}-x86_64 \
>                      "
>  
>  FILES:${PN}-x86_64:class-target = "${bindir}/qemu-system-x86_64 ${bindir}/qemu-x86_64"
> -RDEPENDS:${PN}-x86_64:append:class_target = "${PN}"
> +RDEPENDS:${PN}-x86_64:append:class-target = "${PN}"
>  INSANE_SKIP:${PN}-x86_64:class-target = "file-rdeps"
>  
>  FILES:${PN}-i386:class-target = "${bindir}/qemu-i386"

> 
> 
> 

