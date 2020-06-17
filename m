Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web11.2063.1592353998206375333
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 16 Jun 2020 17:33:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=VG/vfpNb;
 spf=softfail (domain: gmail.com, ip: 140.211.169.56, mailfrom: bruce.ashfield@gmail.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 9080FE01D10; Tue, 16 Jun 2020 17:33:17 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,URIBL_RED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: 
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
	*      (bruce.ashfield[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/, no
	*      trust
	*      [209.85.222.193 listed in list.dnswl.org]
	*  0.0 URIBL_RED Contains an URL listed in the URIBL redlist
	*      [URIs: yoctoproject.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
	*       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com [209.85.222.193])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 782D4E01CCB
	for <meta-virtualization@yoctoproject.org>; Tue, 16 Jun 2020 17:33:16 -0700 (PDT)
Received: by mail-qk1-f193.google.com with SMTP id c12so446364qkk.13
        for <meta-virtualization@yoctoproject.org>; Tue, 16 Jun 2020 17:33:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=PU5gHc7yNg2w54LIj39jNmwov2MR+rYcRf/4vL7N51Y=;
        b=VG/vfpNbL0ZXGC5o2YzCiRm+3gs78P004cNQu8p2RIC2ZoKO6sHzK9ORukoO/94bXM
         rlDwarrmkD0KkRgsuFJyDXR9v/cfLnuD2tthpYGrg1fEyMVIrmjKs17nApccKYXuAepB
         9Dl0gmAbQU5WnaE8aj+HBVfWAw2IRc+Wsw1IUIC+WLD4ul0iYlvMsE5C1dn2hmbwKFb1
         vVySNE7ivn3pKBlht4oNGlr2ABPHonNGzrJnf5z4SuZhufd21C0R4QbjCCfsw/gaOMO7
         O/QE7y+1p0DTYmqIp9mPQUjWtNFRpvfUjR2oh3jTsS5+5yev7VjfH0TZXG+H7+chr0eV
         bg0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=PU5gHc7yNg2w54LIj39jNmwov2MR+rYcRf/4vL7N51Y=;
        b=g5Tgr8UCcoNpcu9mTQ12ARqJAODeTQbHyf/JzwiJVkpcNE2zZbNsQbzvlecGaXI5dD
         leLGlLezajptDWe8cJcYPigbJwYkJN6PdwOQOdYmjHdxm7FxLvcz1tXvfngIEZSAEm9q
         AFlnEJbqWqc3FLCpTlLVjNRdVSNLDwu4WWpfHic7G9QH+mDJp4XbsvupuY7BTG0hFibX
         ED/XJhhqBwni14elVHtoTOBK/cuAHKI3ys/6OxpNn3gZIpdr85jIYZuiwp9H/60pg1vj
         8SM/kQB0GRzHZVIn3I0ED1SAQnlY9x4nNuC/Yrolh0cSVtW3iSFI3h5Exqb7XlnPNB70
         ifzA==
X-Gm-Message-State: AOAM5306F9HhocWonWBJKq0OHPczAIaPDuBBz5s43bVVwR06OL7twDeg
	iDCVPbdCRoItcK03vAbAiDY=
X-Google-Smtp-Source: ABdhPJywJMtPxF1LofIThHAYYO9kyY4xz5JSgWrEAKdI8dRakosWWOEQBf/xM+XUZJ3UOAwKmg2hGw==
X-Received: by 2002:a37:4b47:: with SMTP id y68mr5912599qka.140.1592353995611;
        Tue, 16 Jun 2020 17:33:15 -0700 (PDT)
Received: from gmail.com (CPE04d4c4975b80-CM64777d5e8820.cpe.net.cable.rogers.com. [174.112.240.214])
        by smtp.gmail.com with ESMTPSA id u27sm14772053qku.13.2020.06.16.17.33.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2020 17:33:15 -0700 (PDT)
Date: Tue, 16 Jun 2020 20:33:13 -0400
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: zhengruoqin <zhengrq.fnst@cn.fujitsu.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [meta-virtualization][meta-openstack][PATCH] python3-tinyrpc: change python to python3
Message-ID: <20200617003310.GA5232@gmail.com>
References: <1592316502-130341-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
MIME-Version: 1.0
In-Reply-To: <1592316502-130341-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


merged

Bruce

In message: [meta-virtualization][meta-openstack][PATCH] python3-tinyrpc: change python to python3
on 16/06/2020 zhengruoqin wrote:

> upgrade 0.6 -> 1.0.4
> 
> Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
> ---
>  ...inyrpc_0.6.bb => python3-tinyrpc_1.0.4.bb} | 20 +++++++++----------
>  1 file changed, 10 insertions(+), 10 deletions(-)
>  rename meta-openstack/recipes-devtools/python/{python-tinyrpc_0.6.bb => python3-tinyrpc_1.0.4.bb} (50%)
> 
> diff --git a/meta-openstack/recipes-devtools/python/python-tinyrpc_0.6.bb b/meta-openstack/recipes-devtools/python/python3-tinyrpc_1.0.4.bb
> similarity index 50%
> rename from meta-openstack/recipes-devtools/python/python-tinyrpc_0.6.bb
> rename to meta-openstack/recipes-devtools/python/python3-tinyrpc_1.0.4.bb
> index 9da5813..f77cebe 100644
> --- a/meta-openstack/recipes-devtools/python/python-tinyrpc_0.6.bb
> +++ b/meta-openstack/recipes-devtools/python/python3-tinyrpc_1.0.4.bb
> @@ -5,18 +5,18 @@ SECTION = "devel/python"
>  LICENSE = "MIT"
>  LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
>  
> -SRC_URI[md5sum] = "2663568ba3e1793da7b21003f0847fdd"
> -SRC_URI[sha256sum] = "b4d64227f023f1f0736ef137bd4c901c7652563e62c7a20329222c3a0b14d84f"
> +SRC_URI[md5sum] = "cd61e3cbc01ea940abc97d3a87abf4a7"
> +SRC_URI[sha256sum] = "4b41fab967fb1c978f573bf0d609a3b12cc3b6ed62bd3108f43f575563746396"
>  
>  inherit setuptools3 pypi
>  
>  RDEPENDS_${PN} += " \
> -        python-six \
> -        python-gevent \
> -        python-requests \
> -        python-websocket-client \
> -        python-jsonext \
> -        python-gevent-websocket \
> -        python-werkzeug \
> -        python-pyzmq \
> +        python3-six \
> +        python3-gevent \
> +        python3-requests \
> +        python3-websocket-client \
> +        python3-jsonext \
> +        python3-gevent-websocket \
> +        python3-werkzeug \
> +        python3-pyzmq \
>          "
> -- 
> 2.17.1
> 
> 
> 

> 

