Return-Path: <cjp256@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 89191E00BF8; Tue, 29 Mar 2016 08:00:41 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (cjp256[at]gmail.com)
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.218.43 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-oi0-f43.google.com (mail-oi0-f43.google.com
	[209.85.218.43])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 13500E00951
	for <meta-virtualization@yoctoproject.org>;
	Tue, 29 Mar 2016 08:00:38 -0700 (PDT)
Received: by mail-oi0-f43.google.com with SMTP id h6so25435787oia.2
	for <meta-virtualization@yoctoproject.org>;
	Tue, 29 Mar 2016 08:00:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=3FmIci5zSsI3Joqj9TvgzhE6dwGnqkzpwceO6UHR0pU=;
	b=ZRYNOAgzIrRa8BWyUYy8i/FZO0Uiy+BZg6AYSyeUH79XZCmcKiEMEhIXzGRGbsbzfT
	4SPIGoaQECmD8xtwhkh7FL2htilOg+h6BusQTV6179hmca+T9zpNhCSutuSz42Vax0Tp
	dJGDakQMAFyggjpPbwzHe1PbOhFoWdSNC0eK/BKlMdF5cfCBEEGcsdUpCh1qBBdpGfQF
	Dnh1I/CMZpJ1vsoQGR+aDpIEYfaaFrnS3yER6cAZzpP4oN6yED8qKH6WIaSRwnUTvlwa
	6e09oguAzo4pnOo7tgL4wTBwhndpmhBc3yRslhSP98Kj4zGXCNv/0exf9QB8i9lte5dz
	gFtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=3FmIci5zSsI3Joqj9TvgzhE6dwGnqkzpwceO6UHR0pU=;
	b=FQGs0Be0zB6Rsv4ndTT794ThqmUiVRrvORWRKYxPIn0S2EmlYTrgyVtceVVH3YUxdQ
	ScYKABGvgA2cDJBpPN51o8tH98TcGYdMznWjfrH1d3BW+1wMh1+ScknA96lDVQB8bUbs
	UvWXCfaVh7m3n5E8mAeg+ID6Y5rXXPFNGKHyh9k4InPRib1r/fBWpjzHrnzDDhPvfYRP
	WD6rgHqcSEiJOh1tYMKzthRtocgTGOlQLzPxcjidNIAjtPGtfEexJMA+yxa0s8QrMNGx
	gTQUf9/Fa1Er4+z55kSffCxFANFPkQ4tc0Vy10t/Cp/hq5Z/TddJHoS+HUUMMCI1bXSy
	XXAg==
X-Gm-Message-State: AD7BkJJFfzCsNmMcJV2j0XWXzaQsHRyJMTCM7hMJRyZeBRXBKERJTKMwN76yrssLm8ikluM9QXNQEirVXpvZjQ==
X-Received: by 10.157.41.70 with SMTP id d64mr1457962otb.116.1459263637677;
	Tue, 29 Mar 2016 08:00:37 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.157.15.72 with HTTP; Tue, 29 Mar 2016 08:00:18 -0700 (PDT)
In-Reply-To: <1459255600-14043-4-git-send-email-derek@asterius.io>
References: <1459255600-14043-1-git-send-email-derek@asterius.io>
	<1459255600-14043-4-git-send-email-derek@asterius.io>
From: Chris Patterson <cjp256@gmail.com>
Date: Tue, 29 Mar 2016 11:00:18 -0400
Message-ID: <CABZSBQe6hRe9OWOT79J0xZKZTVW8Pq1CuuwXyuU7knkd=_qQqA@mail.gmail.com>
To: Derek Straka <derek@asterius.io>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCHv2 4/4] xen: add the extra packages released with xen 4.7
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
X-List-Received-Date: Tue, 29 Mar 2016 15:00:41 -0000
Content-Type: text/plain; charset=UTF-8

Built, 4.6 (not 4.7) package LGTM, +1

On Tue, Mar 29, 2016 at 8:46 AM, Derek Straka <derek@asterius.io> wrote:
> Signed-off-by: Derek Straka <derek@asterius.io>
> ---
>  recipes-extended/xen/xen.inc | 47 ++++++++++++++++++++++++++++++++++----------
>  1 file changed, 37 insertions(+), 10 deletions(-)
>
> diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc
> index ae09b8b..a4af0b3 100644
> --- a/recipes-extended/xen/xen.inc
> +++ b/recipes-extended/xen/xen.inc
> @@ -160,6 +160,7 @@ PACKAGES = "\
>      ${PN}-gdbsx \
>      ${PN}-hvmloader \
>      ${PN}-hypervisor \
> +    ${PN}-init-xenstore-dom \
>      ${PN}-kdd \
>      ${PN}-libblktap \
>      ${PN}-libblktapctl \
> @@ -169,8 +170,16 @@ PACKAGES = "\
>      ${PN}-libfsimage-dev \
>      ${PN}-libvhd \
>      ${PN}-libvhd-dev \
> +    ${PN}-libxencall \
> +    ${PN}-libxencall-dev \
>      ${PN}-libxenctrl \
>      ${PN}-libxenctrl-dev \
> +    ${PN}-libxenevtchn \
> +    ${PN}-libxenevtchn-dev \
> +    ${PN}-libxenforeignmemory \
> +    ${PN}-libxenforeignmemory-dev \
> +    ${PN}-libxengnttab \
> +    ${PN}-libxengnttab-dev \
>      ${PN}-libxenguest \
>      ${PN}-libxenguest-dev \
>      ${PN}-libxenlight \
> @@ -179,6 +188,8 @@ PACKAGES = "\
>      ${PN}-libxenstat-dev \
>      ${PN}-libxenstore \
>      ${PN}-libxenstore-dev \
> +    ${PN}-libxentoollog \
> +    ${PN}-libxentoollog-dev \
>      ${PN}-libxenvchan \
>      ${PN}-libxenvchan-dev \
>      ${PN}-libxlutil \
> @@ -261,6 +272,21 @@ FILES_${PN}-staticdev += "\
>  FILES_${PN}-libblktapctl = "${libdir}/libblktapctl.so.*"
>  FILES_${PN}-libblktapctl-dev = "${libdir}/libblktapctl.so"
>
> +FILES_${PN}-libxencall = "${libdir}/libxencall.so.*"
> +FILES_${PN}-libxencall-dev = "${libdir}/libxencall.so"
> +
> +FILES_${PN}-libxenctrl = "${libdir}/libxenctrl.so.*"
> +FILES_${PN}-libxenctrl-dev = "${libdir}/libxenctrl.so"
> +
> +FILES_${PN}-libxenevtchn = "${libdir}/libxenevtchn.so.*"
> +FILES_${PN}-libxenevtchn-dev = "${libdir}/libxenevtchn.so"
> +
> +FILES_${PN}-libxenforeignmemory = "${libdir}/libxenforeignmemory.so.*"
> +FILES_${PN}-libxenforeignmemory-dev = "${libdir}/libxenforeignmemory.so"
> +
> +FILES_${PN}-libxengnttab = "${libdir}/libxengnttab.so.*"
> +FILES_${PN}-libxengnttab-dev = "${libdir}/libxengnttab.so"
> +
>  FILES_${PN}-libxenguest = "${libdir}/libxenguest.so.*"
>  FILES_${PN}-libxenguest-dev = "${libdir}/libxenguest.so"
>
> @@ -270,27 +296,26 @@ FILES_${PN}-libxenlight-dev = " \
>      ${datadir}/pkgconfig/xenlight.pc \
>      "
>
> +FILES_${PN}-libxenstat = "${libdir}/libxenstat.so.*"
> +FILES_${PN}-libxenstat-dev = "${libdir}/libxenstat.so"
> +
> +FILES_${PN}-libxenstore = "${libdir}/libxenstore.so.*"
> +FILES_${PN}-libxenstore-dev = "${libdir}/libxenstore.so"
> +
> +FILES_${PN}-libxentoollog = "${libdir}/libxentoollog.so.*"
> +FILES_${PN}-libxentoollog-dev = "${libdir}/libxentoollog.so"
> +
>  FILES_${PN}-libxenvchan = "${libdir}/libxenvchan.so.*"
>  FILES_${PN}-libxenvchan-dev = "${libdir}/libxenvchan.so"
>
> -FILES_${PN}-libxenctrl = "${libdir}/libxenctrl.so.*"
> -FILES_${PN}-libxenctrl-dev = "${libdir}/libxenctrl.so"
> -
>  FILES_${PN}-libxlutil = "${libdir}/libxlutil.so.*"
>  FILES_${PN}-libxlutil-dev = " \
>      ${libdir}/libxlutil.so \
>      ${datadir}/pkgconfig/xlutil.pc \
>      "
> -
>  FILES_${PN}-libvhd = "${libdir}/libvhd.so.*"
>  FILES_${PN}-libvhd-dev = "${libdir}/libvhd.so"
>
> -FILES_${PN}-libxenstat = "${libdir}/libxenstat.so.*"
> -FILES_${PN}-libxenstat-dev = "${libdir}/libxenstat.so"
> -
> -FILES_${PN}-libxenstore = "${libdir}/libxenstore.so.*"
> -FILES_${PN}-libxenstore-dev = "${libdir}/libxenstore.so"
> -
>  FILES_${PN}-libblktap = "${libdir}/libblktap.so.*"
>  FILES_${PN}-libblktap-dev = "${libdir}/libblktap.so"
>
> @@ -307,6 +332,8 @@ FILES_${PN}-hypervisor = "\
>      /boot/xen-syms-* \
>      "
>
> +FILES_${PN}-init-xenstore-dom = "${libdir}/xen/bin/init-xenstore-domain"
> +
>  FILES_${PN}-efi = "\
>      ${exec_prefix}/lib64 \
>      ${exec_prefix}/lib64/xen* \
> --
> 1.9.1
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization

