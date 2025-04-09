Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B935EC36002
	for <webhook@archiver.kernel.org>; Wed,  9 Apr 2025 20:53:25 +0000 (UTC)
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
 by mx.groups.io with SMTP id smtpd.web11.19525.1744231998026270268
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 09 Apr 2025 13:53:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TP+OxGk7;
 spf=pass (domain: gmail.com, ip: 209.85.222.176, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-7c5aecec8f3so20831285a.1
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 09 Apr 2025 13:53:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744231997; x=1744836797; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=H5p7ohBDOpUQUZhrcNdZ1UY9QCGf/fml6VzC7DBviDY=;
        b=TP+OxGk7gIIMx8ste6RgtzI1JpUoR8p5rSi/1LSdOl+jD5GGTHzdAdR1nYINtC5tlq
         S43is7UeHEBjsyEiBvwlIkKAHVCpWVt1MoLylN2bXjqqQhrEf97EelYyr/nNKxkeRIbh
         CtFoHPlZMyYaqcHkZNGDPQ/sjmjx+cT088rogSX4FaRGsH4ObVGBnwuDsMFhNXwzVzdO
         M+rCGfM3ZRyCKHNzjyBn3LGemTt9Z9QGr+2OeXdvCJF56Nto6nUa6OCH9+wHe5VDAZnI
         heQk7q8cgM/GT7cDF8NfLxu7ARRLloXXfrwnQiuZQKYyJrL5/H41RQUw9i0kiLIHUp+5
         Qttw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744231997; x=1744836797;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H5p7ohBDOpUQUZhrcNdZ1UY9QCGf/fml6VzC7DBviDY=;
        b=w3kS5+P9pbhenzV5QfISBBGkImxmkH593W9K4s39Wx8qAsDvwFx8DvoXdzV/wAjIu3
         djJafMhAMsXwyqTGFNsq/1zNu/A7ZuuSHCMF4LwiF1zPoVqymJEefDD+EJlcT6AzUNRo
         yS63Xc699Rs7qUXPnS03iFyftKdapoTx6uewqrYZCrxD/BL6qlPV94XKRNQ4wCXXAihJ
         Z5YRlmyMPTLgkRwWCMMEtyAUW6rUCl82OqgKTjhmzTrJkirblYEh8BPn+5o3wbFmpdpB
         qFQmH1fXp9EopEaimI4nUHijM5Nr1RaIqjQwtfqT7+UCOluHO5u/gJFSpxUHsK3m71hM
         PH5g==
X-Gm-Message-State: AOJu0YwpZB4r1qYiURlPakIxJBTYCnCtAiEczrrxHhIHuIk9rHYFtij3
	IYneacz0SvM/ZcrxRUKXmUeJp6qIlshIYlU6K+ZahcXu7jv6i2h7
X-Gm-Gg: ASbGncvERECA7k5ejQm1F1FFm4EX1t6fdi0LOn3kylTmWJHkKaxnH+dmiuwdl8KbnWP
	xCfeAfEGXIJkj0zq6Amvk1G0qfQ11GjlJYFaDInrN5VJBqd3XrChTOc3UMgcRr6ch1n6ymjmury
	TsYHNQIyKm74NOOA3Hoypn6QUdLHKZIf87hEAQnPuZRSqP/hyED55dRnkEHZnCVHMOHf8Y8TgSb
	kw46doOyyyYwFZccSsQoPc93qpfiMk/4bAUQP6JssLiYhyKZ0rj5dvW+XLRoWfmWywbydFnmgDp
	wXZxt9jRzblYMl4pD50ioALhD4l12ZNze/2WDO46UCoevGgnaxmzrGo6WBHvvHKuhiHyfEJz4AF
	+5Np8L8AmEqZLFB+QZzk=
X-Google-Smtp-Source: AGHT+IEQugtwOTqbgmWcuVzbFh2F4E0HSGkKJm/yZYgjRVIe4DLrVxDVgcVGub/AbkTRyxvseHz4fQ==
X-Received: by 2002:a05:620a:17a3:b0:7c5:99a6:7883 with SMTP id af79cd13be357-7c7a76d05f3mr44620885a.54.1744231997049;
        Wed, 09 Apr 2025 13:53:17 -0700 (PDT)
Received: from gmail.com (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c7a11e9326sm114671985a.92.2025.04.09.13.53.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 13:53:16 -0700 (PDT)
Date: Wed, 9 Apr 2025 20:53:14 +0000
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: troth@openavr.org
Cc: meta-virtualization@lists.yoctoproject.org,
	"Theodore A . Roth" <theodore_roth@trimble.com>
Subject: Re: [meta-virtualization][PATCH] podman: Fix QA error for invalid
 PACKAGECONFIG
Message-ID: <Z_beOkjtGrcXKjlg@gmail.com>
References: <20250409150620.59558-1-troth@openavr.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250409150620.59558-1-troth@openavr.org>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 09 Apr 2025 20:53:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9214

I went a different way with this.

docker shouldnt' really be a packageconfig, and rootless was adding
an rdepends later .. when it could have just been done in a compliant
way in the PACKAGECONFIG.

Bruce

In message: [meta-virtualization][PATCH] podman: Fix QA error for invalid PACKAGECONFIG
on 09/04/2025 Theodore A. Roth via lists.yoctoproject.org wrote:

> The insane.bbclass now flags as errors when PACKAGECONFIG contains a
> value that does not have a setting.
> 
> For example, setting a value like this:
> 
>     PACKAGECONFIG += "foo"
> 
> without something like this in the recipe:
> 
>     PACKAGECONFIG[foo] = "stuff"
> 
> will result in QA errors like the following:
> 
>     ERROR: podman-v5.4.1-r0 do_recipe_qa: QA Issue: podman:
>            invalid PACKAGECONFIG(s): docker rootless [invalid-packageconfig]
>     ERROR: podman-v5.4.1-r0 do_recipe_qa: Fatal QA errors were found, failing task.
> 
> Signed-off-by: Theodore A. Roth <troth@openavr.org>
> Signed-off-by: Theodore A. Roth <theodore_roth@trimble.com>
> ---
>  recipes-containers/podman/podman_git.bb | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/recipes-containers/podman/podman_git.bb b/recipes-containers/podman/podman_git.bb
> index be85e512..9f886ed4 100644
> --- a/recipes-containers/podman/podman_git.bb
> +++ b/recipes-containers/podman/podman_git.bb
> @@ -70,6 +70,9 @@ EXTRA_OEMAKE = " \
>  # packageconfig, the podman package will rconfict with docker.
>  PACKAGECONFIG ?= "docker"
>  
> +PACKAGECONFIG[docker] ?= ""
> +PACKAGECONFIG[rootless] ?= ""
> +
>  do_compile() {
>  	cd ${S}/src
>  	rm -rf .gopath
> -- 
> 2.34.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9211): https://lists.yoctoproject.org/g/meta-virtualization/message/9211
> Mute This Topic: https://lists.yoctoproject.org/mt/112173803/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


