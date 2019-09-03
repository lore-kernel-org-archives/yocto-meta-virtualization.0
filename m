Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 5FF90E00D68; Tue,  3 Sep 2019 13:00:18 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	https://www.dnswl.org/, no *      trust
	*      [209.85.208.193 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (bruce.ashfield[at]gmail.com)
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
	[209.85.208.193])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A35D9E00BF8
	for <meta-virtualization@yoctoproject.org>;
	Tue,  3 Sep 2019 13:00:17 -0700 (PDT)
Received: by mail-lj1-f193.google.com with SMTP id l20so2854026ljj.3
	for <meta-virtualization@yoctoproject.org>;
	Tue, 03 Sep 2019 13:00:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=XafXeQYyKuXkRwV8bJb8E7SgSyhf6GGT4gKzNu6CUI4=;
	b=Mnt+ZWVxNdyWQGNXNQNwbSMY/10oZMITIHYM8f+0EZyKfodGeHeCt6EPk5kf+it41x
	y6SJvOfHW1zq/wrgqqJhY58ytvvPY6Iaw16SHcJ2IGoXyeKFv+NHgC38ov5Vuyf79/V7
	HkKCTu6kWrjKp3wi95B8XsHzscag1zZksKFgOpEHonclKTAsosoJ1QH4k3v0uVwVI1zn
	mIp5B8pkn34sAcxyQlhrNRvLF2vm38D7iFCeOMJa68QnfrKKxecvofKWHU1tt/sXXy4r
	7MDYD+l3SnqiSBPRZ3ngGBga5Dhzw8QsNNlTLIyUU79cjpT4Mm7kvFyDNJgFMZ0JY8h8
	Ov/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=XafXeQYyKuXkRwV8bJb8E7SgSyhf6GGT4gKzNu6CUI4=;
	b=pgcrqRlseOV3PrtrqaYf0naqOWDSM8o1rOQ5vRAz/UbluQgdE9rB5/nInfN7dSrKPE
	vxSK1yx3G0MjgieVtBgNEiv5AuOfBUFZtKTOPD3Iky3dmcku3pIiRP3TzvLa+B2zzBSn
	JFchxuWB7P7rmBMNJJdebJyoTF3W/RpX9vGUzOuzfQJNLSpCPbvDp72NEbxjlsh9Id9N
	vOvdMrrp4mjCgumP3WTk0D6GZe+0+Tq67cjMF+no90fB1kWuec+ZoEDDlk42DiFT7oqv
	XVHggAWXztRccG/FCwMolQ2SkoILIDpI8u80nBbwIWRk9qe+47kHHSZ19nf2veY2mIyb
	97gw==
X-Gm-Message-State: APjAAAWVgHIusnUStoXCZRo1K1QdbcNJvuh2xpLyBh3NOfdnrGYEOvJG
	xVJcd1mv0SY2Adu6Rrue5kmXSdDBfK/OfvxWXNhCjFrW
X-Google-Smtp-Source: APXvYqzF8DZQqgoztujJcrGJcUOFAWd/m1Gpp0vZp4k9JbqvVeL7WpWyBEHtQZU2RZLVwlJ173IBdQj3uy0I6r4UNTE=
X-Received: by 2002:a2e:83d6:: with SMTP id s22mr14476064ljh.104.1567540816650;
	Tue, 03 Sep 2019 13:00:16 -0700 (PDT)
MIME-Version: 1.0
References: <1567145853-76109-1-git-send-email-changqing.li@windriver.com>
In-Reply-To: <1567145853-76109-1-git-send-email-changqing.li@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 3 Sep 2019 16:00:05 -0400
Message-ID: <CADkTA4PxDgRjCJqdRvwb_eQYVxVhryV1tPAf464c16BXGpH=ew@mail.gmail.com>
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
X-List-Received-Date: Tue, 03 Sep 2019 20:00:18 -0000
Content-Type: text/plain; charset="UTF-8"

merged

Bruce

On Fri, Aug 30, 2019 at 2:20 AM <changqing.li@windriver.com> wrote:
>
> From: Changqing Li <changqing.li@windriver.com>
>
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

