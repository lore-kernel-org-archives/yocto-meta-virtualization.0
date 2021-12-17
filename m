Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CC18C433F5
	for <webhook@archiver.kernel.org>; Fri, 17 Dec 2021 02:44:25 +0000 (UTC)
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com
 [209.85.222.181])
 by mx.groups.io with SMTP id smtpd.web08.1548.1639709064243170414
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 16 Dec 2021 18:44:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Hke371jR;
 spf=pass (domain: gmail.com, ip: 209.85.222.181,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f181.google.com with SMTP id d21so871248qkl.3
        for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 16 Dec 2021 18:44:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=3fv2Btb97nGoXlJ6/DSK2yehECy6KLllHVWQi2wLfyc=;
        b=Hke371jRGWFdYwDieVJvm95nlqeM8TJlBd3KHRlEKlOgFGxwxtiaCunHwQJhssNAGT
         jDHowPUJf4Rpg/fyLw2uVztXjfpYjfaTFFxbel8ryCjh9X2zq0b1mYBMYdJbciuhg7nn
         XuCGUviuX8wpX9aiIXXhCkGU+CjbFpLuI1H009fIT7ePA3YO1cw1nAK1ixMzxPbpZR/L
         Funj3U3QdLmMn4Z+oulvqCnGXOsisNpbfR4NZB6EYEpB+o0g3+w6HsCMhEOiYpMUXE03
         H7wEdJ0yxihDdQn2aBfIkaRZSzBhmzoj5l2T3ON21giG6SOWHwrOXDV5Aaonl5E4s3Rz
         vBJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=3fv2Btb97nGoXlJ6/DSK2yehECy6KLllHVWQi2wLfyc=;
        b=Hbb9AtCU4/kDSVu4XwT9Em4qAI5YvcaQQATNrqNNli5WJus3mF7033n6pMMRixXUYh
         6gToghPcSnPOMJ4Z9lJh3v4ylnlcBNa4wITXSKBbbWVsLI0ch0RJOAqOB4I10Ki5FEFF
         Omzqv0yLuhKhi+07mtIdUIGJ7V1m7GyktkxFMu2BFjizM0T8Afxy7G1USUlXJsrDMefU
         G2mVNQK7wFk2WVO8uNViwMo+jADhd7pajsZEpge0jZUE7e4f3e4bchklR5xE7VL31N0x
         j2FlkOCcEffvRa9FRzxxaxsR9a4lVISS769wUDHhTUKfGZSIdQ9J+ef8qUrpHi0qJluK
         QDvw==
X-Gm-Message-State: AOAM5334Ke6tINjDm+41rIV4unWBcMJ/6GwhofzEn81UKdEbRHd5CyEG
	p3wU7DeH37WAznJazAFc77q2tjClaUvPRQ==
X-Google-Smtp-Source: 
 ABdhPJx0IhOcxxopF7nEExxy7yaxsRBRiVvPdwnJ9/fEZPak2g+weSPWiNAtQvN7u97UHf9FphrpgQ==
X-Received: by 2002:a37:a96:: with SMTP id 144mr619446qkk.358.1639709063249;
        Thu, 16 Dec 2021 18:44:23 -0800 (PST)
Received: from gmail.com
 (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.63.222])
        by smtp.gmail.com with ESMTPSA id
 j21sm3916309qkk.27.2021.12.16.18.44.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Dec 2021 18:44:22 -0800 (PST)
Date: Thu, 16 Dec 2021 21:44:21 -0500
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Kristian Klausen <kristian@klausen.dk>
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][honister][PATCH] cri-o: switch from master
 -> main
Message-ID: <20211217024418.GA29189@gmail.com>
References: <20211216120300.198575-1-kristian@klausen.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211216120300.198575-1-kristian@klausen.dk>
User-Agent: Mutt/1.10.1 (2018-07-13)
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 17 Dec 2021 02:44:25 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/6980

Cherry-picked to honister.

Bruce

In message: [meta-virtualization][honister][PATCH] cri-o: switch from master -> main
on 16/12/2021 Kristian Klausen wrote:

> From: Bruce Ashfield <bruce.ashfield@gmail.com>
> 
> cri-o has joined the projects switching their default branch to
> main (and removing the old one).
> 
> We update our recipe to avoid fetcher errors.
> 
> Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> ---
>  recipes-containers/cri-o/cri-o_git.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/recipes-containers/cri-o/cri-o_git.bb b/recipes-containers/cri-o/cri-o_git.bb
> index 41b8625..b93c3de 100644
> --- a/recipes-containers/cri-o/cri-o_git.bb
> +++ b/recipes-containers/cri-o/cri-o_git.bb
> @@ -16,7 +16,7 @@ At a high level, we expect the scope of cri-o to be restricted to the following
>  
>  SRCREV_cri-o = "1d447191ee73ead59f344f354edac5d64f377e15"
>  SRC_URI = "\
> -	git://github.com/kubernetes-sigs/cri-o.git;branch=master;name=cri-o;protocol=https \
> +	git://github.com/kubernetes-sigs/cri-o.git;branch=main;name=cri-o;protocol=https \
>  	file://0001-Makefile-force-symlinks.patch \
>          file://crio.conf \
>  	"
> -- 
> 2.34.1
> 

