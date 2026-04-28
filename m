Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0053FF8868
	for <webhook@archiver.kernel.org>; Tue, 28 Apr 2026 11:43:43 +0000 (UTC)
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11061.1777376616080868225
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 28 Apr 2026 04:43:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=QR5ZcWGV;
 spf=pass (domain: gmail.com, ip: 209.85.222.169, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-8ef5776530bso731071285a.0
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 28 Apr 2026 04:43:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777376615; x=1777981415; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=EJYti9lGuUR2OZtslcPo5gWBjzIdn+y1x6ApSUabcuQ=;
        b=QR5ZcWGVFxWNyKT9Obo6wSbzV2Z61h/MmLWVD1+loC7lMc5yf9z/YnaeBCwuM8hbo8
         MwmgniljhAXEGf47f+r+Py0fo+j3yahE9P0tUiIin4vs4MRSZm8Hk6r9453XxPwmuukT
         TH7zOPCWkQKjn3/VAhw5B/OjfM7KNmy6fBOyzHpxsMwAunkYUhsFpH4eySA689/JlQDu
         eA64OwR5QluCktQ32NOMqwpP9o1PxW9t6rUmjJVXDJ2K3rpM1XfzxhS/eu/nRSGgihX1
         SX7gzkL+9DwTh79+P0GC+ZS25TGxrGIHJTcwsRGjXyHbZH85AOyPl8bZ/qL56rlRZRif
         OZDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777376615; x=1777981415;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EJYti9lGuUR2OZtslcPo5gWBjzIdn+y1x6ApSUabcuQ=;
        b=LlDvzwoZKRoNHG9UkgoSdR5WRbzEEK9exrj9kzG5AQBeb4xBoqlC763xlmMzUN90I8
         yZuI/mxaljZx0qBOuGkzlV0QHM//AjNZqctha54KNYYyADDiobxgFEbJ5BmFMStXspGt
         xZbSsTxqufioojt77lHy2ivZ65++vsOHkQBnnmL0OT7a5SDqXSNBnS9ZsOowWJgvPDT3
         b3JLcz2HmAPOKcAZ0TKuU5oVPRLsgSkG5feJOFOOMXbgaCnGM2Xhpai0nZvAtT2MNoM+
         DlfOBv5/ubxmCGNS1P+q1C2Uiz43wCXEfXzk85g+WiLRhIwOnKk555CtJszrbkV7fHqA
         Vzng==
X-Gm-Message-State: AOJu0YxTTfWqre4bYkysCsMARxhl/im/nJROd6rZJS3jmmY9Drh6k20o
	KI8TtbpNpOs08KPbH3HR/8LLE7bo7l6UPYQJeykqSoDrkLugA5w/D3zYVxS90EO+Syl53g==
X-Gm-Gg: AeBDievnAllTGOwd4xOYX8BEqzpX9fWWxB+8FRhP1hXKk8OvU/jFnoNQDDmpPPsXsDV
	eWYSP4bVhm46YmzGtG5InPrM4ALQUgAzNZ9zIanJ9BmJKGmQeuA6gCZgF05vo9RMRdei2xRd0bZ
	1uZ6bZZzOtKbeTPM5YaGlOSriojFaXG7OT333KWk7ObOHxvqKXzXMlvxocwkJHQd4rz/sWzq/Aq
	tTa8cCwxnTj5tdO2IKMm0YgshrEjmNpZjYJjoXA9rsEsAWmMY1TyWCsN81mF0Wy56NGg0FPKQhY
	4wdMumRYVm4JrMZksGczzJo/NJKId2OfWShqCNwHG7lO7nv85HDaf5C6p8ShVnCFgpq3nG+zSPz
	UqSMt33Wdazd6qsRiuXosD/Yk61ViRR0iROmWHePp3MHQFdrOX3FTY91PJ9awYU7tOSreMKpdtH
	AvXUpL1rCq6tTgaPLAIWmjhUOUouaMPTGOL8jQQSDqBPElkBVP5tMAYJhRqEd0QB2dcfuuMByJj
	RXUnhwRiF182wM/vSV8TXa2U7PFHjO+d57SS21WKUqMThw=
X-Received: by 2002:a05:620a:4413:b0:8cf:d441:c7c0 with SMTP id af79cd13be357-8f7d9207fb7mr332393185a.34.1777376614977;
        Tue, 28 Apr 2026 04:43:34 -0700 (PDT)
Received: from gmail.com (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8f7c48c71fesm201947185a.5.2026.04.28.04.43.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 04:43:34 -0700 (PDT)
Date: Tue, 28 Apr 2026 11:43:32 +0000
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: mingli.yu@eng.windriver.com
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization] [scarthgap][PATCH v2] podman: Upgrade
 5.0.1 -> 5.0.3
Message-ID: <afCdZEDojW6PSeCJ@gmail.com>
References: <20260424094738.2143616-1-mingli.yu@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260424094738.2143616-1-mingli.yu@windriver.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 28 Apr 2026 11:43:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9764

merged.

Bruce

In message: [meta-virtualization] [scarthgap][PATCH v2] podman: Upgrade 5.0.1 -> 5.0.3
on 24/04/2026 Yu, Mingli via lists.yoctoproject.org wrote:

> From: Mingli Yu <mingli.yu@windriver.com>
> 
> Upgrade podman to 5.0.3 to include some bugfixes and some security fix
> such as CVE-2024-3727 [1].
> 
> Release notes:
> Security
>   This release addresses CVE-2024-3727, a vulnerability in the
> containers/image library which allows attackers to trigger authenticated
> registry access on behalf of the victim user.
> 
> Bugfixes
>   Fixed a bug where podman machine start would fail if the machine
> had a volume with a long target path (#22226).
>   Fixed a bug where podman machine start mounted volumes with paths
> that included dashes in the wrong location (#22505).
> 
> Misc
>   Updated Buildah to v1.35.4
>   Updated the containers/common library to v0.58.3
>   Updated the containers/image library to v5.30.1
> 
> [1] https://github.com/containers/podman/releases/tag/v5.0.3
> 
> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> ---
>  recipes-containers/podman/podman_git.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/recipes-containers/podman/podman_git.bb b/recipes-containers/podman/podman_git.bb
> index ef9798f0..b80b8d5b 100644
> --- a/recipes-containers/podman/podman_git.bb
> +++ b/recipes-containers/podman/podman_git.bb
> @@ -17,7 +17,7 @@ DEPENDS = " \
>      gettext-native \
>  "
>  
> -SRCREV = "bb81e85a430fa95d23a15b77c717fd68bf06ebf2"
> +SRCREV = "d08315df35cb6e95f65bf3935f529295c6e54742"
>  SRC_URI = " \
>      git://github.com/containers/libpod.git;branch=v5.0;protocol=https \
>      ${@bb.utils.contains('PACKAGECONFIG', 'rootless', 'file://50-podman-rootless.conf', '', d)} \
> @@ -33,7 +33,7 @@ GO_IMPORT = "import"
>  
>  S = "${WORKDIR}/git"
>  
> -PV = "5.0.1+git"
> +PV = "5.0.3+git"
>  
>  CVE_STATUS[CVE-2022-2989] = "fixed-version: fixed since v4.3.0"
>  CVE_STATUS[CVE-2023-0778] = "fixed-version: fixed since v4.5.0"
> -- 
> 2.49.0
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9742): https://lists.yoctoproject.org/g/meta-virtualization/message/9742
> Mute This Topic: https://lists.yoctoproject.org/mt/118985012/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


