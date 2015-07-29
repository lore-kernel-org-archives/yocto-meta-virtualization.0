Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 266E0E009E4; Wed, 29 Jul 2015 08:18:41 -0700 (PDT)
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
	*      [209.85.160.177 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-yk0-f177.google.com (mail-yk0-f177.google.com
	[209.85.160.177])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id ABAEEE0096A
	for <meta-virtualization@yoctoproject.org>;
	Wed, 29 Jul 2015 08:18:38 -0700 (PDT)
Received: by ykba194 with SMTP id a194so10431109ykb.0
	for <meta-virtualization@yoctoproject.org>;
	Wed, 29 Jul 2015 08:18:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=PZd8Z/mKi4C4BnrXMTccuiKwDYXdMe9kZ0vwpQj3d38=;
	b=CFjoq05EgoUXX2xZT4BPmvnR5JrkCTx1E9oa5Ht60ehR0iulY+yiDfdIDhu4yF1PpE
	mnwqx2/h5mEze55+RDYMycaPN0faWRslXHCHECFsk9YDuj4tsKjzQwa7mDDqs9vKTJiz
	7Yp+ZFMSQVeVIo+irtKnjOXuMtcaetNbNgJvuTIyWKnFLS6EK8qBo+Wv/5qCSvLd4rg7
	TmZ4HleOhts8X+zq9N8s6RtmLbViRrTP8Vdu5Blr4lrPU6fCmFxsCIWZO89hSZrKhbFI
	bcjviigOz1Ha0JCmfFABbZeD/RJM2XnAO9B0OMtoDjs3P559ctVs0l9uFuw9JDyhsF1I
	p+Pg==
MIME-Version: 1.0
X-Received: by 10.13.232.67 with SMTP id r64mr9556923ywe.30.1438183118372;
	Wed, 29 Jul 2015 08:18:38 -0700 (PDT)
Received: by 10.129.128.2 with HTTP; Wed, 29 Jul 2015 08:18:38 -0700 (PDT)
In-Reply-To: <1438077007-1836-1-git-send-email-lixin.fnst@cn.fujitsu.com>
References: <1438077007-1836-1-git-send-email-lixin.fnst@cn.fujitsu.com>
Date: Wed, 29 Jul 2015 11:18:38 -0400
Message-ID: <CADkTA4N6Ks2apDVz-e93WmveqLXfMu-GKAOXF_exud9DUTSiFQ@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Li xin <lixin.fnst@cn.fujitsu.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH 1/4] pry: upgrade 0.9.12.6 -> 0.10.1
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
X-List-Received-Date: Wed, 29 Jul 2015 15:18:41 -0000
Content-Type: text/plain; charset=UTF-8

Thanks,

I've merged all the recipe updates to master and fido-kilo.

Cheers,

Bruce

On Tue, Jul 28, 2015 at 5:50 AM, Li xin <lixin.fnst@cn.fujitsu.com> wrote:
> 1) Modify rdoc-fixup-opt.banner-heredoc.patch,since the contents
> has been changed.
>
> 2) Update the checksum of LICENSE,since the date in it has been changed,
> but the LICENSE has not been changed.
>
> Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
> ---
>  .../ruby/pry/rdoc-fixup-opt.banner-heredoc.patch   | 56 +++++++++++-----------
>  meta-openstack/recipes-devtools/ruby/pry_git.bb    |  8 ++--
>  2 files changed, 33 insertions(+), 31 deletions(-)
>
> diff --git a/meta-openstack/recipes-devtools/ruby/pry/rdoc-fixup-opt.banner-heredoc.patch b/meta-openstack/recipes-devtools/ruby/pry/rdoc-fixup-opt.banner-heredoc.patch
> index b6612c9..32adfb6 100644
> --- a/meta-openstack/recipes-devtools/ruby/pry/rdoc-fixup-opt.banner-heredoc.patch
> +++ b/meta-openstack/recipes-devtools/ruby/pry/rdoc-fixup-opt.banner-heredoc.patch
> @@ -1,6 +1,6 @@
> -From 55f81df0bb27c68d2a817cade5e0eb472acf24e5 Mon Sep 17 00:00:00 2001
> -From: Mark Asselstine <mark.asselstine@windriver.com>
> -Date: Wed, 14 May 2014 10:43:04 -0400
> +From 40f78c9ae1c8f37e382d2da3498e1670c1a321dd Mon Sep 17 00:00:00 2001
> +From: Li xin <lixin.fnst@cn.fujitsu.com>
> +Date: Sat, 25 Jul 2015 03:13:50 +0900
>  Subject: [PATCH] rdoc: fixup opt.banner heredoc
>
>  rdoc has some quirks with heredoc which in this case would
> @@ -13,39 +13,41 @@ Fixup the heredoc to use a more standard format which is known
>  not to mess up rdoc processing.
>
>  Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> +Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
>  ---
> - lib/pry/commands/ls.rb | 34 +++++++++++++++++-----------------
> - 1 file changed, 17 insertions(+), 17 deletions(-)
> + lib/pry/commands/ls.rb | 35 ++++++++++++++++-------------------
> + 1 file changed, 16 insertions(+), 19 deletions(-)
>
>  diff --git a/lib/pry/commands/ls.rb b/lib/pry/commands/ls.rb
> -index 6ce49bb..b78f7e1 100644
> +index 9f0e68f..eda7a53 100644
>  --- a/lib/pry/commands/ls.rb
>  +++ b/lib/pry/commands/ls.rb
> -@@ -6,23 +6,23 @@ class Pry
> +@@ -28,25 +28,22 @@ class Pry
> +     description 'Show the list of vars and methods in the current scope.'
>       command_options :shellwords => false, :interpolate => false
>
> -     def options(opt)
> --      opt.banner unindent <<-'BANNER'
> --        Usage: ls [-m|-M|-p|-pM] [-q|-v] [-c|-i] [Object]
> --               ls [-g] [-l]
> +-    banner <<-'BANNER'
> +-      Usage: ls [-m|-M|-p|-pM] [-q|-v] [-c|-i] [Object]
> +-             ls [-g] [-l]
> +-
> +-      ls shows you which methods, constants and variables are accessible to Pry. By
> +-      default it shows you the local variables defined in the current shell, and any
> +-      public methods or instance variables defined on the current object.
>  -
> --        ls shows you which methods, constants and variables are accessible to Pry. By
> --        default it shows you the local variables defined in the current shell, and any
> --        public methods or instance variables defined on the current object.
> +-      The colours used are configurable using Pry.config.ls.*_color, and the separator
> +-      is Pry.config.ls.separator.
>  -
> --        The colours used are configurable using Pry.config.ls.*_color, and the separator
> --        is Pry.config.ls.separator.
> +-      Pry.config.ls.ceiling is used to hide methods defined higher up in the
> +-      inheritance chain, this is by default set to [Object, Module, Class] so that
> +-      methods defined on all Objects are omitted. The -v flag can be used to ignore
> +-      this setting and show all methods, while the -q can be used to set the ceiling
> +-      much lower and show only methods defined on the object or its direct class.
>  -
> --        Pry.config.ls.ceiling is used to hide methods defined higher up in the
> --        inheritance chain, this is by default set to [Object, Module, Class] so that
> --        methods defined on all Objects are omitted. The -v flag can be used to ignore
> --        this setting and show all methods, while the -q can be used to set the ceiling
> --        much lower and show only methods defined on the object or its direct class.
> --      BANNER
> -+      opt.banner = <<-EOF
> +-      Also check out `find-method` command (run `help find-method`).
> +-    BANNER
> ++    opt.banner = <<-EOF
>  +Usage: ls [-m|-M|-p|-pM] [-q|-v] [-c|-i] [Object]
>  +       ls [-g] [-l]
> -+
>  +ls shows you which methods, constants and variables are accessible to Pry. By
>  +default it shows you the local variables defined in the current shell, and any
>  +public methods or instance variables defined on the current object.
> @@ -60,8 +62,8 @@ index 6ce49bb..b78f7e1 100644
>  +much lower and show only methods defined on the object or its direct class.
>  +  EOF
>
> -       opt.on :m, :methods,   "Show public methods defined on the Object (default)"
> -       opt.on :M, "instance-methods", "Show methods defined in a Module or Class"
> +
> +     def options(opt)
>  --
> -1.8.3.2
> +1.8.4.2
>
> diff --git a/meta-openstack/recipes-devtools/ruby/pry_git.bb b/meta-openstack/recipes-devtools/ruby/pry_git.bb
> index 37d4497..a4eb63c 100644
> --- a/meta-openstack/recipes-devtools/ruby/pry_git.bb
> +++ b/meta-openstack/recipes-devtools/ruby/pry_git.bb
> @@ -7,18 +7,18 @@ for Ruby. It is written from scratch to provide a number of advanced \
>  features."
>
>  LICENSE = "MIT"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=7d1a6fbb73f604e1e716380490938bd4"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=dde93753687e16ab0c4669232fd27fd0"
>
>  PR = "r0"
>
> -BPV = "0.9.12.6"
> +BPV = "0.10.1"
>  PV = "${BPV}"
> -SRCREV = "047788c4225b25bb0462e06715616964e4f0da15"
> +SRCREV = "191dc519813402acd6db0d7f73e652ed61f8111f"
>
>  S = "${WORKDIR}/git"
>
>  SRC_URI = " \
> -    git://github.com/pry/pry.git;branch=0-9-12-stable \
> +    git://github.com/pry/pry.git \
>      file://rdoc-fixup-opt.banner-heredoc.patch \
>      "
>
> --
> 1.8.4.2
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

