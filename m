Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D75AC433FE
	for <webhook@archiver.kernel.org>; Wed, 26 Oct 2022 14:10:44 +0000 (UTC)
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
 by mx.groups.io with SMTP id smtpd.web11.8063.1666793434525015857
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 26 Oct 2022 07:10:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ckq5syRe;
 spf=pass (domain: gmail.com, ip: 209.85.222.178, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f178.google.com with SMTP id t25so10584026qkm.2
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 26 Oct 2022 07:10:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ACISre+inFY68JXJzvEMCiExWgNTfI5WBY70YsAzDMw=;
        b=ckq5syReXSA1tRoAJhAXJDT4dDKrRxEcN52h2ic/8sea6HPv1EYLlJM+Aw9GnYAeXZ
         F4tKBVar91m/kUe5Lg7Eif11SlSHZgj4K/zhhv+dWSD050ai6+iDgmkBQzrEJIPrDk2/
         hWDhJNJe3C+1/y3cD+E3G518rBdM8TUQJeb3oE7jZ/GcRZpW5X1HOzJk0qPmtwBBQdMZ
         vXtl5F0NejOR2sKlxyHtGvl495v+3hEbjTP1HK5VVhxuKEvoXSsFI4NcIVyq+xp03LKd
         7pw/Z1HykliaNbNrOVC9TWqlnVj1ZWb6HnU32J4uhrZeUMhzmggfhnQfpc2ndk9xWI7m
         sACw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ACISre+inFY68JXJzvEMCiExWgNTfI5WBY70YsAzDMw=;
        b=VIIJBdR+ub1X93vX6IDzrI2VVXANwSJpvDtE08gTydTwyvScV6fBvFS5mBO48J8cv7
         nTNkyz0iCdihchFEr1iwN51u7S0pDuzSYa+RUiMqx1uKFAqe+FIFOombdFKV+waCqBhz
         Pnbccnq32F3NYMZp3zbMg/25O27DXNsVpNktZ2kWGZSQCLJiGMjlwech6tNozPaO9Rj1
         bAUpwBfK59Ra701OzSjAS1oQ0arX3Xc6MPDPv5XkeS9l2ZnvC/nrPy4iki+nYuP539lR
         xJP0AxKOKaVFy3T6mKf81YPyWp77kVnR+w4eIWHVBQwKkzviJJwMA4XqcpoFFvhevSlI
         NQ+g==
X-Gm-Message-State: ACrzQf3ZnaHfMSs/mCsDmHMA9DfX38Y+ku5u3FhW8HjW/5tceL48rwZt
	AoFJra6IoP5n4+Dcnq3r0OU=
X-Google-Smtp-Source: AMsMyM6V2wuPnG0i/y9DGnxexPRTEgWtCkZhhtvL0jdZgaL0/1sx6QVErTqsl27d+pNsBwJ67BmvXw==
X-Received: by 2002:ae9:c107:0:b0:6ec:5250:575f with SMTP id z7-20020ae9c107000000b006ec5250575fmr30728815qki.59.1666793433375;
        Wed, 26 Oct 2022 07:10:33 -0700 (PDT)
Received: from gmail.com (cpe7c9a54441c1f-cm7c9a54441c1d.cpe.net.cable.rogers.com. [173.34.238.88])
        by smtp.gmail.com with ESMTPSA id h2-20020ac81382000000b0038b684a1642sm3233679qtj.32.2022.10.26.07.10.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Oct 2022 07:10:32 -0700 (PDT)
Date: Wed, 26 Oct 2022 10:10:31 -0400
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Mark Hatle <mark.hatle@kernel.crashing.org>
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization] [master,langdale,kirkstone][PATCH] xen:
 Make xilinx extension generic
Message-ID: <20221026141029.GA5043@gmail.com>
References: <20221020162312.915541-1-mark.hatle@kernel.crashing.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221020162312.915541-1-mark.hatle@kernel.crashing.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 26 Oct 2022 14:10:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7665

merged.

Bruce

In message: [meta-virtualization] [master,langdale,kirkstone][PATCH] xen: Make xilinx extension generic
on 20/10/2022 Mark Hatle wrote:

> Move the xilinx specific bbappend to a wildcard append.
> 
> Signed-off-by: Mark Hatle <mark.hatle@kernel.crashing.org>
> ---
>  .../recipes-extended/xen/{xen_4.14.bbappend => xen_%.bbappend}   | 0
>  dynamic-layers/xilinx/recipes-extended/xen/xen_git.bbappend      | 1 -
>  2 files changed, 1 deletion(-)
>  rename dynamic-layers/xilinx/recipes-extended/xen/{xen_4.14.bbappend => xen_%.bbappend} (100%)
>  delete mode 100644 dynamic-layers/xilinx/recipes-extended/xen/xen_git.bbappend
> 
> diff --git a/dynamic-layers/xilinx/recipes-extended/xen/xen_4.14.bbappend b/dynamic-layers/xilinx/recipes-extended/xen/xen_%.bbappend
> similarity index 100%
> rename from dynamic-layers/xilinx/recipes-extended/xen/xen_4.14.bbappend
> rename to dynamic-layers/xilinx/recipes-extended/xen/xen_%.bbappend
> diff --git a/dynamic-layers/xilinx/recipes-extended/xen/xen_git.bbappend b/dynamic-layers/xilinx/recipes-extended/xen/xen_git.bbappend
> deleted file mode 100644
> index 54edd1b..0000000
> --- a/dynamic-layers/xilinx/recipes-extended/xen/xen_git.bbappend
> +++ /dev/null
> @@ -1 +0,0 @@
> -include xen-xilinx.inc
> -- 
> 2.25.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7663): https://lists.yoctoproject.org/g/meta-virtualization/message/7663
> Mute This Topic: https://lists.yoctoproject.org/mt/94457111/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


