Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web11.117957.1597951509437469116
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 20 Aug 2020 12:25:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=UCXVEiTM;
 spf=softfail (domain: gmail.com, ip: 140.211.169.56, mailfrom: bruce.ashfield@gmail.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id DF98BE0205C; Thu, 20 Aug 2020 12:25:08 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FAKE_REPLY_C,FREEMAIL_FROM,FSL_HELO_FAKE,
	RCVD_IN_DNSWL_NONE,URIBL_RED autolearn=ham version=3.3.1
X-Spam-HAM-Report: 
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 FSL_HELO_FAKE FSL_HELO_FAKE
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/, no
	*      trust
	*      [209.85.219.66 listed in list.dnswl.org]
	*  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
	*      (bruce.ashfield[at]gmail.com)
	*  0.0 URIBL_RED Contains an URL listed in the URIBL redlist
	*      [URIs: yoctoproject.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
	*       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	*  1.5 FAKE_REPLY_C FAKE_REPLY_C
Received: from mail-qv1-f66.google.com (mail-qv1-f66.google.com [209.85.219.66])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1E2DEE02059
	for <meta-virtualization@yoctoproject.org>; Thu, 20 Aug 2020 12:25:07 -0700 (PDT)
Received: by mail-qv1-f66.google.com with SMTP id j10so1442008qvo.13
        for <meta-virtualization@yoctoproject.org>; Thu, 20 Aug 2020 12:25:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :in-reply-to:user-agent;
        bh=T6timOgCly6Iu9Sra1TX+nbFHsTi5mmxzu8Y/A/DgAI=;
        b=UCXVEiTM4jvns9IUtJAQziwf5UQ1vKHsyQFBTmAQcX0WB7mZVgW6QtKeP2GkrbZnWQ
         B4qU0viu+uvWBkLkNmTHCnAgJSVVNZ0LcCgDyCtUxYDMWmD2YQeqJL5GXgYhZ7RewWdf
         uGOlEs6gR/liBmRPcKj7i3UKDeKLwggRWg1Ufc/U0g4dMTP1a7YFRWGejJMuCrxlu2wt
         et8MTwltSboLtG8LbSkrBZd6Ist+Pn/jjFS2t10TrkZcmsqtG9WEyiw1wD4ylCWAf9Xp
         /JnHteFQvfmz1yEShE2FlMoKHONiVZkTcHpzZSRLALtWQOrTPIvnNkUXJZMYpqYkAavv
         nJcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=T6timOgCly6Iu9Sra1TX+nbFHsTi5mmxzu8Y/A/DgAI=;
        b=XGYZ1rayTxu/Lu8f76rVW3MSXXGfkMQTq2l5AaeRzXKqRaLUZW1e66VNoMn9gtXEsh
         nuQqDRIVgiX5X7joW2tlXus4/eluTlIusuCOpTlnVxoFDtKNykL39EY/JWuxR4VCZH2S
         TwstimkvwJbmrChatoi7UMbtoDvkk4zzFrD9Ezmx78CFIOyrJqGlwYIKKWSf42ks37M7
         /is/+NtFLv+NA6Ylwd2fKz7JgYpPa8VRISZnsDbZkP3mYo3JSGpySCwUTx/vdcrwNvOQ
         mEICzkzpzR0IwRVtc9QAdzy3WHcrZyrtDYE2Bn6g+kz73b5ulwkq46Y2700iohC9azQO
         MRNw==
X-Gm-Message-State: AOAM5302zL+Cmh7H5CQKeGTN2ylQgclLoFgfDNtS47onaeDf6Tq96bZL
	MfP00IHr7AFB710uUvKQnxQTp/odf+RPZv4j
X-Google-Smtp-Source: ABdhPJxC59NZJqxqv8teK72p5NW6uTnox4LjGql/Kw/9G8KE8QAoTdYLmIso4Vc6hMPT6jh5frOrBg==
X-Received: by 2002:a0c:8f01:: with SMTP id z1mr335039qvd.223.1597951506109;
        Thu, 20 Aug 2020 12:25:06 -0700 (PDT)
Received: from gmail.com (CPE04d4c4975b80-CM64777d5e8820.cpe.net.cable.rogers.com. [174.112.240.214])
        by smtp.gmail.com with ESMTPSA id i7sm3889960qtb.27.2020.08.20.12.25.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2020 12:25:05 -0700 (PDT)
Date: Thu, 20 Aug 2020 15:25:03 -0400
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: zangrc <zangrc.fnst@cn.fujitsu.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [meta-virtualization] [PATCH] python3-xstatic-jquery-migrate: upgrade 1.2.1.1 -> 1.2.1.2
Message-ID: <20200820192500.GA23190@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1597780202-92964-2-git-send-email-zangrc.fnst@cn.fujitsu.com>
 <1597780202-92964-4-git-send-email-zangrc.fnst@cn.fujitsu.com>
 <1597780202-92964-3-git-send-email-zangrc.fnst@cn.fujitsu.com>
 <1597780202-92964-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

merged.

Bruce

In message: [meta-virtualization] [PATCH] python3-xstatic-jquery-migrate: upgrade 1.2.1.1 -> 1.2.1.2
on 19/08/2020 zangrc wrote:

> -License-Update: Update PKG-INFO.
> 
> Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
> ---
>  .../python/python-xstatic-jquery-migrate_1.2.1.1.bb    |  2 --
>  .../python/python3-xstatic-jquery-migrate_1.2.1.1.bb   |  2 --
>  ...e.inc => python3-xstatic-jquery-migrate_1.2.1.2.bb} | 10 +++++-----
>  3 files changed, 5 insertions(+), 9 deletions(-)
>  delete mode 100644 meta-openstack/recipes-devtools/python/python-xstatic-jquery-migrate_1.2.1.1.bb
>  delete mode 100644 meta-openstack/recipes-devtools/python/python3-xstatic-jquery-migrate_1.2.1.1.bb
>  rename meta-openstack/recipes-devtools/python/{python-xstatic-jquery-migrate.inc => python3-xstatic-jquery-migrate_1.2.1.2.bb} (54%)
> 
> diff --git a/meta-openstack/recipes-devtools/python/python-xstatic-jquery-migrate_1.2.1.1.bb b/meta-openstack/recipes-devtools/python/python-xstatic-jquery-migrate_1.2.1.1.bb
> deleted file mode 100644
> index 2dab32f..0000000
> --- a/meta-openstack/recipes-devtools/python/python-xstatic-jquery-migrate_1.2.1.1.bb
> +++ /dev/null
> @@ -1,2 +0,0 @@
> -require python-xstatic-jquery-migrate.inc
> -inherit setuptools3
> diff --git a/meta-openstack/recipes-devtools/python/python3-xstatic-jquery-migrate_1.2.1.1.bb b/meta-openstack/recipes-devtools/python/python3-xstatic-jquery-migrate_1.2.1.1.bb
> deleted file mode 100644
> index 2dab32f..0000000
> --- a/meta-openstack/recipes-devtools/python/python3-xstatic-jquery-migrate_1.2.1.1.bb
> +++ /dev/null
> @@ -1,2 +0,0 @@
> -require python-xstatic-jquery-migrate.inc
> -inherit setuptools3
> diff --git a/meta-openstack/recipes-devtools/python/python-xstatic-jquery-migrate.inc b/meta-openstack/recipes-devtools/python/python3-xstatic-jquery-migrate_1.2.1.2.bb
> similarity index 54%
> rename from meta-openstack/recipes-devtools/python/python-xstatic-jquery-migrate.inc
> rename to meta-openstack/recipes-devtools/python/python3-xstatic-jquery-migrate_1.2.1.2.bb
> index b5c1332..e8bed4c 100644
> --- a/meta-openstack/recipes-devtools/python/python-xstatic-jquery-migrate.inc
> +++ b/meta-openstack/recipes-devtools/python/python3-xstatic-jquery-migrate_1.2.1.2.bb
> @@ -2,16 +2,16 @@ DESCRIPTION = "JQuery-Migrate JavaScript library packaged for setuptools"
>  HOMEPAGE = "https://pypi.python.org/pypi/XStatic-JQuery-Migrate"
>  SECTION = "devel/python"
>  LICENSE = "MIT"
> -LIC_FILES_CHKSUM = "file://PKG-INFO;md5=2bbd78dd61f7b4f2fb6b3e31e4d7a26b"
> +LIC_FILES_CHKSUM = "file://PKG-INFO;md5=55fddf010d3daf1956396fa50e27c864"
>  
>  PYPI_PACKAGE = "XStatic-JQuery-Migrate"
>  
> -SRC_URI[md5sum] = "2dd39f9d6351aeaf129b33d4134ac6a7"
> -SRC_URI[sha256sum] = "e2959b3df49afdddb00d36b74cca727a91b994b9f4edb993d7264731a750900e"
> +SRC_URI[md5sum] = "7ade6ebf832a62e45b0096a1799a1bfc"
> +SRC_URI[sha256sum] = "db9d28cb161626f979f7999f158a4a7aaf6dc957fd0106b1ad1051d47969c425"
>  
> -inherit pypi
> +inherit setuptools3 pypi
>  
> -# DEPENDS_default: python-pip
> +# DEPENDS_default: python3-pip
>  
>  DEPENDS += " \
>          ${PYTHON_PN}-pip \
> -- 
> 2.25.1
> 
> 
> 

> 


