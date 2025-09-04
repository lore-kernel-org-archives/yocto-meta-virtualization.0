Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EE0DCA1010
	for <webhook@archiver.kernel.org>; Thu,  4 Sep 2025 00:03:16 +0000 (UTC)
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
 by mx.groups.io with SMTP id smtpd.web10.27805.1756944187730272090
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 03 Sep 2025 17:03:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=AHJLAm0Z;
 spf=pass (domain: gmail.com, ip: 209.85.219.52, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-7211b09f649so3371986d6.3
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 03 Sep 2025 17:03:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756944187; x=1757548987; darn=lists.yoctoproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UXkRx2iLTdm9odF69wH0RPASxakYQdA5ltlIOlA6ghw=;
        b=AHJLAm0Zz4TFbxqWraJX7OvFDvPeQcHOr27amXfbwitrbIG/5e2ucjMAJdWAiA5Jnu
         91DfmbFHYC4K1wDY3OypFC2aSs1h9gzhEhmXl5g+irfBBQjiVhSy+BcPpsMmk0/YrYew
         U1NTWXorZ/94zRme6e/ngSn7Mebv5DspmzaaijN2TvEM87RoKycPoG8visvnrMoOa7qM
         bNk/ohPVYq93g9xufjuRSf73SRlMU7aR7IgCP/FynMi8McXHIEpnAsFbh8DRK+FCqtvO
         Mj7hbIn1NTJLfOXtyrusY6CVEm7wh/yPlUKtnvdVttLKt4p/NtIWi41r8/Wjq652rl3d
         pI4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756944187; x=1757548987;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UXkRx2iLTdm9odF69wH0RPASxakYQdA5ltlIOlA6ghw=;
        b=a+Lf+pgGPZEUZPaWJ1Gt5MHMN7FN2/4Wk88JN0JyxzYIehHq2H7sAgm2+fT0cejEG+
         63buEu6BGlLjZwQbh5GeoUaVgD1MImHyoZpCThoIGQvSyWmaXTrgar1qU4Ww1e/QO/lO
         d+BoaZ05PpQxAoaZI3tX4JGtt1HUW0ZBYDf+uGocuq9UcObLLD6sinoNDRgjJApF/IY8
         geRyN7zcktWYdKr/0hnLiKMakNjFu3wcQz04Kckh03iAyPfcgWYkwCk4br+P+Hu88E+f
         W49FaUWxunKO4E2zaY7CCZjtMfvEz8FD3lSBXgsLtmzq4nyaYkFIQxTuxDxuyPkmnoFA
         sp8Q==
X-Gm-Message-State: AOJu0YzPIpeACVLZMdmssX1wuWNy7cQady58MPWWXlFXzp7ybxlX3UTU
	oB4kug4kElMp5LbqWlN3XP9ladeDVOCWJQULALdlzjwmuHACAfjn/O3s
X-Gm-Gg: ASbGncuFEchph/sphGvG40ZLsnyU6Wp5Qws7XZ+NI5XhSrM20+9MZHnpPrsYMhOJ6i0
	qWs5GzGdZlAHgNMjNftM/U5nEyraWICiALw4F2fwR8yrCYrFwsQ+9uwIweYUKKWUVqkI0AR7VSt
	fXNtrd8TyX+wzH21/4wqVUFL+6nUW2NZRL7tYUCDjLu3+NsCH+hiETo0wZ/Qjsd1MrA6Cj5D25+
	TR2lmSYK/XRkR7mANnJpwkJ23Fq19itckrcS6FNfOI1wP92D6RNI3sHtC3ll+4aOYUZIqB+2n/D
	L4LX6AGQSb75tGUCQOqsRoxOuBTxWKjdEuiYHk+Q0wTovNEEzd0rHzb3AiX5gvDetIpCLnwr7cp
	LhZ/stxNrm6G/zthGeG1QmY4ba3XoyEQksF0RWeh+e2GgdADdM3SI9q5OUK210A8ol82h+fQ8BZ
	lu5gCYLB7RdF7OBD8Jc2xlDEpoQurppSHc
X-Google-Smtp-Source: AGHT+IEU4eWQzmcJ96shvT1naxG6Nw2YGie7M2eT7z0vozfQBvM3xtq1NEwVS27jSb6Vk4SYR7WieA==
X-Received: by 2002:a05:6214:496:b0:70f:abb8:e51d with SMTP id 6a1803df08f44-70fac6f87dfmr203903506d6.10.1756944186512;
        Wed, 03 Sep 2025 17:03:06 -0700 (PDT)
Received: from gmail.com (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-720b46661b9sm37745436d6.47.2025.09.03.17.03.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 17:03:05 -0700 (PDT)
Date: Wed, 3 Sep 2025 20:03:04 -0400
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: sudumbha@cisco.com
Cc: meta-virtualization@lists.yoctoproject.org, vchavda@cisco.com,
	deeratho@cisco.com
Subject: Re: [meta-virtualization] [scarthgap] [PATCH v2] docker-moby 25.0.3:
 fix CVE-2024-36623
Message-ID: <aLjXOPctYXCxdpeP@gmail.com>
References: <CADkTA4P0tazAxhxkWU-yQjb5PufzgwC32MwN7+meSFOZSvqMoQ@mail.gmail.com>
 <20250903170850.1888472-1-sudumbha@cisco.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250903170850.1888472-1-sudumbha@cisco.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 04 Sep 2025 00:03:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9366

I'm still unable to apply any of your patches.

[/home/bruc...ualization]> git am -s ~/incoming/0001-_Re_meta-virtualization_scarthgap_PATCH_v2_docker-moby_25.0.3_fix_CVE-.patch
Patch format detection failed.

I know you've probably been through everything already, but have you double checked
the settings as described in:

https://docs.yoctoproject.org/dev/contributor-guide/submit-changes.html

Otherwise, we need to find a different way for you to send patches as something
in the path of sending is mangling them.

Bruce

In message: Re: [meta-virtualization] [scarthgap] [PATCH v2] docker-moby 25.0.3: fix CVE-2024-36623
on 03/09/2025 Sudhir Dumbhare -X (sudumbha - E INFOCHIPS PRIVATE LIMITED at Cisco) via lists.yoctoproject.org wrote:

> From: Sudhir Dumbhare <sudumbha@cisco.com>
> 
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
> 
> Changes in v2:
> 	* Fix from identity
> 	* Clean up whitespace
> 
>  recipes-containers/docker/docker-moby_git.bb  |  1 +
>  .../docker/files/CVE-2024-36623.patch         | 47 +++++++++++++++++++
>  2 files changed, 48 insertions(+)
>  create mode 100644 recipes-containers/docker/files/CVE-2024-36623.patch
> 
> diff --git a/recipes-containers/docker/docker-moby_git.bb b/recipes-containers/docker/docker-moby_git.bb
> index d274b002..e1ece0fd 100644
> --- a/recipes-containers/docker/docker-moby_git.bb
> +++ b/recipes-containers/docker/docker-moby_git.bb
> @@ -58,6 +58,7 @@ SRC_URI = "\
>          file://0001-dynbinary-use-go-cross-compiler.patch;patchdir=src/import \
>          file://CVE-2024-36620.patch;patchdir=src/import \
>          file://CVE-2024-36621.patch;patchdir=src/import \
> +	file://CVE-2024-36623.patch;patchdir=src/import \
>  	"
>  
>  DOCKER_COMMIT = "${SRCREV_moby}"
> diff --git a/recipes-containers/docker/files/CVE-2024-36623.patch b/recipes-containers/docker/files/CVE-2024-36623.patch
> new file mode 100644
> index 00000000..3878a8b1
> --- /dev/null
> +++ b/recipes-containers/docker/files/CVE-2024-36623.patch
> @@ -0,0 +1,47 @@
> +commit 5becb76fa5a5cb9de135b82017dbc7da7d345614
> +Author: Paweł Gronowski <pawel.gronowski@docker.com>
> +Date:   Thu Feb 22 18:01:40 2024 +0100
> +
> +    pkg/streamformatter: Make `progressOutput` concurrency safe
> +
> +    Sync access to the underlying `io.Writer` with a mutex.
> +
> +    Upstream-Status: Backport [https://github.com/moby/moby/commit/8e3bcf197488]
> +    CVE: CVE-2024-36623
> +
> +    Signed-off-by: Paweł Gronowski <pawel.gronowski@docker.com>
> +    (cherry picked from commit 5689dabfb357b673abdb4391eef426f297d7d1bb)
> +    Signed-off-by: Albin Kerouanton <albinker@gmail.com>
> +    (cherry picked from commit 8e3bcf19748838b30e34d612832d1dc9d90363b8)
> +    Signed-off-by: Sudhir Dumbhare <sudumbha@cisco.com>
> +
> +diff --git a/pkg/streamformatter/streamformatter.go b/pkg/streamformatter/streamformatter.go
> +index b0456e580d..098df6b523 100644
> +--- a/pkg/streamformatter/streamformatter.go
> ++++ b/pkg/streamformatter/streamformatter.go
> +@@ -5,6 +5,7 @@ import (
> +	"encoding/json"
> +	"fmt"
> +	"io"
> ++	"sync"
> +
> +	"github.com/docker/docker/pkg/jsonmessage"
> +	"github.com/docker/docker/pkg/progress"
> +@@ -109,6 +110,7 @@ type progressOutput struct {
> +	sf       formatProgress
> +	out      io.Writer
> +	newLines bool
> ++	mu       sync.Mutex
> + }
> +
> + // WriteProgress formats progress information from a ProgressReader.
> +@@ -120,6 +122,9 @@ func (out *progressOutput) WriteProgress(prog progress.Progress) error {
> +		jsonProgress := jsonmessage.JSONProgress{Current: prog.Current, Total: prog.Total, HideCounts: prog.HideCounts, Units: prog.Units}
> +		formatted = out.sf.formatProgress(prog.ID, prog.Action, &jsonProgress, prog.Aux)
> +	}
> ++
> ++	out.mu.Lock()
> ++	defer out.mu.Unlock()
> +	_, err := out.out.Write(formatted)
> +	if err != nil {
> +		return err
> -- 
> 2.23.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9365): https://lists.yoctoproject.org/g/meta-virtualization/message/9365
> Mute This Topic: https://lists.yoctoproject.org/mt/115049072/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


