Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 8E7EEE00A04; Mon, 23 Jul 2018 12:53:50 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.167.66 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com
	[209.85.167.66])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D9965E00A04
	for <meta-virtualization@yoctoproject.org>;
	Mon, 23 Jul 2018 12:53:48 -0700 (PDT)
Received: by mail-lf1-f66.google.com with SMTP id m12-v6so1328542lfc.10
	for <meta-virtualization@yoctoproject.org>;
	Mon, 23 Jul 2018 12:53:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Qnd5XvC6Yf9tVyr4vyrqutKh/0msgwPFYl9GLRD6UtE=;
	b=VLAWq3ib0dnSmE3/oIRGlKpoqg6DkDTIl57cA+pweNkIkmuQG19ohHSIEPYuqXGKmN
	mbofaCqvnOTq9WJMcE2jT7M2sareMfC06XOT5kSg6EiWdW9tWdnWFkMk4wDAXhrJZsP8
	QtTeLez9I7yVMsI5bb+DHrmi4Y2IXTrw2c5XugFuDZZgQMywFyShp/akjMO8lDkDt9NI
	GiYQ7cw3qKL4sxVrAMU9l4JKW34kTWJ86wWwwI6hCbhogBmJlvTOvTceeOn6+rxXT4Mu
	ly5Y9G7b9lYMo2Sb/CDHr9n/STW8oovxoTbdx7/ipVk5TmcKcMLm6zCidkI16r6B1Tex
	UJ4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Qnd5XvC6Yf9tVyr4vyrqutKh/0msgwPFYl9GLRD6UtE=;
	b=LF4ZZXGHhKe61xgS9hS6RPwNrOLYXoVIAKErBo6IktFc99SAz89r6uvIWu8yZPncGb
	wDZ3KLBfRwZwt5mErsJGIXAEuN6iVv6C2dXSYWPu4sq5TxkQjgOiKpd2yWLgjmnUL5Y5
	kERSmA0Zql9nOv4O+Ub/Va17F8Z7mBZUVGN1oMWO/ajZwh9llkHdGQDSN0GDEdE0/e+G
	gUGoGrajVUsyyBvxhM8kjJC3yMJGYHNx06dX6XG8muEqW8c+5vHP0YN1CtNziSKvrbfL
	1cNZuIYXfnx1nc++pfIwi4dHdjkKlfNWGPY3Ye32pRQCYPa24f/54rXhQnasfHuqR0RE
	gzKw==
X-Gm-Message-State: AOUpUlEQU5+uipc4P41n+Az1clSH2tx4APVvgK5z7MwEMvPm7xxqsrG6
	lTnky/PS6Q5zEp3JmU7EPA3UKS2HHEd6uDnkpaezbg==
X-Google-Smtp-Source: AAOMgpevfRirZZh1O++RLm6pAQZW8tzBGoVlr8JezZ5LdcdaCwal5PsYkdWCxcJmdyU0wz1SeS4Lyfy5yLpnJpmag0o=
X-Received: by 2002:a19:b598:: with SMTP id
	g24-v6mr8552471lfk.129.1532375627735; 
	Mon, 23 Jul 2018 12:53:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a2e:9acd:0:0:0:0:0 with HTTP; Mon, 23 Jul 2018 12:53:47
	-0700 (PDT)
In-Reply-To: <20180723090011.11902-1-hongl.fnst@cn.fujitsu.com>
References: <20180723090011.11902-1-hongl.fnst@cn.fujitsu.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 23 Jul 2018 15:53:47 -0400
Message-ID: <CADkTA4Na_df2UhRH8xHHwsxuD02BWeBiysJQ29+u=x3WEdJOoQ@mail.gmail.com>
To: Hong Liu <hongl.fnst@cn.fujitsu.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] [meta-cloud-services][patch]:python-sphinx:1.4.1->1.7.6
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
X-List-Received-Date: Mon, 23 Jul 2018 19:53:50 -0000
Content-Type: text/plain; charset="UTF-8"

merged

Bruce

On Mon, Jul 23, 2018 at 5:00 AM, Hong Liu <hongl.fnst@cn.fujitsu.com> wrote:
> 1.Upgrade python-sphinx from 1.4.1 to 1.7.6.
>
> 2.Modify LIC_FILES_CHKSUM,because of delete "PYTHON SOFTWARE FOUNDATION LICENSE VERSION 2"
>
> Signed-off-by: Hong Liu <hongl.fnst@cn.fujitsu.com>
> ---
>  recipes-devtools/python/python-sphinx_1.4.1.bb | 12 ------------
>  recipes-devtools/python/python-sphinx_1.7.6.bb | 12 ++++++++++++
>  2 files changed, 12 insertions(+), 12 deletions(-)
>  delete mode 100644 recipes-devtools/python/python-sphinx_1.4.1.bb
>  create mode 100644 recipes-devtools/python/python-sphinx_1.7.6.bb
>
> diff --git a/recipes-devtools/python/python-sphinx_1.4.1.bb b/recipes-devtools/python/python-sphinx_1.4.1.bb
> deleted file mode 100644
> index 476ff97..0000000
> --- a/recipes-devtools/python/python-sphinx_1.4.1.bb
> +++ /dev/null
> @@ -1,12 +0,0 @@
> -DESCRIPTION = "Python documentation generator"
> -HOMEPAGE = "http://sphinx-doc.org/"
> -SECTION = "devel/python"
> -LICENSE = "BSD"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=72f034adc6f7b05b09bc00d1a05bb065"
> -
> -PYPI_PACKAGE = "Sphinx"
> -
> -SRC_URI[md5sum] = "4c4988e0306a04cef8dccc384281e585"
> -SRC_URI[sha256sum] = "c6871a784d24aba9270b6b28541537a57e2fcf4d7c799410eba18236bc76d6bc"
> -
> -inherit setuptools pypi
> diff --git a/recipes-devtools/python/python-sphinx_1.7.6.bb b/recipes-devtools/python/python-sphinx_1.7.6.bb
> new file mode 100644
> index 0000000..0200c9e
> --- /dev/null
> +++ b/recipes-devtools/python/python-sphinx_1.7.6.bb
> @@ -0,0 +1,12 @@
> +DESCRIPTION = "Python documentation generator"
> +HOMEPAGE = "http://sphinx-doc.org/"
> +SECTION = "devel/python"
> +LICENSE = "BSD"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=89cbefcd0a80481e8b26a9a7d25be749"
> +
> +PYPI_PACKAGE = "Sphinx"
> +
> +SRC_URI[md5sum] = "8fbd77d80c8e0966964751ab31a0204a"
> +SRC_URI[sha256sum] = "217ad9ece2156ed9f8af12b5d2c82a499ddf2c70a33c5f81864a08d8c67b9efc"
> +
> +inherit setuptools pypi
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



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

