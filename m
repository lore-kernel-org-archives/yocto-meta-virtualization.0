Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EDE7CFD376
	for <webhook@archiver.kernel.org>; Tue,  2 Dec 2025 05:03:47 +0000 (UTC)
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1004.1764651823339854570
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 01 Dec 2025 21:03:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ErTDBkq+;
 spf=pass (domain: gmail.com, ip: 209.85.222.173, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-8b22624bcdaso581719885a.3
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 01 Dec 2025 21:03:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764651822; x=1765256622; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=44oUPNl79H1Ybr8X+3rPEIx8PTba7ghxgeD2cwBHq4o=;
        b=ErTDBkq+J0FGOjjnjmNu6rVO2dn4g+4d43eL5gUh8rUYLFzqexzI7o1Jg9sY0mbu/A
         SRbCxDxjyfx8/6qKwI9HV1QwSt7WxKJAGyD2NIFlBJozyslzEca5Lkhn1MJEmwUL+KaH
         I1RwepUfNE31+eQp9CFVn+A5kgvOaUIyZFRmOBK+SC+uBcvxLWllURmrCE0WyObfxE+f
         R3K5y4FPyRQmbZwbF9MeAvRxYYXYR/R9lj8zee/hfJ4tRCMnhH9ep3Ha1ptEH5l0bElo
         Sz0qCM4MjS6abJU48cy5e0DTydVlnZLKLlvs2Ryh2JmT7CWNeroE0fimOhyodyteCG/k
         j+BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764651822; x=1765256622;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=44oUPNl79H1Ybr8X+3rPEIx8PTba7ghxgeD2cwBHq4o=;
        b=QYTKo9luGnk2qbRZb9Z3OTlI1YYVPrTmz87g4qD0OTJgy12Magh6iPyWdeQGwstpxT
         147FBBijiuOTZukreRss73HufwGmTFGBWdZsnRlg4lNwwQB/QQ6o6d5+S2T/Jbvv/IVP
         wJNuBmUSmb9rJtdnkfwswXwJtGm8k3hJ7ogivgsP/zumchyx5qvQqvqsZrNkIVVQF3SI
         1imErZhsfCofCZ5vh5W4sCOJAxBS09aAgIu1sio2PdRYpAdEBh+7r+VKGj4iyrrnGm1k
         hb5/pYO5gacPBbr6rgaodH0MVcTVKcE/4XliNRCb9i4olEFCQtvrfnXS/FAJIyfg38rf
         33DA==
X-Gm-Message-State: AOJu0YwF78YT1HxVtJCbwOmcVRGdDcKqu8zmHZRSBCWsS7hoiPGnk+Mx
	zlw0V1yT5vSdGpkLLJV6GNeqNBy/UDYJkwNA9DFDR4NvVs9phDg7fwcN77wCOByJ70g=
X-Gm-Gg: ASbGncuF5NWfIUUoAH5tgTHYGsp5RIlKPK3yxnH9th5WFZzWQtVMzQN5fqs2VLfv0Aa
	7ReHMY90rMb0fHJDN9IEuEv8P9jzV6zwBUYpXc5p2VUo4xyYclMq3ZJeiMU5mytqHk72cj7WD0Y
	urVzIvkL+Aqvj2xdyCsmsW09zIMBX2OE1CeI3UCkdKjVVt09C/W/NPMHO9rlO7mY06YXVGBkUWo
	KRxrFFPlXVZI//gyX9ynjVsM7kjcEswq1HAMPUVVqc9XwI++dtGt4PpjdexF1yw0wnbrIhucrlX
	1+0gMR451rECMJhiGefE+bc0Ef1v9I84RtwiPWmCRWS/oaXmSRNzjRyWWE20cAIC2xO/NbW/4Nz
	DK2UX+s9WtD0YQYEm+lryHzQ2S3fbxw0NV8dKAOWp6hi8QZYT8nmNC3K7wBzabZTeN/eO0iOA3y
	uKRW59cSJsWK5VxwF1PbZeTZyeV5VwdMVDVjXBT2i6MSDDrMExh+NHq1ZS2080xKRFskazPO1nQ
	UA=
X-Google-Smtp-Source: AGHT+IGPFyVAOARYjKB+ijBZXZWTAkbPfnvdbSRr70rxefCy1Hytn23b/iZOdT/F7ROSHCV8OeixIA==
X-Received: by 2002:a05:620a:190c:b0:8ab:7ac3:3271 with SMTP id af79cd13be357-8b33d1fe654mr5487426985a.36.1764651822188;
        Mon, 01 Dec 2025 21:03:42 -0800 (PST)
Received: from gmail.com (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8b52a1c90ffsm1010729385a.39.2025.12.01.21.03.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Dec 2025 21:03:41 -0800 (PST)
Date: Tue, 2 Dec 2025 00:03:38 -0500
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: yi.zhao@eng.windriver.com
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization] [m-c-s][PATCH] nss-pam-ldapd: add
 UPSTREAM_CHECK_URI
Message-ID: <aS5zKusKvgc6MaZn@gmail.com>
References: <20251127135339.428115-1-yi.zhao@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251127135339.428115-1-yi.zhao@windriver.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 02 Dec 2025 05:03:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9474

merged.

Bruce

In message: [meta-virtualization] [m-c-s][PATCH] nss-pam-ldapd: add UPSTREAM_CHECK_URI
on 27/11/2025 Yi Zhao via lists.yoctoproject.org wrote:

> Add UPSTREAM_CHECK_URI to check the correct latest stable verison.
> 
> Before the patch:
> $ devtool latest-version nss-pam-ldapd
> INFO: Current version: 0.9.12
> INFO: Latest version:
> 
> After the patch:
> $ devtool latest-version nss-pam-ldapd
> INFO: Current version: 0.9.12
> INFO: Latest version: 0.9.13
> 
> Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
> ---
>  recipes-support/nss-pam-ldapd/nss-pam-ldapd_0.9.12.bb | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/recipes-support/nss-pam-ldapd/nss-pam-ldapd_0.9.12.bb b/recipes-support/nss-pam-ldapd/nss-pam-ldapd_0.9.12.bb
> index 08923275..98fcc0b3 100644
> --- a/recipes-support/nss-pam-ldapd/nss-pam-ldapd_0.9.12.bb
> +++ b/recipes-support/nss-pam-ldapd/nss-pam-ldapd_0.9.12.bb
> @@ -21,6 +21,8 @@ SRC_URI = "\
>  	file://nslcd.service \
>  	"
>  
> +UPSTREAM_CHECK_URI = "https://arthurdejong.org/nss-pam-ldapd/downloads"
> +
>  inherit autotools features_check
>  REQUIRED_DISTRO_FEATURES = "pam"
>  
> -- 
> 2.34.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9463): https://lists.yoctoproject.org/g/meta-virtualization/message/9463
> Mute This Topic: https://lists.yoctoproject.org/mt/116500718/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


