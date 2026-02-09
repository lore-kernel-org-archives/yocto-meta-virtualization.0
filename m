Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35C22E94602
	for <webhook@archiver.kernel.org>; Mon,  9 Feb 2026 20:18:19 +0000 (UTC)
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4133.1770668294478451672
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 09 Feb 2026 12:18:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RlKfk3Fz;
 spf=pass (domain: gmail.com, ip: 209.85.219.43, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-894674a4c4aso54577746d6.3
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 09 Feb 2026 12:18:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770668293; x=1771273093; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GOTuxCg3SZce7RaNWozyhSCfmV2uVysrCuhBcLlFYrA=;
        b=RlKfk3FzI9Tmn2Kbm2s074bCTU9D86JnoLdt08p+OPusCHQ4U5TUgtrQioOxnDh25m
         qzaQ8XXOJgznBh91q0DdHFsuZQpEtbStBvVSSZy6oFVucCWKjgKsCtF0eOSQLETbX+bF
         Ns58En32uhmjxbFbwo9+zRwfPETssKxT/0WLa6XYQz/Zm+LDU006npAWs/eLh/DWu+d4
         VLSxRlGENw9H0YKzIsiL+9KLonbR+ksw9K4VeAK2aCcxUXDS2P52yJt9im4SJmk8MPWb
         wNdnGAGXP/b0gD8aqFfVd28thQ6UXiqu3OJMKRMhbTmL+/k0G17Su3Jvgyz8bquJm5go
         N7Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770668293; x=1771273093;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GOTuxCg3SZce7RaNWozyhSCfmV2uVysrCuhBcLlFYrA=;
        b=pRM2tcBpVmk8Yt5wwoLMqnoFGZqb5CSudH3qaDPFSNjApL0IGokcOsNIvq7J9uetAG
         GSdHCJth4yyIV8xp1UFm5vbJoAKuJblbjIdseY72mbyh0AVVblXvQTz1Ek8/EmyjaAWr
         f/k2jIHxbWXD00pRoVcOeK13fdL/WXmhfnS04+IKk+q1nLCtYTsFRlzVglus6ozYglzi
         ZqQNA8Ikusb4r6lshB3bYZFdp1fTkx/b/TIoGpIhnwSMiWDNexkLuoXIzZcvmLvUpCO1
         EXY5e6wk04VZ6AwMx7/lkyAZpnzaU7lj44e8vpD1iKYw8woBC0eK1+vmwJLL9c+KsRP0
         2bLw==
X-Gm-Message-State: AOJu0YyWp1A0LSwN8mRqQJ4uyj3nXYY/o4iT3fEC/+zx8XqAht6Dnuds
	NW5RWN7aS00cok3QegojNUvGAp5AzBuf84woMN6gepvPUQ03LxKekpbNsmY6QtE8
X-Gm-Gg: AZuq6aJNxYhuG62Zg2B3ZcXEI2FnrNzjHQCyxKzelyt7czo/xEwk8DslmvYkkBWh4Kw
	9qHVjBnQcKeL6tOLOmkbwSwh0PW9osJtvuJMtc+bF80uTPM/rsUR4Ds2+CYLt3R/J+xyhNspAda
	Bwlr9UWhYI97EG53jK6QLnzKlooDeLd6NM/r3y8f/8slP6Rz6KxGdJ2eFtVIqsAO14BONmcxOTr
	oiBV6lLeI4QnSbBsP3WCqXp4crSU4y7AECH3rXs/OM47FPj4uF2JdYIkHVEIPqKMEd+b5hFDQwE
	iZfWRSlfc408kWVRnpubrZE+FsPCW1x7kYF56kKh4cajVqQnLLI7Kc7XF1UShuey4/1647Siyyv
	fnhPFyxSiIusNj6qg8Tvb5EUdyktP+7TBvALFc0Jqvb9/7OsMC7Y1qIXDag74/98zwFStzvs4rY
	uUN0FuXLk6YCqBs0v4zuTuMnFWnqNlCNLOszIZKi/CFc3MdF3o8NibfL70DYPQcgZRSuuG+9veO
	nKExR0U6X0B/+KyikaoY722
X-Received: by 2002:a05:6214:27c2:b0:721:a9d7:297a with SMTP id 6a1803df08f44-8953c7d78d5mr207473886d6.7.1770668293293;
        Mon, 09 Feb 2026 12:18:13 -0800 (PST)
Received: from gmail.com (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8953c03fc95sm84294606d6.26.2026.02.09.12.18.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 12:18:12 -0800 (PST)
Date: Mon, 9 Feb 2026 20:18:11 +0000
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Qi.Chen@windriver.com
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][PATCH] nerdctl: add -buildmode=pie to
 avoid textrel QA error
Message-ID: <aYpBAxLkDJLyHcjx@gmail.com>
References: <20260204063445.4066475-1-Qi.Chen@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260204063445.4066475-1-Qi.Chen@windriver.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 09 Feb 2026 20:18:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9573

Since I went a different way with the mod cache rw, this
patch didn't apply.

I've fixed it up and merged it.

Bruce

In message: [meta-virtualization][PATCH] nerdctl: add -buildmode=pie to avoid textrel QA error
on 04/02/2026 Chen Qi via lists.yoctoproject.org wrote:

> From: Chen Qi <Qi.Chen@windriver.com>
> 
> On qemuarm, building nerdctl fails with QA error about textrel.
> Add '-buildmode=pie' to fix this issue.
> 
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  recipes-containers/nerdctl/nerdctl_git.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/recipes-containers/nerdctl/nerdctl_git.bb b/recipes-containers/nerdctl/nerdctl_git.bb
> index 1c37bcf8..5429e6e6 100644
> --- a/recipes-containers/nerdctl/nerdctl_git.bb
> +++ b/recipes-containers/nerdctl/nerdctl_git.bb
> @@ -78,7 +78,7 @@ do_compile() {
>          export CGO_LDFLAGS="${LDFLAGS} --sysroot=${STAGING_DIR_TARGET}"
>  
>          # -trimpath removes build paths from the binary (required for reproducible builds)
> -        oe_runmake GO=${GO} BUILDTAGS="${BUILDTAGS}" GO_BUILD_FLAGS="-trimpath -modcacherw" binaries
> +        oe_runmake GO=${GO} BUILDTAGS="${BUILDTAGS}" GO_BUILD_FLAGS="-trimpath -modcacherw -buildmode=pie" binaries
>  }
>  
>  do_install() {
> -- 
> 2.34.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9555): https://lists.yoctoproject.org/g/meta-virtualization/message/9555
> Mute This Topic: https://lists.yoctoproject.org/mt/117630466/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


