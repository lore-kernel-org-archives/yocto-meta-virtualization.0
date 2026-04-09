Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00235F31E40
	for <webhook@archiver.kernel.org>; Thu,  9 Apr 2026 15:39:07 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.132676.1775742736931759832
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 09 Apr 2026 06:52:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=tELsamr3;
 spf=pass (domain: gmail.com, ip: 209.85.208.51, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-67010289b73so1307619a12.0
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 09 Apr 2026 06:52:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775742735; x=1776347535; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3rsKRw8L3v3ClU2ZJ7m5UNB+8hUEjlXWHtrMOXYtH2w=;
        b=tELsamr3dpjOLNfnOaj6c8+0qqRqofqc+qCZmOnOU7wwzSqGQk7lR5kijQQ1l8A49M
         CjjRPT+1Q79MgGTd2BZunsiLoe/sAC4BYAR5rVnFUG2U/wdMEDAwZgtbfD12IVx4z5ME
         Sj+ra3YK6EAskaZg2TdJNKHn5inNIVrfF39id2cIg2IT8f6aEw16RxUkRvtufg1KxFTy
         VDKnG1tsJWFzAqcTo/C/x9g5UM+uwwKfrjPI7MquA5VUEHfzA76g5XZKdPSaXf9g3tSE
         HkaSuRp6DFCZ6MaVEJGah44u9mUF6f2/4dRfeOID15c6FmWkS9HO8hOJd2LqJHv+eL6g
         u/Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775742735; x=1776347535;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3rsKRw8L3v3ClU2ZJ7m5UNB+8hUEjlXWHtrMOXYtH2w=;
        b=YliIj/BXhMRcRAIJcTsvrBBZMrY4zGJqoa4hItBLfClQ3SGjEFxghM8u19hlErTQ8K
         ARt6N8kqu7BC3DQnUumZUwcZeKwL/dxs2zi/iQms9jziZkeCLpukMjpaMGyf+rLJlniy
         XiSjXVSMDSAorR40BTWXSFW5i5+g6N6Pz8vGRABh7vi64V+jl4d4nYlerausKo1qD2wH
         QjXZfFQ//4418hivQMQpXaEawtxyHVGPEdNKMxFVEAfUq1fqXzROhSoqKncU4dyNnEFc
         QjEbFfiKXZGtUjZC+a2on4RA0MUlpaNvPGvbtJnanAmN4XviZKKYP+J/DShDy4N+Br8z
         Gh2w==
X-Gm-Message-State: AOJu0Yw14vXQHOcsOqlJt4h92P0C8dpCSSvhkVxN0d6tnKM7XD0w+t2H
	4bye/SoKyDKVtmqlhWQFkaJ+pJITal0Jy8hjr06GnDy0QHvfIslhtpOM
X-Gm-Gg: AeBDievpn8D7DVpZJRIPEicSPz6nqR+FAT1gXXNB+OEWk/tIGUsg+YXQoNK9iBZ12ir
	8Y3CdKwp38ypWAVxnbsil0X+GN6D4q+SCFPrWbNWUb5ls+S2H4DInA4yRL3h0VCZLvdNS9o0VWd
	ZDjEcL0UPJN9rnS+xUqn47dGkP39JRpLpaSpLYpef7XcXLSGF2yNY4dM9pRcnogXB5HWvCZHtvI
	ZzIqW75tSutyHXnTMICZlhymInAQNsT8ph7fPszIg6RySwb7nDeun+yd0jw7x89eC5LEyJk2ntp
	sa8JQrQV8CC/DfGlttmVnNM9FAkM28ueAZZ3gPXyah3DsRC0LjVvMEK3KjS8Ae83M6gbbpTXG/M
	OilTBw11c5uP+g0Ltuzhxg0RztEoDPLCOM9GstTLZ03nV0HzXouryW50QDt/RbOkukeaxEZJ2tB
	3B0313JX/hLdtBEKt3J5c7TGhztliz53O76Io/lxNZoGNU8LdleB5LE0/iQzDhLmKYj1rErAxK9
	1gUKU1UR9e9M0wnztCgVe3omEEP9HVKXsAcIt9wg1O/3QU=
X-Received: by 2002:a17:907:9405:b0:b9d:14ec:fd8e with SMTP id a640c23a62f3a-b9d14ecfebdmr501563966b.48.1775742734613;
        Thu, 09 Apr 2026 06:52:14 -0700 (PDT)
Received: from gmail.com (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9c3c574041sm749184966b.0.2026.04.09.06.52.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 06:52:13 -0700 (PDT)
Date: Thu, 9 Apr 2026 13:52:10 +0000
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: li.zhou@windriver.com
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][PATCH] yq: fix do_compile failure caused
 by CGO_ENABLED="0"
Message-ID: <adevClwFTTJx0xnq@gmail.com>
References: <20260408084052.693958-1-li.zhou@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260408084052.693958-1-li.zhou@windriver.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 09 Apr 2026 15:39:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9690

merged.

Bruce

In message: [meta-virtualization][PATCH] yq: fix do_compile failure caused by CGO_ENABLED="0"
on 08/04/2026 Li Zhou via lists.yoctoproject.org wrote:

> New version of yq need set CGO_ENABLED="0" when compiling,
> and this causes do_compile failure for 32 bits target as below:
> -buildmode=pie requires external (cgo) linking, but cgo is not enabled
> 
> Tool go's internal linker doesn't support PIE for linux 32 bits target,
> so -buildmode=pie requires external (cgo) linking on ARM and x86.
> To fix this conflict with CGO_ENABLED="0", remove "-buildmode=pie"
> from GOBUILDFLAGS.
> 
> Signed-off-by: Li Zhou <li.zhou@windriver.com>
> ---
>  recipes-devtools/yq/yq_git.bb | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/recipes-devtools/yq/yq_git.bb b/recipes-devtools/yq/yq_git.bb
> index ac19f2c4..759cd616 100644
> --- a/recipes-devtools/yq/yq_git.bb
> +++ b/recipes-devtools/yq/yq_git.bb
> @@ -35,6 +35,10 @@ GO_MOD_DISCOVERY_GIT_REF = "${SRCREV_yq}"
>  inherit go goarch ptest
>  inherit go-mod-discovery
>  
> +# GO's internal linker doesn't support PIE for linux 32 bits target,
> +# so -buildmode=pie requires external (cgo) linking on ARM and x86.
> +GOBUILDFLAGS:remove = "-buildmode=pie"
> +
>  do_compile() {
>      cd ${S}/src/import
>  
> -- 
> 2.51.2
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9688): https://lists.yoctoproject.org/g/meta-virtualization/message/9688
> Mute This Topic: https://lists.yoctoproject.org/mt/118721968/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


