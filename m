Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 006CFC6FA8E
	for <webhook@archiver.kernel.org>; Thu,  2 Mar 2023 21:25:02 +0000 (UTC)
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
 by mx.groups.io with SMTP id smtpd.web10.6992.1677792296298828742
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 02 Mar 2023 13:24:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=VkOKSEgm;
 spf=pass (domain: gmail.com, ip: 209.85.160.178, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f178.google.com with SMTP id c18so819061qte.5
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 02 Mar 2023 13:24:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2KEv12ZNeJL6PwzxhVHrbQykNruLruhLbDl6ibJBIPw=;
        b=VkOKSEgmuPOuBqNiDtRhUDpzCUtKTKUCnP737IvHt1RHLNGa/L9qZaY+X5KP0p3sMv
         IbwW7usfMeDwsuGqp33KeNqo0iWvnl3RZs8LskDoT6k4FTAnjKHCF/3uB247fgIoKf9y
         OyJTKQBXhEeEPUAFvqV9ujviQynidONkYaTTlgOIFhRMnCo24uYP7jdNXXjsFWn0PG06
         A0OixxMP/5n7yDyHR9Ps9ZoU+Xgd2rY9Fg3ocHdx+99CAKydzl9Fmd2sV9gUIu4wRrFD
         s5TMEIM2U0xe1jFp/rMPTGITmB+b2PYrL1v6mSipLKMgKhwqYFDU0IML1KEAiVn2HJiT
         2YSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2KEv12ZNeJL6PwzxhVHrbQykNruLruhLbDl6ibJBIPw=;
        b=ekGQrzwYysE2XRm7BXj0IOfHg76y3j38BiiC0NgpK0n/m6rjU5OYplkW505xIh97Ht
         aEm5S8jkos5VTwlYPYMhqPoHWRExD8q2mNFpaQoF1jJNcGFs+lQ2aEeakUGwfwUOJAFu
         4U2PFIGb0Sj4U+YQKW1CZ3iRlq2Rcu5eV5hWb2v7e6m0E4Zmq4GHOjl2OKRrd5Jod+Pp
         zUWSn1q4CNkk8jdafEpWziyo88uELTTqFhAK0y67Iow8247FL8l9FCjhTil6C77hBuo3
         6Lku7n7++2+T8eGnLGZzja1I68cNbyBOHbyMhjV/jV5AhYW5eqt8KgR4fjnTSKBf2ICJ
         qSLA==
X-Gm-Message-State: AO0yUKVbH+ro0W5Y2TisRXv187l3j8gh8GDj8Z5YyVQKqjKgHrS13OTM
	/6wlNfMXDjtgmOvOm1cnP/H5K/HfJgHJPg==
X-Google-Smtp-Source: AK7set+THffelgcpEwf7h4F/f7DUakFemBb28ng0VpitKN10yc6RCWb5LJYgfsvgAT1wsqSaT/OEsA==
X-Received: by 2002:a05:622a:48c:b0:3a8:e35:258f with SMTP id p12-20020a05622a048c00b003a80e35258fmr18769555qtx.31.1677792295256;
        Thu, 02 Mar 2023 13:24:55 -0800 (PST)
Received: from gmail.com (cpe7c9a54441c1f-cm7c9a54441c1d.cpe.net.cable.rogers.com. [173.34.238.88])
        by smtp.gmail.com with ESMTPSA id c22-20020a379a16000000b0074233b15a72sm389741qke.116.2023.03.02.13.24.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Mar 2023 13:24:53 -0800 (PST)
Date: Thu, 2 Mar 2023 16:24:51 -0500
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][PATCH 0/1] lxc: templates/lxc-busybox.in:
 if busybox contains init then use it
Message-ID: <ZAEUIxX+2N+Xt6Ez@gmail.com>
References: <20230301023825.124974-1-xiangyu.chen@eng.windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230301023825.124974-1-xiangyu.chen@eng.windriver.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 02 Mar 2023 21:25:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7924

In message: [meta-virtualization][PATCH 0/1] lxc: templates/lxc-busybox.in: if busybox contains init then use it
on 01/03/2023 Xiangyu Chen wrote:

> From: Xiangyu Chen <xiangyu.chen@windriver.com>
> 
> Hi Bruce,
> 
> Recently we found that the lxc ptest has lots of failure cases as below log-1, after checking the 
> code, some cases failed due to related the init progess. For example, lxc-test-exit-code need to 
> start container as daemon, but if using bash as init, the container cannot start correctly.

Is there an indication of what busybox is providing that bash isn't ?

I don't like to force this in the ptest, while for actual lxc containers
we still allow bash, which means it may not be functional.

There are other init options in meta-virt, like the docker tini, if we
had to enforce something, I'd rather that than busybox.

Bruce

> 
> So added a busybox init utils checking in lxc-busybox template, if current system busybox contains 
> init then use it, after applying this patch, the ptest result as log-2. 
> 
> 
> ######## 1og-1: ptest without patch #######
> 
> Starting LXC ptest ###
> FAIL: lxc-test-api-reboot
> SKIPPED: lxc-test-apparmor
> PASS: lxc-test-apparmor-generated
> FAIL: lxc-test-apparmor-mount
> PASS: lxc-test-arch-parse
> FAIL: lxc-test-attach
> PASS: lxc-test-automount
> FAIL: lxc-test-autostart
> PASS: lxc-test-basic
> FAIL: lxc-test-capabilities
> FAIL: lxc-test-cgpath
> PASS: lxc-test-checkpoint-restore
> FAIL: lxc-test-cloneconfig
> FAIL: lxc-test-clonetest
> FAIL: lxc-test-concurrent
> PASS: lxc-test-config-jump-table
> FAIL: lxc-test-console
> FAIL: lxc-test-console-log
> FAIL: lxc-test-containertests
> FAIL: lxc-test-createconfig
> FAIL: lxc-test-createtest
> PASS: lxc-test-criu-check-feature
> FAIL: lxc-test-cve-2019-5736
> FAIL: lxc-test-destroytest
> FAIL: lxc-test-device-add-remove
> FAIL: lxc-test-exit-code
> FAIL: lxc-test-get_item
> PASS: lxc-test-getkeys
> PASS: lxc-test-list
> PASS: lxc-test-locktests
> FAIL: lxc-test-lxc-attach
> PASS: lxc-test-lxcpath
> PASS: lxc-test-may-control
> FAIL: lxc-test-mount-injection
> FAIL: lxc-test-no-new-privs
> PASS: lxc-test-parse-config-file
> FAIL: lxc-test-proc-pid
> FAIL: lxc-test-procsys
> PASS: lxc-test-raw-clone
> PASS: lxc-test-reboot
> FAIL: lxc-test-rootfs
> FAIL: lxc-test-rootfs-options
> FAIL: lxc-test-saveconfig
> FAIL: lxc-test-share-ns
> FAIL: lxc-test-shortlived
> SKIPPED: lxc-test-shutdowntest
> FAIL: lxc-test-snapdeps
> FAIL: lxc-test-snapshot
> FAIL: lxc-test-startone
> SKIPPED: lxc-test-state-server
> FAIL: lxc-test-symlink
> FAIL: lxc-test-sys-mixed
> FAIL: lxc-test-sysctls
> FAIL: lxc-test-unpriv
> FAIL: lxc-test-usernic
> PASS: lxc-test-usernsexec
> PASS: lxc-test-utils
> 
> 
> 
> 
> 
> Results:
>     PASSED = 17
>     FAILED = 37
>     SKIPPED = 3
> (for details check individual test log in ./logs directory)
> 
> 
> ###########log-2: ptest with patch ###################
> root@intel-x86-64:/usr/lib64/lxc/ptest# ./run-ptest 
> ### Starting LXC ptest ###
> PASS: lxc-test-api-reboot
> SKIPPED: lxc-test-apparmor
> PASS: lxc-test-apparmor-generated
> FAIL: lxc-test-apparmor-mount
> PASS: lxc-test-arch-parse
> PASS: lxc-test-attach
> PASS: lxc-test-automount
> PASS: lxc-test-autostart
> PASS: lxc-test-basic
> PASS: lxc-test-capabilities
> PASS: lxc-test-cgpath
> PASS: lxc-test-checkpoint-restore
> FAIL: lxc-test-cloneconfig
> PASS: lxc-test-clonetest
> PASS: lxc-test-concurrent
> PASS: lxc-test-config-jump-table
> PASS: lxc-test-console
> PASS: lxc-test-console-log
> PASS: lxc-test-containertests
> PASS: lxc-test-createconfig
> PASS: lxc-test-createtest
> PASS: lxc-test-criu-check-feature
> PASS: lxc-test-cve-2019-5736
> PASS: lxc-test-destroytest
> PASS: lxc-test-device-add-remove
> PASS: lxc-test-exit-code
> FAIL: lxc-test-get_item
> PASS: lxc-test-getkeys
> PASS: lxc-test-list
> PASS: lxc-test-locktests
> PASS: lxc-test-lxc-attach
> PASS: lxc-test-lxcpath
> PASS: lxc-test-may-control
> PASS: lxc-test-mount-injection
> FAIL: lxc-test-no-new-privs
> PASS: lxc-test-parse-config-file
> PASS: lxc-test-proc-pid
> PASS: lxc-test-procsys
> PASS: lxc-test-raw-clone
> PASS: lxc-test-reboot
> PASS: lxc-test-rootfs
> PASS: lxc-test-rootfs-options
> PASS: lxc-test-saveconfig
> PASS: lxc-test-share-ns
> PASS: lxc-test-shortlived
> SKIPPED: lxc-test-shutdowntest
> FAIL: lxc-test-snapdeps
> PASS: lxc-test-snapshot
> PASS: lxc-test-startone
> SKIPPED: lxc-test-state-server
> PASS: lxc-test-symlink
> PASS: lxc-test-sys-mixed
> PASS: lxc-test-sysctls
> FAIL: lxc-test-unpriv
> FAIL: lxc-test-usernic
> PASS: lxc-test-usernsexec
> PASS: lxc-test-utils
> 
> Results:
>     PASSED = 47
>     FAILED = 7
>     SKIPPED = 3
> (for details check individual test log in ./logs directory)
> 
> 
> 
> 
> Xiangyu Chen (1):
>   lxc: templates/lxc-busybox.in: if busybox contains init then use it
> 
>  ...box-contains-init-use-it-in-containe.patch | 45 +++++++++++++++++++
>  recipes-containers/lxc/lxc_git.bb             |  1 +
>  2 files changed, 46 insertions(+)
>  create mode 100644 recipes-containers/lxc/files/0001-template-if-busybox-contains-init-use-it-in-containe.patch
> 
> -- 
> 2.34.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7908): https://lists.yoctoproject.org/g/meta-virtualization/message/7908
> Mute This Topic: https://lists.yoctoproject.org/mt/97306618/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


