Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62C2DC83F11
	for <webhook@archiver.kernel.org>; Sun, 27 Aug 2023 13:37:33 +0000 (UTC)
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
 by mx.groups.io with SMTP id smtpd.web10.27186.1693143448133754040
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 27 Aug 2023 06:37:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=KdnLIkW+;
 spf=pass (domain: gmail.com, ip: 209.85.160.179, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-403e7472b28so16609721cf.2
        for <meta-virtualization@lists.yoctoproject.org>; Sun, 27 Aug 2023 06:37:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693143447; x=1693748247;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tbvTfp/b59zijLw4mJQMyQJGw92G5LOBvjbgnBLSUC0=;
        b=KdnLIkW+WfAgG1PvlAX0g8UmI4DfHtFmIWrXr+ZSocGfs4TZJhbUfi61yAgMB38Nb5
         V7F3K8X76eNdoviLDoYs0lmkKIv9eRXwELMZUEUsnYw+9q3Ebv5LWkepcnNslazjASZE
         RRW/+hPPzHPmBkL6++tv9kGPQeCBgRuN44jC2dnsBsQONSU23dw4a50o89GKBzCbtRk+
         tW3aHgjoWEOUl9x11dCZkRH2h8e58DK1xM70emFlTvKM4QXZ68XQQA3uACkBDJAj6GBa
         HCYCh2c+ov++DLsRQJjJhKa5kUsuZ81UL5sO5wV9Cpjq8nkYC2UgiqMKG7JQpHYNAmVB
         hZPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693143447; x=1693748247;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tbvTfp/b59zijLw4mJQMyQJGw92G5LOBvjbgnBLSUC0=;
        b=PRJTks8oR4ru0fevSBUBqW03dFl3xxAMRy38NTafmO08DQnmDdkBCQGVVunuF3q1/p
         XelKmCsU5acQffJucd59BGsX1VtaXjtUtEBf7vrNZ07i6vV4Y1KwzGEgG+APT1KoxUMr
         oT0unbkcnGEIpKCnzH4HBvXdy77+OI+RHXdnmq3Hk05V5JZahaVq0OeP+OTWVBYBj67F
         QKsPEtxPGyyDX1BfP5qHI/Ti66p3qvc3ehdGv/bTmv+w7TOlZqY6jNg9UB4UpCmmqdWp
         BuJT4jvm09tJbYln+DUXXiW5O0W6tZfZt5CmVn5EFxzqzCUeWsnkQwzsgy23s1yn6C2w
         EPAA==
X-Gm-Message-State: AOJu0YxNo/UfwsZDOF2VIYXhswHWhxOe/r4aOeyQrTXS52W14PEmgOVA
	iDMjXbiyr5Mwe1FcdEc9tlE=
X-Google-Smtp-Source: AGHT+IG/4iw6L7w4frlJZaoje2eQUslma3DFXb9kg2AQ0c88AQ1VSxGkPMNEvbgoU6uEbLRCqyKOSg==
X-Received: by 2002:a05:620a:46a3:b0:76c:caa5:4c1d with SMTP id bq35-20020a05620a46a300b0076ccaa54c1dmr30656551qkb.26.1693143447078;
        Sun, 27 Aug 2023 06:37:27 -0700 (PDT)
Received: from gmail.com ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id i20-20020a05620a145400b00767dc4c539bsm1752573qkl.44.2023.08.27.06.37.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Aug 2023 06:37:24 -0700 (PDT)
Date: Sun, 27 Aug 2023 13:37:21 +0000
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Anne Macedo <retpolanne@posteo.net>
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][m-c-s][PATCH] consul: fixes consul git urls
Message-ID: <ZOtRkcWtCqwmX3X7@gmail.com>
References: <20230826172823.15707-1-retpolanne@posteo.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230826172823.15707-1-retpolanne@posteo.net>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Sun, 27 Aug 2023 13:37:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8243

Thanks for the fixup!

I'll be going through the entire layer shortly and doing uprevs, etc,
and this saves me some effort.

Bruce

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

