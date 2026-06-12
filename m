Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 603DECD98D2
	for <webhook@archiver.kernel.org>; Fri, 12 Jun 2026 18:49:53 +0000 (UTC)
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.77433.1781290186635240768
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 12 Jun 2026 11:49:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=OoqxvCUj;
 spf=pass (domain: gmail.com, ip: 209.85.219.47, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-8ce9ddeddefso14993596d6.0
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 12 Jun 2026 11:49:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781290185; x=1781894985; darn=lists.yoctoproject.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to
         :subject:cc:to:from:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sCFYIVymsuE2ws93enO5fAmbpAu17DnKzBRlGSvbWsA=;
        b=OoqxvCUjOujFuMclM2kQLhMQnlmVK1vuqm4gI9Kr5GhLi0vbCFOWCcENVN+CviK1ya
         wJJpBJGiEMMswV1wlHY5u6K+Nvook9CglwAUIqkcHJnZgurZ8rpmoQKyhTeVDGmxQHCf
         MHX7LD3XHBZwrO2Sau+4gVkgKEh/lGXALwqww8ZP+KFt0meZ/vreRCnm2LeIPlR84vLK
         Q13yQKuPth71a2YzNaT62Mb+bM/e7pJ21aMzULKr2e8Yw4mfxnQ+wZdOX2WKANp69a6/
         Sh3T2rKcweqkG/Hy9MjbwWRQ8DH4COs3kS6Rs3mnJCBmQTFDSLvgjL46J6aQYEAyT+Ld
         reOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781290185; x=1781894985;
        h=mime-version:content-transfer-encoding:references:in-reply-to
         :subject:cc:to:from:date:message-id:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sCFYIVymsuE2ws93enO5fAmbpAu17DnKzBRlGSvbWsA=;
        b=mtkz0+MzqLMo4g4GtUW/OCak0Ahosq5ZkylXfYXtcYlbs4QUobRhL/NtvNBY6nxaOt
         +UWI0yyrTDqDwvqQHzDxfpovG9uLAmmmj7xgwUjYNfrD634IeTpY8MWPIViJEq6rT6uX
         xUNXFu2t1qe6yIKFZnzOU9V1hLQ/KyaabuSTq9NA2EQP68CIsUiw0QkFXcP2H8JQsAGl
         yA1F8DAvY5HUZEtkX+dSJrtDCrRXKTLLSAS3l+MBNWqIEVceEnuJiNUL7CYHTW3hkEf3
         4fMpB88XIJ0srLFh5WCOlSPFaTqRH2aI9d9OSpLZnHnIrJJPpKzrz8paWE1QOq7Wl/x9
         sdnQ==
X-Gm-Message-State: AOJu0Yzgj3g8AL1Sl1BZaBvrW/J9Kk+IGyMoOwrtcwFYAKI/xIpjXvtV
	2c+Upbdi9Q9H+npppWrVHOh3+S2fF7MHMqqdFAxkFTvo7l9+jNmE+qnu
X-Gm-Gg: Acq92OGmInxptG1IY+18YTzRLigl616vTVZTXTS4+1APe0PDEZ9THJmLUfgBA/o1mYS
	w0llHMftespawjG3bKsjn1i8wK9n6IrapDBHuKPzWY5/i1qxZ6db5CuqAwIOlKx4SxY4YeC/UzV
	JDjbiQj03AJmW/M9CSnY2/n0XX67CxTXx9at1GNLPzfN5UI23kqJhrwDh2DruwV5aVeLq52zKqE
	/rxSjqHNUoGVFcaqlJ1HOA2WmeiOQe6uJzBxi5n5+05nIrOt7K9EM/yMg7AD+kxcpd0X+B9S3zO
	dCY8eA3N/E9SIEBLvnG9Z4ah5PH2SEabXf4LZnthdph6nWAxipHrq42OJb4uY2lZ3Hj8lfj3Q0G
	ioy522whXtIcVonKM3pZOt/KvEtrN4Z+qIRKEbKQQiNmxXvBLqegW1XhgMjjc11wTlw79ElDoVi
	NIQBf9Fz67g7wkQCg/9cXGPNrNLHdMltjuo1+6UVQWCJJCK0U/9MnTXIhCpdzjt2K/N7a9Z8cZA
	aluNyDjMfMmIyBunCOm861lwtK8nRzYmL6rvQ+2/Cm/q7fQhwtHZ9FnAp0H2WMkeJmgEYC6pGQK
	tsfbt2InCS2BMmhS/crQxAP9
X-Received: by 2002:a05:6214:20a1:b0:8ac:732b:6cf1 with SMTP id 6a1803df08f44-8d32e113d8dmr67348876d6.24.1781290185221;
        Fri, 12 Jun 2026 11:49:45 -0700 (PDT)
Received: from [127.0.1.1] (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8d30105fd8fsm30699386d6.4.2026.06.12.11.49.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 11:49:44 -0700 (PDT)
Message-ID: <6a2c54c8.3c73b6eb.36b6b9.5590@mx.google.com>
Date: Fri, 12 Jun 2026 11:49:44 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: ticotimo@gmail.com
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][PATCH] tests: add requirements.txt
In-Reply-To: <20260604001931.96550-1-tim.orling@konsulko.com>
References: <20260604001931.96550-1-tim.orling@konsulko.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 12 Jun 2026 18:49:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9879

Merged into master as d623a2e2.

Pins look sensible — pytest 9.x, pytest-timeout 2.x, pexpect 4.x are
exactly what the existing tests/ harness depends on. Glad to have the
version constraints explicit; will help reproducibility for anyone
running the suites outside the autobuilder.

Thanks.

Bruce

On Wed, Jun 03, 2026 at 17:19 -0700, Tim Orling wrote:
> Add requirements.txt to allow versions to be pinned.
> 
> Signed-off-by: Tim Orling <tim.orling@konsulko.com>
> ---
>  tests/requirements.txt | 3 +++
>  1 file changed, 3 insertions(+)
>  create mode 100644 tests/requirements.txt
> 
> diff --git a/tests/requirements.txt b/tests/requirements.txt
> new file mode 100644
> index 00000000..b0ac705f
> --- /dev/null
> +++ b/tests/requirements.txt
> @@ -0,0 +1,3 @@
> +pytest>=9.0.3,<10
> +pytest-timeout>=2.4.0,<3
> +pexpect>=4.9.0,<5 

