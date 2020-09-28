Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web11.28129.1601261100826625454
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 27 Sep 2020 19:45:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Z8/KWg1B;
 spf=softfail (domain: gmail.com, ip: 198.145.29.25, mailfrom: bruce.ashfield@gmail.com)
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com [209.85.160.196])
	by mail.yoctoproject.org (Postfix) with ESMTPS id 9863438C0858
	for <meta-virtualization@yoctoproject.org>; Sun, 27 Sep 2020 19:45:00 -0700 (PDT)
Received: by mail-qt1-f196.google.com with SMTP id z2so7065174qtv.12
        for <meta-virtualization@yoctoproject.org>; Sun, 27 Sep 2020 19:45:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :in-reply-to:user-agent;
        bh=vvSfS8JD5g429zuhgaz9kNILs+24lMpwr65EE4TPP94=;
        b=Z8/KWg1BGRY6WxGHexDlz/+ibrSOhZzZIbyBDQWTG6+nv5CPVmuP0WyFqyR5dmukFG
         SKKmUHX0N2hjzgodTtv6XRVvkAHp99C01vEhVQpntGCdD+WiIupuGMUJYuG4230EwObr
         5nNXweGkdFoef9ZkEC4n/i7P8sh7ZwkuCMFTazNff7GA14+TFYrGBTBGyBR+X8WbYW9h
         gsDZIjIS/WnjI4S3Bw5BP7beyILnGWDRuf5gTt1KtGkvOUZD23B+ql/Pvb/ViknqUzBx
         vRCwJinGBOPSAiMGOZuG4X+lN6Uf89kZb7T/hOqpw3bkpzV8QpZlk8RckG1ZwrsRpGYe
         IYZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=vvSfS8JD5g429zuhgaz9kNILs+24lMpwr65EE4TPP94=;
        b=DGwQQkSpgZKBSWlYZ1JfpURx9LE3OCKrO7IaiHgxXBoFtbguyT89ITW5i3ntfITWJV
         Dm4fyFncsegoiiD/ftkJl9i4mlo/46ORaVlU1WYGFDX5izh26nYYJ32RbxkBYoq7fSWG
         CoMaMSao7BBvi9CtZ8q/rRIjfC6J6ddNatUI8zyMlWtniudfsBqYuU4MZrJqBZsaOi+p
         leZ/tiD38+hEMketoMLViGRfsr4YDXZWLySJ8rnUHnGJcWxB3L9J7ecsom+mx6FmKiT3
         p1WKOY8bqzvYuKwPdnTDaQUBC4JUiEkj2H7RhVPgohfZfDfdcZN1d4uNE7lmDACOs5s4
         AIQw==
X-Gm-Message-State: AOAM530l3ZoTNDm/UrOeviFVB8Xqyv760u9FeCv6/vxuGxNFWrr0cj9E
	6NIFS04JtjGhJf5u+fHBqJ0Si4fc6SsV6jcq
X-Google-Smtp-Source: ABdhPJzyGbrZYWgJsaxZRtH7GGen8KrTkbwkS3dNFuEWL3V8jsU4qfs0WUYbaInsKKaLbtqYe99n1w==
X-Received: by 2002:ac8:4c8e:: with SMTP id j14mr10988694qtv.340.1601261099384;
        Sun, 27 Sep 2020 19:44:59 -0700 (PDT)
Received: from gmail.com (CPE04d4c4975b80-CM64777d5e8820.cpe.net.cable.rogers.com. [174.112.240.214])
        by smtp.gmail.com with ESMTPSA id d51sm7247417qte.50.2020.09.27.19.44.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2020 19:44:58 -0700 (PDT)
Date: Sun, 27 Sep 2020 22:44:57 -0400
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: zhengruoqin <zhengrq.fnst@cn.fujitsu.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [meta-virtualization] [PATCH] python3-mistralclient: Change to python3
Message-ID: <20200928024454.GA60026@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1600741576-124087-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
 <1600741637-124133-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
 <1600741645-124169-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
 <1600741657-124205-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
 <1600741666-124250-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
 <1600741690-124287-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
 <1600741697-124327-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
 <1600741708-124363-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
 <1600741757-124408-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
 <1600741786-124453-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

merged.

Bruce

In message: [meta-virtualization] [PATCH] python3-mistralclient: Change to python3
on 22/09/2020 zhengruoqin wrote:

> Because python2 is no longer maintained, bb file is changed to python3 version.
> 
> Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
> ---
>  .../python/python-mistralclient_git.bb        | 32 -------------------
>  .../python/python3-mistralclient_4.1.1.bb     | 29 +++++++++++++++++
>  2 files changed, 29 insertions(+), 32 deletions(-)
>  delete mode 100644 meta-openstack/recipes-devtools/python/python-mistralclient_git.bb
>  create mode 100644 meta-openstack/recipes-devtools/python/python3-mistralclient_4.1.1.bb
> 
> diff --git a/meta-openstack/recipes-devtools/python/python-mistralclient_git.bb b/meta-openstack/recipes-devtools/python/python-mistralclient_git.bb
> deleted file mode 100644
> index c9002e9..0000000
> --- a/meta-openstack/recipes-devtools/python/python-mistralclient_git.bb
> +++ /dev/null
> @@ -1,32 +0,0 @@
> -DESCRIPTION = "Python client for Mistral REST API"
> -HOMEPAGE = "https://github.com/openstack/python-mistralclient"
> -SECTION = "devel/python"
> -LICENSE = "Apache-2.0"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=34400b68072d710fecd0a2940a0d1658"
> -
> -DEPENDS += " \
> -        python-pip \
> -        python-pbr \
> -        "
> -
> -# Satisfy setup.py 'setup_requires'
> -DEPENDS += " \
> -        python-pbr-native \
> -        "
> -
> -RDEPENDS_${PN} +=" \
> -        python-cliff \
> -        python-pbr \
> -        python-keystoneclient \
> -        python-pyyaml \
> -        python-requests \
> -	"
> -
> -SRCNAME = "mistralclient"
> -SRC_URI = "git://github.com/openstack/${BPN}.git;branch=master"
> -
> -PV = "1.1.0+git${SRCPV}"
> -SRCREV = "48e2780ee0148efc186c8972ca22e572fa2433c5"
> -S = "${WORKDIR}/git"
> -
> -inherit setuptools3
> diff --git a/meta-openstack/recipes-devtools/python/python3-mistralclient_4.1.1.bb b/meta-openstack/recipes-devtools/python/python3-mistralclient_4.1.1.bb
> new file mode 100644
> index 0000000..dd0eb90
> --- /dev/null
> +++ b/meta-openstack/recipes-devtools/python/python3-mistralclient_4.1.1.bb
> @@ -0,0 +1,29 @@
> +DESCRIPTION = "Python client for Mistral REST API"
> +HOMEPAGE = "https://github.com/openstack/python-mistralclient"
> +SECTION = "devel/python"
> +LICENSE = "Apache-2.0"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=34400b68072d710fecd0a2940a0d1658"
> +
> +SRC_URI[sha256sum] = "b03d52ec860df292192a0face767585633e209ba9297fc71da70d42d6a76aebe"
> +
> +PYPI_PACKAGE = "python-mistralclient"
> +
> +DEPENDS += " \
> +        python3-pip \
> +        python3-pbr \
> +        "
> +
> +# Satisfy setup.py 'setup_requires'
> +DEPENDS += " \
> +        python3-pbr-native \
> +        "
> +
> +RDEPENDS_${PN} +=" \
> +        python3-cliff \
> +        python3-pbr \
> +        python3-keystoneclient \
> +        python3-pyyaml \
> +        python3-requests \
> +	"
> +
> +inherit setuptools3 pypi
> -- 
> 2.25.1
> 
> 
> 

> 
> 
> 


