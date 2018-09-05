Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A8AA3E00A94; Wed,  5 Sep 2018 13:32:20 -0700 (PDT)
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
	*      [209.85.167.67 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com
	[209.85.167.67])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C3CA2E00A64
	for <meta-virtualization@yoctoproject.org>;
	Wed,  5 Sep 2018 13:32:19 -0700 (PDT)
Received: by mail-lf1-f67.google.com with SMTP id g6-v6so7107284lfb.11
	for <meta-virtualization@yoctoproject.org>;
	Wed, 05 Sep 2018 13:32:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Hyb72MsG4DxKBdBtWuiSbnCUgjQdLOLqstXoz2MrkZY=;
	b=OeG/+Pza85PpZuQ07igoVvxhVOz69nzD1vKnIU35zV7hkfvBXEfz4lCiaiMf5sjJ0W
	SedcROe5O4bgQ+Jo29jQnzm6Bp8hp/6F+pybybHrzo8+qFi8FbgBeC1qOa1locmOQB89
	EDwGtvvAyHbWrfyvjgY096JsukOoV9qB0uwLyZvgIWf+/gVpJKltAVmm3SDz0oSZnfwq
	rnbo1DlRM1zDDeL5ZB6I7TWCmCK5LaHVbbkXDKx8OoRs/gTcWGmvgoVb5LNUIDzpMJM7
	xuztx/qt4yU3aa/UiqAqKTLcr7vjHTYwm0NfBjhh+w1J+Unw8qaxalDkzFzNiZWDcrCC
	Y/Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Hyb72MsG4DxKBdBtWuiSbnCUgjQdLOLqstXoz2MrkZY=;
	b=SxU0ZOYwH3je1rDY0CQ/eC3Wyd7JH+trnMvEdRxrxGPuqlr6fuu4ooPA36kAdibirn
	Hp5MlA2pPGpzfwVbmmmhZxyiEkvMl8j4G3ldSEcD5n4hzB8mkV9Vb33YBRw75gdyWrzr
	XbaVAhqhVo0EZWIbGjyQhj9cFx/Tzz3/1/4ZRPL+eiLRh2DtyKPrim7ernZ6fKaMHNfp
	WqXdTedc0KoShIt5zMVsVye54jXvdv9OlA+vor161c07dlZxK6EBpf1vm6RyeYmL0+Dh
	exAc8u4IrKW6lzSyYMW/E1pEl9MUzl3uhZaGrZiHeKJf9WHWy74GpDHz+ApdXPBnbWfV
	4BXg==
X-Gm-Message-State: APzg51DgPsxjcvvcQfYQu6T3GnLwXnKY5bqOP+D75apiHGbQwkeZ/qwo
	ubOPMvjl9eWcaT/es9jM2LDYgTlqEgmbcr1V6RaXcw==
X-Google-Smtp-Source: ANB0VdYeN309cRZqR3HpJFVt35+En3FudxqdaaoF+HIxFnGCLMIstj5a+/GKOcLAK6Fz2cZmnSCFkmXS+fhW+yJDEq8=
X-Received: by 2002:a19:6b0b:: with SMTP id
	d11-v6mr21371786lfa.99.1536179538759; 
	Wed, 05 Sep 2018 13:32:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a2e:86c9:0:0:0:0:0 with HTTP;
	Wed, 5 Sep 2018 13:32:18 -0700 (PDT)
In-Reply-To: <1535716934-203335-1-git-send-email-hongzhi.song@windriver.com>
References: <1535716934-203335-1-git-send-email-hongzhi.song@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 5 Sep 2018 16:32:18 -0400
Message-ID: <CADkTA4P2T4GzhL-ri_HoRxAb-2aL+K9oLDYN4FcitY6q0AjGSA@mail.gmail.com>
To: "Hongzhi.Song" <hongzhi.song@windriver.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] diod/ops.c: add header file for makedev
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
X-List-Received-Date: Wed, 05 Sep 2018 20:32:20 -0000
Content-Type: text/plain; charset="UTF-8"

merged

Bruce

On Fri, Aug 31, 2018 at 8:02 AM, Hongzhi.Song
<hongzhi.song@windriver.com> wrote:
> Error:
> diod/ops.c:845: undefined reference to `makedev'
>
> Fixed:
> Glibc removes sys/sysmacros.h which defines makedev from sys/types.h
> since v2.28. [Commit ID: e16deca62e16f]
>
> And then glibc suggestions us to include <sys/sysmacros.h> directly if
> code needs it.
>
> Signed-off-by: Hongzhi.Song <hongzhi.song@windriver.com>
> ---
>  recipes-extended/diod/diod_1.0.24.bb               |  1 +
>  ...01-diod-ops.c-add-header-file-for-makedev.patch | 40 ++++++++++++++++++++++
>  2 files changed, 41 insertions(+)
>  create mode 100644 recipes-extended/diod/files/0001-diod-ops.c-add-header-file-for-makedev.patch
>
> diff --git a/recipes-extended/diod/diod_1.0.24.bb b/recipes-extended/diod/diod_1.0.24.bb
> index a4d159a..bb5707e 100644
> --- a/recipes-extended/diod/diod_1.0.24.bb
> +++ b/recipes-extended/diod/diod_1.0.24.bb
> @@ -15,6 +15,7 @@ SRC_URI = "git://github.com/chaos/diod.git;protocol=git \
>             file://diod.conf \
>             file://0001-build-allow-builds-to-work-with-separate-build-dir.patch \
>             file://0002-auto.diod.in-remove-bashisms.patch \
> +           file://0001-diod-ops.c-add-header-file-for-makedev.patch \
>            "
>  DEPENDS = "libcap ncurses tcp-wrappers lua"
>
> diff --git a/recipes-extended/diod/files/0001-diod-ops.c-add-header-file-for-makedev.patch b/recipes-extended/diod/files/0001-diod-ops.c-add-header-file-for-makedev.patch
> new file mode 100644
> index 0000000..e6f7ece
> --- /dev/null
> +++ b/recipes-extended/diod/files/0001-diod-ops.c-add-header-file-for-makedev.patch
> @@ -0,0 +1,40 @@
> +From f75836731d6051d85e6317eb4c12465bafb4973e Mon Sep 17 00:00:00 2001
> +From: "Hongzhi.Song" <hongzhi.song@windriver.com>
> +Date: Fri, 31 Aug 2018 05:47:02 -0400
> +Subject: [PATCH] diod/ops.c: add header file for makedev
> +
> +Error:
> +diod/ops.c:845: undefined reference to `makedev'
> +
> +Fixed:
> +Glibc removes sys/sysmacros.h which defines makedev from sys/types.h
> +since v2.28. [Commit ID: e16deca62e16f]
> +
> +And then glibc suggestions us to include <sys/sysmacros.h> directly if
> +code needs it.
> +
> +Upstream-Status: Submitted
> +[diod:
> +mail: v9fs-developer@lists.sourceforge.net
> +author: hongzhi.song@windriver.com]
> +
> +Signed-off-by: Hongzhi.Song <hongzhi.song@windriver.com>
> +---
> + diod/ops.c | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/diod/ops.c b/diod/ops.c
> +index c6c8291..469a502 100644
> +--- a/diod/ops.c
> ++++ b/diod/ops.c
> +@@ -74,6 +74,7 @@
> + #include <pthread.h>
> + #include <errno.h>
> + #include <sys/types.h>
> ++#include <sys/sysmacros.h>
> +
> + #ifdef __FreeBSD__
> + #if !__BSD_VISIBLE
> +--
> +2.8.1
> +
> --
> 2.8.1
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

