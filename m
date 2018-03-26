Return-Path: <asselsm@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 0E54BE00B8E; Mon, 26 Mar 2018 11:24:31 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.213.195 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-yb0-f195.google.com (mail-yb0-f195.google.com
	[209.85.213.195])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 204BFE0084D
	for <meta-virtualization@yoctoproject.org>;
	Mon, 26 Mar 2018 11:24:29 -0700 (PDT)
Received: by mail-yb0-f195.google.com with SMTP id y15-v6so3536961ybb.7
	for <meta-virtualization@yoctoproject.org>;
	Mon, 26 Mar 2018 11:24:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=dV5pdsxsa18AHlzrquOt+jiaWz7jPRI+yz8ildDrVf8=;
	b=eZN1tNIwm7dq3HNYg/Ehk4+tBVXBgZuHGoXHW4O7eA79pP45r+2sRC23Vt3vlhrW7U
	j9Q2N4YxCOaTZrCU8kuUaCeit8ER8SOigIFE5sw0MBrKeBqUWcA1x/HImdm69NRC7h12
	D2x4jQOyB+yrckGANerwdOcl4P6aB/63IVJys/hD2wk27LBXm9nafpjeDoxukTsjLAwZ
	UHtggKNF/7v7aldXaKioXRlcHdIbiV404VqmC+P5KQtvQtNFBvFndMzizaStWSa+qnj9
	KZ/lCQvb6+88vCuNM/RmQzwnaJre721VuXq6rUXMWgKL6FTZJNCnQmR35wmX6Wwqzu71
	0I2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=dV5pdsxsa18AHlzrquOt+jiaWz7jPRI+yz8ildDrVf8=;
	b=g7jcF5BaIm0Ai9KFqjEt4iUl2jCTNuI/XrBS7aQ2xyJG+jBGX664b1RPcrTjGFPNmg
	MktaVc/O+zjSpesye5EX1ErsgWIYa05TxEGdwNgFa37o9p0FQFKnlsQg4XZQJdBp3vs7
	FAY4TwPSfiefW7p0ZpigF3A9sYKfMV8iiMn9/LIcxwA5RCeBH3C6pdbVPs92i7JxuhA0
	+o2vQ3ojO74AcK2uxGuV0YE45yDzuz4+NEEVIy7KsDaxVikCk7qkfOix3EALeYQgVB6z
	N1iZJ8K5ZKKe5itIsAgqYV6YhTdiDXKD2xbyuzMO97CciIRMXbDD0cO6bExFzErBjxIa
	ZITA==
X-Gm-Message-State: AElRT7GFuZ6n7dAjVcZvOTheuGBwg+ZNjE0YvJJPQdPck6YsacvLhTy2
	kE4ALd9uySbEPzLMilBiUpIVJppm+oLK7XgBKRo=
X-Google-Smtp-Source: AG47ELuxhRdaMND0omV8Xm62U+uUwwHhlewAtLNeLzkq9ZrNIir0TIRL1kma7mS/oXPrazZXRZYw2SMzTee96QpWRjQ=
X-Received: by 2002:a25:7254:: with SMTP id
	n81-v6mr24177766ybc.469.1522088668809; 
	Mon, 26 Mar 2018 11:24:28 -0700 (PDT)
MIME-Version: 1.0
Sender: asselsm@gmail.com
Received: by 2002:a25:dec6:0:0:0:0:0 with HTTP; Mon, 26 Mar 2018 11:24:28
	-0700 (PDT)
In-Reply-To: <1521775736-38102-5-git-send-email-huangqy.fnst@cn.fujitsu.com>
References: <1521775736-38102-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
	<1521775736-38102-5-git-send-email-huangqy.fnst@cn.fujitsu.com>
From: "M. Asselstine" <asselsm@mcmaster.ca>
Date: Mon, 26 Mar 2018 14:24:28 -0400
X-Google-Sender-Auth: dN2PkkXyYHWPQAMIQicr7pOuols
Message-ID: <CAPuovEJwi==sPu5tNO1s9yiLA3x3iyScxTt36nfTVKoW75d7ew@mail.gmail.com>
To: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [meta-cloud-services][PATCH] python-psycopg2: 2.6.2 -> 2.7.4
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
X-List-Received-Date: Mon, 26 Mar 2018 18:24:31 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Mar 22, 2018 at 11:28 PM, Huang Qiyu
<huangqy.fnst@cn.fujitsu.com> wrote:
> 1.Upgrade python-psycopg2 from 2.6.2 to 2.7.4.
> 2.Modify remove-pg-config.patch, since the data has been changed.
>
> Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
> ---

This one should be fine. Not sure if we actually have any direct
dependencies if were to cleanup some of our recipes, so possibly a
candidate to abandon to meta-python. At any rate, should be fine to
merge.

Mark

>  .../recipes-devtools/python/python-psycopg2/remove-pg-config.patch | 7 ++++---
>  .../python/{python-psycopg2_2.6.2.bb => python-psycopg2_2.7.4.bb}  | 4 ++--
>  2 files changed, 6 insertions(+), 5 deletions(-)
>  rename meta-openstack/recipes-devtools/python/{python-psycopg2_2.6.2.bb => python-psycopg2_2.7.4.bb} (71%)
>
> diff --git a/meta-openstack/recipes-devtools/python/python-psycopg2/remove-pg-config.patch b/meta-openstack/recipes-devtools/python/python-psycopg2/remove-pg-config.patch
> index 37acc30..8f426f5 100644
> --- a/meta-openstack/recipes-devtools/python/python-psycopg2/remove-pg-config.patch
> +++ b/meta-openstack/recipes-devtools/python/python-psycopg2/remove-pg-config.patch
> @@ -14,13 +14,14 @@ diff --git a/setup.cfg b/setup.cfg
>  index d00ce92..4b45aac 100644
>  --- a/setup.cfg
>  +++ b/setup.cfg
> -@@ -1,5 +1,6 @@
> +@@ -1,6 +1,6 @@
>   [build_ext]
>   define =
> +-pg_config =
>  +pg_config="/bin/true"
>   use_pydatetime = 1
> + mx_include_dir =
>   have_ssl = 0
> -
>  diff --git a/setup.py b/setup.py
>  index d71d489..b101696 100644
>  --- a/setup.py
> @@ -42,7 +43,7 @@ index d71d489..b101696 100644
>  +                pgversion = "9.4.4"
>
>               verre = re.compile(
> -                 r"(\d+)\.(\d+)(?:(?:\.(\d+))|(devel|(alpha|beta|rc)\d+))")
> +                 r"(\d+)(?:\.(\d+))?(?:(?:\.(\d+))|(devel|(?:alpha|beta|rc)\d+))?")
>  --
>  2.7.4
>
> diff --git a/meta-openstack/recipes-devtools/python/python-psycopg2_2.6.2.bb b/meta-openstack/recipes-devtools/python/python-psycopg2_2.7.4.bb
> similarity index 71%
> rename from meta-openstack/recipes-devtools/python/python-psycopg2_2.6.2.bb
> rename to meta-openstack/recipes-devtools/python/python-psycopg2_2.7.4.bb
> index 37a4bdd..674322d 100644
> --- a/meta-openstack/recipes-devtools/python/python-psycopg2_2.6.2.bb
> +++ b/meta-openstack/recipes-devtools/python/python-psycopg2_2.7.4.bb
> @@ -9,8 +9,8 @@ SRC_URI += " \
>             file://remove-pg-config.patch \
>            "
>
> -SRC_URI[md5sum] = "4a392949ba31a378a18ed3e775a4693f"
> -SRC_URI[sha256sum] = "70490e12ed9c5c818ecd85d185d363335cc8a8cbf7212e3c185431c79ff8c05c"
> +SRC_URI[md5sum] = "70fc57072e084565a42689d416cf2c5c"
> +SRC_URI[sha256sum] = "8bf51191d60f6987482ef0cfe8511bbf4877a5aa7f313d7b488b53189cf26209"
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

