Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web11.2195.1595271068789349990
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 20 Jul 2020 11:51:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=DEa24+ye;
 spf=softfail (domain: gmail.com, ip: 140.211.169.56, mailfrom: bruce.ashfield@gmail.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A3694E01ED0; Mon, 20 Jul 2020 11:51:08 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FAKE_REPLY_C,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: 
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
	*      (bruce.ashfield[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/, no
	*      trust
	*      [209.85.160.194 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
	*       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	*  1.5 FAKE_REPLY_C FAKE_REPLY_C
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com [209.85.160.194])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 73CA1E01ECE
	for <meta-virtualization@yoctoproject.org>; Mon, 20 Jul 2020 11:51:06 -0700 (PDT)
Received: by mail-qt1-f194.google.com with SMTP id b25so14050973qto.2
        for <meta-virtualization@yoctoproject.org>; Mon, 20 Jul 2020 11:51:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :in-reply-to:user-agent;
        bh=dc1lVMql2H4TsgPGG4hpxKgA5OhTsYb6UVMLgY4BIk4=;
        b=DEa24+yerWZMESbXOE3ZJL3TueTqbP3aJ68AdMrGFKEOeI2prpCYORP429QYsiqlYO
         TvmXoHV8V3Boaw6YM0uo9i+AHLnCyc9Tp1t3Ar0tcgoyvtM50S4YBxOdyIF8tBsl5z8t
         j4pTBQ8VEtX2hlRY7VW/T7CZ3IkKaCYJIlAjknu7oL9BkoBg6whgHWUUM/DcXGbHcpta
         BUJOi2IQPy1T40Wl8XXNsSYafmSq9WzviJhk5cMPkdzgF0Pz7TamhU49c/A+UW0IxM2y
         qZrrsScsBfJ1a+vZdYRvLP7d3TGVjgQmg5wauGCRskWM2swlaajLpaWw9syX5qio23C2
         JCNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=dc1lVMql2H4TsgPGG4hpxKgA5OhTsYb6UVMLgY4BIk4=;
        b=WFI3QjcN3tPCQsyazc3iCEWyOZVP8GVvPkOeVeD2PuDCKeRKf4fRtib/DSBx/3T8z+
         hXkB/q3vmLZsbfMtqL6haeUiRCNGfivNHlhsoxtxS40e0SQY2/H8ij7TzD2dX19L8SwS
         +wDWUaIInlO6AUwqZlkNfMFn0HzmpZGtI7D8iLMWHpYSB9XSTBJBRfBOZfAT/tnI6djM
         vUSuW82UZq6RW81vQV91GWJb27GF6OnAL4l3Qlg5kwO7akicZiRZguGOi7upImNtDHGW
         HiJvVbQ61Ot//+CxzVdAhZyx4DStPLLCfkS/DoaBs+g6oNby58Cb6hm6Qsg77XyNNJf6
         gJIg==
X-Gm-Message-State: AOAM531pgeo/y47dKpkSn0qsL1/sNZlD4mTBR0ssx8a0S6LMKGFPB2vU
	G4N/EQP2EFcSzfo7dZTZXds=
X-Google-Smtp-Source: ABdhPJyrfZ8D7wLy9sHjZ3hNXQA17SV+kSrkNVN7j1SDYNxojMRLmMkvGx08Ta2q26581RgrieUz2A==
X-Received: by 2002:ac8:2f7b:: with SMTP id k56mr25674582qta.239.1595271066071;
        Mon, 20 Jul 2020 11:51:06 -0700 (PDT)
Received: from gmail.com (CPE04d4c4975b80-CM64777d5e8820.cpe.net.cable.rogers.com. [174.112.240.214])
        by smtp.gmail.com with ESMTPSA id x4sm282330qkl.130.2020.07.20.11.51.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2020 11:51:05 -0700 (PDT)
Date: Mon, 20 Jul 2020 14:51:03 -0400
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: zangrc <zangrc.fnst@cn.fujitsu.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [meta-virtualization] [PATCH] python3-boto: Change to python3
Message-ID: <20200720185100.GA40605@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1594928416-4078-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
 <1594928441-4155-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
 <1594928465-4255-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
 <1594928486-4335-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

merged.

Bruce

In message: [meta-virtualization] [PATCH] python3-boto: Change to python3
on 17/07/2020 zangrc wrote:

> -License-Update: There is no LICENSE file in the package provided by pypi, and it is changed to PKG-INFO.
> 
> Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
> ---
>  .../python/python-boto_git.bb                 | 20 ------------------
>  .../python/python3-boto_2.49.0.bb             | 21 +++++++++++++++++++
>  2 files changed, 21 insertions(+), 20 deletions(-)
>  delete mode 100644 meta-openstack/recipes-devtools/python/python-boto_git.bb
>  create mode 100644 meta-openstack/recipes-devtools/python/python3-boto_2.49.0.bb
> 
> diff --git a/meta-openstack/recipes-devtools/python/python-boto_git.bb b/meta-openstack/recipes-devtools/python/python-boto_git.bb
> deleted file mode 100644
> index 77e2043..0000000
> --- a/meta-openstack/recipes-devtools/python/python-boto_git.bb
> +++ /dev/null
> @@ -1,20 +0,0 @@
> -DESCRIPTION = "Amazon Web Services API"
> -HOMEPAGE = "https://github.com/boto/boto"
> -SECTION = "devel/python"
> -LICENSE = "MIT"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=348302dddd421665d3c9b636a2e55832"
> -
> -SRCREV = "b5852b0aa5ac91f462b28ac9decee33d872dec4d"
> -PV = "2.8.0+git${SRCPV}"
> -PR = "r0"
> -SRCNAME = "boto"
> -
> -SRC_URI = "git://github.com/boto/boto.git;protocol=git"
> -
> -SRC_URI[md5sum] = "5528f3010c42dd0ed7b188a6917295f1"
> -SRC_URI[sha256sum] = "4d6d38aa8e9e536a27a9737eb4222f896417841fed9a12eedcb619ba8fb68a39"
> -
> -S = "${WORKDIR}/git"
> -
> -inherit setuptools3
> -
> diff --git a/meta-openstack/recipes-devtools/python/python3-boto_2.49.0.bb b/meta-openstack/recipes-devtools/python/python3-boto_2.49.0.bb
> new file mode 100644
> index 0000000..fe09e9f
> --- /dev/null
> +++ b/meta-openstack/recipes-devtools/python/python3-boto_2.49.0.bb
> @@ -0,0 +1,21 @@
> +DESCRIPTION = "Amazon Web Services API"
> +HOMEPAGE = "https://github.com/boto/boto"
> +SECTION = "devel/python"
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://PKG-INFO;md5=a1067d091272fcce8cc3d88d7e6fdc01"
> +
> +SRC_URI[md5sum] = "e9b79f80198da059d9a8055a5352fd6d"
> +SRC_URI[sha256sum] = "ea0d3b40a2d852767be77ca343b58a9e3a4b00d9db440efb8da74b4e58025e5a"
> +
> +RDEPENDS_${PN} += "\
> +	python3-json \
> +	python3-netclient \
> +	python3-threading \
> +	python3-xml \
> +	python3-logging \
> +	python3-pickle \
> +	python3-netserver \
> +"
> +
> +inherit setuptools3 pypi
> +
> -- 
> 2.25.1
> 
> 
> 

> 


