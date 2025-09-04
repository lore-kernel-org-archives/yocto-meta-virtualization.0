Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96240CA1010
	for <webhook@archiver.kernel.org>; Thu,  4 Sep 2025 01:40:36 +0000 (UTC)
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
 by mx.groups.io with SMTP id smtpd.web10.29694.1756950030801914614
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 03 Sep 2025 18:40:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Eip9QQWJ;
 spf=pass (domain: gmail.com, ip: 209.85.160.172, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-4b32bbefa14so6895461cf.1
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 03 Sep 2025 18:40:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756950030; x=1757554830; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fkmHBvBIyumC25wBWWgo0PQKvkbOVHjahvhyo+y2oE0=;
        b=Eip9QQWJYBAc9NpWHfEgFfjlEkFrFaNURGHqpruaP3++fRypRXPE27oEJXsEEdYEW6
         bIbHjTDoxE6tHy+nnNECVHLolwiK4W7iLQ3LdDM+4Wzaiw3ZO18gZiH0mMBQLt765eBR
         lZKBmu6IJnUbykJopV15zvD4MvJZg3FIRS112aiszX9ux9OIEl9MHku5tWodJ0uh/VrZ
         TJXfJ+LD+WmV4N1MuFlBlwdurZd9F2gT3fDATOv7Nl9lT2EgfUbp+L9+rtFYFPqGZiru
         6MoKRaM97qW0/AQMukKhYfXVmNTFI6bor16RchO2roby7/BgucCdf0bKIezZBNwsMDb3
         PooQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756950030; x=1757554830;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fkmHBvBIyumC25wBWWgo0PQKvkbOVHjahvhyo+y2oE0=;
        b=Ip9dzesp46ayAn7+qqouvCIFMCWFcQzptpm5+/TqKKScigtGbfE/GpDOAlzTAEd4EL
         53jF81gls/vA5GXswPLA//Dh0eP5khNBtSjE7fB+NmMmsumYsb3848O21xv/QqqIWhF7
         p+6z0jx3fNO6G5llvRicG1oGG3qqH0O368e1lHyKH8gcdQGEogTK7SQvARZsuMo35/iW
         kz7qySU32QIvxCiDi7mDa1feth/rVlvNWFSVXjxkKVLpuJ+wKCfHTxw7GFFp6btm5g9l
         a9vlXRtJ8Tz4IggHTaMj7So2MypyhZQWkiNPkNh11yC7VSBVYPTC0lbdA/Ng0VZnbDng
         DPRQ==
X-Gm-Message-State: AOJu0YyC4QXVGddwrlx3ly3KcGjeJK4Hl6W4NzjVTc9ZzFj19KEM4O1w
	WAjs6f+kDYNhwYw5gT0/CcQ0yar+kR2Ouha6oW4p3e3Wvkui9vUJfUNJ+eWoBSSd
X-Gm-Gg: ASbGncvmzGT1pJ83jqFuxhoXPgFVuSdoBXQdNOXORAUJn095/rjudwodReC5t4pN6Ud
	JWtvKyRe1jYiLImlzQDdgJFq32D8wcih91HWEugV2dWve561y3Rh0i8KNnmlHP1RSPs0jJW1Erw
	yM5gcPIZTZZw9XQrBSv9kZ73g89JOAqnhKIKeu4eKL/wlcrdu1t2Zol6kDeIiK/B1L5kN+iv36v
	7MDWcb3C4TvgplIDtk7j/7RRhf1jIjrZwcO6F+QK38LQ77t8bSZZZce336vhsM7tLQP6qgr9Tkm
	mZkAO1jTPha2SsPl2xdUsVX3ath4G+GL+VWFWFzDCaTuvBi8cSvkGJ8n0Im7oHci5HaGQcoZbyL
	877yeg6n/VvCiPTpWIvEhtzmNtTAJo9WFCtjAAogzh4G9arVf6fKtqUEkVBh9DF3KJbAliqVfT3
	+fMNDFZc5Ots1+fLBzhfJbtEW590Zyrk2PZqlOLd+82s0=
X-Google-Smtp-Source: AGHT+IHJv31UbjH4NwnJaGipaI4IfCY0Xr4TWfOs0Pp5Zmfcvmso9aXpHc39Y7+UvnjwSpTRF9JRwQ==
X-Received: by 2002:a05:622a:1981:b0:4b3:ea6:e0ec with SMTP id d75a77b69052e-4b31d8a34c2mr190008311cf.30.1756950029663;
        Wed, 03 Sep 2025 18:40:29 -0700 (PDT)
Received: from gmail.com (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4b48f6582f6sm20871211cf.13.2025.09.03.18.40.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 18:40:29 -0700 (PDT)
Date: Wed, 3 Sep 2025 21:40:27 -0400
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: "Anil Dongare -X (adongare - E INFOCHIPS PRIVATE LIMITED at Cisco)" <adongare@cisco.com>
Cc: meta-virtualization@lists.yoctoproject.org, vchavda@cisco.com
Subject: Re: [meta-virtualization] [scarthgap] [PATCH] grpc-go 1.59.0+git:
 Ignore CVE-2024-7246
Message-ID: <aLjuC1lJ1TVOo0vp@gmail.com>
References: <20250829045345.2030325-1-adongare@cisco.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250829045345.2030325-1-adongare@cisco.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 04 Sep 2025 01:40:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9372

In message: [meta-virtualization] [scarthgap] [PATCH] grpc-go 1.59.0+git: Ignore CVE-2024-7246
on 28/08/2025 Anil Dongare -X (adongare - E INFOCHIPS PRIVATE LIMITED at Cisco) wrote:

> From: Anil Dongare <adongare@cisco.com>
> 
> Upstream Repository: https://github.com/grpc/grpc-go
> 
> Bug Details: https://nvd.nist.gov/vuln/detail/CVE-2024-7246
> Type: Security Fix
> CVE: CVE-2024-7246
> Score: 6.3 (Medium)
> Patch: https://github.com/grpc/grpc/issues/36245
> 
> Analysis:
> -CVE-2024-7246 describes an HTTP/2 HPACK header table poisoning
>  issue found in the gRPC C-core implementation (grpc/grpc).
> -The vulnerability does not apply to the pure Go implementation
>  (grpc-go) used in Yocto (meta-virtualization layer).
> -Marking as not-applicable-config (implementation difference).
> -The affected code path is not present in grpc-go.Hence ignoring the
>   CVE for grpc-go.

merged.

Bruce

> 
> Reference:
> [1] https://nvd.nist.gov/vuln/detail/CVE-2024-7246
> [2] https://github.com/grpc/grpc/issues/36245
> [3] Upstream gRPC release notes confirming fixed versions for gRPC
>     C-core (not grpc-go).
> 
> Signed-off-by: Anil Dongare <adongare@cisco.com>
> ---
>  recipes-devtools/go/grpc-go_git.bb | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/recipes-devtools/go/grpc-go_git.bb b/recipes-devtools/go/grpc-go_git.bb
> index 7989c02f..fdfc2307 100644
> --- a/recipes-devtools/go/grpc-go_git.bb
> +++ b/recipes-devtools/go/grpc-go_git.bb
> @@ -43,3 +43,8 @@ FILES:${PN} += " \
>  # some CVEs are reported with "cpe:2.3:a:grpc:grpc:*:*:*:*:*:go:*:*"
>  # it's better to have false positives than false negatives
>  CVE_PRODUCT += "grpc"
> +# CVE-2024-7246 is an HTTP/2 HPACK poisoning issue in gRPC C-core
> +# (C/C++ implementation, meta-openembedded).
> +# grpc-go (Go implementation in meta-virtualization) does not
> +# contain the affected HPACK code path.
> +CVE_STATUS[CVE-2024-7246] = "not-applicable-config: CVE is for grpc (C-core), not grpc-go."
> -- 
> 2.43.5
> 

