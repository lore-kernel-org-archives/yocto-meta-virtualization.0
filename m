Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 1BF1BE00C78; Thu, 29 Aug 2019 21:27:25 -0700 (PDT)
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
	*      [209.85.208.196 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
	[209.85.208.196])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A6EE1E00B7A
	for <meta-virtualization@yoctoproject.org>;
	Thu, 29 Aug 2019 21:27:23 -0700 (PDT)
Received: by mail-lj1-f196.google.com with SMTP id f9so5095667ljc.13
	for <meta-virtualization@yoctoproject.org>;
	Thu, 29 Aug 2019 21:27:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=3DPnyEDsW9TNsYNhzjWof5cL//lH0gQfE4vy6xDluKs=;
	b=RgbGxUQjwejuZYwAucU6OPFxXYq/oZ3YfuGLRiYQH4OeosEzUIJ8wXCJCFAXmyVv6k
	yXROzA5696BN1FoeQPnunNh/W7Xts67papBr21Bg424R7En0NNRMlebvCuQz2OOsjk33
	Noq98wnrBG0wCZE3YdKNpBBeJ03ke8BK5UPpJa6drU8gQGgfZS0Qb27qMl//+HSfBEMb
	P2EbzrAi1bpea3NRL2/WgCMuKjpQSEhGcF/S4NYivQVG0WR89yr4EZYTXc5DFgtwvSTi
	7ILoI+w60o41MnqijqykBtEf3Z3gAmWeeVMEuHaQtHnehM1rQ8p898i74YjKyWpu1/IJ
	21VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=3DPnyEDsW9TNsYNhzjWof5cL//lH0gQfE4vy6xDluKs=;
	b=uNoxBZxzZGfabP1XOTcS/MKoWAuhexeewi/A1uoC66kKPLL3tZMbcvATiZXfT/VqEN
	MdxxuJtIG5NbbrnyoKISqYV+Gv0OkSPwAFFQMZZzaZGUDLTKvhRTxpcw7D51/xP9XX9d
	J3J0IF4ggKPsrWDPxt/7xQMwKmGYFtQGM2SsIgb6N9+kNHmPlHtgK3DfOzJxvzkIR6Q6
	236ZdBf5bhs24Y8EBpFG5r6k4Csjy+zaCSR1FntmCjqeGjGev/p4evBc7PYDGRuQQt9F
	upcqWRcAKu4btc6wahqo9wt3z7sMGr9LiWdMq/IvFUt6PVNsHN3BnOgJnLcG4AH2lO7r
	iQqQ==
X-Gm-Message-State: APjAAAVxhA3gZjxk5x5rSJb81E++VcC2KhNp8nADkzoZ3w3sSxNecOQs
	E1iOJSLWT+kd8MzFVoStZzkqPCudJ0gpJOM0ONA=
X-Google-Smtp-Source: APXvYqyzkkQg0GrRaA6bbiHW6EN+8DYItl4/gurU6GNSW5B+aGqRQMVOTPoH6ajqGf6uigHk9FARwx1Pv1q/ao5E3gg=
X-Received: by 2002:a2e:83d6:: with SMTP id s22mr994563ljh.104.1567139242479; 
	Thu, 29 Aug 2019 21:27:22 -0700 (PDT)
MIME-Version: 1.0
References: <20190829054324.3530-1-zangrc.fnst@cn.fujitsu.com>
In-Reply-To: <20190829054324.3530-1-zangrc.fnst@cn.fujitsu.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 30 Aug 2019 00:27:11 -0400
Message-ID: <CADkTA4OXVk5_0Nq-pCSLAV_9w_LyAc9-8nm3Q8Kw9Q-QXsN8Qw@mail.gmail.com>
To: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] python-enum-compat: Add python3 version
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
X-List-Received-Date: Fri, 30 Aug 2019 04:27:25 -0000
Content-Type: text/plain; charset="UTF-8"

merged

Bruce

On Thu, Aug 29, 2019 at 1:45 AM Zang Ruochen <zangrc.fnst@cn.fujitsu.com> wrote:
>
> Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
> ---
>  .../recipes-devtools/python/python-enum-compat.inc           | 10 ++++++++++
>  .../recipes-devtools/python/python-enum-compat_0.0.2.bb      | 12 ++----------
>  .../recipes-devtools/python/python3-enum-compat_0.0.2.bb     |  2 ++
>  3 files changed, 14 insertions(+), 10 deletions(-)
>  create mode 100644 meta-openstack/recipes-devtools/python/python-enum-compat.inc
>  create mode 100644 meta-openstack/recipes-devtools/python/python3-enum-compat_0.0.2.bb
>
> diff --git a/meta-openstack/recipes-devtools/python/python-enum-compat.inc b/meta-openstack/recipes-devtools/python/python-enum-compat.inc
> new file mode 100644
> index 0000000..d1f7648
> --- /dev/null
> +++ b/meta-openstack/recipes-devtools/python/python-enum-compat.inc
> @@ -0,0 +1,10 @@
> +DESCRIPTION = "Python enum/enum34 compatibility package"
> +HOMEPAGE = "https://github.com/jstasiak/enum-compat"
> +SECTION = "devel/python"
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
> +
> +SRC_URI[md5sum] = "3002940b6620837d0fbc86ec72509be3"
> +SRC_URI[sha256sum] = "939ceff18186a5762ae4db9fa7bfe017edbd03b66526b798dd8245394c8a4192"
> +
> +inherit pypi
> diff --git a/meta-openstack/recipes-devtools/python/python-enum-compat_0.0.2.bb b/meta-openstack/recipes-devtools/python/python-enum-compat_0.0.2.bb
> index 3ae7bb4..36ab5af 100644
> --- a/meta-openstack/recipes-devtools/python/python-enum-compat_0.0.2.bb
> +++ b/meta-openstack/recipes-devtools/python/python-enum-compat_0.0.2.bb
> @@ -1,10 +1,2 @@
> -DESCRIPTION = "Python enum/enum34 compatibility package"
> -HOMEPAGE = "https://github.com/jstasiak/enum-compat"
> -SECTION = "devel/python"
> -LICENSE = "MIT"
> -LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
> -
> -SRC_URI[md5sum] = "3002940b6620837d0fbc86ec72509be3"
> -SRC_URI[sha256sum] = "939ceff18186a5762ae4db9fa7bfe017edbd03b66526b798dd8245394c8a4192"
> -
> -inherit setuptools pypi
> +inherit setuptools
> +require python-enum-compat.inc
> diff --git a/meta-openstack/recipes-devtools/python/python3-enum-compat_0.0.2.bb b/meta-openstack/recipes-devtools/python/python3-enum-compat_0.0.2.bb
> new file mode 100644
> index 0000000..a9bff30
> --- /dev/null
> +++ b/meta-openstack/recipes-devtools/python/python3-enum-compat_0.0.2.bb
> @@ -0,0 +1,2 @@
> +inherit setuptools3
> +require python-enum-compat.inc
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

