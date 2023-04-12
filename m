Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84B76C77B6E
	for <webhook@archiver.kernel.org>; Wed, 12 Apr 2023 17:08:59 +0000 (UTC)
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
 by mx.groups.io with SMTP id smtpd.web10.49775.1681319331802998073
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 12 Apr 2023 10:08:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=RiCB4RaZ;
 spf=pass (domain: gmail.com, ip: 209.85.160.171, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f171.google.com with SMTP id gb12so10478807qtb.6
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 12 Apr 2023 10:08:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681319331; x=1683911331;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/iARnFveYkphhWbc9gUmqY8sspkM5T40fz1XDV6D47g=;
        b=RiCB4RaZEglpXypJkDNYlc/WPwrKajoA3uwC0yRNloIYM/tL7my7hkrEXpuAYNwcAM
         grapxckGShubb5Zizq/6mu55acZN4Mn9VmbZwzGtdM9tDPX9ZD62Mdh+ViI3pxPEgujp
         sp4hKFmaBJCjiqJa2wcist/AH8aossocyFCHyifmdZE4FJxFIX85ihQZ6ji92UMa5mJ/
         li8dpQYq0YPR16qid1Qzfi6pcM2hBa9oZG55apKp6IWQq88yU4dNMFnTkrqCGqzhCQQl
         ywzQZJXZ9bJVS7dBnRc7r80516CVHfFihGMl1MvA16KP6jiTT6MgHkSOe2w4CTioLAQF
         306w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681319331; x=1683911331;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/iARnFveYkphhWbc9gUmqY8sspkM5T40fz1XDV6D47g=;
        b=cXtg2w8CCEsG5pbR+ZtOAEkX+Y7MymfrS2YuNHR15gPV+K382p/uiamnwE6mS+0OLk
         jqqSdRhmlXIbPXV5KFbDVX4HBvEm1zKJvEhN7W7UvGyYNSlhW6NtMcZ4YjYxDfReFhgZ
         6jlcMoCQdGESkt98Cpe3Vgkj91D6U/7sSmspzOry2YVWQdMLl6L4N+lQHSiwSNoydxWX
         NLfY1C7sGY5jY/LNlB41zHFVlvsbKOsjQW4NCq0Tu7oVHCOMh1Z9AhHp9K2i5xx+sgTO
         NfdW0BrGJsCOixLIzNF2a9inMGa5s434WLcGy+AA/EgPh6By+t+4RubyeZN52NgEzdDj
         ThmQ==
X-Gm-Message-State: AAQBX9f5nKx0j153N2VxuvUBdfZ+wnW16kOKAF+8gRS5XyEppMi1ImxX
	XavZlRH+z0Ujw1tXqkzTzB5u9fcyYr/BeA==
X-Google-Smtp-Source: AKy350YvSN3Wi8WicMTiX1HUE7BAm8qwTXa1+/wYoYFyXQ/zYJ2oa1lJwN+kow2i/ZQ9MIvvw2mTcg==
X-Received: by 2002:a05:622a:293:b0:3e4:f0da:7086 with SMTP id z19-20020a05622a029300b003e4f0da7086mr5181497qtw.27.1681319330558;
        Wed, 12 Apr 2023 10:08:50 -0700 (PDT)
Received: from gmail.com ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id i18-20020ac860d2000000b003e45a39ed74sm4366097qtm.81.2023.04.12.10.08.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Apr 2023 10:08:50 -0700 (PDT)
Date: Wed, 12 Apr 2023 13:08:48 -0400
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Soumya <soumya.sambu@windriver.com>
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][kirkstone][PATCH 1/1] fuse: Fix
 CVE-2023-26253
Message-ID: <ZDbloOG0a+AwHzX8@gmail.com>
References: <20230411040703.3632835-1-soumya.sambu@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230411040703.3632835-1-soumya.sambu@windriver.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 12 Apr 2023 17:08:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7988

In message: [meta-virtualization][kirkstone][PATCH 1/1] fuse: Fix CVE-2023-26253
on 11/04/2023 Soumya wrote:

> Resolve asan bug in during receive event notification (#4024)
> 
>     The fuse xlator notify function tries to assign data object to graph
>     object without checking an event. In case of upcall event data object
>     represents upcall object so during access of graph object the process
>     crashed for asan build.
> 
>     Solution: Access the graph->id only while an event is associated
>     specifically to fuse xlator

merged.

Bruce

> 
> Signed-off-by: Soumya <soumya.sambu@windriver.com>
> ---
>  .../glusterfs/files/CVE-2023-26253.patch      | 76 +++++++++++++++++++
>  recipes-extended/glusterfs/glusterfs.inc      |  1 +
>  2 files changed, 77 insertions(+)
>  create mode 100644 recipes-extended/glusterfs/files/CVE-2023-26253.patch
> 
> diff --git a/recipes-extended/glusterfs/files/CVE-2023-26253.patch b/recipes-extended/glusterfs/files/CVE-2023-26253.patch
> new file mode 100644
> index 00000000..828c1626
> --- /dev/null
> +++ b/recipes-extended/glusterfs/files/CVE-2023-26253.patch
> @@ -0,0 +1,76 @@
> +commit 0cbf51a9827af0e3a35f5cfa823bfa39740bbc58
> +Author: mohit84 <moagrawa@redhat.com>
> +Date:   Thu Mar 30 13:02:19 2023 +0530
> +Subject: [PATCH] fuse: Resolve asan bug in during receive event notification
> + (#4024)
> +
> +    The fuse xlator notify function tries to assign data object to graph
> +    object without checking an event. In case of upcall event data object
> +    represents upcall object so during access of graph object the process
> +    crashed for asan build.
> +
> +    Solution: Access the graph->id only while an event is associated
> +    specifically to fuse xlator
> +
> +    > Fixes: #3954
> +    > Change-Id: I6b2869256b26d22163879737dcf163510d1cd8bf
> +    > Signed-off-by: Mohit Agrawal moagrawa@redhat.com
> +    > (Reviewed on upstream link #4019)
> +
> +    Fixes: #3954
> +    Change-Id: I6b2869256b26d22163879737dcf163510d1cd8bf
> +
> +CVE: CVE-2023-26253
> +
> +Upstream-Status: Backport [https://github.com/gluster/glusterfs/commit/0cbf51a9827af0e3a35f5cfa823bfa39740bbc58]
> +
> +Signed-off-by: Soumya <soumya.sambu@windriver.com>
> +---
> + xlators/mount/fuse/src/fuse-bridge.c | 14 +++++++++++---
> + 1 file changed, 11 insertions(+), 3 deletions(-)
> +
> +diff --git a/xlators/mount/fuse/src/fuse-bridge.c b/xlators/mount/fuse/src/fuse-bridge.c
> +index c3945d7..0c01a43 100644
> +--- a/xlators/mount/fuse/src/fuse-bridge.c
> ++++ b/xlators/mount/fuse/src/fuse-bridge.c
> +@@ -6198,6 +6198,7 @@ notify(xlator_t *this, int32_t event, void *data, ...)
> +     int32_t ret = 0;
> +     fuse_private_t *private = NULL;
> +     gf_boolean_t start_thread = _gf_false;
> ++    gf_boolean_t event_graph = _gf_true;
> +     glusterfs_graph_t *graph = NULL;
> + 
> +    private
> +@@ -6205,9 +6206,6 @@ notify(xlator_t *this, int32_t event, void *data, ...)
> + 
> +     graph = data;
> + 
> +-    gf_log("fuse", GF_LOG_DEBUG, "got event %d on graph %d", event,
> +-           ((graph) ? graph->id : 0));
> +-
> +     switch (event) {
> +         case GF_EVENT_GRAPH_NEW:
> +             break;
> +@@ -6271,9 +6269,19 @@ notify(xlator_t *this, int32_t event, void *data, ...)
> +         }
> + 
> +         default:
> ++            /* Set the event_graph to false so that event
> ++               debug msg would not try to access invalid graph->id
> ++               while data object is not matched to graph object
> ++               for ex in case of upcall event data object represents
> ++               gf_upcall object
> ++            */
> ++            event_graph = _gf_false;
> +             break;
> +     }
> + 
> ++    gf_log("fuse", GF_LOG_DEBUG, "got event %d on graph %d", event,
> ++           ((graph && event_graph) ? graph->id : -1));
> ++
> +     return ret;
> + }
> + 
> +-- 
> +2.35.5
> +
> diff --git a/recipes-extended/glusterfs/glusterfs.inc b/recipes-extended/glusterfs/glusterfs.inc
> index baa8962b..e5bedca1 100644
> --- a/recipes-extended/glusterfs/glusterfs.inc
> +++ b/recipes-extended/glusterfs/glusterfs.inc
> @@ -20,6 +20,7 @@ SRC_URI += "file://glusterd.init \
>              file://glusterd-change-port-range.patch \
>              file://configure.ac-allow-PYTHON-values-to-be-passed-via-en.patch \
>              file://0001-cli-duplicate-defns-of-cli_default_conn_timeout-and-.patch \
> +            file://CVE-2023-26253.patch \
>             "
>  
>  LICENSE = "(LGPL-3.0-or-later | GPL-2.0-only) & GPL-3.0-or-later & LGPL-3.0-or-later & GPL-2.0-or-later & LGPL-2.0-or-later & LGPL-2.1-or-later & Apache-2.0"
> -- 
> 2.35.5
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7982): https://lists.yoctoproject.org/g/meta-virtualization/message/7982
> Mute This Topic: https://lists.yoctoproject.org/mt/98191421/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


