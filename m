Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B8320E00D77; Thu,  5 Sep 2019 07:09:24 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (bruce.ashfield[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/,
	no *      trust
	*      [209.85.208.174 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com
	[209.85.208.174])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CF79AE00BF8
	for <meta-virtualization@yoctoproject.org>;
	Thu,  5 Sep 2019 07:09:22 -0700 (PDT)
Received: by mail-lj1-f174.google.com with SMTP id y23so2630171lje.9
	for <meta-virtualization@yoctoproject.org>;
	Thu, 05 Sep 2019 07:09:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Ic709Iw8CYIUUabpJkUZvWY9/cu+ZvnjP4cXQw3jFAo=;
	b=BnDBKSp13VN3SFbycf2cHhKcAqjGH1G8rSCDDk1BK9yYO5xp4Gf4tOMfikkSGCftss
	6l9T60KMxMHfUx5ZuupFlenB+qltwVd/sbdX4sWHAdY/lOvaYPUYc4lCKNwP9RcBm0KX
	nhosMWlo0/xQzweygGbUlUkuL0QoXLLBZ4YaHWB0cSi+1brzDrHqDeodKm9uGQCzliP6
	oDChGQSW8fYHyyF7JAaxF9fkfie6iaXcGrDsTZ8c7viHJLOlX8wkQzOJnlr7COcyPr1d
	SN+L5HV+zXmbKOgugZOkGXd7B8ZhPVEf/hz1JG2NTAHtAKpuDAd5Qp63mrwFs3ELrtDV
	OXSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Ic709Iw8CYIUUabpJkUZvWY9/cu+ZvnjP4cXQw3jFAo=;
	b=QyvG2OpQIqjXQRkbD8ZBG96giPP/2Cf6xcyatxISzUoT7LJ4qRADysXJ8TM490Jr19
	wvZYCWh2gh4Fn8Rqw72muQJArdxADSapGfujrYQdChMS9Mw0cAovKtWDhlzuvBKTZZwl
	J6CkMaDuzU8oZRUh+Jz+yhsR1ZlzlqV5JZm4OzEk+5DZamvZu6IfcvMupru8W8sbeQ5b
	wlmDTqufdEn1Y4NjCmVdShBlEn1FlhP/Yz9tOOyLc8IWhFEMwIFR1/a5cMa3cMKQVX+8
	/IPJE+VBqznxyOAsnOtLe8vrrfzOhROnKHPsyH4yPwWIWlGxKYZBBu7GlAgedPz1yM94
	eaAQ==
X-Gm-Message-State: APjAAAWbLiROfsMIRUVEhWsaDS43gvPdRS05vXe3PfCvrz+hny4S/gYr
	7IjGnBbaTM2m/HhPwqWYqg7YEJU0A0yMUTPoIe0=
X-Google-Smtp-Source: APXvYqxo8yGhDqyz/E9lmsTJNRhz7Jg5g6CRXJfWM7aB0nP3jvkxKjejGpjymAIJiIwOLmWGZve5mJjsP8WzkYHLC/o=
X-Received: by 2002:a2e:83d6:: with SMTP id s22mr2254955ljh.104.1567692561446; 
	Thu, 05 Sep 2019 07:09:21 -0700 (PDT)
MIME-Version: 1.0
References: <20190904024549.2526-1-zangrc.fnst@cn.fujitsu.com>
In-Reply-To: <20190904024549.2526-1-zangrc.fnst@cn.fujitsu.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 5 Sep 2019 10:09:10 -0400
Message-ID: <CADkTA4PefRkA3ukJEDaApMrLqS2rp4kSoX3fkCzkYcAqUHqJ+g@mail.gmail.com>
To: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
Cc: meta-virtualization <meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] python-eventlet: Add python3 version
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
X-List-Received-Date: Thu, 05 Sep 2019 14:09:25 -0000
Content-Type: text/plain; charset="UTF-8"

merged.

Bruce

On Tue, Sep 3, 2019 at 10:48 PM Zang Ruochen <zangrc.fnst@cn.fujitsu.com> wrote:
>
> Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
> ---
>  meta-openstack/recipes-devtools/python/python-eventlet.inc   | 10 ++++++++++
>  .../recipes-devtools/python/python-eventlet_0.25.1.bb        | 12 ++----------
>  .../recipes-devtools/python/python3-eventlet_0.25.1.bb       |  2 ++
>  3 files changed, 14 insertions(+), 10 deletions(-)
>  create mode 100644 meta-openstack/recipes-devtools/python/python-eventlet.inc
>  create mode 100644 meta-openstack/recipes-devtools/python/python3-eventlet_0.25.1.bb
>
> diff --git a/meta-openstack/recipes-devtools/python/python-eventlet.inc b/meta-openstack/recipes-devtools/python/python-eventlet.inc
> new file mode 100644
> index 0000000..fd1bf39
> --- /dev/null
> +++ b/meta-openstack/recipes-devtools/python/python-eventlet.inc
> @@ -0,0 +1,10 @@
> +DESCRIPTION = "Highly concurrent networking library"
> +HOMEPAGE = "http://pypi.python.org/pypi/eventlet"
> +SECTION = "devel/python"
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=56472ad6de4caf50e05332a34b66e778"
> +
> +SRC_URI[md5sum] = "8d7145af6506d5418c5a6bee7bf0b7e7"
> +SRC_URI[sha256sum] = "6c9c625af48424c4680d89314dbe45a76cc990cf002489f9469ff214b044ffc1"
> +
> +inherit pypi
> diff --git a/meta-openstack/recipes-devtools/python/python-eventlet_0.25.1.bb b/meta-openstack/recipes-devtools/python/python-eventlet_0.25.1.bb
> index d2878b6..d9c9383 100644
> --- a/meta-openstack/recipes-devtools/python/python-eventlet_0.25.1.bb
> +++ b/meta-openstack/recipes-devtools/python/python-eventlet_0.25.1.bb
> @@ -1,10 +1,2 @@
> -DESCRIPTION = "Highly concurrent networking library"
> -HOMEPAGE = "http://pypi.python.org/pypi/eventlet"
> -SECTION = "devel/python"
> -LICENSE = "MIT"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=56472ad6de4caf50e05332a34b66e778"
> -
> -SRC_URI[md5sum] = "8d7145af6506d5418c5a6bee7bf0b7e7"
> -SRC_URI[sha256sum] = "6c9c625af48424c4680d89314dbe45a76cc990cf002489f9469ff214b044ffc1"
> -
> -inherit setuptools pypi
> +inherit setuptools
> +require python-eventlet.inc
> diff --git a/meta-openstack/recipes-devtools/python/python3-eventlet_0.25.1.bb b/meta-openstack/recipes-devtools/python/python3-eventlet_0.25.1.bb
> new file mode 100644
> index 0000000..c5fe598
> --- /dev/null
> +++ b/meta-openstack/recipes-devtools/python/python3-eventlet_0.25.1.bb
> @@ -0,0 +1,2 @@
> +inherit setuptools3
> +require python-eventlet.inc
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

