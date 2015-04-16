Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 02FF0E00965; Thu, 16 Apr 2015 12:13:43 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.214.173 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-ob0-f173.google.com (mail-ob0-f173.google.com
	[209.85.214.173])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CA10AE0049A
	for <meta-virtualization@yoctoproject.org>;
	Thu, 16 Apr 2015 12:13:32 -0700 (PDT)
Received: by obbeb7 with SMTP id eb7so50709953obb.3
	for <meta-virtualization@yoctoproject.org>;
	Thu, 16 Apr 2015 12:13:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=sqbilRjd5kb5iIdvvxfDbYtlU/6pFA4WmvKFWUnLk8Y=;
	b=dET8jHj10NI94JTUqj4jGsZ4Cch1AXY586RQ5lzzvDnaRteUCMpS6/GpP5zuQ6O6p7
	6HnOycvhvlhVkGUwceJkhmE/QN+rwYq84Qc0nRYiVR3RhbUjqalSKkf9qGwXlrMd0oiM
	G+k/6OHw7GD6d/b3OB6R66kU3r+Pthkx/hKnelDQW53bZ7dgtdglrJ8I/ofkf0WGxTf0
	QD5pYWF+3e/KUPPrTLlGLowKv/2OswNZK6BW1YVh8We9Zo4uMGsVBPQpzd5ZOl77DgMS
	VEvxxLHSZGV6jWEonPOFJMVAS14rA9Cphv5RVIDSoSUjeVXSVepan2P/AZxPnvdWQFLG
	5/MA==
MIME-Version: 1.0
X-Received: by 10.202.201.3 with SMTP id z3mr21742342oif.130.1429211611906;
	Thu, 16 Apr 2015 12:13:31 -0700 (PDT)
Received: by 10.202.9.193 with HTTP; Thu, 16 Apr 2015 12:13:31 -0700 (PDT)
In-Reply-To: <1429156721-39898-1-git-send-email-leimaohui@cn.fujitsu.com>
References: <1429156721-39898-1-git-send-email-leimaohui@cn.fujitsu.com>
Date: Thu, 16 Apr 2015 15:13:31 -0400
Message-ID: <CADkTA4N7oqyy1-=WhcCTF+vULC3pXFoiLwXMNhHiOOi-7jXeZg@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Lei Maohui <leimaohui@cn.fujitsu.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] python-psycopg2_2.5: The license should be GPLv3+
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
X-List-Received-Date: Thu, 16 Apr 2015 19:13:43 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Apr 15, 2015 at 11:58 PM, Lei Maohui <leimaohui@cn.fujitsu.com> wrote:
> Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>

Thanks! I've merged the change.

Bruce

> ---
>  meta-openstack/recipes-devtools/python/python-psycopg2_2.5.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-openstack/recipes-devtools/python/python-psycopg2_2.5.bb b/meta-openstack/recipes-devtools/python/python-psycopg2_2.5.bb
> index c93e62b..ab4fe1f 100644
> --- a/meta-openstack/recipes-devtools/python/python-psycopg2_2.5.bb
> +++ b/meta-openstack/recipes-devtools/python/python-psycopg2_2.5.bb
> @@ -1,7 +1,7 @@
>  DESCRIPTION = "Python-PostgreSQL Database Adapter"
>  HOMEPAGE = "http://initd.org/psycopg/"
>  SECTION = "devel/python"
> -LICENSE = "GPLv2"
> +LICENSE = "GPLv3+
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=2c9872d13fa571e7ba6de95055da1fe2"
>  DEPENDS = "postgresql"
>
> --
> 1.8.4.2
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

