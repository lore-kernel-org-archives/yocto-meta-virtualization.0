Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1A22C64E93
	for <webhook@archiver.kernel.org>; Thu, 21 Apr 2022 16:46:09 +0000 (UTC)
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com
 [209.85.217.46])
 by mx.groups.io with SMTP id smtpd.web12.11284.1650478369302833851
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 20 Apr 2022 11:12:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=dRGjW3rX;
 spf=pass (domain: gmail.com, ip: 209.85.217.46,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-vs1-f46.google.com with SMTP id r1so2301493vsi.12
        for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 20 Apr 2022 11:12:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=1lgu6CNxOFE+oWwsR6eapzgksRTKZekzRMiazqhS08g=;
        b=dRGjW3rXj7cVqnTKMbC/i/XXtLZ5jovrb5DfOz9QbgVFBsWyMfGeA1v3bUbYjxRwvU
         xbg4G6y7JjVR2yDSW/3Q8nlFK09eovWlMMORrx1V14ccavrpCYOIxlMiDhCiVmhf1OVU
         wDSS/AENMphOIHw6wo8IgSCLWYw9CTY7vZg1UW+gBc8o+IYsFsNLaOdigeZLX63Zv9Ax
         7PTQ/2HQO9PMfpj30IphmKD07yy/uSq44RQ4G/6IjTZoYqrotfBw8cmJFqO3MncKIN4e
         0/vYrM51JeToR3yTAVlS1kciuChB+pICUlvDnBMow24vUlUeyC5+L3O18+y6Zyfjb8hn
         py/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=1lgu6CNxOFE+oWwsR6eapzgksRTKZekzRMiazqhS08g=;
        b=VZ5/Y477wf7tI7N4Ijalqwr9eLaQn7Uz+TXjCVD6FG4rOl1+1/6kXmnyZBGR7j88Jx
         OyXcExn7f08rnq+EJTRxx6hhR3QFpCqlo4sHyJD7Gg4q4sDMW0dj6lVjCpncn75BWVAO
         xHZyozlOursr2VOqQqpoqVqiqycFhNY7hjrmtSNfbKr9zjE14oaO2WFX9WaGms3H90QA
         U/MNQ2Wm7cR+g2p/ENJ8f749oo6bPWGGaap+Xl0YMBskBHRG0latw1/gnNnBvZrOBZ/P
         Qn5M2bpW1Y2PqI4m6xjr5Sn3BUD1aH0eEBsxZyxcUFq1Bu7+cxOw+Oj9jjeukdH7p0Ft
         46Rg==
X-Gm-Message-State: AOAM532TkYfeRnmoYYTn1CO/TiUPZjusDLd84RnI2uyZk1SJoajCK4i4
	ozJBaSYu4XLXRyhzac0VPpLlCXke7QEActMw
X-Google-Smtp-Source: 
 ABdhPJwowpen06He2GFaa+9AYTdKbAI4u+V1A/rdb9/yvm4ixJZNI8bdb3mtOXY65gaOGTCpJGP+XA==
X-Received: by 2002:a05:6102:1492:b0:32a:3c2e:9aa8 with SMTP id
 d18-20020a056102149200b0032a3c2e9aa8mr4169643vsv.19.1650478368313;
        Wed, 20 Apr 2022 11:12:48 -0700 (PDT)
Received: from gmail.com ([173.34.88.218])
        by smtp.gmail.com with ESMTPSA id
 j3-20020a05612212a300b003497d7b77ecsm469431vkp.14.2022.04.20.11.12.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Apr 2022 11:12:47 -0700 (PDT)
Date: Wed, 20 Apr 2022 14:12:46 -0400
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: He Zhe <zhe.he@windriver.com>
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][PATCH] openvswitch: uprev from
 v2.17.0-30-g2404d4536 to v2.17.1
Message-ID: <20220420181245.GD60199@gmail.com>
References: <20220419063024.2344118-1-zhe.he@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220419063024.2344118-1-zhe.he@windriver.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 21 Apr 2022 16:46:09 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7205

staged to master-next.

Bruce

In message: [meta-virtualization][PATCH] openvswitch: uprev from v2.17.0-30-g2404d4536 to v2.17.1
on 19/04/2022 He Zhe wrote:

> commits short log:
> 41bb202fb (tag: v2.17.1) Set release date for 2.17.1.
> 8f42d4f59 NEWS: Highlight libopenvswitch API change caused by UB fixes.
> 14301b3a3 netdev-offload-tc: Check for ct_state flag combinations that are not offloadable.
> 3a2eef792 python: idl: Set cond_changed to true if condition change requested.
> d05ccf288 dpif-netdev: Fix dp_netdev_get_pmd() function getting correct core_id.
> 79e291f98 alb.at: Add tests for cross-numa polling.
> 9c3b74fb2 dpif-netdev: Fix PMD auto load balance with pmd-rxq-isolate.
> 8580ff9dd pmd.at: Add tests for multi non-local numa pmds.
> 6bf4eeddb dpif-netdev: Fix non-local numa selection for more than two numas.
> c41434b3b dpif-netdev: Fix typo in function name.
> e0aa5e132 python: idl: Set cond_changed to false if last id is zero.
> 8da40d31c ofproto-dpif-xlate: Fix NULL pointer dereference in xlate_normal().
> 63a903ab4 ofproto/ofproto-dpif: Fix dpif_type for userspace tunnels.
> 14d54eb8b sset: add SHORT version of SAFE loop macros.
> f0e63b115 sparse: bump recommended version and include headers.
> 70b87cf72 idlc: support short version of SAFE macros.
> 3777ed90c rculist: use multi-variable helpers for loop macros.
> bb52e9beb hindex: remove the next variable in safe loops.
> 7d6cbfa24 hindex: use multi-variable iterators.
> 97ad96b63 cmap: use multi-variable iterators.
> cd62fda22 hmap: use short version of safe loops if possible.
> d56bfd752 hmap: implement UB-safe hmap pop iterator.
> e2c835486 hmap: use multi-variable helpers for hmap loops.
> 897d6647e list: use short version of safe loops if possible.
> 979a9eb5b list: use multi-variable helpers for list loops.
> 6bacf802c util: add helpers to overload SAFE macro.
> f127123d6 util: add safe multi-variable iterators.
> 38e73f0b6 util: add multi-variable loop iterator macros.
> e91edf456 ovsdb: raft: Fix inability to read the database with DNS host names.
> 
> The ptest results BEFORE uprev:
> ERROR: 2340 tests were run,
> 30 failed unexpectedly.
> 65 tests were skipped.
> failed cases:
> 10 11 12 13 14 15 16 17 18 462 769 785 786 787 788 791 792 793 1024 1180 1181
> 1182 1183 1184 1185 1290 1291 2387 2391 2394
> 
> The ptest results AFTER uprev:
> ERROR: 2343 tests were run,
> 30 failed unexpectedly.
> 65 tests were skipped.
> failed cases:
> 10 11 12 13 14 15 16 17 18 462 769 785 786 787 788 791 792 793 1025 1183 1184
> 1185 1186 1187 1188 1293 1294 2390 2394 2397
> 
> Signed-off-by: He Zhe <zhe.he@windriver.com>
> ---
>  recipes-networking/openvswitch/openvswitch_git.bb | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/recipes-networking/openvswitch/openvswitch_git.bb b/recipes-networking/openvswitch/openvswitch_git.bb
> index 7051ac5c..2e125e78 100644
> --- a/recipes-networking/openvswitch/openvswitch_git.bb
> +++ b/recipes-networking/openvswitch/openvswitch_git.bb
> @@ -14,12 +14,12 @@ RDEPENDS:${PN}-ptest += "\
>  	"
>  
>  S = "${WORKDIR}/git"
> -PV = "2.17.0+${SRCPV}"
> -CVE_VERSION = "2.17.0"
> +PV = "2.17.1+${SRCPV}"
> +CVE_VERSION = "2.17.1"
>  
>  FILESEXTRAPATHS:append := "${THISDIR}/${PN}-git:"
>  
> -SRCREV = "2404d45367d104e74cc9eea50d27dcaa8c8917c0"
> +SRCREV = "41bb202fb37f184b0a8820a029c62d03c118614e"
>  SRC_URI += "git://github.com/openvswitch/ovs.git;protocol=https;branch=branch-2.17 \
>              file://openvswitch-add-ptest-71d553b995d0bd527d3ab1e9fbaf5a2ae34de2f3.patch \
>              file://run-ptest \
> -- 
> 2.25.1
> 

