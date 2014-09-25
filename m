Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A1582E0086F; Thu, 25 Sep 2014 05:18:08 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.215.50 listed in list.dnswl.org]
Received: from mail-la0-f50.google.com (mail-la0-f50.google.com
	[209.85.215.50])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5BCBEE0086B
	for <meta-virtualization@yoctoproject.org>;
	Thu, 25 Sep 2014 05:18:02 -0700 (PDT)
Received: by mail-la0-f50.google.com with SMTP id el20so787250lab.9
	for <meta-virtualization@yoctoproject.org>;
	Thu, 25 Sep 2014 05:18:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=iiz5S3ZnV/DWfuO7Fs2TmDUWQM1e/zI823etoXXyNGA=;
	b=dolSGfK9YcZbR6Eqtad03D5qBtDJ4mfchPD6+PfzsvcUM98b626PyCWrhwtWWJSVBU
	u9FlfshfXECSZYJI6Qno0LHibBzN4H2/6VcsQO4nLy6NY/etHHiXvWwHl+RIGhSVLL7Z
	PkDtzkOnlVB+4+5Qu7zZxOL6Meb5ukWNZiTdrCaaTOE0MT2gCidWbGLJA8vDe/xAt5ua
	nYz6/P0Bf3Wh51uiI0o3hTcTBFzMBu9/Wb5SqHRq67rIzvbNGaNmZUaVF+LkloUiLGZx
	h/4R6XeJ43CGQ+8DbLjUWO/PHdpEwVkk1qVovTDMDpmPBMPMSyupilLnj431nZxrzfSE
	lDKg==
MIME-Version: 1.0
X-Received: by 10.112.76.6 with SMTP id g6mr12437166lbw.22.1411647480357; Thu,
	25 Sep 2014 05:18:00 -0700 (PDT)
Received: by 10.112.44.234 with HTTP; Thu, 25 Sep 2014 05:18:00 -0700 (PDT)
In-Reply-To: <1411498603-13375-1-git-send-email-zibo.zhao@windriver.com>
References: <1411498603-13375-1-git-send-email-zibo.zhao@windriver.com>
Date: Thu, 25 Sep 2014 08:18:00 -0400
Message-ID: <CADkTA4OXqZND_V99E7m=UA3arwMP1tfJ8+5eAeLcFjKV-_rnkA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Zibo Zhao <zibo.zhao@windriver.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH 1/1] Add udev dependency for multipath-tools package
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
X-List-Received-Date: Thu, 25 Sep 2014 12:18:08 -0000
Content-Type: text/plain; charset=UTF-8

Thanks Zibo,

I've merged the change.

Bruce

On Tue, Sep 23, 2014 at 2:56 PM, Zibo Zhao <zibo.zhao@windriver.com> wrote:
> mutipath-tools package has build time dependency on udev.
> Without it, following build error will occur:
> | discovery.c:14:21: fatal error: libudev.h: No such file or directory
> | compilation terminated.
> | make[1]: *** [discovery.o] Error 1
> | make[1]: *** Waiting for unfinished jobs....
> | config.c:8:21: fatal error: libudev.h: No such file or directory
> | compilation terminated.
> | make[1]: *** [config.o] Error 1
> | structs.c:8:21: fatal error: libudev.h: No such file or directory
> | compilation terminated.
> | make[1]: *** [structs.o] Error 1
>
> Add udev into DEPENDS to avoid build failures.
>
> Signed-off-by: Zibo Zhao <zibo.zhao@windriver.com>
> ---
>  recipes-extended/multipath-tools/multipath-tools_git.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/recipes-extended/multipath-tools/multipath-tools_git.bb b/recipes-extended/multipath-tools/multipath-tools_git.bb
> index 633b9f2..01d15dd 100644
> --- a/recipes-extended/multipath-tools/multipath-tools_git.bb
> +++ b/recipes-extended/multipath-tools/multipath-tools_git.bb
> @@ -3,7 +3,7 @@ DESCRIPTION = "This package provides the tools to manage multipathed devices by
>  instructing the device-mapper multipath module what to do"
>
>  HOMEPAGE = "http://christophe.varoqui.free.fr/"
> -DEPENDS = "readline libaio lvm2"
> +DEPENDS = "readline libaio lvm2 udev"
>  LICENSE = "GPLv2"
>
>  LIC_FILES_CHKSUM = "file://COPYING;md5=7be2873b6270e45abacc503abbe2aa3d"
> --
> 1.9.1
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

