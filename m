Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 5785AE00824; Fri, 22 Aug 2014 11:52:26 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.215.52 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-la0-f52.google.com (mail-la0-f52.google.com
	[209.85.215.52])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0D8B7E00769
	for <meta-virtualization@yoctoproject.org>;
	Fri, 22 Aug 2014 11:52:16 -0700 (PDT)
Received: by mail-la0-f52.google.com with SMTP id b17so10318317lan.39
	for <meta-virtualization@yoctoproject.org>;
	Fri, 22 Aug 2014 11:52:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=WJD9Vy81DbCxIoDmHGXCWNWbAQz2eOAFC7rEBtjo22g=;
	b=VsnGiTBl/pkWkm0Mz3osa819FICKnm3xJskXKMVHnxy/3y5SvtxNeP4tQArngxNGAW
	1OmJ10qOrpN4VgL+Qppw0lBA5gBPTFSCYY4MMwwpc9M0eqOJYByZnw1WwszxldHostPw
	0tfU5NudP/iABxVw6WgsvYwIT79imK04l1K/D+CwSVdnO7/bAQzZe0aGvZZFc4CTVGhs
	m4tSbVQrw9cwSle2YJDXs+kk1zZw4GnF/l89XIAMx3TWNjIArKiiL374jAz/I+s3p0zu
	DTxapLbs6P4j1NAo54sku8H6/7qr76x+Mj9o+jrmxZmOGTnl7rnB3nDS2Qy1qwkqzHuf
	m1Bg==
MIME-Version: 1.0
X-Received: by 10.152.234.236 with SMTP id uh12mr6231851lac.31.1408733534800; 
	Fri, 22 Aug 2014 11:52:14 -0700 (PDT)
Received: by 10.112.202.67 with HTTP; Fri, 22 Aug 2014 11:52:14 -0700 (PDT)
In-Reply-To: <1408567571-27481-1-git-send-email-Keith.Holman@windriver.com>
References: <1408567571-27481-1-git-send-email-Keith.Holman@windriver.com>
Date: Fri, 22 Aug 2014 14:52:14 -0400
Message-ID: <CADkTA4N6+5NQs=mUQK+CB-vuCmvezHO1vdcZ_6Ob4xr00qyOUA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Keith Holman <Keith.Holman@windriver.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH 1/5] protobuf: update google protocol buffers to 2.5.0
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
X-List-Received-Date: Fri, 22 Aug 2014 18:52:26 -0000
Content-Type: text/plain; charset=UTF-8

Keith,

My build test is showing this:

NOTE: Executing RunQueue Tasks
ERROR: Function failed: do_compile_ptest_base (log file is located at
/home/bruce/poky/build/tmp/work/core2-64-poky-linux/protobuf/2.5.0-r0/temp/log.do_compile_ptest_base.30471)
ERROR: Logfile of failure stored in:
/home/bruce/poky/build/tmp/work/core2-64-poky-linux/protobuf/2.5.0-r0/temp/log.do_compile_ptest_base.30471
Log data follows:
| DEBUG: SITE files ['endian-little', 'common-linux', 'common-glibc',
'bit-64', 'x86_64-linux', 'common']
| DEBUG: Executing shell function do_compile_ptest_base
| cp: cannot stat
'/home/bruce/poky/build/tmp/work/core2-64-poky-linux/protobuf/2.5.0-r0/protobuf-2.5.0/protobuf.pc':
No such file or directory
| WARNING: exit code 1 from a shell command.
| ERROR: Function failed: do_compile_ptest_base (log file is located
at /home/bruce/poky/build/tmp/work/core2-64-poky-linux/protobuf/2.5.0-r0/temp/log.do_compile_ptest_base.30471)
ERROR: Task 9 (/home/bruce/poky/meta-virtualization/recipes-containers/criu/protobuf_2.5.0.bb,
do_compile_ptest_base) failed with exit code '1'

Does that look familiar ?

Bruce


On Wed, Aug 20, 2014 at 4:46 PM, Keith Holman
<Keith.Holman@windriver.com> wrote:
> Upgrade Google Protocol Buffers to version 2.5.0.  The previous
> version 2.4.1 is getting quite old (released April 2011).  The newer
> version provides bug fixes and more functionality.  This version adds
> some speed optimization and the ability to allow multiple enum
> symbols to have the same value.
>
> Signed-off-by: Keith Holman <Keith.Holman@windriver.com>
> ---
>  recipes-containers/criu/protobuf_2.4.1.bb | 18 ------------------
>  recipes-containers/criu/protobuf_2.5.0.bb | 20 ++++++++++++++++++++
>  2 files changed, 20 insertions(+), 18 deletions(-)
>  delete mode 100644 recipes-containers/criu/protobuf_2.4.1.bb
>  create mode 100644 recipes-containers/criu/protobuf_2.5.0.bb
>
> diff --git a/recipes-containers/criu/protobuf_2.4.1.bb b/recipes-containers/criu/protobuf_2.4.1.bb
> deleted file mode 100644
> index d8f1b53..0000000
> --- a/recipes-containers/criu/protobuf_2.4.1.bb
> +++ /dev/null
> @@ -1,18 +0,0 @@
> -SUMMARY = "protobuf"
> -DESCRIPTION = "Protocol Buffers are a way of encoding structured data in an efficient yet extensible format. Google uses Protocol Buffers for almost all of its internal RPC protocols and file formats."
> -HOMEPAGE = "http://code.google.com/p/protobuf/"
> -SECTION = "console/tools"
> -LICENSE = "BSD-3-Clause"
> -
> -LIC_FILES_CHKSUM = "file://COPYING.txt;md5=af6809583bfde9a31595a58bb4a24514"
> -
> -PR = "r0"
> -
> -SRC_URI[md5sum] = "dc84e9912ea768baa1976cb7bbcea7b5"
> -SRC_URI[sha256sum] = "eac6969b617f397247e805267da2b0db3ff9e5a9163b123503a192fbb5776567"
> -SRC_URI = "http://protobuf.googlecode.com/files/protobuf-${PV}.tar.gz"
> -
> -EXTRA_OECONF += " --with-protoc=echo"
> -inherit autotools
> -
> -BBCLASSEXTEND = "native nativesdk"
> \ No newline at end of file
> diff --git a/recipes-containers/criu/protobuf_2.5.0.bb b/recipes-containers/criu/protobuf_2.5.0.bb
> new file mode 100644
> index 0000000..4a90b2c
> --- /dev/null
> +++ b/recipes-containers/criu/protobuf_2.5.0.bb
> @@ -0,0 +1,20 @@
> +SUMMARY = "protobuf"
> +DESCRIPTION = "Protocol Buffers are a way of encoding structured data in \
> +an efficient yet extensible format. Google uses Protocol Buffers for \
> +almost all of its internal RPC protocols and file formats."
> +HOMEPAGE = "http://code.google.com/p/protobuf/"
> +SECTION = "console/tools"
> +LICENSE = "BSD-3-Clause"
> +
> +LIC_FILES_CHKSUM = "file://COPYING.txt;md5=af6809583bfde9a31595a58bb4a24514"
> +
> +PR = "r0"
> +
> +SRC_URI[md5sum] = "b751f772bdeb2812a2a8e7202bf1dae8"
> +SRC_URI[sha256sum] = "c55aa3dc538e6fd5eaf732f4eb6b98bdcb7cedb5b91d3b5bdcf29c98c293f58e"
> +SRC_URI = "http://protobuf.googlecode.com/files/protobuf-${PV}.tar.gz"
> +
> +EXTRA_OECONF += " --with-protoc=echo"
> +inherit autotools
> +
> +BBCLASSEXTEND = "native nativesdk"
> --
> 1.9.3
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

