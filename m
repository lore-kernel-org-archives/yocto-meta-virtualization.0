Received: from mail-qv1-f66.google.com (mail-qv1-f66.google.com [209.85.219.66])
 by mx.groups.io with SMTP id smtpd.web11.95.1582220629596153898
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 20 Feb 2020 09:43:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=lH/Dci/T;
 spf=pass (domain: gmail.com, ip: 209.85.219.66, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f66.google.com with SMTP id q9so2268344qvu.7
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 20 Feb 2020 09:43:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=0PDjENgtvmyAnha2fGW7FfwBrKQ/+YqkelGlxkjeRog=;
        b=lH/Dci/TPuGP6naUZBJM06uFoysiN0qbrVGJXm8FzaCXFOC4CmW/qYxR8D0VFDdWE6
         zCH+yspCWNVRV8+GVJvPUVE94P5NUdfg7cgNvJ4boVwtvJBnDiEf7x9OQPYCmC0TWFgX
         +1ek1XrLu+x/8MpVLI9Sp+hI72QZi0CjGsBsmsh/4PrmqTWIKmr7SN3ZpgL6IeODS922
         qTA7ZCEmi6klDggSakqt/Nk5J3Khl5jTax+wjbtpIEP1PGUCancXMvdwKcNgFq268P+N
         NNsrduz1Oz3Nlhgz4Rc2XxN/M04utG7TAVHYKSCyVzGim+XXQOpjQHQ3GTHCo8KKhiz+
         h8sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=0PDjENgtvmyAnha2fGW7FfwBrKQ/+YqkelGlxkjeRog=;
        b=hPdbqS2gGVaMWhkdpIIz9/HxN2XcF/XMrCMSQen+UcURSm5vyCnHu9WCbRgedlswfj
         QVhVFVxtZO5Z04cknlro1hKrTU9JOCwBgSmTGcmYyRIhf0Rg6WiDexEzvvTaEr2TDfGS
         nc40zRxFauCHPvwmoxpD8fikou8yOtPEXMukoX0JUWUiYiMclfmlRnlXEaGkp4QMsozM
         aXaqX28Qurvw8Z/G4eAxL6IqCSAiwcuiDUWFG7jN2gEUtcIOEuHHZW1JsnyY/q2RjXSX
         gf2IXc7UMWukmqna7Z13jlrcZ4GJlkG5hnUuLKiuBmTX1uE8dZHZlCcl0fkbYMrlCQxO
         +o/g==
X-Gm-Message-State: APjAAAUb82xoPAAHs0v+5IO0eXAX28enjhPsNJoIn2ra09eRfu+UDAjn
	dir6Zl7yubaK7q5K62slEPk=
X-Google-Smtp-Source: APXvYqyrmWQFzF83PYqyZNiORY2lCJItYco9OZIaa4ClrpONtg4yV9T2L45NQa/KbQrI00tPLY0ByQ==
X-Received: by 2002:a0c:edc3:: with SMTP id i3mr26768195qvr.29.1582220628675;
        Thu, 20 Feb 2020 09:43:48 -0800 (PST)
Return-Path: <bruce.ashfield@gmail.com>
Received: from gmail.com (CPEe8de27b71faa-CM64777d5e8820.cpe.net.cable.rogers.com. [174.113.11.95])
        by smtp.gmail.com with ESMTPSA id d69sm145747qkg.63.2020.02.20.09.43.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2020 09:43:48 -0800 (PST)
Date: Thu, 20 Feb 2020 12:43:46 -0500
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: Changqing Li <changqing.li@windriver.com>
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][PATCH] hook_support.py: convert to python3
Message-ID: <20200220174343.GA65133@gmail.com>
References: <1582011834-136295-1-git-send-email-changqing.li@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1582011834-136295-1-git-send-email-changqing.li@windriver.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

merged.

Bruce

In message: [meta-virtualization][PATCH] hook_support.py: convert to python3
on 18/02/2020 Changqing Li wrote:

> From: Changqing Li <changqing.li@windriver.com>
> 
> python2 has been removed from oe-core, convert the scripts
> to python3 to avoid runtime error like:
> /usr/bin/env: 'python': No such file or directory'
> 
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>  recipes-extended/libvirt/libvirt/hook_support.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/recipes-extended/libvirt/libvirt/hook_support.py b/recipes-extended/libvirt/libvirt/hook_support.py
> index c3eb8b3..7c5e2a9 100755
> --- a/recipes-extended/libvirt/libvirt/hook_support.py
> +++ b/recipes-extended/libvirt/libvirt/hook_support.py
> @@ -1,4 +1,4 @@
> -#!/usr/bin/env python
> +#!/usr/bin/env python3
>  #
>  # Copyright (C) 2014 Wind River Systems, Inc. 
>  # 
> -- 
> 2.7.4
> 

> 

