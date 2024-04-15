Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BA68C4345F
	for <webhook@archiver.kernel.org>; Mon, 15 Apr 2024 20:59:44 +0000 (UTC)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
 by mx.groups.io with SMTP id smtpd.web10.4158.1713214778542429918
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 15 Apr 2024 13:59:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=huFuF0o5;
 spf=pass (domain: gmail.com, ip: 209.85.128.173, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-61ae4743d36so8591947b3.2
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 15 Apr 2024 13:59:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713214778; x=1713819578; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1Gca9d2bpxHQe+L8w7QbcMnbrUMzCGhKphyobNHN6ps=;
        b=huFuF0o5AL0YBra5xDCWv0KoRzkXfHqFNMN8IAETyoXW+CSOJzlM3QBgdGT57ivgmz
         iaXnxdIjs1heR/VDKo2C+b/K21OLPj0os/NfOOV9r0XZjf1TD3EyJQwfxmp3s6vo2KUL
         JHmy+9sfAC95Qze9Okca+0UDcLlhvk1Slh7KAc7/sHmSZfM9mbuCGg+5iOHfiOduXO+3
         oMbBSQalo0jcj7fg5IJGp4gz++No23PwwOpc1gs87Ub0nmkZqHUvKkzhJCHGMk2NPyLI
         k680l/KzRLQWDFV7W7J2icQNDogrta8LhDTA2XRO0U8Kax9kPQjAae9+r8s1ccuMU8vv
         BzhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713214778; x=1713819578;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1Gca9d2bpxHQe+L8w7QbcMnbrUMzCGhKphyobNHN6ps=;
        b=IJs1v+nRt6T50sJo9f1OkRiFMfK3eMjnzhlpAUYvtw/515ZxTLDrNZH1fnTXhDEH0e
         EvCmOoDqNB/3LbEhkXl1vW74gmFOAvoF5QItWE0pgIawO9M1lF1dtx7a2DHr8+IaD6/M
         5j5k7Hq0nU5SawJDHW1TMYF0hsuRnaoJ+wgqVrbEh77ZAnM8SWGY4bVdttrlZMiEum8K
         vvOW3y4lr/Pe5SHwcwaB51c4iqO2D3yZtqeyVv9WLKEROr+lpwB9PGU5LyuJLCxU851Z
         OxEd8RmF31OZYederyTOb4TohmzVQ3sFeAJzi1peyibIMEYJyvZf9DBbHtX1DJUxBQNf
         DX2Q==
X-Gm-Message-State: AOJu0YxLw+xo7Cu80JkN5HsjI9HzioTMIsgmtcDi4hToDmuK46EupcrE
	Y6zU6Ai64clD5BaXEMt16hoqaIAt09GZg+vt1XqZAux+fPM/avFoaWR4fg==
X-Google-Smtp-Source: AGHT+IHoNmXJ+qpQK8FZ1+llSGvbpcHy+xjSv7eCA31OwaU7XLY0D6891MARNtkE9I+eXIJiTIHPHw==
X-Received: by 2002:a25:905:0:b0:de0:d497:1ba7 with SMTP id 5-20020a250905000000b00de0d4971ba7mr9538108ybj.39.1713214777578;
        Mon, 15 Apr 2024 13:59:37 -0700 (PDT)
Received: from gmail.com (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id px11-20020a056214050b00b0069b534fb8b0sm5766106qvb.59.2024.04.15.13.59.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Apr 2024 13:59:36 -0700 (PDT)
Date: Mon, 15 Apr 2024 20:59:34 +0000
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: "Yu, Mingli" <mingli.yu@eng.windriver.com>
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization] [meta-cloud-services][PATCH]
 python3-ansible-collections: Add new recipe
Message-ID: <Zh2VNjqd+uWGp42N@gmail.com>
References: <20240411030349.3378190-1-mingli.yu@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240411030349.3378190-1-mingli.yu@windriver.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 15 Apr 2024 20:59:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8679

merged!

Thanks for the contribution.

Bruce

In message: [meta-virtualization] [meta-cloud-services][PATCH] python3-ansible-collections: Add new recipe
on 11/04/2024 Yu, Mingli wrote:

> From: Mingli Yu <mingli.yu@windriver.com>
> 
> Ansible is a radically simple model-driven configuration management,
> multi-node deployment, and remote task execution system. Ansible works
> over SSH and does not require any software or daemons to be installed
> on remote nodes. Extension modules can be written in any language and
> are transferred to managed machines automatically.
> 
> This recipe provides a curated set of Ansible collections included in
> addition to ansible-core which provided by python3-ansible.
> 
> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> ---
>  .../python3-ansible-collections_9.4.0.bb      | 22 +++++++++++++++++++
>  1 file changed, 22 insertions(+)
>  create mode 100644 recipes-devtools/python/python3-ansible-collections_9.4.0.bb
> 
> diff --git a/recipes-devtools/python/python3-ansible-collections_9.4.0.bb b/recipes-devtools/python/python3-ansible-collections_9.4.0.bb
> new file mode 100644
> index 00000000..94f1af05
> --- /dev/null
> +++ b/recipes-devtools/python/python3-ansible-collections_9.4.0.bb
> @@ -0,0 +1,22 @@
> +SUMMARY = "Curated set of Ansible collections included in addition to ansible-core"
> +DESCRIPTION = "Ansible is a radically simple model-driven configuration management, \
> +multi-node deployment, and remote task execution system. Ansible works \
> +over SSH and does not require any software or daemons to be installed \
> +on remote nodes. Extension modules can be written in any language and \
> +are transferred to managed machines automatically. \
> +This package provides a curated set of Ansible collections included in addition \
> +to ansible-core."
> +HOMEPAGE = "https://pypi.org/project/ansible/"
> +LICENSE = "GPL-3.0-or-later"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=8f0e2cd40e05189ec81232da84bd6e1a"
> +
> +PYPI_PACKAGE = "ansible"
> +
> +inherit pypi setuptools3
> +
> +SRC_URI[sha256sum] = "dd431c63380e18c3faca3288ebde8ce2f4f992363ab558a3c11c8f2032d90867"
> +
> +RDEPENDS:${PN} = " \
> +    bash \
> +    python3-ansible \
> +"
> -- 
> 2.25.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8673): https://lists.yoctoproject.org/g/meta-virtualization/message/8673
> Mute This Topic: https://lists.yoctoproject.org/mt/105456110/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


