Return-Path: <asselsm@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 55381E00509; Wed, 14 Sep 2016 10:44:07 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, RCVD_IN_DNSWL_NONE,
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * 0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.161.195 listed in dnsbl.sorbs.net]
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.161.195 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-yw0-f195.google.com (mail-yw0-f195.google.com
	[209.85.161.195])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 19A9BE0045D
	for <meta-virtualization@yoctoproject.org>;
	Wed, 14 Sep 2016 10:44:03 -0700 (PDT)
Received: by mail-yw0-f195.google.com with SMTP id v2so1574333ywg.3
	for <meta-virtualization@yoctoproject.org>;
	Wed, 14 Sep 2016 10:44:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:reply-to:sender:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=QR+IvNZgqncCu1Tc2avRDZeWhc11Ftp891bL9bXVTa4=;
	b=pGfZYZaqbFU33zxdeboh2dI36YfzG+MH00FY5eh58yzFCgEHWkxKMq4xJIv0dSy7+7
	iarlzxBNGFKt6xLtR5NeVPOheos2IwJ3Iw8wdcPDKNr8Sx5VS8uskZrKuTaIAfRhdkmy
	TGRK3z7Ngu+XSe1lQEyyTobB2irSl/lIp3CDlrdCORIesn8T6lCYWH83BziBM2BsdDgp
	81wI+H/kTR460+zrh9zMKkjHuQoFnnEVYr9wm10wwUGxQZOEYRt4N6DV6psUIw86L8ey
	NyW81TwMfwZz0d/qEQmZIffIgj/ufOSvld4oei3lBWDI9//qW+Sq12/E8X8iu2FEqSFb
	fPkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:reply-to:sender:in-reply-to
	:references:from:date:message-id:subject:to:cc;
	bh=QR+IvNZgqncCu1Tc2avRDZeWhc11Ftp891bL9bXVTa4=;
	b=OKK6ilYu4IZLBBBhjKVm8X9qsPjz1POIOW/9pdMa5u7hzIKnhTu2zbaO3p0irJZGyt
	S+MeLj2MbMjsRNxLc3rwPe0GL4th00hsgzjHy47m2d4J47142yW32yugrqXoRNr4rgys
	8hn90pDDhIR8JhrBl/P5ZosflmnzJJZvtwfcO4CWydy1ZulpjlNBTEROsrj2jJ9HW81g
	wArPTe7ix9q1bUqilCO7LY33ee1KJBWB4hGZ9EjKMyy/GMbtD5bQjT/VTGVhY/TxQeTn
	fKMUOibmWXMaqW5uA4FKpsxEqqHo8O+CrCxOG9st9aSL1LhdiMeuOlmkXXOvqL4dtim4
	PPuA==
X-Gm-Message-State: AE9vXwMBI4PqpWd9KCKdr8+SsqoKcHec2hSm2rS55vClfL0ZM+AFdjrSAFpzfUiMkJ/100Eb/yN28TCx3LtW9A==
X-Received: by 10.129.104.196 with SMTP id d187mr2964146ywc.39.1473875042525; 
	Wed, 14 Sep 2016 10:44:02 -0700 (PDT)
MIME-Version: 1.0
Sender: asselsm@gmail.com
Received: by 10.37.171.207 with HTTP; Wed, 14 Sep 2016 10:44:02 -0700 (PDT)
In-Reply-To: <1473831257-3711-1-git-send-email-wangxin2015.fnst@cn.fujitsu.com>
References: <1473831257-3711-1-git-send-email-wangxin2015.fnst@cn.fujitsu.com>
From: Mark Asselstine <mark.asselstine@windriver.com>
Date: Wed, 14 Sep 2016 13:44:02 -0400
X-Google-Sender-Auth: NGi2LvZbULbewkqbgH4qLK2yeM0
Message-ID: <CAPuovEKXxaP_K+x_3udNPBgwbgLu3Y9T=3u5hhHzzo8pw-+P1Q@mail.gmail.com>
To: Wang Xin <wangxin2015.fnst@cn.fujitsu.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: ][PATCH] tgt: 1.0.63 -> 1.0.67
X-BeenThere: meta-virtualization@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
Reply-To: mark.asselstine@windriver.com
List-Id: "Discussion of layer enabling hypervisor, virtualization tool stack,
	and cloud support" <meta-virtualization.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-virtualization>
List-Post: <mailto:meta-virtualization@yoctoproject.org>
List-Help: <mailto:meta-virtualization-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Wed, 14 Sep 2016 17:44:07 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Sep 14, 2016 at 1:34 AM, Wang Xin
<wangxin2015.fnst@cn.fujitsu.com> wrote:
> 1) Upgrade tgt from 1.0.63 to 1.0.67.
> 2) Modify one patch, since the data has been changed.
>     0001-Correct-the-path-of-header-files-check-in-Yocto-buil.patch
>
> Signed-off-by: Wang Xin <wangxin2015.fnst@cn.fujitsu.com>
> ---
>  ...rrect-the-path-of-header-files-check-in-Yocto-buil.patch | 13 +++++++------
>  meta-openstack/recipes-support/tgt/tgt_git.bb               |  6 +++---
>  2 files changed, 10 insertions(+), 9 deletions(-)
>
> diff --git a/meta-openstack/recipes-support/tgt/files/0001-Correct-the-path-of-header-files-check-in-Yocto-buil.patch b/meta-openstack/recipes-support/tgt/files/0001-Correct-the-path-of-header-files-check-in-Yocto-buil.patch
> index 6106b90..b371378 100644
> --- a/meta-openstack/recipes-support/tgt/files/0001-Correct-the-path-of-header-files-check-in-Yocto-buil.patch
> +++ b/meta-openstack/recipes-support/tgt/files/0001-Correct-the-path-of-header-files-check-in-Yocto-buil.patch
> @@ -21,21 +21,22 @@ diff --git a/usr/Makefile b/usr/Makefile
>  index 453eb1a..191503d 100644
>  --- a/usr/Makefile
>  +++ b/usr/Makefile
> -@@ -1,10 +1,10 @@
> +@@ -1,11 +1,11 @@
>   sbindir ?= $(PREFIX)/sbin
> -
> + libdir ?= $(PREFIX)/lib/tgt
> +
>  -ifneq ($(shell test -e /usr/include/linux/signalfd.h && echo 1),)
>  +ifneq ($(shell test -e $(SYSROOT)/usr/include/linux/signalfd.h && echo 1),)
>   CFLAGS += -DUSE_SIGNALFD
>   endif
>
> --ifneq ($(shell test -e /usr/include/sys/timerfd.h && echo 1),)
> -+ifneq ($(shell test -e $(SYSROOT)/usr/include/sys/timerfd.h && echo 1),)
> +-ifneq ($(shell test -n $(shell find /usr/include -name "timerfd.h" | head -n1) && echo 1),)
> ++ifneq ($(shell test -n $(shell find $(SYSROOT)/usr/include -name "timerfd.h" | head -n1) && echo 1),)
>   CFLAGS += -DUSE_TIMERFD
>   endif
>
> -@@ -18,7 +18,7 @@ TGTD_OBJS += bs_rbd.o
> - LIBS += -lrados -lrbd
> +@@ -25,7 +25,7 @@ ifneq ($(SD_NOTIFY),)
> + CFLAGS += -DUSE_TIMERFD
>   endif
>
>  -ifneq ($(shell test -e /usr/include/sys/eventfd.h && test -e /usr/include/libaio.h && echo 1),)
> diff --git a/meta-openstack/recipes-support/tgt/tgt_git.bb b/meta-openstack/recipes-support/tgt/tgt_git.bb
> index ac240f0..0fc70fd 100644
> --- a/meta-openstack/recipes-support/tgt/tgt_git.bb
> +++ b/meta-openstack/recipes-support/tgt/tgt_git.bb
> @@ -4,10 +4,10 @@ LICENSE = "GPLv2"
>  LIC_FILES_CHKSUM = "file://scripts/tgtd.spec;beginline=7;endline=7;md5=21c19ea7dad04648b9c2f791b6e29b4c"
>  DEPENDS = "sg3-utils"
>
> -SRCREV = "eca74a72d2595f126a020111943928c3ea9e6fe8"
> -PV = "1.0.63+git${SRCPV}"
> +SRCREV = "cb7971cfeecaa43c15eed4719dc82516d7e87b6c"
> +PV = "1.0.67+git${SRCPV}"
>
> -SRC_URI = "git://github.com/fujita/tgt.git \
> +SRC_URI = "git://github.com/fujita/tgt.git;protocol=https;\

We have a lot of recipes which use git and github and do not require
the "protocol=https" attribute. What is going on here that this is
needed, just out of curiousity.

Mark

>         file://0001-Correct-the-path-of-header-files-check-in-Yocto-buil.patch \
>          file://0001-usr-Makefile-WARNING-fix.patch \
>  "
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

