Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com [209.85.160.194])
 by mx.groups.io with SMTP id smtpd.web10.27966.1601260864308018365
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 27 Sep 2020 19:41:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=n3Fpv9xR;
 spf=pass (domain: gmail.com, ip: 209.85.160.194, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f194.google.com with SMTP id g3so7067708qtq.10
        for <meta-virtualization@lists.yoctoproject.org>; Sun, 27 Sep 2020 19:41:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :in-reply-to:user-agent;
        bh=gP3ww0m2SSKxBc0SVp3zHkFYxmJN61ADDVW1p/PE43Q=;
        b=n3Fpv9xRhYSoiiHpZXwVHMUHzwLZ150SlKaggyiwMYR6YwGRupwzjwJyRhuk1JUFeM
         fQTUVMb5ztvtGWaiVozvQvWTrr5moxx5CIRu20XYRy/1BbNJzdPIDemwt4n5UJ2jLMMi
         panIfJ3509Nmki/clepx9HBgez4/lRlEDhh52k7dmnNj8m0DCl0PnyNFYXqI32T0gsJU
         GJDbKIdB2D0taHp146weIEsSdRsAr5RwzJyYjuxz4zjNmhq4EitHtz2oRK9IB+j+weLa
         quUziMlwARi520ARnjLLfJiro/NF/2Xy9MLXKKWDAbd8zvlgrm0O5FuHLAbaBN42P/wn
         S6Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=gP3ww0m2SSKxBc0SVp3zHkFYxmJN61ADDVW1p/PE43Q=;
        b=roqqNN5WEpIWImJDYpihpbC71gEkW/RfSsBNFcPrfejJOhLzuPlfvjFIvG6gUaRAdg
         UiElhC3OzKrRRnnhj513eVM1hvpYbECVypVq0pBQphv25Za06AvNkuTGOVMOIIG5UoKJ
         VbKmTFb3ANFUU75obvlGfmbq0S6UqZ24pyj4GXgLpQKDwAxvN+k9JFkHaBonq7KX0VZT
         Po7L6fq7ehaF7ayHHRJqed/XDvgLD6MCoWOTK2tZ6lIP0rxEPI0n0bYlEmAjJUGanM22
         BXa7ELRckao0rQShjmAPkF9HJXON9OHAWzhraOu+7Ozos+684TjRr1dJG14lIp1ZeSOE
         HbHA==
X-Gm-Message-State: AOAM533tpSQhunLLUd7J+9S/OTI0/qiZwNQB90XsiQxFLe2ac+11My2x
	y0bEEG2R+Ys5jrD2f8T5tQg=
X-Google-Smtp-Source: ABdhPJzJDNyvzbQ4xNj6KjG8UiCG6V6O76p4pLD5bh5GaEzl10wyc237iVNlrTSw/x/4BZ5ilIJRaA==
X-Received: by 2002:ac8:6916:: with SMTP id e22mr10437818qtr.141.1601260863034;
        Sun, 27 Sep 2020 19:41:03 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from gmail.com (CPE04d4c4975b80-CM64777d5e8820.cpe.net.cable.rogers.com. [174.112.240.214])
        by smtp.gmail.com with ESMTPSA id w2sm7787772qki.115.2020.09.27.19.41.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2020 19:41:02 -0700 (PDT)
Date: Sun, 27 Sep 2020 22:41:00 -0400
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: Ricardo Salveti <ricardo@foundries.io>
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization] [PATCH] python3-websocket-client: remove recipe
Message-ID: <20200928024058.GA59678@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20200921190448.20625-1-ricardo@foundries.io>
 <20200921192555.22149-1-ricardo@foundries.io>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

merged.

Bruce


In message: [meta-virtualization] [PATCH] python3-websocket-client: remove recipe
on 21/09/2020 Ricardo Salveti wrote:

> Remove local python3-websocket-client recipe in favor of a similar one
> that is provided by meta-oe/meta-python (same verison but with the correct
> license).
> 
> Signed-off-by: Ricardo Salveti <ricardo@foundries.io>
> ---
>  recipes-devtools/python/python-websocket-client.inc   | 11 -----------
>  .../python/python3-websocket-client_0.57.0.bb         |  2 --
>  2 files changed, 13 deletions(-)
>  delete mode 100644 recipes-devtools/python/python-websocket-client.inc
>  delete mode 100644 recipes-devtools/python/python3-websocket-client_0.57.0.bb
> 
> diff --git a/recipes-devtools/python/python-websocket-client.inc b/recipes-devtools/python/python-websocket-client.inc
> deleted file mode 100644
> index 8604dcb..0000000
> --- a/recipes-devtools/python/python-websocket-client.inc
> +++ /dev/null
> @@ -1,11 +0,0 @@
> -SUMMARY = "WebSocket client for python. hybi13 is supported."
> -HOMEPAGE = "https://github.com/websocket-client/websocket-client.git"
> -LICENSE = "LGPL-3.0"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=c4c4a98fbc4836b81c8c64d6ecb01fc1"
> -
> -inherit pypi
> -
> -PYPI_PACKAGE = "websocket_client"
> -
> -SRC_URI[md5sum] = "8061820da5e1de26a6a1a6996d4eebd5"
> -SRC_URI[sha256sum] = "d735b91d6d1692a6a181f2a8c9e0238e5f6373356f561bb9dc4c7af36f452010"
> diff --git a/recipes-devtools/python/python3-websocket-client_0.57.0.bb b/recipes-devtools/python/python3-websocket-client_0.57.0.bb
> deleted file mode 100644
> index 473e31f..0000000
> --- a/recipes-devtools/python/python3-websocket-client_0.57.0.bb
> +++ /dev/null
> @@ -1,2 +0,0 @@
> -require python-websocket-client.inc
> -inherit setuptools3
> \ No newline at end of file
> -- 
> 2.28.0
> 

> 
> 
> 


