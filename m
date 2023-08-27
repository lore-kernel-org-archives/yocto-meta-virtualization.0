Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6161AC83F01
	for <webhook@archiver.kernel.org>; Sun, 27 Aug 2023 13:35:53 +0000 (UTC)
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
 by mx.groups.io with SMTP id smtpd.web11.27150.1693143351629197951
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 27 Aug 2023 06:35:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=qKTE7bFB;
 spf=pass (domain: gmail.com, ip: 209.85.222.174, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-76da239ba16so162303385a.3
        for <meta-virtualization@lists.yoctoproject.org>; Sun, 27 Aug 2023 06:35:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693143350; x=1693748150;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QUmJlKpWnA0AwjqtC2wfoUiUbajcJviCg397oGDBdCo=;
        b=qKTE7bFB876HvetGBuNrtWQHEAHvTEPIP1sYY0+A1HpfKltQ8Z8lu3LR5pVjMzM7dP
         ldkfXKMvfE5OMnLS9z3rf70Y395CLDa6kJo/8sxD2348spL2iJdwnT0ZmVRStt0Xn6o8
         fxrA9Ipo0eWcSwZR+fh2ll/JPgoAYmfySuWUQpvHlJeV6RcT1FG+mhEhUvDEYd9v27lN
         xDjvZSVLeklnFRF7H/P7ui+QqSGfaUZQ5imFFiK9+Mo7r7TpLsg8IkJgKECSPZvVsbK7
         POHRrJHkOToBg8gNyrmyN1CvbVm4tDpOZHb6H0UIQ3VfHS50Tqwd2k3jJwA6zqVAUkcM
         4FeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693143350; x=1693748150;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QUmJlKpWnA0AwjqtC2wfoUiUbajcJviCg397oGDBdCo=;
        b=cz4MvvmFjn8Pbfi6P/qRNnBn0Kb/yHu323oXy52sG9ge/QqnHJHqrdOu8W2Rtpdqzk
         aBVcZsLbgN74I5l1Ut1iLRwNHsvphLVYLIKzKPMpLu29X2QlxGFh7CtIjb3kGX0/hWrR
         7zCWNznE3GTvj4PaRoM4dYke8A3b2mltxhDrFvh5uQWM22MaPVHh8LDGJh2Vq/3QYvBs
         VezPnV+fFWKL3OLxdybsEN2cJ3HrdJfLAHvKPA9YGsjybpJNkE3CcPht+Glf3inTULRx
         S259SkX9lx1aaWdFnT8tAVU+LfkMLpH5DulBK5vrFgT2RE8v9k4BnWxbWw7b/GaxJJbP
         XzMA==
X-Gm-Message-State: AOJu0YzhRs6dPhH9R9v2+ROQjXvNkLrrXArRh7ZrsAqCV+uMVkIirgLR
	x0yBQ+Zyu6tAwgH+xA8CfWo=
X-Google-Smtp-Source: AGHT+IEV6KGy5DMRlbXiO9npUqcVliAVEYkJ01vzfFALnbHOc0oPFFM2Gd6GjZVILedstLj03MeKcw==
X-Received: by 2002:a05:620a:240c:b0:767:2736:ecd4 with SMTP id d12-20020a05620a240c00b007672736ecd4mr29667711qkn.47.1693143350641;
        Sun, 27 Aug 2023 06:35:50 -0700 (PDT)
Received: from gmail.com ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id 19-20020a05620a071300b00767d47eb29bsm1728003qkc.119.2023.08.27.06.35.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Aug 2023 06:35:46 -0700 (PDT)
Date: Sun, 27 Aug 2023 13:35:44 +0000
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Anne Macedo <retpolanne@posteo.net>
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][m-c-s][PATCH] consul: fixes consul git urls
Message-ID: <ZOtRMH53kY+meSxh@gmail.com>
References: <20230826172823.15707-1-retpolanne@posteo.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230826172823.15707-1-retpolanne@posteo.net>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Sun, 27 Aug 2023 13:35:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8242

In message: [meta-virtualization][m-c-s][PATCH] consul: fixes consul git urls
on 26/08/2023 Anne Macedo wrote:

> Fixes error:
> 
> URL: git://github.com/hashicorp/consul-migrate.git;branch=master uses
> git protocol which is no longer supported by github.
> Please change to ;protocol=https in the url.
> 
> when running bitbake with the meta-cloud-services layer.
> 
> Signed-off-by: Anne Macedo <retpolanne@posteo.net>
> ---
>  .../consul/consul-migrate_git.bb                 | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/recipes-connectivity/consul/consul-migrate_git.bb b/recipes-connectivity/consul/consul-migrate_git.bb
> index 7d784c2a..1393c912 100644
> --- a/recipes-connectivity/consul/consul-migrate_git.bb
> +++ b/recipes-connectivity/consul/consul-migrate_git.bb
> @@ -4,7 +4,7 @@ LICENSE = "BSD & MPL-2.0 & MIT"
>  LIC_FILES_CHKSUM = "file://src/github.com/hashicorp/consul-migrate/LICENSE;md5=b278a92d2c1509760384428817710378"
>  
>  GO_IMPORT = "github.com/hashicorp/consul-migrate"
> -SRC_URI = "git://${GO_IMPORT}.git;branch=master"
> +SRC_URI = "https://${GO_IMPORT}.git;branch=master"
>  SRCREV = "678fb10cdeae25ab309e99e655148f0bf65f9710"
>  
>  S = "${WORKDIR}/git"
> @@ -18,13 +18,13 @@ SRCREV_bolt = "c6ba97b89e0454fec9aa92e1d33a4e2c5fc1f631"
>  SRCREV_go-msgpack = "fa3f63826f7c23912c15263591e65d54d080b458"
>  
>  SRC_URI += " \
> -   git://github.com/hashicorp/raft;name=raft;destsuffix=git/src/github.com/hashicorp/raft;branch=master;protocol=https \
> -   git://github.com/armon/go-metrics;name=go-metrics;destsuffix=git/src/github.com/armon/go-metrics;branch=master;protocol=https \
> -   git://github.com/hashicorp/raft-boltdb;name=raft-boltdb;destsuffix=git/src/github.com/hashicorp/raft-boltdb;branch=master;protocol=https \
> -   git://github.com/hashicorp/raft-mdb;name=raft-mdb;destsuffix=git/src/github.com/hashicorp/raft-mdb;branch=master;protocol=https \
> -   git://github.com/armon/gomdb;name=gomdb;destsuffix=git/src/github.com/armon/gomdb;branch=master;protocol=https \
> -   git://github.com/boltdb/bolt;name=bolt;destsuffix=git/src/github.com/boltdb/bolt;branch=master;protocol=https \
> -   git://github.com/hashicorp/go-msgpack;name=go-msgpack;destsuffix=git/src/github.com/hashicorp/go-msgpack;branch=master;protocol=https \
> +   https://github.com/hashicorp/raft;name=raft;destsuffix=git/src/github.com/hashicorp/raft;branch=master;protocol=https \
> +   https://github.com/armon/go-metrics;name=go-metrics;destsuffix=git/src/github.com/armon/go-metrics;branch=master;protocol=https \
> +   https://github.com/hashicorp/raft-boltdb;name=raft-boltdb;destsuffix=git/src/github.com/hashicorp/raft-boltdb;branch=master;protocol=https \
> +   https://github.com/hashicorp/raft-mdb;name=raft-mdb;destsuffix=git/src/github.com/hashicorp/raft-mdb;branch=master;protocol=https \
> +   https://github.com/armon/gomdb;name=gomdb;destsuffix=git/src/github.com/armon/gomdb;branch=master;protocol=https \
> +   https://github.com/boltdb/bolt;name=bolt;destsuffix=git/src/github.com/boltdb/bolt;branch=master;protocol=https \
> +   https://github.com/hashicorp/go-msgpack;name=go-msgpack;destsuffix=git/src/github.com/hashicorp/go-msgpack;branch=master;protocol=https \
>  "
>  
>  inherit go
> -- 
> 2.41.0
> 

