Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 593E9C87FCC
	for <webhook@archiver.kernel.org>; Thu, 31 Jul 2025 17:44:42 +0000 (UTC)
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
 by mx.groups.io with SMTP id smtpd.web10.68577.1753983872000091399
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 31 Jul 2025 10:44:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=AEeoy8I9;
 spf=pass (domain: gmail.com, ip: 209.85.222.179, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-7e32c9577ddso4799085a.0
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 31 Jul 2025 10:44:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753983871; x=1754588671; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=G3PymLpyq1th7dUaAkSjhtgpAfOT/+0//YlhFBPYgBE=;
        b=AEeoy8I9bqF9myGgonY+3gSNO2TzBu9YDRdtIp5dIKPRLpW6BCAL8IjDJJhLq9ym31
         /5ZXsTdQWJ6uL6Fvq8gwXLLWsS8dSBnoAGopSsxSM1PBmeCuaNrkq5dd7pBIp7Er1srI
         qYfvmQQyvulazE2ZwAlR9qJK5spSWLNfMaDfymhfGL48JAMsZigAT5W2X8qGlge9FZre
         b/DYD/le4F9kr9u3g+u9osC1mwj4GbK09CN1C97JFDa8baNd9zQy2OCNN67bsM8t5qfK
         9Dblh6IA0R0NH47DpVlbhXwtX31kt2PcybQmO1G0o5rK+2kwqOiFwhEQCDKNXxWNpIUy
         ZfYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753983871; x=1754588671;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G3PymLpyq1th7dUaAkSjhtgpAfOT/+0//YlhFBPYgBE=;
        b=g5crDTsUk87Y2EAwnoLbBaoNl6vwrjUIfBK/TeJwGIs/K5FO3Qy/2knpb4pXwCEAMs
         v0dZqX8bMyNuSt323zbNsdLUNIFXBm8IhiMZsN0rpWarTeqT+6Qh7c9q4nCNis2aOw+N
         6PsAUKQgf/1ztMI8bybIW2Kf4ZP0Ds2kFCvvWTxMEbZUg0IXgObPgaRz1hz0Ki8IFeyy
         PA9MAUjblZOjfHiT5uT7yqDPTsAxui982wrF79S6lQB+CXK3ZAvKUOnkTfsB58qx2s5d
         izHPYcInPk7DIHJ1O7DuXtRLO7F1wA+hq4nOYaWIDtlgFrnJJTxZwU0X9ctPC17T0MMz
         5IPQ==
X-Gm-Message-State: AOJu0YxVBXnPv6RJzLtZQMoxWGF+ghXnd0HhPdphMsugfO4zMkB1Xxy4
	mLJ1nrTgoCMggQjRI2LbelBIqVCigVsoHjfKeoOAQC/LAVynMHU6m5EiM2vczbSy
X-Gm-Gg: ASbGncszZ8DtSzVxTAj0AQuRsvnUmsDDryaMp2j63UppHyxzb+ywIbSNLaKSoRvXwvg
	dvJ6wnfnF9tp5plDeZl5zMOlSNkSNaHJwX1zqXxTufm0+FQMyeEkRCHD9/OHeqd+xkm1OKCnPDM
	Pl5PtrK11OZgGuf+hW3SFQ6Jg8JWVdWrZsNr3MW834Q33EYdYowbycOGA/zNL/cePkr7fVOmJ5w
	Pmivivi2cGsGg9V2NsyOOiQqQsPDRmb77nudSgPvd2pikLU6DX+HHRFHfkAN0Pl3tXnFuRT42yc
	Cg+VA9Yp+S9yQccgDgpqtmJzQKIJTiwdBwOyOta2ha9IvFZtKlP9Tcf6yZpBlQPygK8pLnqH2vX
	KqCX6u2Gw3LIjpELgNydzKSwtkMm8JFNtRMNB5hZePnEfqQdaOe6FNtr4Z2ELrayCzcfd56Hl+b
	t7m7fUR/rdPJ8=
X-Google-Smtp-Source: AGHT+IFf6BSo2ZbnY2pO7USuDO0a5rU/b5qlZQbFuPBAKJ33RoDxrxjm+0ftTHd/PrujRxwR61Ujlw==
X-Received: by 2002:a05:620a:6188:b0:7e3:380a:b8b2 with SMTP id af79cd13be357-7e66efac2d1mr999098385a.23.1753983870832;
        Thu, 31 Jul 2025 10:44:30 -0700 (PDT)
Received: from gmail.com (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7e67f594236sm113881285a.8.2025.07.31.10.44.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Jul 2025 10:44:30 -0700 (PDT)
Date: Thu, 31 Jul 2025 13:44:28 -0400
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: zachary.zet.li.chua@intel.com
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization] [scarthgap][PATCH] virt-manager: update
 RDEPENDS
Message-ID: <aIurfJQwxDaYq0VG@gmail.com>
References: <20250724055013.3358042-1-zachary.zet.li.chua@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250724055013.3358042-1-zachary.zet.li.chua@intel.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 31 Jul 2025 17:44:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9336

When something is a cherry-pick, it is useful to put that in the
subject, or even in the long log .. that way I can quickly pickup
that I don't need extra review on the patch as it is already in
tree.

Bruce

In message: [meta-virtualization] [scarthgap][PATCH] virt-manager: update RDEPENDS
on 24/07/2025 zachary.zet.li.chua via lists.yoctoproject.org wrote:

> From: "Chua, Zachary Zet Li" <zachary.zet.li.chua@intel.com>
> 
> Update RDEPENDS to fix following errors when run virt-manager:
> 
> |   File "/usr/share/virt-manager/virtManager/virtmanager.py", line 13, in <module>
> |     import gi
> | ModuleNotFoundError: No module named 'gi'
> 
> |   File "/usr/lib/python3.12/site-packages/gi/__init__.py", line 122, in require_version
> |     raise ValueError('Namespace %s not available' % namespace)
> | ValueError: Namespace LibvirtGLib not available
> 
> |   File "/usr/share/virt-manager/virtinst/xmlapi.py", line 7, in <module>
> |     import libxml2
> | ModuleNotFoundError: No module named 'libxml2'
> 
> |   File "/usr/share/virt-manager/virtinst/install/urlfetcher.py", line 16, in <module>
> |      import requests
> | ModuleNotFoundError: No module named 'requests'
> 
> Update RDEPENDS for package virt-manager-install which are required by
> command virt-install. For example, the error is as follows when missing
> virsh:
> 
>   Error launching ['virsh', '--connect', 'qemu:///system', 'console',
>     'myvm']: [Errno 2] No such file or directory
> 
> Commits are taken from 'master' branch:
> - 032415ef6b7d48ca34bb1d23cb8c194a38e0c369
> - 238020e42060764e7d2aadbb43a12792ed8b7e27
> 
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> Signed-off-by: Chua, Zachary Zet Li <zachary.zet.li.chua@intel.com>
> ---
>  .../virt-manager/virt-manager_4.1.0.bb           | 16 ++++++++++++++--
>  1 file changed, 14 insertions(+), 2 deletions(-)
> 
> diff --git a/recipes-extended/virt-manager/virt-manager_4.1.0.bb b/recipes-extended/virt-manager/virt-manager_4.1.0.bb
> index a2395012..d752fd2b 100644
> --- a/recipes-extended/virt-manager/virt-manager_4.1.0.bb
> +++ b/recipes-extended/virt-manager/virt-manager_4.1.0.bb
> @@ -28,8 +28,20 @@ RDEPENDS:${PN}-common += " \
>    libosinfo \
>  "
>  
> -RDEPENDS:${PN} = "${PN}-common"
> -RDEPENDS:${PN}-install = "${PN}-common"
> +RDEPENDS:${PN} = " \
> +  ${PN}-common \
> +  libvirt-glib \
> +  libxml2-python \
> +  python3-pygobject \
> +  python3-requests \
> +"
> +RDEPENDS:${PN}-install = " \
> +  ${PN}-common \
> +  libvirt-virsh \
> +  libxml2-python \
> +  python3-pygobject \
> +  python3-requests \
> +"
>  
>  SETUPTOOLS_INSTALL_ARGS += "${PACKAGECONFIG_CONFARGS}"
>  
> -- 
> 2.43.0
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9329): https://lists.yoctoproject.org/g/meta-virtualization/message/9329
> Mute This Topic: https://lists.yoctoproject.org/mt/114316587/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


