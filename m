Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 371F3E00D60; Sun, 25 Aug 2019 19:25:02 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	https://www.dnswl.org/, no *      trust
	*      [209.85.167.68 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (bruce.ashfield[at]gmail.com)
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lf1-f68.google.com (mail-lf1-f68.google.com
	[209.85.167.68])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 10C1EE00CDF
	for <meta-virtualization@yoctoproject.org>;
	Sun, 25 Aug 2019 19:25:00 -0700 (PDT)
Received: by mail-lf1-f68.google.com with SMTP id v16so11016687lfg.11
	for <meta-virtualization@yoctoproject.org>;
	Sun, 25 Aug 2019 19:25:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=1zNPMR0kwCAr50jvI1+1jt8TuZqNxruXwpD2OvOGnbM=;
	b=q9zOLAB3QYCG8cPxpAEK9XB1nNw8a5KaEugOz4LPIbMH4KhzBQQ01Qm9eQiIEJsr6h
	7JO77HKONr4L1vLUNj3yUWt6b2Ui8aWUtdnJzOW2V9/ZTU2YGXyX3gLrWRXMqb9pnjtL
	UhR8ek8XAGzlXsLqGqle51Or8O8wCIG1cpts9AoxGWq+ZGlJgBj+w/XJ6OIdXdFuvF1n
	o/GQLXkVs3e6emdy0GAgf1hoHhZIK22sXM5Ij/8zcckqPorOAIeniuNzK0fpOcU2xQIz
	TpfqZvCl1m849f2v6ZxEzaxeCpMCRUBxn2q2eDMPQ+8lVOZVwLSbyZIKRQ7qT074ofKZ
	Kcbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=1zNPMR0kwCAr50jvI1+1jt8TuZqNxruXwpD2OvOGnbM=;
	b=owFdndOgXDAsdYDPVJtLSo9RtTFNWx6HEiBnIjFyhu9Wx1LUzGb4IdN3xr6ASmEay6
	crDSIQd4JNpFZvQ5ORguH9NDQM++gwXX6KkXLBguDSr+EC5nXUcIiYBWFDW6DS0NESlk
	lqykBNsC1qPztJJpENvCSD/hz9tyHmSkcS1q/wZrnKaV55a1Xv7764i3rrgA7FPxo3j5
	WVxWxqRPLGEjenTPmP0oIFEdfBSTdbI0f44tSLxhA0qYbBhgL02BO9mfWRnXHTf+zAD1
	oDp5BXgE+Q9iRifEriVC9mbVHnC0MX4p/h36tSHuB92Xh6xNgQIuhF78jrX+RACIRts8
	hvCQ==
X-Gm-Message-State: APjAAAUDdmCAHjbN+Dt8Tzj3K0rHqVou8CoQzrpwBj9RGpPqyAVF7exk
	r8fWZuaxkZDh7evmeBDiZA9pDfNOcXHZiOt2lZqVcTa3
X-Google-Smtp-Source: APXvYqyjgkslyQW9R989kM8/wgneS8ZON5SHGJchkuG3IsWOllVUoQ9f/rhyEsyExPNGhH8Sk9uCNzqMaxwPFLiNxq8=
X-Received: by 2002:a19:4959:: with SMTP id l25mr4281557lfj.140.1566786299905; 
	Sun, 25 Aug 2019 19:24:59 -0700 (PDT)
MIME-Version: 1.0
References: <20190814030302.15929-1-zangrc.fnst@cn.fujitsu.com>
In-Reply-To: <20190814030302.15929-1-zangrc.fnst@cn.fujitsu.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Sun, 25 Aug 2019 22:24:48 -0400
Message-ID: <CADkTA4MkLdvAuOaZJauMiVS8o4p5R8n5cuC5+jsG09J139Qn7g@mail.gmail.com>
To: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] python-eventlet: upgrade 0.24.0 -> 0.25.0
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
X-List-Received-Date: Mon, 26 Aug 2019 02:25:02 -0000
Content-Type: text/plain; charset="UTF-8"

merged

Bruce

On Tue, Aug 13, 2019 at 11:05 PM Zang Ruochen
<zangrc.fnst@cn.fujitsu.com> wrote:
>
> From: Yuan Chao <yuanc.fnst@cn.fujitsu.com>
>
> Remove 0.20.0.bb file.
>
> Signed-off-by: Yuan Chao <yuanc.fnst@cn.fujitsu.com>
> ---
>  .../recipes-devtools/python/python-eventlet_0.20.0.bb    | 16 ----------------
>  ...thon-eventlet_0.24.0.bb => python-eventlet_0.25.0.bb} |  4 ++--
>  2 files changed, 2 insertions(+), 18 deletions(-)
>  delete mode 100644 meta-openstack/recipes-devtools/python/python-eventlet_0.20.0.bb
>  rename meta-openstack/recipes-devtools/python/{python-eventlet_0.24.0.bb => python-eventlet_0.25.0.bb} (63%)
>
> diff --git a/meta-openstack/recipes-devtools/python/python-eventlet_0.20.0.bb b/meta-openstack/recipes-devtools/python/python-eventlet_0.20.0.bb
> deleted file mode 100644
> index 1d51f1a..0000000
> --- a/meta-openstack/recipes-devtools/python/python-eventlet_0.20.0.bb
> +++ /dev/null
> @@ -1,16 +0,0 @@
> -DESCRIPTION = "Highly concurrent networking library"
> -HOMEPAGE = "http://pypi.python.org/pypi/eventlet"
> -SECTION = "devel/python"
> -LICENSE = "MIT"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=56472ad6de4caf50e05332a34b66e778"
> -
> -SRC_URI[md5sum] = "057276232bf65f1db6aabf819e7ece6a"
> -SRC_URI[sha256sum] = "2e17cda85f2003796f13de0e6c59a5253c0afd1f45dfc97bb9b6bfb8962f7895"
> -
> -inherit setuptools pypi pypi
> -
> -RDEPENDS_${PN} += " \
> -    python-enum34 \
> -    python-enum-compat \
> -    python-greenlet \
> -    "
> diff --git a/meta-openstack/recipes-devtools/python/python-eventlet_0.24.0.bb b/meta-openstack/recipes-devtools/python/python-eventlet_0.25.0.bb
> similarity index 63%
> rename from meta-openstack/recipes-devtools/python/python-eventlet_0.24.0.bb
> rename to meta-openstack/recipes-devtools/python/python-eventlet_0.25.0.bb
> index fb9d09d..c3eabb2 100644
> --- a/meta-openstack/recipes-devtools/python/python-eventlet_0.24.0.bb
> +++ b/meta-openstack/recipes-devtools/python/python-eventlet_0.25.0.bb
> @@ -4,7 +4,7 @@ SECTION = "devel/python"
>  LICENSE = "MIT"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=56472ad6de4caf50e05332a34b66e778"
>
> -SRC_URI[md5sum] = "40acca39e1da2a79e983a696b9b390a3"
> -SRC_URI[sha256sum] = "4c247db031ea374128e8c75a40fe5402c611e9a4798b9f90f095001192f22364"
> +SRC_URI[md5sum] = "a7e8759e6684352ea81a157b6f93fb9b"
> +SRC_URI[sha256sum] = "f0610bd0d3bb3d51d69f74caa4ad04fc7bce424cdb72e54d08ccda90d8c69800"
>
>  inherit setuptools pypi
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
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

