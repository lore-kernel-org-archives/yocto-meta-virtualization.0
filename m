Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 78A0BE00BE6; Sat, 14 Sep 2019 21:05:07 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, FSL_HELO_FAKE,
	RCVD_IN_DNSWL_NONE autolearn=no version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000] *  1.7 FSL_HELO_FAKE FSL_HELO_FAKE
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (bruce.ashfield[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/,
	no *      trust
	*      [209.85.166.50 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-io1-f50.google.com (mail-io1-f50.google.com
	[209.85.166.50])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 03564E007C2
	for <meta-virtualization@yoctoproject.org>;
	Sat, 14 Sep 2019 21:05:06 -0700 (PDT)
Received: by mail-io1-f50.google.com with SMTP id m11so71315095ioo.0
	for <meta-virtualization@yoctoproject.org>;
	Sat, 14 Sep 2019 21:05:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=Noew9+2H+SpPCm69WF+XghsZF45u2HrXs9BoGt81BQ8=;
	b=q5i1U/vNf+Fa1BeCJR9TflZ2h4BgjjgVeqHL6Tx8bJgY9mE4dzfP6IMFbHxkMrnQst
	Ys3rRRqJrMfnsf5S5lj0AxBTFAiay3wjZaHIDUdEuCnL+pilpCfDcmFjz1AhSqKAo+ng
	hLZJx/C1yAmXUoRwXxuHaZQ8AKZyrAvvb/4lZkk1+TgmuR1OQtVwgTj7mpNRQCIropED
	OzXYyc55n9z5mrbJWZrd7AyvbzV+E5hr1CV6Qro+D92DxtiG2/uqcGuNLqAdWfj+w89y
	IH6F0RFMg3kpiF6+RowZS5TnVN9E+WBmI3nfs5FEVcAAscAA+VUjcJpwJTXeyW5ZwR0c
	KC5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=Noew9+2H+SpPCm69WF+XghsZF45u2HrXs9BoGt81BQ8=;
	b=cxbn306k93UrQmapDbHBdeRvUTq6iF4Mv6mtjAuf51OTYMLLWuI/ZCoHWksx2BuZR/
	R6K0LMicb5evRA5ST0c+tGCbu+zcRUGvrva/TaDZnTXRDUVPqyn+PMQcPG5Kfg9FN7x+
	Nc0TPKyOYQN7/AJcxnk8N9vRt/f4a6lIuQaoT4x5y0GuDZJtVXJgNcb7LxVuurudUv5m
	z/E847WgK9IdR/6WgSESKUEG489gPsz6Rjpr3SqcQ5dqR12lbGpBYPP2ABF9vUrWs78i
	TdpvPPiIWsPkjz5BzOKfHWfyK0eIeXmwPgIHO79h4/E/W490m1glE5/hkbYHwF4h3bXU
	u20g==
X-Gm-Message-State: APjAAAWRcPDw8Hgt7A9WJAsSds7pogTAE5/QuH18nTk0J+7qVKL8VMKV
	5LnckudhCbx7w79HkjYyIzM=
X-Google-Smtp-Source: APXvYqxBMmdWWKC0v/NIO9ayj7Rt4KngFHcV/8+xwX83wP5HD3z1zr1YtHxgJN8uXqrV0UClXxu5Ww==
X-Received: by 2002:a02:8644:: with SMTP id e62mr36792410jai.115.1568520306229;
	Sat, 14 Sep 2019 21:05:06 -0700 (PDT)
Received: from gmail.com
	(CPEe8de27b71faa-CM64777d5e8820.cpe.net.cable.rogers.com.
	[174.112.251.208]) by smtp.gmail.com with ESMTPSA id
	g4sm22739605ion.26.2019.09.14.21.05.05
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 14 Sep 2019 21:05:05 -0700 (PDT)
Date: Sun, 15 Sep 2019 00:05:03 -0400
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
Message-ID: <20190915040502.GE4367@gmail.com>
References: <20190912071505.1140-1-zangrc.fnst@cn.fujitsu.com>
MIME-Version: 1.0
In-Reply-To: <20190912071505.1140-1-zangrc.fnst@cn.fujitsu.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] python-suds-jurko: Add python3 version
X-BeenThere: meta-virtualization@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: "Discussion of layer enabling hypervisor, virtualization tool stack,
	and cloud support" <meta-virtualization.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-virtualization>
List-Post: <mailto:meta-virtualization@yoctoproject.org>
List-Help: <mailto:meta-virtualization-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Sun, 15 Sep 2019 04:05:07 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

merged.

Bruce

In message: [meta-virtualization] [PATCH] python-suds-jurko: Add python3 version
on 12/09/2019 Zang Ruochen wrote:

> Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
> ---
>  .../recipes-devtools/python/python-suds-jurko.inc   | 20 ++++++++++++++++++++
>  .../python/python-suds-jurko_0.6.bb                 | 21 ++-------------------
>  .../python/python3-suds-jurko_0.6.bb                |  3 +++
>  3 files changed, 25 insertions(+), 19 deletions(-)
>  create mode 100644 meta-openstack/recipes-devtools/python/python-suds-jurko.inc
>  create mode 100644 meta-openstack/recipes-devtools/python/python3-suds-jurko_0.6.bb
> 
> diff --git a/meta-openstack/recipes-devtools/python/python-suds-jurko.inc b/meta-openstack/recipes-devtools/python/python-suds-jurko.inc
> new file mode 100644
> index 0000000..579212a
> --- /dev/null
> +++ b/meta-openstack/recipes-devtools/python/python-suds-jurko.inc
> @@ -0,0 +1,20 @@
> +DESCRIPTION = "Lightweight SOAP client (Jurko's fork)"
> +HOMEPAGE = "https://bitbucket.org/jurko/suds"
> +SECTION = "devel/python"
> +LICENSE = "LGPLv3"
> +LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=847e96bce86d8774f491a92924343a29"
> +
> +PYPI_PACKAGE_EXT = "tar.bz2"
> +
> +SRC_URI[md5sum] = "1309e9bc2454aa3434041f0a24ae4e11"
> +SRC_URI[sha256sum] = "29edb72fd21e3044093d86f33c66cf847c5aaab26d64cb90e69e528ef014e57f"
> +
> +inherit pypi
> +
> +DEPENDS += " \
> +        ${PYTHON_PN}-pip \
> +        "
> +
> +RDEPENDS_${PN} += " \
> +        "
> +
> diff --git a/meta-openstack/recipes-devtools/python/python-suds-jurko_0.6.bb b/meta-openstack/recipes-devtools/python/python-suds-jurko_0.6.bb
> index a4a436f..52bb6d8 100644
> --- a/meta-openstack/recipes-devtools/python/python-suds-jurko_0.6.bb
> +++ b/meta-openstack/recipes-devtools/python/python-suds-jurko_0.6.bb
> @@ -1,20 +1,3 @@
> -DESCRIPTION = "Lightweight SOAP client (Jurko's fork)"
> -HOMEPAGE = "https://bitbucket.org/jurko/suds"
> -SECTION = "devel/python"
> -LICENSE = "LGPLv3"
> -LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=847e96bce86d8774f491a92924343a29"
> -
> -PYPI_PACKAGE_EXT = "tar.bz2"
> -
> -SRC_URI[md5sum] = "1309e9bc2454aa3434041f0a24ae4e11"
> -SRC_URI[sha256sum] = "29edb72fd21e3044093d86f33c66cf847c5aaab26d64cb90e69e528ef014e57f"
> -
> -inherit setuptools pypi
> -
> -DEPENDS += " \
> -        python-pip \
> -        "
> -
> -RDEPENDS_${PN} += " \
> -        "
> +inherit setuptools
> +require python-suds-jurko.inc
>  
> diff --git a/meta-openstack/recipes-devtools/python/python3-suds-jurko_0.6.bb b/meta-openstack/recipes-devtools/python/python3-suds-jurko_0.6.bb
> new file mode 100644
> index 0000000..d230c8d
> --- /dev/null
> +++ b/meta-openstack/recipes-devtools/python/python3-suds-jurko_0.6.bb
> @@ -0,0 +1,3 @@
> +inherit setuptools3
> +require python-suds-jurko.inc
> +
> -- 
> 2.7.4
> 
> 
> 
> -- 
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization

