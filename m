Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94740CA1012
	for <webhook@archiver.kernel.org>; Thu,  4 Sep 2025 01:41:06 +0000 (UTC)
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
 by mx.groups.io with SMTP id smtpd.web10.29702.1756950063945783658
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 03 Sep 2025 18:41:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QEXtgu9M;
 spf=pass (domain: gmail.com, ip: 209.85.219.46, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-726e7449186so5846876d6.0
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 03 Sep 2025 18:41:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756950063; x=1757554863; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sa5RNM6hYhYNUHMmUHExYIgX+K9aE3r0lbp7Ojh2qS0=;
        b=QEXtgu9MYWWOfWR7WRKZf6LbRCREzQ4WyIt1uCaXYTSVSOzdE5EnGuY11ieU+rwRp1
         TTeBomn3+DsCPGdE4wXZKJwr5N03jGkXul4VQFXi6eKUKEnpOLb8rgI8v1fIJUzAUJwH
         u0UtR7jrc5yxK+l7602SWXg3OU6f0iAU38B1qB/YBVE5Vck2JOvWaimjJ/gfd8qQt3I7
         iqcxE18iXwlDzfpzs+sC3R9IWS608ilrrY7D7508bWG0RDoFQRJs831JZ7y83RST3wZj
         myk0aYyHNfedFOY7OYlxgMyyF8mmK2jiy28+LAaaEHYFd436fdl+5QaeHTk423/DMWOy
         XjeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756950063; x=1757554863;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sa5RNM6hYhYNUHMmUHExYIgX+K9aE3r0lbp7Ojh2qS0=;
        b=GMskXEOjOeZQe7/5oPvrdnrH/pUQgkGIKAkLlLBcW3CLHVfvQMyIP4JyHGXArYaela
         B04i52BmFXZlH9Y6d/wD66xlCuWk722eRHWnlgniZjCyyyQus7Er6K/U7vIPpP/9i4Qc
         Y93fHA7pC8irqPgMCjxU4NpCvKTOrjEXhhje4STH/11iqh/pERAF58qUVP9mofgpu8yw
         7XjjEFfi+vji80HvYlDCJmdEZosZdKfPH3TG2BWq+ive2NFHCThgL0ocYfYI9ewJZkAz
         6cduF+Lidm1hgvA0jKaGgHglpt2K9UB1EKbVcRsSMSFphbJPfwelWq44E/stpEVZuWqP
         ZBSg==
X-Gm-Message-State: AOJu0YwCWPnqHtsu5Krvc4Q+z+UczJheLq6+1vljjJEi70Qy29bztBZE
	9vKMB6T8ct8PVuAreBsBW4KH06gGINQFiBRWSQ5pRAis0YnNOx9atbMx
X-Gm-Gg: ASbGncsa+FqK/4B3jH971n2J706b8PTKTJ/cZvbHAZ2qTZsh6b+UtSzOjLQfPAZxXW5
	W28WWw0DkxQUgaU3OXN8T+IjJB1FgHwjrVycVktSa96f8NIAkt8uH8I00RO7mexW+lp7WOkC/z2
	dQXiqbRldqiNVm0Sz9DGQdlcanf33EO4BLQRPI5EQ6QffOuqYrewgCZFbopyk8JHlLYizqwRumb
	sQrn1OZCFw1QRBMh3h/ct0Syf4TcjrKZdOoqannWjNNjj/sZqLbw3vDqa5XhiimhRHuxRlKYDtl
	I4GP8ERwi7rtXwwwlDXMQIBl1V5dvHWOzF3mTjtMK8UT7C1ZIl04nxFkM9kH0Mu3LKkE+uVIbL6
	DmQ5YUTaLq+5USj6hAIlxKqnaq99B5BHtV9CJn6LrkkMCmVEybxO271DXeNWYc6RPt/12KLnmKC
	sQsYvh7uQE9x/RWBXJkIQ3SUwHMaoPDCuM2cumMBOdmnHfqX8bDLgBUg==
X-Google-Smtp-Source: AGHT+IHLXv9sR/ha8mXervr7CM5yiK408ihQYeEYfEOHKNhWhlbw3zGTXcdqdLL2lrUEi+7xoMw5oQ==
X-Received: by 2002:a05:6214:2029:b0:725:370b:6f14 with SMTP id 6a1803df08f44-725370b7077mr55106606d6.63.1756950062870;
        Wed, 03 Sep 2025 18:41:02 -0700 (PDT)
Received: from gmail.com (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-720b6a1beabsm37943156d6.70.2025.09.03.18.41.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 18:41:02 -0700 (PDT)
Date: Wed, 3 Sep 2025 21:41:00 -0400
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: "Anil Dongare -X (adongare - E INFOCHIPS PRIVATE LIMITED at Cisco)" <adongare@cisco.com>
Cc: meta-virtualization@lists.yoctoproject.org, vchavda@cisco.com
Subject: Re: [meta-virtualization] [master] [PATCH] grpc-go 1.59.0+git:
 Ignore CVE-2024-7246
Message-ID: <aLjuLJii7LPeOuoK@gmail.com>
References: <20250829052335.2162583-1-adongare@cisco.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250829052335.2162583-1-adongare@cisco.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 04 Sep 2025 01:41:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9373

merged to master-next

Bruce

In message: [meta-virtualization] [master] [PATCH] grpc-go 1.59.0+git: Ignore CVE-2024-7246
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
> index 839a4f9c..c2990869 100644
> --- a/recipes-devtools/go/grpc-go_git.bb
> +++ b/recipes-devtools/go/grpc-go_git.bb
> @@ -41,3 +41,8 @@ FILES:${PN} += " \
>  # some CVEs are reported with "cpe:2.3:a:grpc:grpc:*:*:*:*:*:go:*:*"
>  # it's better to have false positives than false negatives
>  CVE_PRODUCT += "grpc"
> +# CVE-2024-7246 is an HTTP/2 HPACK poisoning issue in gRPC C-core
> +# (C/C++ implementation, meta-openembedded).
> +# grpc-go (Go implementation in meta-virtualization) does not
> +# contain the affected HPACK code path.
> +CVE_STATUS[CVE-2024-7246] = "not-applicable-config: CVE is for grpc (C-core), not grpc-go."
> -- 
> 2.44.1
> 

