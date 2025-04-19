Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E413C369C9
	for <webhook@archiver.kernel.org>; Sat, 19 Apr 2025 22:50:18 +0000 (UTC)
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
 by mx.groups.io with SMTP id smtpd.web10.6275.1745103008335282933
 for <meta-virtualization@lists.yoctoproject.org>;
 Sat, 19 Apr 2025 15:50:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=A+SkBPeC;
 spf=pass (domain: gmail.com, ip: 209.85.222.173, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-7c5aecec8f3so470000285a.1
        for <meta-virtualization@lists.yoctoproject.org>; Sat, 19 Apr 2025 15:50:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745103007; x=1745707807; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=T8SpTK2WNjVKrDdtwrOeckMkY2YxX9IIoVv9sdWQd9w=;
        b=A+SkBPeC+R2vUb3nbzZNvUmrLYZG1gUNuW1Ws1SoNYwky3El38kFvINrA+hN36OyTq
         XMC88HH6+dMywg8rm77nnG076dn6OvkxeM3V1554ndvTAePF3UTcO/rfTxjdUAADRgE9
         +J4hSSce6U7OMZP0sNMa9m7RQdHFW7rYXC/2ow4OB5jP/YB1ALTaqkaDZ7EWNMWKDpny
         toVlKcczmkT5PVd31xxNlaVPnpWxrUdOU1ai57h3YUKG++WPDayFtZNjMHXFLaT2XLPi
         9MgMBZ8cQW+sw9f9osG91iRNX0Xq81QeZBmP7DJlNwt6SKOrWPJKziJaCeree+FhEDpS
         pdkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745103007; x=1745707807;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T8SpTK2WNjVKrDdtwrOeckMkY2YxX9IIoVv9sdWQd9w=;
        b=q8DCoDx0z3keaGo1tqNIfnm7BWVSOkElTmqWjx2G3Oc7QuePmTtWYVrqslAdAvXkKd
         9gvufT6cNgf6bPJ8IzaKqdQvqd4B70HQTejNjNK/+qW3xl8pwZyAc7eHmjXH3Evnp6k6
         6qK4NrO3vANzQyMFog6PGpdUK7Y7TnfUzhkkAoyurbm9HlEkYy3qtIR0UfL2tNsL2y4h
         XsMvDXfLAmQk49k4Z348jSp8klHiIWSGPDZs4FYF3kLON6Z5qxs8jcofOSJeiie0HzXt
         eqYwgg2/IcXvKYEc99VJWadOyM0+bxNF+x8JCVU1uXP1/U3V7Rw0HO4/cCLJVIDp1Fsl
         CsRA==
X-Gm-Message-State: AOJu0Yzcdoo//E1+lRtDtv1dUAMKsVWr2YGMvefGmGTuUbKXDllP1qFM
	fFwTqjYVVo/lhOSnG8aj8pBW3rohoz8n4xxS8VI/C5h+Xgoi3LgA
X-Gm-Gg: ASbGncsDtJ3sV+uqFlEwztzc3hQXB1v16w7s8DlXc9fgSAeVIfuKFEbmol6+oNecPQ9
	0WfyNlXDlw62iSbaBFSFfeZ3uvGwZ4vK5r9wv47DjI31c7ACtbJ2MQTZnGt5m+PznGBk2Fc5jqn
	dWU4sR8t8QSgviLuFTUQ+GYuyWEbVLWZC5fujp97MQiKbHgReAEmBrAXi3RgtuhCrsJMJHzplOR
	Ku7hixdqwPYwIwy6e9qbls3Hmt98F1mSHSNECJhQLnQySbHZ+vTr+asUff0CoD4A9IZLjY3GOrh
	By3+grhgv6NZZeYRiKH6m5CgQAlG8nzT8Le8UizxYRfv0eR06QcF0emtEhxH6PhNjL8MlDU7UkG
	4qIwNoyajW8pl4HGSgrk=
X-Google-Smtp-Source: AGHT+IGyB97tpZtRr1mIll4cIgjFfdaTGfqovpYQCPlZ4U10xlhN4ApxnlrutkE622NzNELla3Ucfw==
X-Received: by 2002:a05:620a:4156:b0:7c5:4de8:bf65 with SMTP id af79cd13be357-7c928018ebamr1409021585a.36.1745103007266;
        Sat, 19 Apr 2025 15:50:07 -0700 (PDT)
Received: from gmail.com (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c925ac22ebsm251456885a.58.2025.04.19.15.50.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Apr 2025 15:50:06 -0700 (PDT)
Date: Sat, 19 Apr 2025 22:50:04 +0000
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: libo.chen.cn@windriver.com
Cc: meta-virtualization@lists.yoctoproject.org, christian.ege@ifm.com
Subject: Re: [meta-virtualization] [kirkstone][PATCH] python3-docker: Fix for
 requests 2.32.0: CVE-2024-35195 backport
Message-ID: <aAQonGJeVRiP_cJk@gmail.com>
References: <20250416125805.1672302-1-libo.chen.cn@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250416125805.1672302-1-libo.chen.cn@windriver.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Sat, 19 Apr 2025 22:50:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9231

merged to kirskstone.

Bruce

In message: [meta-virtualization] [kirkstone][PATCH] python3-docker: Fix for requests 2.32.0: CVE-2024-35195 backport
on 16/04/2025 Chen, Libo (CN) via lists.yoctoproject.org wrote:

> From: Christian Ege <christian.ege@ifm.com>
> 
> After backporting the CVE-2024-35195 in poky, parts of python3-requests
> got updated to 2.32.0 which is incompatible with the current
> docker-compose command.
> 
> This patch will fix the following error message:
> 
> During handling of the above exception, another exception occurred:
> 
> Traceback (most recent call last):
>   File "/usr/bin/docker-compose", line 8, in <module>
>     sys.exit(main())
>   File "/usr/lib/python3.10/site-packages/compose/cli/main.py", line 81, in main
>     command_func()
>   File "/usr/lib/python3.10/site-packages/compose/cli/main.py", line 200, in perform_command
>     project = project_from_options('.', options)
>   File "/usr/lib/python3.10/site-packages/compose/cli/command.py", line 60, in project_from_options
>     return get_project(
>   File "/usr/lib/python3.10/site-packages/compose/cli/command.py", line 152, in get_project
>     client = get_client(
>   File "/usr/lib/python3.10/site-packages/compose/cli/docker_client.py", line 41, in get_client
>     client = docker_client(
>   File "/usr/lib/python3.10/site-packages/compose/cli/docker_client.py", line 170, in docker_client
>     client = APIClient(use_ssh_client=not use_paramiko_ssh, **kwargs)
>   File "/usr/lib/python3.10/site-packages/docker/api/client.py", line 197, in __init__
>     self._version = self._retrieve_server_version()
>   File "/usr/lib/python3.10/site-packages/docker/api/client.py", line 221, in _retrieve_server_version
>     raise DockerException(
> docker.errors.DockerException: Error while fetching server API version: Not supported URL scheme http+docker
> 
> Signed-off-by: Christian Ege <christian.ege@ifm.com>
> 
> Reference: https://github.com/graugans/meta-virtualization/commit/4149812ca9581a313de27c45a0f2dfa7bd8f53df
> 
> Signed-off-by: Libo Chen <libo.chen.cn@windriver.com>
> ---
>  .../0001-hotfix-requests-issue.patch          | 31 +++++++++++++++++++
>  .../python/python3-docker_5.0.0.bb            |  4 +++
>  2 files changed, 35 insertions(+)
>  create mode 100644 recipes-devtools/python/python3-docker/0001-hotfix-requests-issue.patch
> 
> diff --git a/recipes-devtools/python/python3-docker/0001-hotfix-requests-issue.patch b/recipes-devtools/python/python3-docker/0001-hotfix-requests-issue.patch
> new file mode 100644
> index 00000000..70ad8f49
> --- /dev/null
> +++ b/recipes-devtools/python/python3-docker/0001-hotfix-requests-issue.patch
> @@ -0,0 +1,31 @@
> +From 2efec099ad80c18136dc38d9dafd1bb868bf4c90 Mon Sep 17 00:00:00 2001
> +From: Felix Fontein <felix@fontein.de>
> +Date: Mon, 20 May 2024 21:08:25 +0200
> +Subject: [PATCH] Add hotfix for requests 2.32.0. (#861)
> +
> +Upstream-Status: Backport
> +[https://github.com/ansible-collections/community.docker/commit/ab8b6662c28a2c7b0473d43fcf0b26adb2877ede]
> +
> +Signed-off-by: Libo Chen <libo.chen.cn@windriver.com>
> +---
> + docker/transport/basehttpadapter.py | 7 +++++++
> + 1 file changed, 7 insertions(+)
> +
> +diff --git a/docker/transport/basehttpadapter.py b/docker/transport/basehttpadapter.py
> +index 4d819b6..3ffe78b 100644
> +--- a/docker/transport/basehttpadapter.py
> ++++ b/docker/transport/basehttpadapter.py
> +@@ -6,3 +6,10 @@ class BaseHTTPAdapter(requests.adapters.HTTPAdapter):
> +         super(BaseHTTPAdapter, self).close()
> +         if hasattr(self, 'pools'):
> +             self.pools.clear()
> ++
> ++    # Hotfix for requests 2.32.0: its commit
> ++    # https://github.com/psf/requests/commit/c0813a2d910ea6b4f8438b91d315b8d181302356
> ++    # changes requests.adapters.HTTPAdapter to no longer call get_connection() from
> ++    # send(), but instead call _get_connection().
> ++    def _get_connection(self, request, *args, **kwargs):
> ++        return self.get_connection(request.url, kwargs.get('proxies'))
> +-- 
> +2.35.5
> +
> diff --git a/recipes-devtools/python/python3-docker_5.0.0.bb b/recipes-devtools/python/python3-docker_5.0.0.bb
> index 44d65b05..3ad359c3 100644
> --- a/recipes-devtools/python/python3-docker_5.0.0.bb
> +++ b/recipes-devtools/python/python3-docker_5.0.0.bb
> @@ -3,6 +3,10 @@ HOMEPAGE = "https://github.com/docker/docker-py"
>  LICENSE = "Apache-2.0"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=34f3846f940453127309b920eeb89660"
>  
> +SRC_URI:append = " \
> +                file://0001-hotfix-requests-issue.patch \
> +"
> +
>  SRC_URI[md5sum] = "9cc5156a2ff6458a8f52114b9bbc0d7e"
>  SRC_URI[sha256sum] = "3e8bc47534e0ca9331d72c32f2881bb13b93ded0bcdeab3c833fb7cf61c0a9a5"
>  
> -- 
> 2.34.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9229): https://lists.yoctoproject.org/g/meta-virtualization/message/9229
> Mute This Topic: https://lists.yoctoproject.org/mt/112294119/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


