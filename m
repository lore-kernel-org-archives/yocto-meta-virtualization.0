Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web11.3189.1596138511417335585
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 30 Jul 2020 12:48:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=qHx8pSKD;
 spf=softfail (domain: gmail.com, ip: 140.211.169.56, mailfrom: bruce.ashfield@gmail.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 499F5E01F51; Thu, 30 Jul 2020 12:48:31 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FAKE_REPLY_C,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: 
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/, no
	*      trust
	*      [209.85.222.176 listed in list.dnswl.org]
	*  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
	*      (bruce.ashfield[at]gmail.com)
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
	*       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	*  1.5 FAKE_REPLY_C FAKE_REPLY_C
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A5AA5E01F0B
	for <meta-virtualization@yoctoproject.org>; Thu, 30 Jul 2020 12:48:29 -0700 (PDT)
Received: by mail-qk1-f176.google.com with SMTP id e13so26756501qkg.5
        for <meta-virtualization@yoctoproject.org>; Thu, 30 Jul 2020 12:48:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :in-reply-to:user-agent;
        bh=uj+rHxP0zll9Odq/hK9ZulBgOBxrUxGRhxS0zOnJO08=;
        b=qHx8pSKDRAntysZH24TX5i0/IAh11wL8991OMjOakGDc2LWQ+XYXtnt+JZhmlviALS
         3FMlVHQCkeD17KCYzBpxmjAeMQ0UquehUBafWVnMCDUl73LCNiL5TZy8yoifj8PSRAvU
         2Wsm+a5601IJljXHNkUnf5RhcEZ/iEmoikh01IKsID5vaat6EqLxzLf2MOA3rwZavGuB
         kOoiqO+y8MjADNleL+7+wDaptN6WlQOwzQqIqC+EI2EDuTx8w/37BoDAPRfp3kkTzbzU
         g5kdYES31XqaoBlG9ewNXuZB2z8YGWX6MvKCJOsQQG02i5fDb85qSTGl40G4odDB6f4O
         Jwug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=uj+rHxP0zll9Odq/hK9ZulBgOBxrUxGRhxS0zOnJO08=;
        b=UR1Q7JJSsMmQ0yh8hiToAx/k44qJ6Wa4g0ugeBEVCoVrWIHk2nR5oJOEQOAE0ATlA7
         eVgooiOOuh7gOrjO7uzyUVV8EtHY5G6m/Q/FWrFmehH4M6g5OBzc7t0QqOSAnigb1634
         UDVk+5UEBoj0K154eGtyW/ItLFC5zQ3RjQXbydTNXvcewxKDV+MQDj8WPMqJif/Z/zus
         Iu4KrAlow4/d1HBtcTKUaTLX4hk7EJuOvZKb1U1gjVKkjVdbt56thHKcn/tqxDLYhiK3
         S+fe1W1Vas632UyUcNouQmnh2qpdh7ZAy10h8zKV138sQVD+7/umZAgbnqOr+KTM+Z8l
         u7Gg==
X-Gm-Message-State: AOAM530ZS4mqBA57vW5BGdTuZaclMnMm8g5I/sXtQsulNkluW2p4stVd
	2z/A97Jn6yClMwm+WbsqOCX+0ng+MGXxyg==
X-Google-Smtp-Source: ABdhPJwsg8cUln0NHC/JzWN07FNDTKZFLdcWFXoQZz6TJTIj0Zj0Oj4C1JSZ+68krSIYDHk276CblA==
X-Received: by 2002:a37:b1c4:: with SMTP id a187mr816221qkf.460.1596138508597;
        Thu, 30 Jul 2020 12:48:28 -0700 (PDT)
Received: from gmail.com (CPE04d4c4975b80-CM64777d5e8820.cpe.net.cable.rogers.com. [174.112.240.214])
        by smtp.gmail.com with ESMTPSA id t12sm4836050qkt.56.2020.07.30.12.48.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2020 12:48:28 -0700 (PDT)
Date: Thu, 30 Jul 2020 15:48:26 -0400
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: zhengruoqin <zhengrq.fnst@cn.fujitsu.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [meta-virtualization] [PATCH] python3-xattr: upgrade 0.6.4 -> 0.9.7
Message-ID: <20200730194825.GD28981@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1595900026-54536-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
 <1595900075-54608-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
 <1595900106-54645-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
 <1595900120-54689-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
 <1595900141-54751-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
 <1595900159-54788-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

merged.

Bruce

In message: [meta-virtualization] [PATCH] python3-xattr: upgrade 0.6.4 -> 0.9.7
on 28/07/2020 zhengruoqin wrote:

> Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>/
> ---
>  .../python/python-xattr_0.6.4.bb               | 10 ----------
>  .../python/python3-xattr_0.9.7.bb              | 18 ++++++++++++++++++
>  2 files changed, 18 insertions(+), 10 deletions(-)
>  delete mode 100644 meta-openstack/recipes-devtools/python/python-xattr_0.6.4.bb
>  create mode 100644 meta-openstack/recipes-devtools/python/python3-xattr_0.9.7.bb
> 
> diff --git a/meta-openstack/recipes-devtools/python/python-xattr_0.6.4.bb b/meta-openstack/recipes-devtools/python/python-xattr_0.6.4.bb
> deleted file mode 100644
> index d349a48..0000000
> --- a/meta-openstack/recipes-devtools/python/python-xattr_0.6.4.bb
> +++ /dev/null
> @@ -1,10 +0,0 @@
> -DESCRIPTION = "Python wrapper for extended filesystem attributes"
> -HOMEPAGE = "http://github.com/xattr/xattr"
> -SECTION = "devel/python"
> -LICENSE = "MIT"
> -LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=7ebb582f22ddff5dcb0bc33d04f7cbb8"
> -
> -SRC_URI[md5sum] = "1bef31afb7038800f8d5cfa2f4562b37"
> -SRC_URI[sha256sum] = "f9dcebc99555634b697fa3dad8ea3047deb389c6f1928d347a0c49277a5c0e9e"
> -
> -inherit setuptools3 pypi
> \ No newline at end of file
> diff --git a/meta-openstack/recipes-devtools/python/python3-xattr_0.9.7.bb b/meta-openstack/recipes-devtools/python/python3-xattr_0.9.7.bb
> new file mode 100644
> index 0000000..ea31fc1
> --- /dev/null
> +++ b/meta-openstack/recipes-devtools/python/python3-xattr_0.9.7.bb
> @@ -0,0 +1,18 @@
> +DESCRIPTION = "Python wrapper for extended filesystem attributes"
> +HOMEPAGE = "http://github.com/xattr/xattr"
> +SECTION = "devel/python"
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=7ebb582f22ddff5dcb0bc33d04f7cbb8"
> +
> +SRC_URI[md5sum] = "3b9a928bc76c14eeeaccbc3c152c4920"
> +SRC_URI[sha256sum] = "b0bbca828e04ef2d484a6522ae7b3a7ccad5e43fa1c6f54d78e24bb870f49d44"
> +
> +inherit setuptools3 pypi
> +
> +DEPENDS += " \
> +	python3-cffi-native \
> +"
> +
> +RDEPENDS_${PN} += " \
> +	python3-cffi \
> +"
> -- 
> 2.25.1
> 
> 
> 

> 


