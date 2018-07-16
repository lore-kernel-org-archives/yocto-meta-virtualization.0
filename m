Return-Path: <asselsm@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 81292E01073; Mon, 16 Jul 2018 08:57:09 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.213.194 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-yb0-f194.google.com (mail-yb0-f194.google.com
	[209.85.213.194])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D40E0E006B4
	for <meta-virtualization@yoctoproject.org>;
	Mon, 16 Jul 2018 08:57:08 -0700 (PDT)
Received: by mail-yb0-f194.google.com with SMTP id y11-v6so15602826ybm.7
	for <meta-virtualization@yoctoproject.org>;
	Mon, 16 Jul 2018 08:57:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:reply-to:sender:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=9D7kUQU70d3f9XnvQHDTmDbSLVpmDZGjQYxQAF1VD5I=;
	b=KNujLSFFdlVNveKL+od453A5OzKSf83/faO4n+8jCpTW4bArni1J2HN984dQKEH+h6
	0KqJA7O6kEzkgzhPPcUy4sysH4qJBq+Y6RP5/xsNOUOFxQXDInuBfWXfjcTyqV1MDTxv
	A06590UjmKYNyOfXEJBEtC1Km0gqboNr8t6zAgGzL+cn+NBgUXjjy/rmiZq+Jy5qPZVa
	hMOGzlwAkH49OmFaJh6t+JDAh+0QDU4Zr2uiuv33NRCVgDmWyfyyFXF67upciWe5xPa3
	x3gTwV6ABa/YtEniCHoykzJEdCFhwTu2l33e7a+lAh1hxDoUTBN6mf7QWwJcbYTEQ80k
	QdHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:reply-to:sender:in-reply-to
	:references:from:date:message-id:subject:to:cc;
	bh=9D7kUQU70d3f9XnvQHDTmDbSLVpmDZGjQYxQAF1VD5I=;
	b=cqK8ScmfaCQi5gKdQP9ETTE1IQMrKRAg64vzH3NC4lRZvs0xmp+TM4Z5afaoRTwfP8
	Qw1j+UwSUG/x2gld4/GEZDu8rL6Kr76p7yeAkU6KGNMpd2L9XZKqjvdPpFifvD2l8/02
	oRm31Q13zi4X6C8Yv4MPysNchlHKFZD1Zy1TDZOV9MXmsbK0IXgQ0w8fg45UdTAPwbPw
	0mz8dXbYggmTS66ZQ+ILEGQ/yYdytBVWHsHRc219+zUCb2F07hwEJKvlEYIvuxSaAY+Y
	s0xtyjMaT1ALgf5CNAUyfEicf+LzpC9IN4Twkx9cKLwzEHRVjPsy5jsNRgfhzHnMqNyN
	vBiA==
X-Gm-Message-State: AOUpUlHIVmaORG7Psv+Bs8CkYm7Rlqn8PW0r/2eqLhE8U5js+RAsiOZb
	JgVZpIanId4zGzfSTZk67hYE6dVtkfUWKz+XKNI=
X-Google-Smtp-Source: AAOMgpcc6mePiOQnNmt+SKkH9Pb+cuYMR/wiFJcPKcQFelneUNbKORPsExYdzOSutCviI1rs0zGuRSESgIIxtIq0/2c=
X-Received: by 2002:a25:ce49:: with SMTP id
	x70-v6mr9191190ybe.18.1531756627987; 
	Mon, 16 Jul 2018 08:57:07 -0700 (PDT)
MIME-Version: 1.0
Sender: asselsm@gmail.com
Received: by 2002:a5b:612:0:0:0:0:0 with HTTP;
	Mon, 16 Jul 2018 08:57:07 -0700 (PDT)
In-Reply-To: <20180716093631.27024-1-hongl.fnst@cn.fujitsu.com>
References: <20180716093631.27024-1-hongl.fnst@cn.fujitsu.com>
From: Mark Asselstine <mark.asselstine@windriver.com>
Date: Mon, 16 Jul 2018 11:57:07 -0400
X-Google-Sender-Auth: T36DQSgBfLhKtNy9TSFiR-FYpXE
Message-ID: <CAPuovEJgjL_GtKhyQ-Ug17ORX=6PU=8fc72Txs=oW3Q9ZABOhA@mail.gmail.com>
To: Hong Liu <hongl.fnst@cn.fujitsu.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] [meta-cloud-services][patch] python-amqp : 2.2.2 -> 2.3.2
X-BeenThere: meta-virtualization@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
Reply-To: mark.asselstine@windriver.com
List-Id: "Discussion of layer enabling hypervisor, virtualization tool stack,
	and cloud support" <meta-virtualization.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-virtualization>
List-Post: <mailto:meta-virtualization@yoctoproject.org>
List-Help: <mailto:meta-virtualization-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Mon, 16 Jul 2018 15:57:09 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Jul 16, 2018 at 5:36 AM, Hong Liu <hongl.fnst@cn.fujitsu.com> wrote:
> Upgrade python-amqp from 2.2.2 to 2.3.2.
>
> Signed-off-by: Hong Liu <hongl.fnst@cn.fujitsu.com>
> ---

I am pretty sure this is safe after examining several depends.

Mark

>  .../python/{python-amqp_2.2.2.bb => python-amqp_2.3.2.bb}             | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta-openstack/recipes-devtools/python/{python-amqp_2.2.2.bb => python-amqp_2.3.2.bb} (68%)
>
> diff --git a/meta-openstack/recipes-devtools/python/python-amqp_2.2.2.bb b/meta-openstack/recipes-devtools/python/python-amqp_2.3.2.bb
> similarity index 68%
> rename from meta-openstack/recipes-devtools/python/python-amqp_2.2.2.bb
> rename to meta-openstack/recipes-devtools/python/python-amqp_2.3.2.bb
> index 94979d3..395c81e 100644
> --- a/meta-openstack/recipes-devtools/python/python-amqp_2.2.2.bb
> +++ b/meta-openstack/recipes-devtools/python/python-amqp_2.3.2.bb
> @@ -4,8 +4,8 @@ SECTION = "devel/python"
>  LICENSE = "BSD-3-Clause"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=9d6ba772ac59c08a25a12ce15bd5f27b"
>
> -SRC_URI[md5sum] = "0971a3fd2d635ded45c349cfc17106bd"
> -SRC_URI[sha256sum] = "cba1ace9d4ff6049b190d8b7991f9c1006b443a5238021aca96dd6ad2ac9da22"
> +SRC_URI[md5sum] = "11fce0d01f4ee6886a02415c20cece80"
> +SRC_URI[sha256sum] = "073dd02fdd73041bffc913b767866015147b61f2a9bc104daef172fc1a0066eb"
>
>  inherit setuptools pypi
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

