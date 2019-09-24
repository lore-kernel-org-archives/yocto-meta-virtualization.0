Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A841EE00D89; Tue, 24 Sep 2019 14:55:39 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	https://www.dnswl.org/, no *      trust
	*      [209.85.166.66 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (bruce.ashfield[at]gmail.com)
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
	[209.85.166.66])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 06900E00D83
	for <meta-virtualization@yoctoproject.org>;
	Tue, 24 Sep 2019 14:55:38 -0700 (PDT)
Received: by mail-io1-f66.google.com with SMTP id h144so8275429iof.7
	for <meta-virtualization@yoctoproject.org>;
	Tue, 24 Sep 2019 14:55:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=HToIOCzSUvWLjXzYWEYpLAdM5S7aXuVNThdAshFEGp4=;
	b=Vs5sx2ecpuPcbjS5Eeg8Mk6NAfQaEdpx6mh7sYBF5bOl/uuNSCWem2i3XmRS+sgigM
	c7EcL2ITJ/92hW4JHPvytwQg35Y6o9uvbR+q1EcivaA7ZwSaHg8uhkqXpDCZ3w63Pv4q
	nMJWjNTUzFTDQQDxjqw2d4ke0RKKCONvwKBr+RAgMbt3yLG1f6a+Axtp9IIvi7tOBI8v
	AW2pIWhH+6XeV0ZKYiKxm4MSDFjJCA/LMk98WGRoNj4BYqJhuXYhaDu1zK72FIQzBvem
	9Mp1F8WE1YCBHR85C8Tm4qOKf9SFMA7/YvmwlUVRfkcoqvLY2MqNGyehdaxTbNwABe5w
	iTRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=HToIOCzSUvWLjXzYWEYpLAdM5S7aXuVNThdAshFEGp4=;
	b=RagJU5VJZxCT2mo/p9U7jf9s71CbrulyscNySLXMeqZEIP6lel3C8x8Y9RDyk0vteo
	I/ia8SSfFFShBQ4reGvnFB57rozlqQOSOBU2k60QLYLFlGPnIElmMlQ3rtfcOcXBdgso
	ZUkwof1HU2t6RvBpqxQf4/vn7dyke9HMlYjtm36s5Z/1v50UQ5RQLnaNxEtaOPSto5JN
	hA5Yay28cxCW1nlyqIvDJhG+E6UkQEpNgusXcWu7YwYSuvxyogYHYko/5rKALQ0PjiXE
	MPKyI8c8WVgbY/fgQST6DFmBaeukcNwtkhJvLQeonTUxe9M9hOR5+0z+tdo5ilQKgWL0
	gq3Q==
X-Gm-Message-State: APjAAAXQ4vg5Pwx9FhIwMn9AHNFPEL7n1O/Aqxfvh4H7ZgKH3Las8v2f
	7jcu4j9Cx+MXowAWVs2LbJk=
X-Google-Smtp-Source: APXvYqxfewSgCMHjOQXZzgEuFjYtvgO8w+d7xMZXy4yFM6yaG09Epkf5AI/upjGN+mKZl/lOt8frqA==
X-Received: by 2002:a02:712b:: with SMTP id n43mr1288945jac.2.1569362138201;
	Tue, 24 Sep 2019 14:55:38 -0700 (PDT)
Received: from gmail.com
	(CPEe8de27b71faa-CM64777d5e8820.cpe.net.cable.rogers.com.
	[174.112.251.208]) by smtp.gmail.com with ESMTPSA id
	k22sm2181002iom.45.2019.09.24.14.55.37
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 24 Sep 2019 14:55:37 -0700 (PDT)
Date: Tue, 24 Sep 2019 17:55:35 -0400
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
Message-ID: <20190924215534.GD54158@gmail.com>
References: <20190924040026.6545-1-zangrc.fnst@cn.fujitsu.com>
MIME-Version: 1.0
In-Reply-To: <20190924040026.6545-1-zangrc.fnst@cn.fujitsu.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] python-setuptools-git: Add python3 version
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
X-List-Received-Date: Tue, 24 Sep 2019 21:55:39 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

merged

Bruce

In message: [meta-virtualization] [PATCH] python-setuptools-git: Add python3 version
on 24/09/2019 Zang Ruochen wrote:

> Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
> ---
>  .../recipes-devtools/python/python-setuptools-git.inc  | 16 ++++++++++++++++
>  .../python/python-setuptools-git_1.2.bb                | 18 ++----------------
>  .../python/python3-setuptools-git_1.2.bb               |  2 ++
>  3 files changed, 20 insertions(+), 16 deletions(-)
>  create mode 100644 meta-openstack/recipes-devtools/python/python-setuptools-git.inc
>  create mode 100644 meta-openstack/recipes-devtools/python/python3-setuptools-git_1.2.bb
> 
> diff --git a/meta-openstack/recipes-devtools/python/python-setuptools-git.inc b/meta-openstack/recipes-devtools/python/python-setuptools-git.inc
> new file mode 100644
> index 0000000..18bc1dc
> --- /dev/null
> +++ b/meta-openstack/recipes-devtools/python/python-setuptools-git.inc
> @@ -0,0 +1,16 @@
> +DESCRIPTION = "Plugin for setuptools that enables git integration"
> +HOMEPAGE = "https://github.com/wichert/setuptools-git"
> +SECTION = "devel/python"
> +LICENSE = "BSD"
> +LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3775480a712fc46a69647678acb234cb"
> +
> +SRC_URI[md5sum] = "40b2ef7687a384ea144503c2e5bc67e2"
> +SRC_URI[sha256sum] = "ff64136da01aabba76ae88b050e7197918d8b2139ccbf6144e14d472b9c40445"
> +
> +inherit pypi
> +
> +# conflicting file prevention
> +do_install_append() {
> +	rm -f ${D}${libdir}/python*/site-packages/site.py*
> +}
> +BBCLASSEXTEND = "native"
> diff --git a/meta-openstack/recipes-devtools/python/python-setuptools-git_1.2.bb b/meta-openstack/recipes-devtools/python/python-setuptools-git_1.2.bb
> index 2514017..0317002 100644
> --- a/meta-openstack/recipes-devtools/python/python-setuptools-git_1.2.bb
> +++ b/meta-openstack/recipes-devtools/python/python-setuptools-git_1.2.bb
> @@ -1,16 +1,2 @@
> -DESCRIPTION = "Plugin for setuptools that enables git integration"
> -HOMEPAGE = "https://github.com/wichert/setuptools-git"
> -SECTION = "devel/python"
> -LICENSE = "BSD"
> -LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3775480a712fc46a69647678acb234cb"
> -
> -SRC_URI[md5sum] = "40b2ef7687a384ea144503c2e5bc67e2"
> -SRC_URI[sha256sum] = "ff64136da01aabba76ae88b050e7197918d8b2139ccbf6144e14d472b9c40445"
> -
> -inherit setuptools pypi
> -
> -# conflicting file prevention
> -do_install_append() {
> -	rm -f ${D}${libdir}/python*/site-packages/site.py*
> -}
> -BBCLASSEXTEND = "native"
> +inherit setuptools
> +require python-setuptools-git.inc
> diff --git a/meta-openstack/recipes-devtools/python/python3-setuptools-git_1.2.bb b/meta-openstack/recipes-devtools/python/python3-setuptools-git_1.2.bb
> new file mode 100644
> index 0000000..5dd6804
> --- /dev/null
> +++ b/meta-openstack/recipes-devtools/python/python3-setuptools-git_1.2.bb
> @@ -0,0 +1,2 @@
> +inherit setuptools3
> +require python-setuptools-git.inc
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

