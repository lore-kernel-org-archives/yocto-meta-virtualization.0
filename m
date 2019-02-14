Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C5D22E00B81; Thu, 14 Feb 2019 06:21:30 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.167.66 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (bruce.ashfield[at]gmail.com)
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com
	[209.85.167.66])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DB803E0053F
	for <meta-virtualization@yoctoproject.org>;
	Thu, 14 Feb 2019 06:21:25 -0800 (PST)
Received: by mail-lf1-f66.google.com with SMTP id n15so4670068lfe.5
	for <meta-virtualization@yoctoproject.org>;
	Thu, 14 Feb 2019 06:21:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=3rsJjYUkzYgpSRu6rzUci29dEpjYgdujJPdpBW6150s=;
	b=iBg4VfmZ/mzEQw33zCZltgB69xziDh7/Ijja1KI7txwAYzop2FOm/3jugWtl3o4n3r
	2P4lVNMfWSHTVY5eyrL1UZH7GDB6rkz0rLE+dE0pVvKo9PVDp7snz/1EgW6JCB57oZu6
	52wroaNqo2A+csIBQq/sTBq0rA0heM5l4TWWJ1kOZDa+wq3INrNDFJc+HfQYbIWoM4B2
	FkXloSFEoTqr0j7DI8hQjQhM5z9ntWTB+kyWFtNpLv5e9Az08p4VlArEm5InrJmtkMD6
	3KozZ7vghIzeMOpeDhidnP2pXO4wKLJdcOTLTdMEmKBEbyhqe++aCrUSsiz+XF8vTNjI
	RaOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=3rsJjYUkzYgpSRu6rzUci29dEpjYgdujJPdpBW6150s=;
	b=W5+FuLcBiKAk/hWjWz3FdlGbeDBIOhu7NIT726USjr1Q/64zLNFsCJuVHN5dGcYD2P
	WQOjo8cr0Xiw2T8zhrUxWpsiaeqW2Aahf3J/hpXXQDxb0TWZ5R0RoHaJkaM4YyFuotUZ
	WNaUP+abBMaJvPD70k4IbNrzanIuH7Pppf3xhXoBJZq1G7J55hXp9e5WwKv31GmvXIqs
	RydvNWv6AyIbEWdlI17qNIM/RZ8xJM4FaEiFyktujiWNpKEWOegCATbye9XvAiyOXoZD
	D80eJfRq7WMKg2gYFBMyC9fbYnWRync0TD1M0Irpqd+2Wp67z6ydWymAfT+4q2Csl108
	3qDQ==
X-Gm-Message-State: AHQUAubDMpJjJvZfA8KjG+x5oGS/aPOHm8F1y4REmyiN/Mt1OUAvOJOs
	ZO4haqVpkGlxLaYzHi21lSYrvFkNw4ud8Yu/eq4=
X-Google-Smtp-Source: AHgI3IYCapEBj4jSO4zCrp73qKPxvFsNTQaooTHXxM5DD5LcJsDu0Zq3d37CQCYiIptf0CEXzQJcv+EHrUpMOl9FrU0=
X-Received: by 2002:ac2:5624:: with SMTP id b4mr2625406lff.41.1550154071859;
	Thu, 14 Feb 2019 06:21:11 -0800 (PST)
MIME-Version: 1.0
References: <20190214054425.11565-1-hongl.fnst@cn.fujitsu.com>
In-Reply-To: <20190214054425.11565-1-hongl.fnst@cn.fujitsu.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 14 Feb 2019 09:21:00 -0500
Message-ID: <CADkTA4PO72QCURoVu99f55pcTW6bXt252e8NWqRY3hfK1N=DFg@mail.gmail.com>
To: Hong Liu <hongl.fnst@cn.fujitsu.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] [meta-cloud-services][patch]:python-oslo.config:modify homepage
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
X-List-Received-Date: Thu, 14 Feb 2019 14:21:30 -0000
Content-Type: text/plain; charset="UTF-8"

merged

Bruce

On Thu, Feb 14, 2019 at 12:43 AM Hong Liu <hongl.fnst@cn.fujitsu.com> wrote:
>
> Modify homepage to correspond to new version
>
> Signed-off-by: Hong Liu <hongl.fnst@cn.fujitsu.com>
> ---
>  .../recipes-devtools/python/python-oslo.config_git.bb         | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta-openstack/recipes-devtools/python/python-oslo.config_git.bb b/meta-openstack/recipes-devtools/python/python-oslo.config_git.bb
> index 0ccc66e..eed00c5 100644
> --- a/meta-openstack/recipes-devtools/python/python-oslo.config_git.bb
> +++ b/meta-openstack/recipes-devtools/python/python-oslo.config_git.bb
> @@ -1,5 +1,5 @@
>  DESCRIPTION = "API supporting parsing command line arguments and .ini style configuration files."
> -HOMEPAGE = "https://pypi.python.org/pypi/oslo.config/2.6.0"
> +HOMEPAGE = "https://pypi.python.org/pypi/oslo.config/4.11.1"
>  SECTION = "devel/python"
>  LICENSE = "Apache-2.0"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=c46f31914956e4579f9b488e71415ac8"
> @@ -34,4 +34,4 @@ RDEPENDS_${PN} += " \
>      python-rfc3986 \
>      python-pyyaml \
>      "
> -
> \ No newline at end of file
> +
> --
> 2.17.2
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

