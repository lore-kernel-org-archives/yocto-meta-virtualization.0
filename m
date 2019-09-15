Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 9FC57E00B1B; Sat, 14 Sep 2019 21:04:19 -0700 (PDT)
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
	*      [209.85.166.44 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-io1-f44.google.com (mail-io1-f44.google.com
	[209.85.166.44])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 326A1E007C2
	for <meta-virtualization@yoctoproject.org>;
	Sat, 14 Sep 2019 21:04:18 -0700 (PDT)
Received: by mail-io1-f44.google.com with SMTP id j4so71279819iog.11
	for <meta-virtualization@yoctoproject.org>;
	Sat, 14 Sep 2019 21:04:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=s88dC0PD2frjq1K8We3Ib8tQJN4YlUJWoKgZSEhdvPk=;
	b=H81zfq6hZWBS5n/eY3Txa58uHrCoDmniEendnh5rEkRQQD05/DhETkylmOdjZK9aHH
	dYr7moTBQOefFls5T/bgirzft3CKEL+2LKd7wtELNl33CovBoFEg9goinShu7kdC2J3i
	yxJ1VFrZ4hSXBp98T1AYroBhB6OEMElO1SMNSC7vWptdI/1o5wO07FEtIFvXx/QLwr8y
	KQCo70De8V1M0NQuN4l+m9N9ttOZvkVaJCNhIVQiPjfboBGIhpOfslFUJmQSdQ8UIHQt
	eI8Uqdg13oY3jLI4oWr+zst9YG4MFhWrbXlRjYE/C3+ZT+A4SAFXd1/Z9RyznoXHiQ1+
	zQ4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=s88dC0PD2frjq1K8We3Ib8tQJN4YlUJWoKgZSEhdvPk=;
	b=PYrDTlOu5WP0I7FiYkNMYmk7+vrxWOeYqZSfkkAfz2zvAbhp8o/p26mn06mJ5+HiUx
	5w1qvY1b0ZldodcOyCHgpPLGh8Jk3H41nc8mjiC+Lv5iyqk3cDciV4XAFje+daMi5qLe
	S3wtbMaMXjm/maYduYwbhy29PHhTmC+NCQqdnmMkvvZCjzmJ94SNNfD/kzY7eOb1dmsK
	phh2mOehjzesbAx9cJ9EUizcqebMVIEPXAu+jOvpsc5pfNwbPfYM5mldbmnDcG1NdAOF
	Ucy6eZPi4X18yduh4dJgwKGuv7zeXCtfY/xHQLoO2IpwAXkhSAWZAlGRsVBhgH1FilwE
	wWvg==
X-Gm-Message-State: APjAAAUj0sH3twka1FeIG/2OKABohydexH1Pg0PTfQ4qH0Yp3IRGe9b4
	DZ6VrUovUcrp8gC80n4OhP/Pil+f0ZA=
X-Google-Smtp-Source: APXvYqyBcZ+e4EirX4iYCn1c4wGR1JZstf3omt68IQuDH685fmrljmcmT6m7mqkJV+Mf3BtGjmZJNw==
X-Received: by 2002:a02:cdca:: with SMTP id m10mr8037625jap.44.1568520258171; 
	Sat, 14 Sep 2019 21:04:18 -0700 (PDT)
Received: from gmail.com
	(CPEe8de27b71faa-CM64777d5e8820.cpe.net.cable.rogers.com.
	[174.112.251.208]) by smtp.gmail.com with ESMTPSA id
	h70sm68630206iof.48.2019.09.14.21.04.17
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 14 Sep 2019 21:04:17 -0700 (PDT)
Date: Sun, 15 Sep 2019 00:04:15 -0400
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
Message-ID: <20190915040412.GA4367@gmail.com>
References: <20190910015911.21816-1-zangrc.fnst@cn.fujitsu.com>
MIME-Version: 1.0
In-Reply-To: <20190910015911.21816-1-zangrc.fnst@cn.fujitsu.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] python-zaqarclient: upgrade 1.11.0 -> 1.12.0
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
X-List-Received-Date: Sun, 15 Sep 2019 04:04:19 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

merged

Bruce

In message: [meta-virtualization] [PATCH] python-zaqarclient: upgrade 1.11.0 -> 1.12.0
on 10/09/2019 Zang Ruochen wrote:

> Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
> ---
>  meta-openstack/recipes-devtools/python/python-zaqarclient_git.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta-openstack/recipes-devtools/python/python-zaqarclient_git.bb b/meta-openstack/recipes-devtools/python/python-zaqarclient_git.bb
> index e6f92f7..699d380 100644
> --- a/meta-openstack/recipes-devtools/python/python-zaqarclient_git.bb
> +++ b/meta-openstack/recipes-devtools/python/python-zaqarclient_git.bb
> @@ -30,8 +30,8 @@ RDEPENDS_${PN} +=" \
>  SRCNAME = "zaqarclient"
>  SRC_URI = "git://github.com/openstack/${BPN}.git"
>  
> -PV = "1.11.0+git${SRCPV}"
> -SRCREV = "13e90a0ab5e296fb8cf21d09c666c06ed47a84c0"
> +PV = "1.12.0+git${SRCPV}"
> +SRCREV = "9038bf6ba93c24c9a61447dfcb14e436f1267066"
>  S = "${WORKDIR}/git"
>  
>  inherit setuptools
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

