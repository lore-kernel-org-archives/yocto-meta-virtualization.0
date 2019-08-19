Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 83036E00C46; Sun, 18 Aug 2019 19:29:33 -0700 (PDT)
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
	*      [209.85.208.195 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com
	[209.85.208.195])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2E386E00A93
	for <meta-virtualization@yoctoproject.org>;
	Sun, 18 Aug 2019 19:29:31 -0700 (PDT)
Received: by mail-lj1-f195.google.com with SMTP id e24so253162ljg.11
	for <meta-virtualization@yoctoproject.org>;
	Sun, 18 Aug 2019 19:29:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=R4wRH5KJCWsoKEPGLptQdSu6YHI54Z/UCa/mA6eOfcw=;
	b=cTXo3cFVqoLuQXTdOOvPJFDE27jPdeffvUTyVgE5Z61PIu69pL+Ejwo5L6UaBSq0sL
	XPhW9FKj1al1aS6S/ux5ElbWpnhPPBTyn2nkqzQEGQIP1gwm/3K5bGYsSb4dE4cn4QJ5
	PzBlhKWCKXvZV/4bkWOzV/Wn/4BpuYcVo28225ChqOH6/wx1RK5BmkB2dJLbyZL06ack
	7+Z7KvTgpwK9BhvtzmNX7XyEFHtyRJTEhIJCOL/UU1Ogfw/dFbAe2TubXNJyg0dR/yXK
	u877zSIwiols7UTwEPAfWkyPAodScnrMb6Z/mgZPbxp4BsQ7Nx110CrYvzYFSd+MZneR
	DruQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=R4wRH5KJCWsoKEPGLptQdSu6YHI54Z/UCa/mA6eOfcw=;
	b=SXkQZLcfyIpYrPbjfCTRX89d4emlHAp08kkUkQon/6itkcm2C/9drCfqPPgiDFtWR5
	q8Wf+zqdXcKCj/DbaTESolc94vUUpftT9A3Ye/0K4RzRBbA+33QEGZVjySSmOdN2sIEG
	wne3j2EnJLNp3N92Kz8FhsPneFYsptVC9l44Clypanm9fR8Zn5QT0jzaTRqe1LItYyLv
	Q7h+AHPa1LMIMWNgXD8XMkWb+8nmgkUhlmE8iMOYum6ABMKc5G2HHKTb9xLf3+nvrmCa
	51eCfU1XYVVbrz5gniOqeoGbpBnCw++4fozW6Xaaw+n1k7W6tCWpP7jvCGW1w7IDtGxs
	vI6Q==
X-Gm-Message-State: APjAAAUI6xyqQyDBVO3XxX1x8ZH17MlDi3WvRl47P7xtfMOKYxRUSWeu
	7wBUm0hwI41PvEKJoX93sP/PyoUCii/lYy2DElK7cWBD
X-Google-Smtp-Source: APXvYqx79UwxbzVnvdwwxOu68ZnaaPgMpiSUXntd24AkOTnveIvZYtZ53ZGUfOLdJjx8KVk+dldhsvXeOjbWshoM8Tg=
X-Received: by 2002:a05:651c:1111:: with SMTP id
	d17mr4388246ljo.87.1566181769474; 
	Sun, 18 Aug 2019 19:29:29 -0700 (PDT)
MIME-Version: 1.0
References: <20190816013723.2541-1-zangrc.fnst@cn.fujitsu.com>
In-Reply-To: <20190816013723.2541-1-zangrc.fnst@cn.fujitsu.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Sun, 18 Aug 2019 22:29:18 -0400
Message-ID: <CADkTA4Peuen-CGMM=_87F_nfK-zn+a59LMf+9JsVv5bozPRhOg@mail.gmail.com>
To: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] python-kombu: upgrade 4.6.3 -> 4.6.4
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
X-List-Received-Date: Mon, 19 Aug 2019 02:29:33 -0000
Content-Type: text/plain; charset="UTF-8"

merged

Bruce

On Thu, Aug 15, 2019 at 9:44 PM Zang Ruochen <zangrc.fnst@cn.fujitsu.com> wrote:
>
> From: Yuan Chao <yuanc.fnst@cn.fujitsu.com>
>
> Signed-off-by: Yuan Chao <yuanc.fnst@cn.fujitsu.com>
> ---
>  meta-openstack/recipes-devtools/python/python-kombu.inc               | 4 ++--
>  .../python/{python-kombu_4.6.3.bb => python-kombu_4.6.4.bb}           | 0
>  .../python/{python3-kombu_4.6.3.bb => python3-kombu_4.6.4.bb}         | 0
>  3 files changed, 2 insertions(+), 2 deletions(-)
>  rename meta-openstack/recipes-devtools/python/{python-kombu_4.6.3.bb => python-kombu_4.6.4.bb} (100%)
>  rename meta-openstack/recipes-devtools/python/{python3-kombu_4.6.3.bb => python3-kombu_4.6.4.bb} (100%)
>
> diff --git a/meta-openstack/recipes-devtools/python/python-kombu.inc b/meta-openstack/recipes-devtools/python/python-kombu.inc
> index 722adcd..3053f71 100644
> --- a/meta-openstack/recipes-devtools/python/python-kombu.inc
> +++ b/meta-openstack/recipes-devtools/python/python-kombu.inc
> @@ -4,8 +4,8 @@ SECTION = "devel/python"
>  LICENSE = "BSD"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=daea7c168428449fbee05e644df929f4"
>
> -SRC_URI[md5sum] = "adc9167ba3571c5465d6f7abe4945a12"
> -SRC_URI[sha256sum] = "eb365ea795cd7e629ba2f1f398e0c3ba354b91ef4de225ffdf6ab45fdfc7d581"
> +SRC_URI[md5sum] = "4eb5f1e6f669e04f5bd0c627c7467156"
> +SRC_URI[sha256sum] = "e5f0312dfb9011bebbf528ccaf118a6c2b5c3b8244451f08381fb23e7715809b"
>
>  FILES_${PN}-doc += "${datadir}/${SRCNAME}"
>
> diff --git a/meta-openstack/recipes-devtools/python/python-kombu_4.6.3.bb b/meta-openstack/recipes-devtools/python/python-kombu_4.6.4.bb
> similarity index 100%
> rename from meta-openstack/recipes-devtools/python/python-kombu_4.6.3.bb
> rename to meta-openstack/recipes-devtools/python/python-kombu_4.6.4.bb
> diff --git a/meta-openstack/recipes-devtools/python/python3-kombu_4.6.3.bb b/meta-openstack/recipes-devtools/python/python3-kombu_4.6.4.bb
> similarity index 100%
> rename from meta-openstack/recipes-devtools/python/python3-kombu_4.6.3.bb
> rename to meta-openstack/recipes-devtools/python/python3-kombu_4.6.4.bb
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

