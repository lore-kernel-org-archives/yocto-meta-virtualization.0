Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0695C61DA3
	for <webhook@archiver.kernel.org>; Tue, 21 Feb 2023 15:14:37 +0000 (UTC)
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
 by mx.groups.io with SMTP id smtpd.web11.45065.1676992469382275991
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 21 Feb 2023 07:14:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ifnTU9/F;
 spf=pass (domain: gmail.com, ip: 209.85.219.47, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f47.google.com with SMTP id y12so5011886qvt.8
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 21 Feb 2023 07:14:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZBLEn41KTst5Vc1CfWjBtk2q/uBpeP06Xdx5M2chJGY=;
        b=ifnTU9/FzXi02BSWM/c7amGTc2L4yGZL3LPQ5PGo9yTBuue6jTaDSiBVOxmPjGM6Xs
         XdJwvQamanXr8SVYPMbujnaNrJE+iGeJkyVrSK2Ibd8UeeDV++9zl3nURj9/jAPxR3Be
         ODrHqZCkx7BhQF3ARO8fz3pYeimf9kR6nLhc/PxnhyPqmt3s/qLjKNo+sSgiM6ofjz50
         qjje/U/Xia+up+IHnWgbnQeiPdH2Yf8APmhmK/yRGei8u+d8zHvTjNBajxEZnRQcMnoD
         0k38hYx0d+MUSx1WOTmMFJyq5spDtM4S66fTF2PKrU7eB4XosbZdrtY2irGDpBK6j0Mt
         2cKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZBLEn41KTst5Vc1CfWjBtk2q/uBpeP06Xdx5M2chJGY=;
        b=13slt4VjYHtmAkI6dOWIpkoVPik2juUnDhPHVlg96laV/PEIz4C3nOBBlEFxQgw0hn
         1KA0xsSy/5Fko0yYRPkMj/x+LjMLtRLY3JefzAlzNwsaT9w4IMedtkk0yJBBnraufpec
         4J9v+bXORYydZ0pPCiccv76H64nSrH6rtoRo+6cyvQpr+BN7uU6ya+3Qg9dsDuqcl6zu
         Zi/tx4IwZepdTeghS8YUME13nCmqrSH89SikayJ4VDUZuX6kNO7ZrfO80wJ9AtNRbvS+
         yZUFAv6/LpWok4hsH5mJlMciB7qQYrTaVPshfpRMSTcKPyRNHS+VS0mGFU555qo6xIwK
         sGcQ==
X-Gm-Message-State: AO0yUKWsJAC/nifeKfnGPHB228xiGonoVAB/FMBy0f0XFME05bcf4ZGs
	elzLmcZGczlzNl/9/KLKpYg=
X-Google-Smtp-Source: AK7set9O1EiF6Uc5O9JGCJWTJMMTOozu3OYJYBpp4s0o+5+QVAhSD9i8ZrKmU/yzDeUhqh4JuKXiYA==
X-Received: by 2002:ad4:594a:0:b0:56e:ace7:6a03 with SMTP id eo10-20020ad4594a000000b0056eace76a03mr11920854qvb.6.1676992468003;
        Tue, 21 Feb 2023 07:14:28 -0800 (PST)
Received: from gmail.com (cpe7c9a54441c1f-cm7c9a54441c1d.cpe.net.cable.rogers.com. [173.34.238.88])
        by smtp.gmail.com with ESMTPSA id s190-20020a372cc7000000b007422fa6376bsm453673qkh.77.2023.02.21.07.14.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Feb 2023 07:14:27 -0800 (PST)
Date: Tue, 21 Feb 2023 10:14:26 -0500
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Chen Qi <Qi.Chen@windriver.com>
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][master-next][PATCH 1/3] Revert "cri-o:
 install policy.json to avoid image pulling error"
Message-ID: <Y/Tf0ioHbsQbkOVg@gmail.com>
References: <20230220045423.84802-1-Qi.Chen@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230220045423.84802-1-Qi.Chen@windriver.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 21 Feb 2023 15:14:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7888

dropped.

Bruce

In message: [meta-virtualization][master-next][PATCH 1/3] Revert "cri-o: install policy.json to avoid image pulling error"
on 19/02/2023 Chen Qi wrote:

> Do NOT merge this patch. This revert-type patch is only an indication
> that the original patch on master-next should be dropped.
> 
> A follow-up patch to master-next will be sent to add policy.json to
> container-host-config.
> 
> This reverts commit 3a905978b2e6eb558072e65b2688a1ced5aa50a3.
> 
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  recipes-containers/cri-o/cri-o_git.bb | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/recipes-containers/cri-o/cri-o_git.bb b/recipes-containers/cri-o/cri-o_git.bb
> index 57dfe8e..9467cf1 100644
> --- a/recipes-containers/cri-o/cri-o_git.bb
> +++ b/recipes-containers/cri-o/cri-o_git.bb
> @@ -98,8 +98,6 @@ do_install() {
>      install -m 0644 ${S}/src/import/contrib/systemd/crio-wipe.service  ${D}${systemd_unitdir}/system/
>  
>      install -d ${D}${localstatedir}/lib/crio
> -    install -d ${D}${sysconfdir}/containers
> -    install -m 0644 ${S}/src/import/contrib/policy.json ${D}${sysconfdir}/containers
>  }
>  
>  FILES:${PN}-config = "${sysconfdir}/crio/config/*"
> -- 
> 2.37.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7881): https://lists.yoctoproject.org/g/meta-virtualization/message/7881
> Mute This Topic: https://lists.yoctoproject.org/mt/97080774/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


