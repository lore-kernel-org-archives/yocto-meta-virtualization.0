Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E3E3DE00E04; Tue,  3 Sep 2019 12:56:00 -0700 (PDT)
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
	*      [209.85.167.67 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com
	[209.85.167.67])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id BE394E00E1A
	for <meta-virtualization@yoctoproject.org>;
	Tue,  3 Sep 2019 12:55:40 -0700 (PDT)
Received: by mail-lf1-f67.google.com with SMTP id z21so13926126lfe.1
	for <meta-virtualization@yoctoproject.org>;
	Tue, 03 Sep 2019 12:55:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Pc74Lp0YafKBAtdvNJ3/VxZupZqJF799HbsEHwyK8Jo=;
	b=IcYjfqB9dpKRR/di4FkR7qlxM2oZXryj1IjR/jijlwj3UGxK60QmWRQ4IhvJ3nP9VT
	51ceppSXrBEIMszz7oB57JDGkPC2X323RZHbbvwUpZjxFBYdWRIBIPgVusl4SxJtNh3Z
	tc2vpBh9ZsIxwyfp+f+ITQ9WgJ5SmvdHYjKfiWc6675TPhcBAS6DLYP+Yv3QlbtKjBdS
	zNxG86A7wsH4L0I0FORwa9rwr03dbcClX5FLhniuKu0Tj1Z7IKl7RPmcpa8htunrmweo
	KLhdyrPeIx+6SjQKl8XQmIFqUgn6zT7wP9a7vB+Dr9rAQGk5c8/6hIJGJR9O0dS0CUEt
	19rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Pc74Lp0YafKBAtdvNJ3/VxZupZqJF799HbsEHwyK8Jo=;
	b=uega4hfv77Ya+9RNbvdlzHqO2e1GdUrGFExdN/vnclNt3PdjNkORDBXUdexBfmcKK8
	A1EtKMqLxkrQihiSw3G6QjVyFqyGQjS6C08BCzzTQc2GUR4sJOYmim6qIIr38qBnuduu
	LxgPHrwYR/BKFoR7jQ8Nfbl751lbWB32Capp3u8PQmXtXAMPZaxXaTx6Q7ADLYv+0gvv
	a1YPlL79TpJgIyB8nqZjmipWwV89pvl3yoNs3+CEDsvaL9azHJHs68VcLWEcsylhicRC
	m+kB6GPzWfc21v3//SVyQc6JDIufrppNX9W9eo+oMLXBVPvybVk9HyOjOvd+T73SSHNw
	U7Lg==
X-Gm-Message-State: APjAAAVia0AZMAfq4vkuKdiEnAgWuoHVnjBUpeWggK5QLp2PVQ8O45Rl
	PgGE8lajQ0JwelK71Q8rGdd47ga0f/wi/0I2CgM=
X-Google-Smtp-Source: APXvYqwfIZ904EukU2sic1Raga8MYdBS4xeTnTZIDHk98afYxXuPNQA3na8+3k+uBANpfMyzji74QHxNQ9INrrbT50c=
X-Received: by 2002:a19:428f:: with SMTP id
	p137mr22042552lfa.149.1567540538769; 
	Tue, 03 Sep 2019 12:55:38 -0700 (PDT)
MIME-Version: 1.0
References: <20190830063228.19117-1-zangrc.fnst@cn.fujitsu.com>
In-Reply-To: <20190830063228.19117-1-zangrc.fnst@cn.fujitsu.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 3 Sep 2019 15:55:27 -0400
Message-ID: <CADkTA4Nq+fN+vgaeC21dHF-S=A-yVZ4wdg861BU_AmFuQbv1Jg@mail.gmail.com>
To: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] python-netifaces: Add python3 version
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
X-List-Received-Date: Tue, 03 Sep 2019 19:56:03 -0000
Content-Type: text/plain; charset="UTF-8"

Looks like this was already send on Aug 26th (and had been merged).
Try to be sure to rebase to the latest master.

Bruce

On Fri, Aug 30, 2019 at 2:36 AM Zang Ruochen <zangrc.fnst@cn.fujitsu.com> wrote:
>
> Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
> ---
>  meta-openstack/recipes-devtools/python/python-netifaces.inc  | 10 ++++++++++
>  .../recipes-devtools/python/python-netifaces_0.10.9.bb       | 12 ++----------
>  .../recipes-devtools/python/python3-netifaces_0.10.9.bb      |  2 ++
>  3 files changed, 14 insertions(+), 10 deletions(-)
>  create mode 100644 meta-openstack/recipes-devtools/python/python-netifaces.inc
>  create mode 100644 meta-openstack/recipes-devtools/python/python3-netifaces_0.10.9.bb
>
> diff --git a/meta-openstack/recipes-devtools/python/python-netifaces.inc b/meta-openstack/recipes-devtools/python/python-netifaces.inc
> new file mode 100644
> index 0000000..b1b1ed5
> --- /dev/null
> +++ b/meta-openstack/recipes-devtools/python/python-netifaces.inc
> @@ -0,0 +1,10 @@
> +DESCRIPTION = "Portable network interface information."
> +HOMEPAGE = "http://alastairs-place.net/netifaces"
> +SECTION = "devel/python"
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
> +
> +SRC_URI[md5sum] = "de92cc322b4f56047c073f802ad77860"
> +SRC_URI[sha256sum] = "2dee9ffdd16292878336a58d04a20f0ffe95555465fee7c9bd23b3490ef2abf3"
> +
> +inherit pypi
> diff --git a/meta-openstack/recipes-devtools/python/python-netifaces_0.10.9.bb b/meta-openstack/recipes-devtools/python/python-netifaces_0.10.9.bb
> index 05f5f4a..aa9760b 100644
> --- a/meta-openstack/recipes-devtools/python/python-netifaces_0.10.9.bb
> +++ b/meta-openstack/recipes-devtools/python/python-netifaces_0.10.9.bb
> @@ -1,10 +1,2 @@
> -DESCRIPTION = "Portable network interface information."
> -HOMEPAGE = "http://alastairs-place.net/netifaces"
> -SECTION = "devel/python"
> -LICENSE = "MIT"
> -LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
> -
> -SRC_URI[md5sum] = "de92cc322b4f56047c073f802ad77860"
> -SRC_URI[sha256sum] = "2dee9ffdd16292878336a58d04a20f0ffe95555465fee7c9bd23b3490ef2abf3"
> -
> -inherit setuptools pypi
> +inherit setuptools
> +require python-netifaces.inc
> diff --git a/meta-openstack/recipes-devtools/python/python3-netifaces_0.10.9.bb b/meta-openstack/recipes-devtools/python/python3-netifaces_0.10.9.bb
> new file mode 100644
> index 0000000..a46326f
> --- /dev/null
> +++ b/meta-openstack/recipes-devtools/python/python3-netifaces_0.10.9.bb
> @@ -0,0 +1,2 @@
> +inherit setuptools3
> +require python-netifaces.inc
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

