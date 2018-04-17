Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 45CC3E00B28; Tue, 17 Apr 2018 10:57:50 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.215.66 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-lf0-f66.google.com (mail-lf0-f66.google.com
	[209.85.215.66])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 676B1E006B4
	for <meta-virtualization@yoctoproject.org>;
	Tue, 17 Apr 2018 10:57:49 -0700 (PDT)
Received: by mail-lf0-f66.google.com with SMTP id d79-v6so2858415lfd.0
	for <meta-virtualization@yoctoproject.org>;
	Tue, 17 Apr 2018 10:57:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=lkEyB2P8xgREqClGeKJu2buZbR7o3lixXphkTG6CO4I=;
	b=iA/Aw8+vQl9hmDHpvdfoReZ7F3llFO1ZIhb92oXfAenV/vwTz/Az6+JO41nMzp7669
	mmlyGnmp+N+YVxI57XZcQQMyv43atRrV/4VjbjPNuGzCKYjord8vQI+qfaeurT+BmcB3
	tkxve739j4sCOToVayNBQJloMrqRiyIvnNNc664IEkxSH0vX27iRP1CGlTDwvgq6JGxe
	MG34ZrjIkZ0ChG0rBSnBzRvdjW4w/lnD+9YdPf+9taOrGDPJmk5NRGkZoTl2olaHUPO4
	kO/sitxo+Sswi67yJlz6sMqXHzt14LRxGrr7xuUX2sKSByAOFU77qr8WY/nRzHyRWeUi
	xyOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=lkEyB2P8xgREqClGeKJu2buZbR7o3lixXphkTG6CO4I=;
	b=Wp4sZewptKd1pDRRPmTGNKRwnTTXkIx8iNz7PYxrnBtl6XzuC639XBWNUDE9rXGe+l
	QDQbFEa5+ELcyh0WLUlO6gYu4eBDj2vPbKeC0M+lBS7vwMVEFrxd0tvsjYK6Jf3xX+ef
	pFtU+slMQkZmbzjefeBJP+iq0JWv32ahEv/GCLJkbBvCmr3Fey18xWHn6Klpgp4n39e+
	QDQZ9qlNbVAzwZDOOShYEwWFjCW/vVoE5JmhPPky9Xy+BxuuMgWJPDvwRQ+xFiBGVEJx
	9Bhw/XbaFzQ+g/WVdE/1AJoOiWzmlTrfaNU/JV+Y+oYtXfzrpF0lLCz1Be08rChEI/aU
	QlRg==
X-Gm-Message-State: ALQs6tCUJIjymF+3ZCI82hDcmlVkOnHAndmpNoCRutkdv8oZ97koPzkp
	m/sX7vO/mjntECEMACJ+wk55Ur7LgHUVI4x/q1A=
X-Google-Smtp-Source: AIpwx4+s+rYQHgA9VEjTUbPHCNv9K6DwVqdpAnOZQwwHJOwu3vkjyOdT25oGVKag3h80/y+H5gm0ZuJETnd7tzxW6E0=
X-Received: by 10.46.9.148 with SMTP id 142mr2217478ljj.129.1523987868040;
	Tue, 17 Apr 2018 10:57:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.46.2.22 with HTTP; Tue, 17 Apr 2018 10:57:47 -0700 (PDT)
In-Reply-To: <1523889281-30520-1-git-send-email-akuster@mvista.com>
References: <1523889281-30520-1-git-send-email-akuster@mvista.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 17 Apr 2018 13:57:47 -0400
Message-ID: <CADkTA4NOUkdN4_rbtOvs5G+x9Y8P89ch=6cKFKkaue8GZ1sH=g@mail.gmail.com>
To: Armin Kuster <akuster808@gmail.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] sysvinit: fix DISTRO decode
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
X-List-Received-Date: Tue, 17 Apr 2018 17:57:50 -0000
Content-Type: text/plain; charset="UTF-8"

merged.

Bruce

On Mon, Apr 16, 2018 at 10:34 AM, Armin Kuster <akuster808@gmail.com> wrote:
> the yocto-check-layer failed with:
>
>       Dependency on variable DISTRO_FEATURES_LIBC was added
>       Variable do_install value changed:
>       @@ -32,3 +32,7 @@
>                done
>                echo "" >> ${D}${sysconfdir}/inittab
>            fi
>       + if echo "${DISTRO_FEATURES}" | grep -q 'xen'; then
>       +         echo "" >> ${D}${sysconfdir}/inittab
>       +         echo "X0:12345:respawn:/sbin/getty 115200 hvc0" >> ${D}${sysconfdir}/inittab
>       + fi
>
> used idea from meta-selinux
>
> Signed-off-by: Armin Kuster <akuster@mvista.com>
> ---
>  recipes-core/sysvinit/sysvinit-inittab_2.%.bbappend | 7 +------
>  recipes-core/sysvinit/sysvinit-inittab_xen.inc      | 4 ++++
>  2 files changed, 5 insertions(+), 6 deletions(-)
>  create mode 100644 recipes-core/sysvinit/sysvinit-inittab_xen.inc
>
> diff --git a/recipes-core/sysvinit/sysvinit-inittab_2.%.bbappend b/recipes-core/sysvinit/sysvinit-inittab_2.%.bbappend
> index 1b89aec..8c08832 100644
> --- a/recipes-core/sysvinit/sysvinit-inittab_2.%.bbappend
> +++ b/recipes-core/sysvinit/sysvinit-inittab_2.%.bbappend
> @@ -1,6 +1 @@
> -do_install_append() {
> -       if echo "${DISTRO_FEATURES}" | grep -q 'xen'; then
> -               echo "" >> ${D}${sysconfdir}/inittab
> -               echo "X0:12345:respawn:/sbin/getty 115200 hvc0" >> ${D}${sysconfdir}/inittab
> -       fi
> -}
> +require ${@bb.utils.contains('DISTRO_FEATURES', 'xen', 'sysvinit-inittab_xen.inc', '', d)}
> diff --git a/recipes-core/sysvinit/sysvinit-inittab_xen.inc b/recipes-core/sysvinit/sysvinit-inittab_xen.inc
> new file mode 100644
> index 0000000..9d0589c
> --- /dev/null
> +++ b/recipes-core/sysvinit/sysvinit-inittab_xen.inc
> @@ -0,0 +1,4 @@
> +do_install_append() {
> +                echo "" >> ${D}${sysconfdir}/inittab
> +                echo "X0:12345:respawn:/sbin/getty 115200 hvc0" >> ${D}${sysconfdir}/inittab
> +}
> --
> 2.7.4
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

