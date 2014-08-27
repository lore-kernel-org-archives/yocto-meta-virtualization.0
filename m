Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B8729E007DB; Wed, 27 Aug 2014 09:31:53 -0700 (PDT)
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
	*      [209.85.215.51 listed in list.dnswl.org]
Received: from mail-la0-f51.google.com (mail-la0-f51.google.com
	[209.85.215.51])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3BEE9E007B9
	for <meta-virtualization@yoctoproject.org>;
	Wed, 27 Aug 2014 09:31:49 -0700 (PDT)
Received: by mail-la0-f51.google.com with SMTP id b8so213123lan.10
	for <meta-virtualization@yoctoproject.org>;
	Wed, 27 Aug 2014 09:31:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=HHfV/rHpAbdLI75o46xEBWQJv7FUAQbXzGw1HnGemuY=;
	b=KuLuYnwe5X6mbbVIh0XV6+WyOViPlT48TGqhTUN1SirmNoo1z5bLWe/CKiYyEwJF29
	H7bV+SpbdXZiqiMXwNeTHrGZXbacC80iPZAeqkAEW/vesKpdvHFvH5lk+o0Z/4EaILfy
	FwmBMNnhbE4DW3r878lkQ5PTGYw3j37N9VzbJZ3vMB/nEQs91kjVSI5rlWzX6kdQFJFJ
	CxGjjdOdZh6K63WVsfj6VhGSu8Z3xlQe+eXTrGZHVZTix2+n9lVFuDip5YANLDXrOgMr
	mt24s4f2e+4NHtSrJHrP5Hxnba2/6LsEj8Z5OA2KpASnI5PU7Io3nwp7r6AkbtQPdcP5
	nKmg==
MIME-Version: 1.0
X-Received: by 10.112.163.103 with SMTP id yh7mr26525559lbb.73.1409157108467; 
	Wed, 27 Aug 2014 09:31:48 -0700 (PDT)
Received: by 10.112.202.67 with HTTP; Wed, 27 Aug 2014 09:31:48 -0700 (PDT)
In-Reply-To: <1408974460-22527-1-git-send-email-liviu.gheorghisan@enea.com>
References: <1408974460-22527-1-git-send-email-liviu.gheorghisan@enea.com>
Date: Wed, 27 Aug 2014 12:31:48 -0400
Message-ID: <CADkTA4PSnAXBdTVzRk023h1GnuP5P2TC5+8Wm2osQ+_Da-ROiw@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Liviu Gheorghisan <liviu.gheorghisan@enea.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH 1/1] multipath-tools buildfix: added '-brokensep' to autotools
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
X-List-Received-Date: Wed, 27 Aug 2014 16:31:53 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Aug 25, 2014 at 9:47 AM, Liviu Gheorghisan
<liviu.gheorghisan@enea.com> wrote:
> This is required because the build failed at do_install task.
>
> | DEBUG: Executing shell function do_install
> | NOTE: make -j 64 LIB=/usr/lib exec_prefix=/usr libdir=/usr/lib DESTDIR=/media/sdd1/fb/ligh/scm/cgl-upstream/build-qemuppc/tmp/work/ppc7400-poky-linux/multipath-tools/0.4.9+gitrAUTOINC+d3683ab18b-r0/image install
> | make: *** No rule to make target `install'.  Stop.
> | ERROR: oe_runmake failed
> | WARNING: /media/sdd1/fb/ligh/scm/cgl-upstream/build-qemuppc/tmp/work/ppc7400-poky-linux/multipath-tools/0.4.9+gitrAUTOINC+d3683ab18b-r0/temp/run.do_install.34183:1 exit 1 from
> |   exit 1
>

merged!

Bruce

> ERROR: Task 2 (poky/meta-virtualization/recipes-extended/multipath-tools/multipath-tools_git.bb, do_install) failed with exit code '1'
>
> Signed-off-by: Liviu Gheorghisan <liviu.gheorghisan@enea.com>
> ---
>  recipes-extended/multipath-tools/multipath-tools_git.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/recipes-extended/multipath-tools/multipath-tools_git.bb b/recipes-extended/multipath-tools/multipath-tools_git.bb
> index 633b9f2..e2076d3 100644
> --- a/recipes-extended/multipath-tools/multipath-tools_git.bb
> +++ b/recipes-extended/multipath-tools/multipath-tools_git.bb
> @@ -15,7 +15,7 @@ SRC_URI = "git://git.opensvc.com/multipath-tools/.git;protocol=http"
>  SRCREV = "d3683ab18b386e9b3b54b59a122c689e9ebdf5cf"
>  PV = "0.4.9+gitr${SRCPV}"
>
> -inherit autotools
> +inherit autotools-brokensep
>
>  EXTRA_OEMAKE="LIB=${libdir} exec_prefix=${exec_prefix} libdir=${libdir}"
>
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

