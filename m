Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DB3A1061B1D
	for <webhook@archiver.kernel.org>; Mon, 30 Mar 2026 19:36:11 +0000 (UTC)
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3969.1774899367052757556
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 30 Mar 2026 12:36:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=RY3JlxSt;
 spf=pass (domain: gmail.com, ip: 209.85.222.177, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-8cd77786e97so490924185a.3
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 30 Mar 2026 12:36:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774899366; x=1775504166; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/c1pDvWEunsbaf9/7/02DEotXIYlfsDcVkF/pSPRIpk=;
        b=RY3JlxStaQBcfq7Fu9JA0QtKubtDBTO69j/AJctO5MYm6u1fG4044S50JoZ+DhsywH
         Ta32u8wKK1RXYKXJ2g+03LRk55SE69Xd1oc0iX9wbsaQAtkbyH8dlWKnODgjkoRF1+3J
         8NMgpsFeSLi6+odt7DIWFFB6iYxeQvHLsqye1ZR1aUtup+0HsmFO9jKPBnfbTKjAZOZF
         RtJ6Xf/vUY9Bw3RuqRN4+/QCBY+O2jO09f1kAC9Ow2It8MWHQTGSCfBLhePnFrBtCeLD
         yGMKwG05inbu0gW8GsoKY47MfWPzMi4rhR/7TN8VtmJMb0b899W1NbVpk09z8o9jBvf1
         R0DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774899366; x=1775504166;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/c1pDvWEunsbaf9/7/02DEotXIYlfsDcVkF/pSPRIpk=;
        b=Cb9FBQTVuSXrerLlrJIdfqpK25YAGnZPmEr1o1MRDaVYrNLE4W8+2RoFcjj8C/aIjN
         jBYUmqbibu4WDUePSqPUdmIlx4kXD+kzY6EEs/me2FyILhhLsK6cxq9ch+URJKkOdfUI
         yKkUryobzqNrveVKqWHZgaVnpaUl4Mb4x8J1hsVcRMU6kqEbbUq1uxDuqOsyQzUO4o7k
         1jM6sBDmOrLpCTUDyXi8cxOrgISbUjgDtHuxt2cAUpIhDJ+3kG+3EBVeqARm0miaW59H
         F5hrIU008MoRfAIxEi0i+6VNSBv0MXlAo1YgY28t9B/B0TtvbiawI4NT0M37uX6TtLYD
         qOuQ==
X-Gm-Message-State: AOJu0YzZWIBpHAU5oiNztv0cc1rt5h2FTkt7WnLxI/+2CpbxBLUrFDxY
	2k5+6vAEWMGUfOARM0GhxkErCrNo+AYqHWXkCtnUtUIpJXWpuegmZvwB
X-Gm-Gg: ATEYQzx3V+LKYDlecMNBc15uCgUGggazYSCisJEJKdup6kg0LRBUjby8T6vXHFDewQQ
	3Q1OhgHgVRmlSHiX/QQ1fkqws7Tkf3mAcwD0jixD/fjtOcFrW48WD8ntdPvxM3TUegXEg5ByRvO
	GARjpwIUITCaIh8pV8xD4NdA5rtM5Mr8vLWno+NJKJIaiGOnoV5r7Ct8LUqQyfG6gkjGehb4lac
	1LgSbs44KM/S/EKg/UPmmcOUA10jcqgxn3LDO36SSzGM9X+25ZfXQnwalDbjt+cDi35b7DabEOX
	gOKTbjHQur0ApAp1TksCS0hnMEtIhXZ3ao/dRVz0l2D4fgaRjU6qCg9fU5jPh2GD5aIaPQAsHGh
	FCdriuZGO/5Qvn7cR1kaBfAstewJdC9OkTGotSLsxM7ELVICPv5Zr8VICeeVAO9wL5GCfzFNi+D
	ex8tKTZhy0sBPwlsn+eSc1cRsr8htNxbPlQi03s/2nYgMQJwMuRD5DZqwj4I/6SrJg7KN2BhOdk
	Jm/2Bp+L/hM4a0FajuayQ/MBYdyf9xUhzis
X-Received: by 2002:a05:620a:2954:b0:8cf:cee2:e407 with SMTP id af79cd13be357-8d01c666022mr1937826585a.28.1774899365957;
        Mon, 30 Mar 2026 12:36:05 -0700 (PDT)
Received: from gmail.com (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8d028041f8esm691776185a.31.2026.03.30.12.36.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 12:36:05 -0700 (PDT)
Date: Mon, 30 Mar 2026 19:36:03 +0000
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: youenn.lejeune@savoirfairelinux.com
Cc: meta-virtualization@lists.yoctoproject.org,
	Enguerrand de Ribaucourt <enguerrand.de-ribaucourt@savoirfairelinux.com>,
	Erwann Roussy <erwann.roussy@savoirfairelinux.com>
Subject: Re: [meta-virtualization][PATCH] ceph, libvirt, openvswitch: marked
 some CVEs as patched
Message-ID: <acrQo0_tj86jBiT7@gmail.com>
References: <20260316120501.1216022-1-youenn.lejeune@savoirfairelinux.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260316120501.1216022-1-youenn.lejeune@savoirfairelinux.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 30 Mar 2026 19:36:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9682

merged.

Bruce

In message: [meta-virtualization][PATCH] ceph, libvirt, openvswitch: marked some CVEs as patched
on 16/03/2026 Youenn Le Jeune via lists.yoctoproject.org wrote:

> For ceph, libvirt and openvswitch, 9 CVEs were marked as "unpatched"
> whereas they have been patched long ago compared to the versions of
> the recipes, because the NVD database does not contain patched version
> for those CVEs.
> 
> Reviewed-by: Enguerrand de Ribaucourt <enguerrand.de-ribaucourt@savoirfairelinux.com>
> Reviewed-by: Erwann Roussy <erwann.roussy@savoirfairelinux.com>
> Signed-off-by: Youenn Le Jeune <youenn.lejeune@savoirfairelinux.com>
> ---
>  recipes-extended/ceph/ceph_git.bb                 | 3 +++
>  recipes-extended/libvirt/libvirt_git.bb           | 7 +++++++
>  recipes-networking/openvswitch/openvswitch_git.bb | 2 ++
>  3 files changed, 12 insertions(+)
> 
> diff --git a/recipes-extended/ceph/ceph_git.bb b/recipes-extended/ceph/ceph_git.bb
> index 2cf1c88a..728a420b 100644
> --- a/recipes-extended/ceph/ceph_git.bb
> +++ b/recipes-extended/ceph/ceph_git.bb
> @@ -192,3 +192,6 @@ INSANE_SKIP:${PN}-dbg += "buildpaths"
>  CCACHE_DISABLE = "1"
>  
>  CVE_PRODUCT = "ceph ceph_storage ceph_storage_mon ceph_storage_osd"
> +
> +CVE_STATUS[CVE-2017-7519] = "fixed-version: Fixed in 12.1.2, NVD tracks this as version-less vulnerability"
> +CVE_STATUS[CVE-2020-1700] = "fixed-version: Fixed in 15.1.1, NVD tracks this as version-less vulnerability"
> diff --git a/recipes-extended/libvirt/libvirt_git.bb b/recipes-extended/libvirt/libvirt_git.bb
> index 63f882ee..8462c10c 100644
> --- a/recipes-extended/libvirt/libvirt_git.bb
> +++ b/recipes-extended/libvirt/libvirt_git.bb
> @@ -179,6 +179,13 @@ PACKAGECONFIG[libpcap] = "-Dlibpcap=enabled, -Dlibpcap=disabled,libpcap,libpcap"
>  PACKAGECONFIG[numad] = "-Dnumad=enabled, -Dnumad=disabled,"
>  PACKAGECONFIG[nftables] = ""
>  
> +CVE_STATUS[CVE-2014-8135] = "fixed-version: Fixed in 1.2.11, NVD tracks this as version-less vulnerability"
> +CVE_STATUS[CVE-2014-8136] = "fixed-version: Fixed in 1.2.11, NVD tracks this as version-less vulnerability"
> +CVE_STATUS[CVE-2015-5313] = "fixed-version: Fixed in 1.3.1, NVD tracks this as version-less vulnerability"
> +CVE_STATUS[CVE-2018-5748] = "fixed-version: Fixed in 4.0.0, NVD tracks this as version-less vulnerability"
> +CVE_STATUS[CVE-2018-6764] = "fixed-version: Fixed in 4.1.0, NVD tracks this as version-less vulnerability"
> +CVE_STATUS[CVE-2023-3750] = "fixed-version: Fixed in 9.6.0, NVD tracks this as version-less vulnerability"
> +
>  # Enable the Python tool support
>  require libvirt-python.inc
>  
> diff --git a/recipes-networking/openvswitch/openvswitch_git.bb b/recipes-networking/openvswitch/openvswitch_git.bb
> index 4d6520e0..61c5e39c 100644
> --- a/recipes-networking/openvswitch/openvswitch_git.bb
> +++ b/recipes-networking/openvswitch/openvswitch_git.bb
> @@ -35,6 +35,8 @@ PACKAGECONFIG[dpdk] = "--with-dpdk=shared,,dpdk,dpdk"
>  PACKAGECONFIG[libcap-ng] = "--enable-libcapng,--disable-libcapng,libcap-ng,"
>  PACKAGECONFIG[ssl] = ",--disable-ssl,openssl,"
>  
> +CVE_STATUS[CVE-2023-5366] = "fixed-version: Fixed in 3.2.2, NVD tracks this as version-less vulnerability"
> +
>  # Don't compile kernel modules by default since it heavily depends on
>  # kernel version. Use the in-kernel module for now.
>  # distro layers can enable with EXTRA_OECONF_pn_openvswitch += ""
> -- 
> 2.34.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9662): https://lists.yoctoproject.org/g/meta-virtualization/message/9662
> Mute This Topic: https://lists.yoctoproject.org/mt/118343262/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


