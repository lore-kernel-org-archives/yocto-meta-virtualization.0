Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06F45C74A5B
	for <webhook@archiver.kernel.org>; Thu, 23 Mar 2023 23:09:23 +0000 (UTC)
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
 by mx.groups.io with SMTP id smtpd.web10.88813.1679612952805941104
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 23 Mar 2023 16:09:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=AWjkhoqZ;
 spf=pass (domain: gmail.com, ip: 209.85.160.169, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f169.google.com with SMTP id t19so363qta.12
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 23 Mar 2023 16:09:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679612952;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Yj9fhmQwYbF1+T8Ml1q366P+O24p8qIGvrk27deV3Rc=;
        b=AWjkhoqZ0/hcLNv42mUmf6u5a7pjTahVbw4YTY5EFU0uOhg+no2DcAS7QdzvTD/kRh
         5+0EQh7nB1b0+343R5gXkXb8zQ9vsuQObfTV2mOohAvf3k7ovxWaIVLSLhlWBztHhvXw
         1/9+TAMSGsl+GFM5HdhIPTgAHJBEplrcEjPBWvEY+YphQ3MJ6r8bak4ZeQtQtC9LkEqL
         yZHyQABTQFRLQtf96FLoYLLc7rVBJpvC9EZ006eIZPDYAK1CztYdP0AdpdTg8/MDVhco
         oruXu//zdV3WmwQl9D/N/2/rg50bbzy4k1slK5QyzM4WLfXn+UeRNAlbk+4g1lQ8p0PR
         Orvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679612952;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yj9fhmQwYbF1+T8Ml1q366P+O24p8qIGvrk27deV3Rc=;
        b=NEv2H5X+AviodkL8bghatFw20cUfbg/Fvdy3xAsIyVN+tjrmieLEhsHAjgEyy4lLPC
         ol699ZtUbpy2E7k18xqPcip4ME/zpRArvtu3/29W1dpexbeC6JiHX7I0bbsEyrR91k89
         c+dE1P4hSoo/UK1Gc2s1g7vkjj7oROyY96kLhHfi6/OW1fzXBGb6t/WS4WnrJXOf8zyE
         mqkJ+fSgZfb3mUaEgB1+tGdnGKKNfbxTbva5lzyDX345tj7bACLvkRCjAqbHyIuQVRRq
         7NfU/f5GUrdXj5mnaLxzDclWvV2y8JVMm5xDOASzsspjX+hnTbzrLLVmdVd1RNi9Ipbc
         Og+g==
X-Gm-Message-State: AO0yUKVdjzAroONqerzDqqVRu42HDj87wMoKC2seGoIIVLaIG0dlEI9W
	DBG8oUGxSAxIbjVJUf84vktBtTpZ0zVkHQ==
X-Google-Smtp-Source: AKy350Yf1PQmTHabmDDPOIyn6qOiLPZzr+ov2Cls2g1Ka6BgWaPkHZAE6iyrhDXq+x7EdUXxtZWHcw==
X-Received: by 2002:ac8:5a48:0:b0:3d8:6b0d:f9a6 with SMTP id o8-20020ac85a48000000b003d86b0df9a6mr2058975qta.61.1679612951734;
        Thu, 23 Mar 2023 16:09:11 -0700 (PDT)
Received: from gmail.com (cpe7c9a54441c1f-cm7c9a54441c1d.cpe.net.cable.rogers.com. [173.34.238.88])
        by smtp.gmail.com with ESMTPSA id x23-20020ac87317000000b003b63b8df24asm5669243qto.36.2023.03.23.16.09.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Mar 2023 16:09:11 -0700 (PDT)
Date: Thu, 23 Mar 2023 19:09:09 -0400
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Wentao Zhang <wentao.zhang@windriver.com>
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization] [[PATCH] botocore: Fix rejecting URLs with
 unsafe characters in is_valid_endpoint_url()
Message-ID: <ZBzcFWsvOk8wbrns@gmail.com>
References: <20230321062823.2778260-1-wentao.zhang@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230321062823.2778260-1-wentao.zhang@windriver.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 23 Mar 2023 23:09:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7954

merged.

Bruce

In message: [meta-virtualization] [[PATCH] botocore: Fix rejecting URLs with unsafe characters in is_valid_endpoint_url()
on 21/03/2023 Wentao Zhang wrote:

> The function is_valid_endpoint_url() in botocore is designed to validate
> endpoint URLs, but it fails to detect unsafe characters with Python 3.9.5+
> and other versions carrying bpo-43882 fix. The issue is caused by urlsplit()
> silently stripping LF, CR, and HT characters while splitting the URL,
> which disarms the validator in botocore.
> 
> This patch detects unsafe characters in is_valid_endpoint_url() and
> is_valid_ipv6_endpoint_url() early, in order to fix rejecting invalid URLs
> with unsafe characters.
> 
> Signed-off-by: Wentao Zhang <wentao.zhang@windriver.com>
> ---
>  ...Ls-with-unsafe-characters-in-is_vali.patch | 58 +++++++++++++++++++
>  .../python/python3-botocore_1.20.51.bb        |  2 +
>  2 files changed, 60 insertions(+)
>  create mode 100644 recipes-devtools/python/python3-botocore/0001-Fix-rejecting-URLs-with-unsafe-characters-in-is_vali.patch
> 
> diff --git a/recipes-devtools/python/python3-botocore/0001-Fix-rejecting-URLs-with-unsafe-characters-in-is_vali.patch b/recipes-devtools/python/python3-botocore/0001-Fix-rejecting-URLs-with-unsafe-characters-in-is_vali.patch
> new file mode 100644
> index 0000000..6a43608
> --- /dev/null
> +++ b/recipes-devtools/python/python3-botocore/0001-Fix-rejecting-URLs-with-unsafe-characters-in-is_vali.patch
> @@ -0,0 +1,58 @@
> +From 370cdf7d708c92bf21a42f15392f7be330cf8f80 Mon Sep 17 00:00:00 2001
> +From: =?UTF-8?q?Micha=C5=82=20G=C3=B3rny?= <mgorny@gentoo.org>
> +Date: Fri, 7 May 2021 19:54:16 +0200
> +Subject: [PATCH] Fix rejecting URLs with unsafe characters in
> + is_valid_endpoint_url() (#2381)
> +
> +Detect unsafe characters in is_valid_endpoint_url()
> +and is_valid_ipv6_endpoint_url() early, in order to fix rejecting
> +invalid URLs with Python 3.9.5+ and other versions carrying bpo-43882
> +fix.  In these versions, urlsplit() silently strips LF, CR and HT
> +characters while splitting the URL, effectively disarming the validator
> +in botocore.
> +
> +The solution is based on a similar fix in Django.
> +
> +Fixes #2377
> +---
> + botocore/utils.py | 10 ++++++++++
> + 1 file changed, 10 insertions(+)
> +
> +diff --git a/botocore/utils.py b/botocore/utils.py
> +index 378972248..d35dd64bb 100644
> +--- a/botocore/utils.py
> ++++ b/botocore/utils.py
> +@@ -173,6 +173,10 @@ ZONE_ID_PAT = "(?:%25|%)(?:[" + UNRESERVED_PAT + "]|%[a-fA-F0-9]{2})+"
> + IPV6_ADDRZ_PAT = r"\[" + IPV6_PAT + r"(?:" + ZONE_ID_PAT + r")?\]"
> + IPV6_ADDRZ_RE = re.compile("^" + IPV6_ADDRZ_PAT + "$")
> + 
> ++# These are the characters that are stripped by post-bpo-43882 urlparse().
> ++UNSAFE_URL_CHARS = frozenset('\t\r\n')
> ++
> ++
> + def ensure_boolean(val):
> +     """Ensures a boolean value if a string or boolean is provided
> + 
> +@@ -977,6 +981,8 @@ class ArgumentGenerator(object):
> + 
> + 
> + def is_valid_ipv6_endpoint_url(endpoint_url):
> ++    if UNSAFE_URL_CHARS.intersection(endpoint_url):
> ++        return False
> +     netloc = urlparse(endpoint_url).netloc
> +     return IPV6_ADDRZ_RE.match(netloc) is not None
> + 
> +@@ -990,6 +996,10 @@ def is_valid_endpoint_url(endpoint_url):
> +     :return: True if the endpoint url is valid. False otherwise.
> + 
> +     """
> ++    # post-bpo-43882 urlsplit() strips unsafe characters from URL, causing
> ++    # it to pass hostname validation below.  Detect them early to fix that.
> ++    if UNSAFE_URL_CHARS.intersection(endpoint_url):
> ++        return False
> +     parts = urlsplit(endpoint_url)
> +     hostname = parts.hostname
> +     if hostname is None:
> +-- 
> +2.25.1
> +
> diff --git a/recipes-devtools/python/python3-botocore_1.20.51.bb b/recipes-devtools/python/python3-botocore_1.20.51.bb
> index ca506f6..f71db1f 100644
> --- a/recipes-devtools/python/python3-botocore_1.20.51.bb
> +++ b/recipes-devtools/python/python3-botocore_1.20.51.bb
> @@ -8,3 +8,5 @@ SRC_URI[sha256sum] = "c853d6c2321e2f2328282c7d49d7b1a06201826ba0e7049c6975ab5f22
>  inherit pypi setuptools3
>  
>  RDEPENDS:${PN} += "python3-jmespath python3-dateutil python3-logging"
> +
> +SRC_URI += "file://0001-Fix-rejecting-URLs-with-unsafe-characters-in-is_vali.patch"
> -- 
> 2.25.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7950): https://lists.yoctoproject.org/g/meta-virtualization/message/7950
> Mute This Topic: https://lists.yoctoproject.org/mt/97749704/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


