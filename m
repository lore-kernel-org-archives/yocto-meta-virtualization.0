Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 5934FE00D6A; Tue,  3 Sep 2019 10:14:37 -0700 (PDT)
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
	*      [209.85.167.65 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lf1-f65.google.com (mail-lf1-f65.google.com
	[209.85.167.65])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7E8E7E0097C
	for <meta-virtualization@yoctoproject.org>;
	Tue,  3 Sep 2019 10:14:36 -0700 (PDT)
Received: by mail-lf1-f65.google.com with SMTP id r134so12619901lff.12
	for <meta-virtualization@yoctoproject.org>;
	Tue, 03 Sep 2019 10:14:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=+74ato9TqTLAwm0zujH8E719twLJDg+f5WXxf29AeAI=;
	b=GR5REQL5Zbzcg5Rc80iVegWbdGssBNtN+BcLMleL+jYZKgpKmSCyghzl7gORnos27p
	nZFHy036nqixVg+mmbxi7aX8E+VbUDn6As0Lg4x5n2RoXpTM7nyagUKBPMP+SsLzJwr/
	5S7KG1pq+90SJfAaTPPB//clms9b0oo2+d01+nbUl58gvcip3CUQrvjQS117RQ/SP3l0
	odLnYNIejQHL91HCsY04RcG+LD7XvkvN9wW35ANyxHYzgg7wh5Aj3rx2fkovTgGKCw/8
	r3+hGAMJk9JHjnqVbdnJVSDRKY2XSg45+v/dVuNdo6OcFsJ+2XNa+hJXPWDMG8WUQvwz
	evqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=+74ato9TqTLAwm0zujH8E719twLJDg+f5WXxf29AeAI=;
	b=pWb1EUeEjzYy5sYGLzVHMl14m11Iz9kRzGKbzNXZIUwK03a0u/ZCwgT1xZSLpbK6qN
	RueTiE4JJXmrYIfT9Mh7kdKCAWENp8l/BqJnPjfNzb9YmYjPefml2oDH5Qng0Jr/hbaM
	JdP6/aJuHvl+n68JxHldhrdlsTH54JGyw6JiGPVusNn1611FI7eP55g3JSgImmb3+jEb
	GtjZcH9T6RqfhLKBEmTql1l58zn4v9HUPHoHtVjNKUdh370F19LWzC3ahcFuxkQ8pRTE
	2MgGXp4ez/bXk0b1SyG1vsBAE/AWLrWloArfXlroc0idVmrQj0kp9FZC174119G3kLNO
	DMfg==
X-Gm-Message-State: APjAAAVfOQsUWTzBQM0VRTPY9UcIC88NX7JSC0u/laJbRQqMVHs1W2DP
	WW+wakehJltI+fddnPth3KdZZTeCKere3lEbRTU=
X-Google-Smtp-Source: APXvYqyMzjGkl9QUc6jAZ2ABnwwUeNhcUqfVtU0HuWABchXYBUZY0wO9U9dEuc+9boTOZfXqtEbWH20jldaXN9s3Bdo=
X-Received: by 2002:ac2:4117:: with SMTP id b23mr6021359lfi.36.1567530875109; 
	Tue, 03 Sep 2019 10:14:35 -0700 (PDT)
MIME-Version: 1.0
References: <1567145853-76109-1-git-send-email-changqing.li@windriver.com>
In-Reply-To: <1567145853-76109-1-git-send-email-changqing.li@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 3 Sep 2019 13:14:23 -0400
Message-ID: <CADkTA4O9jccyykrQSR+Htkwu=AW4i9Ro2hQnuPmvw=6EZyeFig@mail.gmail.com>
To: changqing.li@windriver.com
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH 1/2] cgroup-lite: support usrmerge
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
X-List-Received-Date: Tue, 03 Sep 2019 17:14:37 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Aug 30, 2019 at 2:20 AM <changqing.li@windriver.com> wrote:
>
> From: Changqing Li <changqing.li@windriver.com>
>

I'll take the patch, but in the future, we should have a long log
here. I'd expect that log to point out that by using ${base_bindir}
versus 'bin', we can adjust to the binary directory changes when
usrmerge is enabled.

Bruce

> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>  recipes-containers/cgroup-lite/cgroup-lite_1.15.bb | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/recipes-containers/cgroup-lite/cgroup-lite_1.15.bb b/recipes-containers/cgroup-lite/cgroup-lite_1.15.bb
> index 7b48c3a..45cc287 100644
> --- a/recipes-containers/cgroup-lite/cgroup-lite_1.15.bb
> +++ b/recipes-containers/cgroup-lite/cgroup-lite_1.15.bb
> @@ -22,9 +22,9 @@ SYSTEMD_AUTO_ENABLE_${PN} = "mask"
>
>
>  do_install() {
> -       install -d ${D}/bin
> -       install -m 0755 ${S}/scripts/cgroups-mount ${D}/bin
> -       install -m 0755 ${S}/scripts/cgroups-umount ${D}/bin
> +       install -d ${D}/${base_bindir}
> +       install -m 0755 ${S}/scripts/cgroups-mount ${D}/${base_bindir}
> +       install -m 0755 ${S}/scripts/cgroups-umount ${D}/${base_bindir}
>
>         install -d ${D}${sysconfdir}/init.d
>         install -m 0755 ${WORKDIR}/cgroups-init ${D}${sysconfdir}/init.d/cgroups-init
> --
> 2.7.4
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

