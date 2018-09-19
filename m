Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 254F5E00B4C; Wed, 19 Sep 2018 01:00:24 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.208.194 listed in list.dnswl.org]
Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com
	[209.85.208.194])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0159DE00A4F
	for <meta-virtualization@yoctoproject.org>;
	Wed, 19 Sep 2018 01:00:22 -0700 (PDT)
Received: by mail-lj1-f194.google.com with SMTP id s12-v6so4164667ljj.0
	for <meta-virtualization@yoctoproject.org>;
	Wed, 19 Sep 2018 01:00:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=8VQQvQF0GrDojjfIFCXwy0jBJT+7Aaifnw6mYBP3VL8=;
	b=gRyUnRSC2BolnIyfQemcFQiI06cZH/wSEMRxwNjVvTMH5wmAzGgRCFsn++clE8TCEH
	MBlKMZI3/YUF9QSH9CxabT0w3jmczKZo9ANCVnzcQ1dmE+cZRsjOlnrDvOlnz9sIA3I/
	2yDf6LhOs0qBDT5yO2cazbgdZcXsUU2J+2aTje3Fk3Q5/WRhzcfMJpJcY+lkIDhbT3q6
	J2AlZwT//J7iSDIn9MOOacQPO1pbrz9hTkbI7mxQ2TP5MeCMDrRm+QLlkSOv0OpCaebK
	QEIVmm0UhLnhuYI6/ipqzp3ePhiCr3f/AFqJH/T5leDQtH7yJSqRKG8xcap0OlMtFsiW
	TddA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=8VQQvQF0GrDojjfIFCXwy0jBJT+7Aaifnw6mYBP3VL8=;
	b=N8rWilZaOYI140wka3vC/9sMJE01LmoZKp9rjtSqLrkUuZKXHRISPSUjaopHG3UYED
	PqmoMQv6I294ouzmTV/xK+8xGKjWaZLh3RNIaPt9wLWx6PjqxiR7syhjlH1KImVFBMHU
	Fkse1saxWqvJJgeheAtRq+Hc05/uaoeq2PJbf43TIfepkitjiLRVDQVpiFBSd5oy/ZZh
	pkG3HRC82d6bCoLoq+2JWGhSMgtBqWTRnquXKWqB/SIFM3fdlts3abZWXizirLaUK+7Z
	q1Cp+3S+ir+k+WLvF1wQdi3OQ+1lYGrb5ru8ANaQw7PpSARmXWwkpj4x5LvH3pRkaKeB
	twsQ==
X-Gm-Message-State: APzg51AoQkJlT1bIzPG2Tdd9KY26478S+QJIwW2WzvpWpNrPgA8lVEnv
	xxoRrNX0G2U0p58R3q3wUJSYNEtOjgE+6XjwOaRt0Q==
X-Google-Smtp-Source: ANB0Vdb5ZiRx2tYuPDEEYAWMf/gVsk1ezgXfsOsi2Ng78iwKYPj2ccY4QqBlUC+jDwqpnYTUp4RVmNNf88uUmVndrzI=
X-Received: by 2002:a2e:2b1b:: with SMTP id
	q27-v6mr21005676lje.147.1537344021901; 
	Wed, 19 Sep 2018 01:00:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a2e:86c9:0:0:0:0:0 with HTTP; Wed, 19 Sep 2018 01:00:21
	-0700 (PDT)
In-Reply-To: <20180918093631.1253-1-hongl.fnst@cn.fujitsu.com>
References: <20180918093631.1253-1-hongl.fnst@cn.fujitsu.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 19 Sep 2018 04:00:21 -0400
Message-ID: <CADkTA4N=k=hbrEi+_hWhX9+YUx30201iPVMOc-yauW0RVSG23A@mail.gmail.com>
To: Hong Liu <hongl.fnst@cn.fujitsu.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] [meta-cloud-services][patch]:python-psycopg2:2.7.4 -> 2.7.5
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
X-List-Received-Date: Wed, 19 Sep 2018 08:00:24 -0000
Content-Type: text/plain; charset="UTF-8"

merged

Bruce

On Tue, Sep 18, 2018 at 5:36 AM, Hong Liu <hongl.fnst@cn.fujitsu.com> wrote:
> 1.Upgrade python-psycopg2 from 2.7.4 to 2.7.5
>
> 2.Modify LIC_FILES_CHKSUM.because of delete BSD-like license
>
> Signed-off-by: Hong Liu <hongl.fnst@cn.fujitsu.com>
> ---
>  .../python/{python-psycopg2_2.7.4.bb => python-psycopg2_2.7.5.bb}   | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>  rename meta-openstack/recipes-devtools/python/{python-psycopg2_2.7.4.bb => python-psycopg2_2.7.5.bb} (57%)
>
> diff --git a/meta-openstack/recipes-devtools/python/python-psycopg2_2.7.4.bb b/meta-openstack/recipes-devtools/python/python-psycopg2_2.7.5.bb
> similarity index 57%
> rename from meta-openstack/recipes-devtools/python/python-psycopg2_2.7.4.bb
> rename to meta-openstack/recipes-devtools/python/python-psycopg2_2.7.5.bb
> index 674322d..740643d 100644
> --- a/meta-openstack/recipes-devtools/python/python-psycopg2_2.7.4.bb
> +++ b/meta-openstack/recipes-devtools/python/python-psycopg2_2.7.5.bb
> @@ -2,15 +2,15 @@ DESCRIPTION = "Python-PostgreSQL Database Adapter"
>  HOMEPAGE = "http://initd.org/psycopg/"
>  SECTION = "devel/python"
>  LICENSE = "GPLv3+"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=2c9872d13fa571e7ba6de95055da1fe2"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=72bded22a37845c7d9dc3fd39d699a2d"
>  DEPENDS = "postgresql"
>
>  SRC_URI += " \
>             file://remove-pg-config.patch \
>            "
>
> -SRC_URI[md5sum] = "70fc57072e084565a42689d416cf2c5c"
> -SRC_URI[sha256sum] = "8bf51191d60f6987482ef0cfe8511bbf4877a5aa7f313d7b488b53189cf26209"
> +SRC_URI[md5sum] = "9e7d6f695fc7f8d1c42a7905449246c9"
> +SRC_URI[sha256sum] = "eccf962d41ca46e6326b97c8fe0a6687b58dfc1a5f6540ed071ff1474cea749e"
>
>  inherit distutils pypi
>
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

