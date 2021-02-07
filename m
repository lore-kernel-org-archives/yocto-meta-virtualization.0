Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
 by mx.groups.io with SMTP id smtpd.web12.20182.1612705640370382689
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 07 Feb 2021 05:47:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=dAEavpn4;
 spf=pass (domain: gmail.com, ip: 209.85.222.179, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f179.google.com with SMTP id s77so11863171qke.4
        for <meta-virtualization@lists.yoctoproject.org>; Sun, 07 Feb 2021 05:47:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Kt00wyVrxZuiRot/4u3JSQ0Q2KOFgRw7m58oB3DDvXc=;
        b=dAEavpn4wkYWDTrWBLK1U+LLGkTfILoqzV/BE3OwFnTNUWcc4IkuTwj51DrPf2XguF
         2nYvzNfeaUyqxcDgVVfduoB4EjFsBOcV3SR+zBD00wHIPjUv4RTsIMki5vM0puzoQtJC
         8HuEqsX7/jENr4it7/A3owmqCW0yiYYMzwVA7/eYY4HukscnF+ZQUqOPmkdJoVbmsEUX
         tIqK7PMNni7Kmh55QinvXOIYVNJ2cpm5aBURilyXeAsoq4eQd1XP33UysiC031Tei44D
         OjDX6Hdfk7Spoc8SYnic7R0N2h8PCivcSU1VwXMfRGuMuRM25sJAVNg4AKqgCQm7bDJi
         kXEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Kt00wyVrxZuiRot/4u3JSQ0Q2KOFgRw7m58oB3DDvXc=;
        b=blfSbz09IWQUpjhy2QuqP1gVp/A3ky4CWACN+yq58q2T46MiGrmsQ8aCsWTFO7JUmy
         8r8ptzwDP0tSyfNBD3IelebCQgs0TLl8iHLULxr2n8tEgKXPMPQS5COPOuBWHWrLf6iF
         iyzIV6EgM9GcYewDmKBm2kGuQUQcVACgbZi4MWU95ug13uS1GAfd/qYmSakXonVLhYBE
         U12chlQqFHbWvB/kre0S5L9GhDrYKeFPZcXHm52XUijbe2m60Fw12wA4IHRRtPWw0VKq
         6ivfnGGm75a3D6h8zV4UaHEWV5ulYWqhMgiF7iT7oqjo+T9q38OEbrp7ee4ZVZ2STUXY
         5uZw==
X-Gm-Message-State: AOAM5339bqEJI6PGMvgGwo6bGcg/HKGzUCEd1Uj8y0uASYqLEYb9e27C
	SyXPqNSxxGLDWUww2Rbne/k=
X-Google-Smtp-Source: ABdhPJzQbNEhj8nVMJwPMCozevv+Yq163iKONUkNHV1TabqoEqn80d8J8+6rKBwppalK9pc9fM3aBA==
X-Received: by 2002:a37:aa96:: with SMTP id t144mr12889645qke.127.1612705639494;
        Sun, 07 Feb 2021 05:47:19 -0800 (PST)
Return-Path: <bruce.ashfield@gmail.com>
Received: from gmail.com (cpe04d4c4975b80-cm64777d5e8820.cpe.net.cable.rogers.com. [174.112.159.151])
        by smtp.gmail.com with ESMTPSA id c17sm2514024qtn.71.2021.02.07.05.47.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Feb 2021 05:47:18 -0800 (PST)
Date: Sun, 7 Feb 2021 08:47:17 -0500
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: Changqing Li <changqing.li@windriver.com>
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization] [V2][PATCH] celt051: update SRC_URI
Message-ID: <20210207134714.GA48372@gmail.com>
References: <165E00DC7E478DDF.12137@lists.yoctoproject.org>
 <20210127061054.15256-1-changqing.li@windriver.com>
MIME-Version: 1.0
In-Reply-To: <20210127061054.15256-1-changqing.li@windriver.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

v2 is merged.

Bruce

In message: [meta-virtualization] [V2][PATCH] celt051: update SRC_URI
on 27/01/2021 Changqing Li wrote:

> Gitlab is old repo, which is no longer used for active development. But
> at least we can access, the new repo has down for several monthes.
> 
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>  recipes-support/celt051/celt051_git.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/recipes-support/celt051/celt051_git.bb b/recipes-support/celt051/celt051_git.bb
> index ee388214..6eab5669 100644
> --- a/recipes-support/celt051/celt051_git.bb
> +++ b/recipes-support/celt051/celt051_git.bb
> @@ -17,7 +17,7 @@ PR = "r0"
>  
>  SRCREV = "5555aae843f57241d005e330b9cb65602d56db0f"
>  
> -SRC_URI = "git://git.xiph.org/celt.git;branch=compat-v0.5.1;protocol=https"
> +SRC_URI = "git://gitlab.xiph.org/xiph/celt.git;branch=compat-v0.5.1;protocol=https"
>  
>  S = "${WORKDIR}/git"
>  
> -- 
> 2.17.1
> 

> 
> 
> 

