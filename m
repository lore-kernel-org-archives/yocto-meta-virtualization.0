Return-Path: <nathan@nathanrossi.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 56B91E00BE4; Mon, 24 Aug 2015 23:44:26 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [209.85.215.46 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail-la0-f46.google.com (mail-la0-f46.google.com
	[209.85.215.46])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CEC63E00978
	for <meta-virtualization@yoctoproject.org>;
	Mon, 24 Aug 2015 23:44:21 -0700 (PDT)
Received: by lalv9 with SMTP id v9so91640660lal.0
	for <meta-virtualization@yoctoproject.org>;
	Mon, 24 Aug 2015 23:44:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=99WOHJOnGvM60Prorz16izXQjMTx6DwVMXkbRtk/hPc=;
	b=ejDObdL0WeCRRB+y+xAnKL1rnc0YVU1KwqHWN43oZeVWmE6rdb3qtn5LC1bMqgCyka
	JRQLt6E/+V+lghOsfGAG9efpYHQEC6edAoRup/6sNY92ZrTI0DAEPn5jWt63JFloElmB
	bWnV2tyN4Nmexj+ZdXdbtvR8G9wxxbOGepmY/qW79JgHw6L4nqY4p2xx/7hK01H/Z23J
	oBUQtY6nufXr2Q6QNsDIh+D9jb0FcGdwNPRZPE0VFUTxC+rRCMgOnHONzO53aELXKYqN
	UqBqCc9a1Og6JUOFSqvT6cJZwR0qe+UimFDckPtXMjxKCpBW5HKYlNDe+9EcA3sebu83
	WHqg==
X-Gm-Message-State: ALoCoQk7sbnY9RQGA4G0rbr/t6iDiVZgzSDJLy14n4+kRrtzlJVChdJ77FhrsZOOIPW4RIvRObQx
MIME-Version: 1.0
X-Received: by 10.112.168.100 with SMTP id zv4mr23715129lbb.117.1440485060086; 
	Mon, 24 Aug 2015 23:44:20 -0700 (PDT)
Received: by 10.25.155.144 with HTTP; Mon, 24 Aug 2015 23:44:20 -0700 (PDT)
In-Reply-To: <1440448008-9189-1-git-send-email-cardoe@cardoe.com>
References: <1440448008-9189-1-git-send-email-cardoe@cardoe.com>
Date: Tue, 25 Aug 2015 16:44:20 +1000
Message-ID: <CA+aJhH1V+_mFMdoqStYssgFzG5PYR6XcYx7gKyeo9xSxXjg_ww@mail.gmail.com>
From: Nathan Rossi <nathan@nathanrossi.com>
To: Doug Goldstein <cardoe@cardoe.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH 1/4] xen: drop patch that upstream says is wrong
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
X-List-Received-Date: Tue, 25 Aug 2015 06:44:26 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Aug 25, 2015 at 6:26 AM, Doug Goldstein <cardoe@cardoe.com> wrote:
> Per upstream its not correct to always force -mfpmath=387 to work around
> the -mno-sse flags. Instead strip out -mfpmath=sse that Yocto injects
> for certain BSPs.
> ---
>  ...xen-x86-Fix-up-rules-when-forcing-mno-sse.patch | 28 ----------------------
>  recipes-extended/xen/xen.inc                       |  5 ++++
>  recipes-extended/xen/xen_4.5.0.bb                  |  1 -
>  3 files changed, 5 insertions(+), 29 deletions(-)
>  delete mode 100644 recipes-extended/xen/files/xen-x86-Fix-up-rules-when-forcing-mno-sse.patch
>
> diff --git a/recipes-extended/xen/files/xen-x86-Fix-up-rules-when-forcing-mno-sse.patch b/recipes-extended/xen/files/xen-x86-Fix-up-rules-when-forcing-mno-sse.patch
> deleted file mode 100644
> index 4c3e297..0000000
> --- a/recipes-extended/xen/files/xen-x86-Fix-up-rules-when-forcing-mno-sse.patch
> +++ /dev/null
> @@ -1,28 +0,0 @@
> -From: Nathan Rossi <nathan.rossi@xilinx.com>
> -Subject: [PATCH] xen/x86: Fix up rules when forcing -mno-sse
> -
> -* When forcing -mno-sse specify -mfpmath=387 to avoid the fallback
> -  warning
> -
> -Signed-off-by: Nathan Rossi <nathan.rossi@xilinx.com>
> -Upstream-Status: Not-Submitted
> ----
> - xen/arch/x86/Rules.mk | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/xen/arch/x86/Rules.mk b/xen/arch/x86/Rules.mk
> -index 6775cb5..03848f7 100644
> ---- a/xen/arch/x86/Rules.mk
> -+++ b/xen/arch/x86/Rules.mk
> -@@ -42,7 +42,7 @@ x86 := y
> - x86_32 := n
> - x86_64 := y
> -
> --CFLAGS += -mno-red-zone -mno-sse -fpic
> -+CFLAGS += -mno-red-zone -mno-sse -fpic -mfpmath=387
> - CFLAGS += -fno-asynchronous-unwind-tables
> - # -fvisibility=hidden reduces -fpic cost, if it's available
> - ifneq ($(call cc-option,$(CC),-fvisibility=hidden,n),n)
> ---
> -2.1.1
> -
> diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc
> index 432bf4d..c7a2347 100644
> --- a/recipes-extended/xen/xen.inc
> +++ b/recipes-extended/xen/xen.inc
> @@ -12,6 +12,11 @@ inherit autotools-brokensep gettext setuptools update-rc.d systemd
>
>  require xen-arch.inc
>
> +# Xen uses hardcodes the use of -mno-sse which conflicts -mfpmath=sse
> +# The issue arises from certain Yocto machine BSPs injecting -mfpmath=sse
> +# into the package's CFLAGS so we need to strip that
> +TUNE_CCARGS := "${@oe_filter_out('-mfpmath=sse', '${TUNE_CCARGS}', d)}"

Just curious, filtering out that flag will also affect the building of
for example the target user-space tools no? is that problematic or do
other SSE related flags (for those BSPs) cause the use of this fpmath
setting regardless?

Regards,
Nathan

> +
>  PACKAGECONFIG ??= " \
>      sdl \
>      ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)} \
> diff --git a/recipes-extended/xen/xen_4.5.0.bb b/recipes-extended/xen/xen_4.5.0.bb
> index 6c17b90..a5f03f3 100644
> --- a/recipes-extended/xen/xen_4.5.0.bb
> +++ b/recipes-extended/xen/xen_4.5.0.bb
> @@ -2,7 +2,6 @@ require xen.inc
>
>  SRC_URI = " \
>      http://bits.xensource.com/oss-xen/release/${PV}/xen-${PV}.tar.gz \
> -    file://xen-x86-Fix-up-rules-when-forcing-mno-sse.patch \
>      "
>
>  SRC_URI[md5sum] = "9bac43d2419d05a647064d9253bb03fa"
> --
> 2.1.4
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization

