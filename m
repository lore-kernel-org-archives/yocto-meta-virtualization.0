Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC8FBC36002
	for <webhook@archiver.kernel.org>; Wed,  9 Apr 2025 20:55:45 +0000 (UTC)
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
 by mx.groups.io with SMTP id smtpd.web11.19573.1744232140130620478
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 09 Apr 2025 13:55:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VQ6TD9R5;
 spf=pass (domain: gmail.com, ip: 209.85.222.176, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-7c5e39d1e0eso11913685a.1
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 09 Apr 2025 13:55:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744232139; x=1744836939; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oavGbDXeLDdO1AQ2SXGXrOYbHzt4jHPf1lxncdBIIno=;
        b=VQ6TD9R5IGWkrnWSwnkQJY7hPznylbNjlNIi3VxY8s0tq5Q/qEDvaUBPVBAmITZcNR
         UkQ2WMMjQMw1hU3AkHkg0VSl/vYiGn4NDTOhq3D45TTNWVW7dd01gdH6Wmi9hne5Ih+y
         YpoWFnGY4mprGSxePQ9N0QfBjevEbNcT4imD4xIlkJ1Il6g1TQ42fZYBBlqWPyMZe2Q8
         yDwcuH6zW7smBqgcoh6IxwPbzi4zQI42WqMN+jtinVbXp8Hp6stOWuq2XTcC+/rApbBp
         SuBPx+wJuOVX4TPhc5tBv0PPx+3tt0EfgmWN+Ag6cF7VbqaE5P3aiQCZL1mshmPIn3fq
         gO0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744232139; x=1744836939;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oavGbDXeLDdO1AQ2SXGXrOYbHzt4jHPf1lxncdBIIno=;
        b=AEuhZyA2KPNaz35fbTF2d3r817hNS6tq9SPGgaqJnlI+RpguP7hh4VupY8E8mkU5o2
         9Uwr7e/AkGL6928eduQlbmkLtQzvtncMyjRPbsUWM0b3pJWmBbRFIX8l5ji2XAI7WdUh
         SdU6toV9fitUn+tT4vSGOGAnnUtCsKjCfjIwr0Z25OvBWHv9Qkm5hzYgevjIrv8NuTeR
         AybK2XoHXK9GiXiJ4Xirt9jIyWD4cWZvW17qWsx+GQj4DT0gtDGi5mGgM/9qGWvGye4r
         xfOMpffxyfP/4mvL7jP7pwbnGvpjpE9Nhp0Zd6SblOslB7XqvFJis1fgyWP/QHnOcr61
         eMZA==
X-Gm-Message-State: AOJu0YxtoYRPw0jD6mhPBhbfedkifQ0WqLnyFPVrNKhMw7xfu/SkS1lK
	85tnQPulOsK80Gp35fD4Knl/8M6f7OjSdHXyup8zbHOlsCPa4kRBV2gcMyO26so=
X-Gm-Gg: ASbGnctJIL/5WPJm4gLJsWiDBUB5/MhKF8nibzlrL8aLDdDlvHLcn4otJSNYo2A7PJA
	M+Ti979buN9lQiP3617LmlLaSGr5EozdGqEOf6NHkebMLNjddVLeYlyf3CAiWCX1XBekQGoQjKH
	MBgoZxalJjrv6KDumfMQjeM9stW5ypPdy5pHLlLqO5CoIzoqTEVJJuvgKK0l/oUufOFqjq6djIn
	Xz/rZAj6fypOvEO1JAL2rIg2TEPLhaV/i6VymOq5ge5wyI1yaPlKOAbkwivRoZhAEzMLNovFt7k
	21g/QS27+c3MYW/TZmzS3IkmAwrf92njP/KHGa9Bq75AZqvJ14exqA3/DFTeD8qVpy3RMp4zvoT
	KLdiu+tCZm+dnFBw54ks=
X-Google-Smtp-Source: AGHT+IEW4c35cPMdxeqpDOhfBJtoZx9k+QdnoazSLk5TF3ycJeKHJsMU0B9M6uqNvoRfTA8gC0ztgg==
X-Received: by 2002:a05:620a:4512:b0:7c5:7a1f:4d89 with SMTP id af79cd13be357-7c7a76d3545mr43168385a.54.1744232139033;
        Wed, 09 Apr 2025 13:55:39 -0700 (PDT)
Received: from gmail.com (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c7a10a38a3sm117589085a.13.2025.04.09.13.55.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 13:55:38 -0700 (PDT)
Date: Wed, 9 Apr 2025 20:55:36 +0000
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: soumya.sambu@windriver.com
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re:
 [meta-virtualization][meta-cloud-services][master][scarthgap][PATCH 1/1]
 python3-ansible: Upgrade 2.17.6 -> 2.17.7
Message-ID: <Z_beyFsvvNWuKFGE@gmail.com>
References: <20250408105654.1933617-1-soumya.sambu@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250408105654.1933617-1-soumya.sambu@windriver.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 09 Apr 2025 20:55:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9215

merged.

Bruce

In message: [meta-virtualization][meta-cloud-services][master][scarthgap][PATCH 1/1] python3-ansible: Upgrade 2.17.6 -> 2.17.7
on 08/04/2025 Soumya via lists.yoctoproject.org wrote:

> From: Soumya Sambu <soumya.sambu@windriver.com>
> 
> Fixes CVE-2024-11079 and other bugs
> 
> Changelog:
> ==========
> https://github.com/ansible/ansible/blob/v2.17.7/changelogs/CHANGELOG-v2.17.rst#v2-17-7
> 
> Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
> ---
>  recipes-devtools/python/python-ansible.inc                      | 2 +-
>  .../{python3-ansible_2.17.6.bb => python3-ansible_2.17.7.bb}    | 0
>  2 files changed, 1 insertion(+), 1 deletion(-)
>  rename recipes-devtools/python/{python3-ansible_2.17.6.bb => python3-ansible_2.17.7.bb} (100%)
> 
> diff --git a/recipes-devtools/python/python-ansible.inc b/recipes-devtools/python/python-ansible.inc
> index a528f246..4bb90cb7 100644
> --- a/recipes-devtools/python/python-ansible.inc
> +++ b/recipes-devtools/python/python-ansible.inc
> @@ -8,7 +8,7 @@ SRCNAME = "ansible"
>  
>  SRC_URI = "git://github.com/ansible/ansible.git;protocol=https;branch=stable-2.17"
>  
> -SRCREV = "05e01efa8534d19956133e19e9e84aad720abb0d"
> +SRCREV = "dc0e3bd16cc7ded081bc46c88e4e3d1997ca9bb0"
>  
>  S = "${WORKDIR}/git"
>  
> diff --git a/recipes-devtools/python/python3-ansible_2.17.6.bb b/recipes-devtools/python/python3-ansible_2.17.7.bb
> similarity index 100%
> rename from recipes-devtools/python/python3-ansible_2.17.6.bb
> rename to recipes-devtools/python/python3-ansible_2.17.7.bb
> -- 
> 2.40.0
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9207): https://lists.yoctoproject.org/g/meta-virtualization/message/9207
> Mute This Topic: https://lists.yoctoproject.org/mt/112150573/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


