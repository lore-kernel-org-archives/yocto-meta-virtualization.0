Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D460C7619A
	for <webhook@archiver.kernel.org>; Wed, 12 Apr 2023 17:11:09 +0000 (UTC)
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
 by mx.groups.io with SMTP id smtpd.web11.49586.1681319464690161842
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 12 Apr 2023 10:11:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=IR9oQg9c;
 spf=pass (domain: gmail.com, ip: 209.85.160.170, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f170.google.com with SMTP id gb12so10485580qtb.6
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 12 Apr 2023 10:11:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681319464; x=1683911464;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=laemn4yl1hjfE4HNH8vmglLZNBTc1YzoztjUOhr7hxM=;
        b=IR9oQg9c7B9yyb1YXr1wU1/ORjyY+cC59yCgJyah//A0vCQ2ZTAZAcyXcmpaXEptEw
         +57IyHVZzDHO2Dhoynx7bql+eWvlp2nEjQLe14/Rh3tqbd7eQDYzNq+IUZqPnzgBpJEO
         2m0nZZ99LHghrUO4+EUeFbw4vkPcjKEiuQAoF6w4Mrl5d8n0ZbCU8cur8IZkggaYJ3IP
         TQ8NjF4kgShn/AKqQxnGAwjqltDkKqQT8T889ITTLwXkEziakJMOG+w5eOxJ+Kq8aOfM
         Uh9qPeldkeBO+gsnyfEipMUA9PcawZLarT29G2au+zcg3XKZ4k1zVA1FofHy/RfzfHDa
         r1dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681319464; x=1683911464;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=laemn4yl1hjfE4HNH8vmglLZNBTc1YzoztjUOhr7hxM=;
        b=LVVQWsGfW8tDexJjKyHLFfEmNIaXgca2QOCfmk5NzVl5Uugk+HzISmrxzYLL7w5RVP
         hPBPmoDVcLsoV2CwFGPFAA5qhC85zsz9rdPQmSOvaglw3ZmvCS4dcqS27jcaWVcaq6Gk
         KDINc4KEKn7fXF5kczBtRQlQ7F14XIN4QjSiS6IO/Waff7qemc8V2OazqT3+i6rlw7um
         Bm0fKeha4ZqBsUFiuzumDPOcR/AjFU1/1WKjBTOtt7jyLuwlnXIKmFg7g3P+8ZsG9IiF
         jDUy+t7GgKtqdOGlCrG8IQa4dRHl1kQ8p/zX3w68fh/oXxvZ1Pww9hW2jXdaf5iWeAL9
         1Rlg==
X-Gm-Message-State: AAQBX9cGztl+BBwGd8/d9mW0C9vJGmI3YPgVJLFucnypjuC3tnVh01xX
	1f+lH51PWUHzqdeEv/nBk2S04QEjOpSOng==
X-Google-Smtp-Source: AKy350bWeNO742KuY3nSyQmT/g8erYVIcYU1OTl13sVAhtWQzTBNFU26oNZMidHv7ISA2WF5bPib/g==
X-Received: by 2002:a05:622a:190a:b0:3b9:c889:ec24 with SMTP id w10-20020a05622a190a00b003b9c889ec24mr10021363qtc.12.1681319463738;
        Wed, 12 Apr 2023 10:11:03 -0700 (PDT)
Received: from gmail.com ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id h7-20020ac846c7000000b003e3921077d9sm4346085qto.38.2023.04.12.10.11.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Apr 2023 10:11:03 -0700 (PDT)
Date: Wed, 12 Apr 2023 13:11:01 -0400
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Alexander Kanavin <alex@linutronix.de>
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][PATCH] xen-tools: add a patch to address
 failures on 32 bit systems with 64 bit time_t
Message-ID: <ZDbmJc9ZJCO5HKpD@gmail.com>
References: <20230412091543.1002187-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230412091543.1002187-1-alex@linutronix.de>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 12 Apr 2023 17:11:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7989

staged on master-next.

Bruce

In message: [meta-virtualization][PATCH] xen-tools: add a patch to address failures on 32 bit systems with 64 bit time_t
on 12/04/2023 Alexander Kanavin wrote:

> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
>  ...enstored_control.c-correctly-print-t.patch | 34 +++++++++++++++++++
>  recipes-extended/xen/xen-tools_4.16.bb        |  3 +-
>  recipes-extended/xen/xen-tools_4.17.bb        |  1 +
>  recipes-extended/xen/xen-tools_git.bb         |  1 +
>  4 files changed, 38 insertions(+), 1 deletion(-)
>  create mode 100644 recipes-extended/xen/files/0001-tools-xenstore-xenstored_control.c-correctly-print-t.patch
> 
> diff --git a/recipes-extended/xen/files/0001-tools-xenstore-xenstored_control.c-correctly-print-t.patch b/recipes-extended/xen/files/0001-tools-xenstore-xenstored_control.c-correctly-print-t.patch
> new file mode 100644
> index 0000000..bf99f5e
> --- /dev/null
> +++ b/recipes-extended/xen/files/0001-tools-xenstore-xenstored_control.c-correctly-print-t.patch
> @@ -0,0 +1,34 @@
> +From c7c43c4531fe1cd188f62d9905c3f5c7a29a6fb0 Mon Sep 17 00:00:00 2001
> +From: Alexander Kanavin <alex@linutronix.de>
> +Date: Wed, 12 Apr 2023 10:30:18 +0200
> +Subject: [PATCH] tools/xenstore/xenstored_control.c: correctly print time_t
> +
> +On 32 bit systems with 64 bit time_t (hello, Y2038 problem),
> +the following error occurs otherwise:
> +
> +| xenstored_control.c: In function 'lu_reject_reason':
> +| xenstored_control.c:646:70: error: format '%ld' expects argument of type 'long int', but argument 5 has type 'time_t' {aka 'long long int'} [-Werror=format=]
> +
> +Upstream-Status: Submitted [by email to xen-devel@lists.xenproject.org and maintainers as suggested by add_maintainers.pl script]
> +Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> +---
> + tools/xenstore/xenstored_control.c | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/tools/xenstore/xenstored_control.c b/tools/xenstore/xenstored_control.c
> +index d1aaa00bf4..8d318c0399 100644
> +--- a/tools/xenstore/xenstored_control.c
> ++++ b/tools/xenstore/xenstored_control.c
> +@@ -643,10 +643,10 @@ static const char *lu_reject_reason(const void *ctx)
> + 	list_for_each_entry(conn, &connections, list) {
> + 		if (conn->ta_start_time &&
> + 		    (now - conn->ta_start_time >= lu_status->timeout)) {
> +-			ret = talloc_asprintf(ctx, "%s\nDomain %u: %ld s",
> ++			ret = talloc_asprintf(ctx, "%s\nDomain %u: %jd s",
> + 					      ret ? : "Domains with long running transactions:",
> + 					      conn->id,
> +-					      now - conn->ta_start_time);
> ++					      (intmax_t)now - conn->ta_start_time);
> + 		}
> + 	}
> + 
> diff --git a/recipes-extended/xen/xen-tools_4.16.bb b/recipes-extended/xen/xen-tools_4.16.bb
> index 386e7dc..2861788 100644
> --- a/recipes-extended/xen/xen-tools_4.16.bb
> +++ b/recipes-extended/xen/xen-tools_4.16.bb
> @@ -7,6 +7,7 @@ XEN_BRANCH ?= "stable-${XEN_REL}"
>  SRC_URI = " \
>      git://xenbits.xen.org/xen.git;branch=${XEN_BRANCH} \
>      file://0001-python-pygrub-pass-DISTUTILS-xen-4.15.patch \
> +    file://0001-tools-xenstore-xenstored_control.c-correctly-print-t.patch \
>      "
>  
>  LIC_FILES_CHKSUM ?= "file://COPYING;md5=419739e325a50f3d7b4501338e44a4e5"
> @@ -20,4 +21,4 @@ require xen-tools.inc
>  
>  SYSTEMD_SERVICE:${PN}-xencommons:append = " \
>      var-lib-xenstored.mount \
> -    "
> \ No newline at end of file
> +    "
> diff --git a/recipes-extended/xen/xen-tools_4.17.bb b/recipes-extended/xen/xen-tools_4.17.bb
> index 0f323cb..d0ab2db 100644
> --- a/recipes-extended/xen/xen-tools_4.17.bb
> +++ b/recipes-extended/xen/xen-tools_4.17.bb
> @@ -7,6 +7,7 @@ XEN_BRANCH ?= "stable-${XEN_REL}"
>  SRC_URI = " \
>      git://xenbits.xen.org/xen.git;branch=${XEN_BRANCH} \
>      file://0001-python-pygrub-pass-DISTUTILS-xen-4.15.patch \
> +    file://0001-tools-xenstore-xenstored_control.c-correctly-print-t.patch \
>      "
>  
>  LIC_FILES_CHKSUM ?= "file://COPYING;md5=d1a1e216f80b6d8da95fec897d0dbec9"
> diff --git a/recipes-extended/xen/xen-tools_git.bb b/recipes-extended/xen/xen-tools_git.bb
> index fd42cf2..7557081 100644
> --- a/recipes-extended/xen/xen-tools_git.bb
> +++ b/recipes-extended/xen/xen-tools_git.bb
> @@ -7,6 +7,7 @@ XEN_BRANCH ?= "master"
>  SRC_URI = " \
>      git://xenbits.xen.org/xen.git;branch=${XEN_BRANCH} \
>      file://0001-python-pygrub-pass-DISTUTILS-xen-4.15.patch \
> +    file://0001-tools-xenstore-xenstored_control.c-correctly-print-t.patch \
>      "
>  
>  LIC_FILES_CHKSUM ?= "file://COPYING;md5=d1a1e216f80b6d8da95fec897d0dbec9"
> -- 
> 2.30.2
> 

