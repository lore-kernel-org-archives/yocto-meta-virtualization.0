Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5D0DC83F17
	for <webhook@archiver.kernel.org>; Mon, 21 Jul 2025 02:38:09 +0000 (UTC)
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
 by mx.groups.io with SMTP id smtpd.web10.31332.1753065481022652657
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 20 Jul 2025 19:38:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=A+BzLKHc;
 spf=pass (domain: gmail.com, ip: 209.85.160.175, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-4ab63f8fb91so34697281cf.0
        for <meta-virtualization@lists.yoctoproject.org>; Sun, 20 Jul 2025 19:38:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753065480; x=1753670280; darn=lists.yoctoproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pg3HpipaP+6MVfmIkS4PsTpd6fp3n9RyvYdYXC0mKLw=;
        b=A+BzLKHcqhrN3imE0OyZuaZ0WZf1QPCgeXznZMtE60E/IqpT75tfIvbENRFhkqD48m
         3WACicgkcyGI+b6qNXRjsi6pezUiS5MEFsork0/1JwUD0UzLNhO0UCZl6B/vKLBaSLFT
         wlnmOA47ZdTuDm09HnWXnHCdYfsBGRTevPbbu15Wlf/Q+y3vgaxJP57TY9R+fz4TURKA
         ZoY9VWsES5eUOiAkxSE5D4DC41jpbFZVDn7BFc66jATyqoKmPsWBFz98WwTHyuNOOcCf
         2/gpwjYw7JZvqKG7/nSsnjJzrakjlU61WuG7VJMmedJ+eGtH88yVDAPivinXJVMS8LSV
         tACg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753065480; x=1753670280;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pg3HpipaP+6MVfmIkS4PsTpd6fp3n9RyvYdYXC0mKLw=;
        b=PBkkaBEF5t26xrM+VMWeGnHsOUwWto5oaXEUCH4tqAcqCbE8yqhL5/zAQCtZV835YQ
         +jb3WS6wme3FLqlGmhJDApVXyAt34Xc3bA6ZYcnvHoRlQ8thmEoQaBmr/Ye+fyyVqtIs
         BerVhTQ0/Ms+seqOWuO8GJ8dZsY3b8vn1PaiJ1I0xy79b7gydDmTJt1W4TJHLJ5/ZmLS
         CQftvPHnmDjAdP6h4VT7ZhHWYX7b6y5zFGFdV2FLjgtS3uoTiBtyBAs6GriBY4PdIxpl
         V0IWt4qne3BwmO/ycYqm8ETxrWdliYWH4cyXQQlVpSZQ9QISPH68b9N0o+TpnuWvHRbo
         9GYg==
X-Gm-Message-State: AOJu0Yxh2hAgNVxH+/wBZ1UT2oR+7bXJVxtQ4oj3q/QlWThdoWqLbFBh
	fj89i9kd3UEP0ykfHO8sD992Hl88PdrlwcRLDR0UjcOuZXHkA9Ng/bhR
X-Gm-Gg: ASbGncscoO99GU2qcSKNfHWX+99ZVTYotG5LPKfcC5PhoL+fFo1KlJiNF9Yji/nXaEK
	/3+7NXy+LDQ748+Kq31rkgdNTU6aGy8D/fnQRZOJh20FlovpWRoOdkX3ozyJFZyk8JZOX+QaIyJ
	V9yNdc5BYzblAYPp03w2w63J1DmIZvPc4cOhfbq97hQ7fLO+bR2hNMX/1UPZ8jI/MwEQLdsbrzi
	tULGI8XNVB8Z9clivmC0NYNj9TKcF7Y7Hu+oYhESRVgZ0qHV0LzZJuN9TCbjnGVXAgtA9rxygJg
	f41uPfT0VxX1P2j4Q3A9RT9Cm1UwHfuofmpe/T+1CsOEObCgnDQg9BfOSrxQN0BNZ42T2qQqGIe
	o/vhT+RZrVLAaTzjrMyXazv8DYeXpM1nZpxsn7zOUPnd2WG17F9UdpgO6g7wACEuxocCkrfLbEP
	FtzBg22Xn3Wks=
X-Google-Smtp-Source: AGHT+IHxtfIRwFdNfSqXRb+Jz/hkOIs6RzFiZzVRMaKKF6qfS7KDhZVuy987KyZiyPXz+CEEVxzdmQ==
X-Received: by 2002:a05:622a:110e:b0:4ab:840f:f36a with SMTP id d75a77b69052e-4ab93d886d4mr289657031cf.42.1753065479804;
        Sun, 20 Jul 2025 19:37:59 -0700 (PDT)
Received: from gmail.com (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4abb4aed09dsm36339191cf.36.2025.07.20.19.37.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Jul 2025 19:37:59 -0700 (PDT)
Date: Sun, 20 Jul 2025 22:37:57 -0400
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: sudumbha@cisco.com
Cc: meta-virtualization@lists.yoctoproject.org, xe-linux-external@cisco.com
Subject: Re: [meta-virtualization] [scarthgap] [PATCH] docker-moby 25.0.3:
 fix CVE-2024-36623
Message-ID: <aH2oBWMowUl8f7+U@gmail.com>
References: <20250717180522.498240-1-sudumbha@cisco.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250717180522.498240-1-sudumbha@cisco.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 21 Jul 2025 02:38:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9324

This patch is coming through garbled:

[/home/bruc...]> git am -s ~/incoming/0003-_meta-virtualization_scarthgap_PATCH_docker-moby_25.0.3_fix_CVE-2024-3.patch
Patch format detection failed.

Bruce

In message: [meta-virtualization] [scarthgap] [PATCH] docker-moby 25.0.3: fix CVE-2024-36623
on 17/07/2025 Sudhir Dumbhare -X (sudumbha - E INFOCHIPS PRIVATE LIMITED at Cisco) via lists.yoctoproject.org wrote:

> Upstream Repository: https://github.com/moby/moby.git
> 
> Bug Details: https://nvd.nist.gov/vuln/detail/CVE-2024-36623
> Type: Security Fix
> CVE: CVE-2024-36623
> Score: 8.1
> Patch: https://github.com/moby/moby/commit/8e3bcf197488
> 
> Analysis:
> - Moby through v25.0.3 has a race condition vulnerability in the
>   streamformatter package. It can trigger multiple concurrent write
>   operations resulting in data corruption. [1]
> - The fix adds a mutex to prevent concurrent writes and protect against
>   data corruption. [2]
> 
> Reference:
> [1] https://nvd.nist.gov/vuln/detail/CVE-2024-36623
> [2] https://github.com/moby/moby/commit/8e3bcf197488
> 
> Signed-off-by: Sudhir Dumbhare <sudumbha@cisco.com>
> ---
>  recipes-containers/docker/docker-moby_git.bb  |  1 +
>  .../docker/files/CVE-2024-36623.patch         | 55 +++++++++++++++++++
>  2 files changed, 56 insertions(+)
>  create mode 100644 recipes-containers/docker/files/CVE-2024-36623.patch
> 
> diff --git a/recipes-containers/docker/docker-moby_git.bb b/recipes-containers/docker/docker-moby_git.bb
> index aa239f68..d40e3e17 100644
> --- a/recipes-containers/docker/docker-moby_git.bb
> +++ b/recipes-containers/docker/docker-moby_git.bb
> @@ -60,6 +60,7 @@ SRC_URI = "\
>          file://CVE-2024-36621.patch;patchdir=src/import \
>          file://CVE-2024-29018_p1.patch;patchdir=src/import \
>          file://CVE-2024-29018_p2.patch;patchdir=src/import \
> +        file://CVE-2024-36623.patch;patchdir=src/import \
>  	"
>  
>  DOCKER_COMMIT = "${SRCREV_moby}"
> diff --git a/recipes-containers/docker/files/CVE-2024-36623.patch b/recipes-containers/docker/files/CVE-2024-36623.patch
> new file mode 100644
> index 00000000..811a37d7
> --- /dev/null
> +++ b/recipes-containers/docker/files/CVE-2024-36623.patch
> @@ -0,0 +1,55 @@
> +From 595fb34dbb46105379b469abfb70f7f9228c9361 Mon Sep 17 00:00:00 2001
> +From: =?UTF-8?q?Pawe=C5=82=20Gronowski?= <pawel.gronowski@docker.com>
> +Date: Thu, 22 Feb 2024 18:01:40 +0100
> +Subject: [PATCH] pkg/streamformatter: Make `progressOutput` concurrency safe
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=UTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +Sync access to the underlying `io.Writer` with a mutex.
> +
> +Upstream-Status: Backport [https://github.com/moby/moby/commit/8e3bcf197488]
> +CVE: CVE-2024-36623
> +
> +Signed-off-by: Paweł Gronowski <pawel.gronowski@docker.com>
> +(cherry picked from commit 5689dabfb357b673abdb4391eef426f297d7d1bb)
> +Signed-off-by: Albin Kerouanton <albinker@gmail.com>
> +(cherry picked from commit 8e3bcf19748838b30e34d612832d1dc9d90363b8)
> +Signed-off-by: Sudhir Dumbhare <sudumbha@cisco.com>
> +---
> + pkg/streamformatter/streamformatter.go | 5 +++++
> + 1 file changed, 5 insertions(+)
> +
> +diff --git a/pkg/streamformatter/streamformatter.go b/pkg/streamformatter/streamformatter.go
> +index b0456e580d..098df6b523 100644
> +--- a/pkg/streamformatter/streamformatter.go
> ++++ b/pkg/streamformatter/streamformatter.go
> +@@ -5,6 +5,7 @@ import (
> + 	"encoding/json"
> + 	"fmt"
> + 	"io"
> ++	"sync"
> + 
> + 	"github.com/docker/docker/pkg/jsonmessage"
> + 	"github.com/docker/docker/pkg/progress"
> +@@ -109,6 +110,7 @@ type progressOutput struct {
> + 	sf       formatProgress
> + 	out      io.Writer
> + 	newLines bool
> ++	mu       sync.Mutex
> + }
> + 
> + // WriteProgress formats progress information from a ProgressReader.
> +@@ -120,6 +122,9 @@ func (out *progressOutput) WriteProgress(prog progress.Progress) error {
> + 		jsonProgress := jsonmessage.JSONProgress{Current: prog.Current, Total: prog.Total, HideCounts: prog.HideCounts, Units: prog.Units}
> + 		formatted = out.sf.formatProgress(prog.ID, prog.Action, &jsonProgress, prog.Aux)
> + 	}
> ++
> ++	out.mu.Lock()
> ++	defer out.mu.Unlock()
> + 	_, err := out.out.Write(formatted)
> + 	if err != nil {
> + 		return err
> +-- 
> +2.44.1
> +
> -- 
> 2.35.6
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9318): https://lists.yoctoproject.org/g/meta-virtualization/message/9318
> Mute This Topic: https://lists.yoctoproject.org/mt/114208293/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


