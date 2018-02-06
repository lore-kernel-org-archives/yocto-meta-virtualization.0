Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 34B70E00E5E; Mon,  5 Feb 2018 17:29:38 -0800 (PST)
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
	*      [209.85.215.67 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-lf0-f67.google.com (mail-lf0-f67.google.com
	[209.85.215.67])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id ED511E00A44
	for <meta-virtualization@yoctoproject.org>;
	Mon,  5 Feb 2018 17:29:36 -0800 (PST)
Received: by mail-lf0-f67.google.com with SMTP id g72so373814lfg.5
	for <meta-virtualization@yoctoproject.org>;
	Mon, 05 Feb 2018 17:29:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ax0jiWQm5pC29r6dyjPejTXZvjioEiXgelR218gYhDM=;
	b=RBMOfksyJhV7dhmnLYq12rJt0dM2NChdNFQA5jHwtqb6e94Aa7Z3g8Sj5Ba//YbkO4
	HHWU263gzX0+JTju8mIgapDVHZ82RdPqiEgvX5wpYySFG7Iz3K0jel7OgaTpVE+KLwyR
	RVwKX7cOvh3ORP64hypZMyvZImhvhRyvpGGxlnaBCDgAKw+jaEV7dSXb7GY24scP7WGz
	iuMC0B91FW3d4ZzU5o3nCgyAkfku2mnmVml63tjohods/SfEKKuF5DNd8NJK/0DKeXzG
	fOi1tSdiFDvv7bLy2N+x1+aH4ML+KFRfVQqqhk2BHnVkUHLvP+J8KNmnSE1bu6zZC+L1
	47dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ax0jiWQm5pC29r6dyjPejTXZvjioEiXgelR218gYhDM=;
	b=aEFp5xC1NgX1HH+P7I/rNjtYgxarlrxFfTyV2eZd989IjjhQFsZxTnnPsZaaZr/+RX
	sxERt1wk0+7vgMjARA/Wcrfro8IJDpQvg2H7cVrMCKH6ki9iGoJsoqupvmUKKGqzQ0hW
	DDxM6Cou0nzPNkbC1hbo90tPGgHDkC9c6ZrbJwkvC8Xva40kxMkC19Za0DlE3sz+FMBu
	L0+ivMF1qopJ0PhBLtv0cBIG8suhJSB4C+g9ou1G0tjEqpY/WDkPB6JmzKzsxQOBg99m
	gRqbVX0743jmaM++exHNnufft71D3mvTIlcGM8sOktLx/3jII7kvb7G6HXI7CnsAxAe7
	kr5g==
X-Gm-Message-State: APf1xPAliLWTwUuw5nwOkQLiFN9fxh+ampAmnrJlIfhOnpVYhJ7R3f7m
	cVsF66dM8zju8iRSblYHuqrc1IQzgMdT3A79lhkz/g==
X-Google-Smtp-Source: AH8x2259/Op8laLu7J3sGlxgGTWbg/2wXzvcGReeH/opcZUjB+ELNQATlkApdjiX9nVuRlgwyLlWknIfVNso8Q/XipY=
X-Received: by 10.46.77.149 with SMTP id c21mr460560ljd.148.1517880575803;
	Mon, 05 Feb 2018 17:29:35 -0800 (PST)
MIME-Version: 1.0
Received: by 10.46.18.151 with HTTP; Mon, 5 Feb 2018 17:29:35 -0800 (PST)
In-Reply-To: <1517547743-30140-1-git-send-email-ricardo@opensourcefoundries.com>
References: <1517547743-30140-1-git-send-email-ricardo@opensourcefoundries.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 5 Feb 2018 20:29:35 -0500
Message-ID: <CADkTA4NSfG9yTvkSVnKftrsD-Wmo5yYnNwWx_bbJs4w7M+xzsg@mail.gmail.com>
To: Ricardo Salveti <ricardo@opensourcefoundries.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] lxc: set systemdsystemunitdir with systemd
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
X-List-Received-Date: Tue, 06 Feb 2018 01:29:38 -0000
Content-Type: text/plain; charset="UTF-8"

merged.

Bruce

On Fri, Feb 2, 2018 at 12:02 AM, Ricardo Salveti
<ricardo@opensourcefoundries.com> wrote:
> systemd unit dir can be customized by the distro (e.g. usrmerge), so
> make sure the correct unit dir path is set on configure.
>
> Signed-off-by: Ricardo Salveti <ricardo@opensourcefoundries.com>
> ---
>  recipes-containers/lxc/lxc_2.0.8.bb | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/recipes-containers/lxc/lxc_2.0.8.bb b/recipes-containers/lxc/lxc_2.0.8.bb
> index 651eb72..d8607f8 100644
> --- a/recipes-containers/lxc/lxc_2.0.8.bb
> +++ b/recipes-containers/lxc/lxc_2.0.8.bb
> @@ -60,6 +60,7 @@ EXTRA_OECONF += "--enable-log-src-basename"
>  CFLAGS_append = " -Wno-error=deprecated-declarations"
>
>  PACKAGECONFIG ??= "templates \
> +    ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)} \
>      ${@bb.utils.contains('DISTRO_FEATURES', 'selinux', 'selinux', '', d)} \
>  "
>  PACKAGECONFIG[doc] = "--enable-doc --enable-api-docs,--disable-doc --disable-api-docs,,"
> @@ -68,6 +69,7 @@ PACKAGECONFIG[apparmour] = "--enable-apparmor,--disable-apparmor,apparmor,apparm
>  PACKAGECONFIG[templates] = ",,, ${PN}-templates"
>  PACKAGECONFIG[selinux] = "--enable-selinux,--disable-selinux,libselinux,libselinux"
>  PACKAGECONFIG[seccomp] ="--enable-seccomp,--disable-seccomp,libseccomp,libseccomp"
> +PACKAGECONFIG[systemd] = "--with-systemdsystemunitdir=${systemd_unitdir}/system/,--without-systemdsystemunitdir,systemd,"
>  PACKAGECONFIG[python] = "--enable-python,--disable-python,python3,python3-core"
>  PACKAGECONFIG[lua] = "--enable-lua,--disable-lua,lua,lua"
>
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

