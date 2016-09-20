Return-Path: <asselsm@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id CF015E00B5F; Tue, 20 Sep 2016 07:57:52 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, RCVD_IN_DNSWL_LOW,
	RCVD_IN_SORBS_SPAM autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [209.85.213.193 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.213.193 listed in dnsbl.sorbs.net]
Received: from mail-yb0-f193.google.com (mail-yb0-f193.google.com
	[209.85.213.193])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6615EE00B48
	for <meta-virtualization@yoctoproject.org>;
	Tue, 20 Sep 2016 07:57:46 -0700 (PDT)
Received: by mail-yb0-f193.google.com with SMTP id 2so461793ybv.1
	for <meta-virtualization@yoctoproject.org>;
	Tue, 20 Sep 2016 07:57:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:reply-to:sender:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=w7R2qOvcjFezKSGfxnVk/FpVp2D5FpnBu5cwlW97lf0=;
	b=07CroPZS5sZ94IOrDtIQEqfm4zXkCXyj6BEfQ5QYKQPqMsCBrvSc2tsUuQ2IIRasdf
	X02G5cwZiRcAJ0BAMmKtLi1AaPUG+zrvCMRrdQiEaI3uMJeNcA5v0eUoAnoY09Ajmz+O
	e+lJA8yla274ojYP1pV1C5b42PdFM3Agfik1AucxOGLXbmCg002UEUSQ98quElE2cnrb
	oqszy0HQCd7VuN8OIOfQipeDYU1FO900j/cJCwOAuYsC2O0NgzNI507rqn3AvoYre3on
	xz8UHZ8TQycA9ht06CgaK1t45WvDXBwUAaadQz/c1K7TMTIEb/bqoJqN0GMTcbT8uJe8
	WxMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:reply-to:sender:in-reply-to
	:references:from:date:message-id:subject:to:cc
	:content-transfer-encoding;
	bh=w7R2qOvcjFezKSGfxnVk/FpVp2D5FpnBu5cwlW97lf0=;
	b=Ok38lKVIaiArHk7/R0DxmRMZtckTTQl5NNXRmW1zziBciuc6biwlOA/gwXQAV1DQxh
	iMru8x4SMh/KZi+vz0CIL148TVOhBu0+3eCvYQhnQUR/PknVEMrWkYxRxuW6N+Fisxjx
	xkD2VChiHIvtOMLbXOuhGpE59Kksl5vUWnFXIW2YvBYyun/y2oRSXrnSkDt3GzDBXjAR
	V/UdpzE9a0a5zqqgavOJ1fCwILVyCf1LTsazaH6hHnyWFz2maLiwcroRom3TwvXJCu9o
	/SWtk+dt2OiE05pKJPE8s1IwKFm3gVxKnrENygCxmHOnTAJpBVP9iJXwTLNbQokEEhsR
	ndSA==
X-Gm-Message-State: AE9vXwP4kFvWRUDklAmDUqiLgWKgulbef9W3fb/06nb4p898u+EvnVT3J7Qb1F5ekilApe3ROsAViWGg2hrSJw==
X-Received: by 10.37.96.131 with SMTP id u125mr28553471ybb.143.1474383465888; 
	Tue, 20 Sep 2016 07:57:45 -0700 (PDT)
MIME-Version: 1.0
Sender: asselsm@gmail.com
Received: by 10.37.171.207 with HTTP; Tue, 20 Sep 2016 07:57:45 -0700 (PDT)
In-Reply-To: <1474313584-40091-1-git-send-email-jason.wessel@windriver.com>
References: <1474313584-40091-1-git-send-email-jason.wessel@windriver.com>
From: Mark Asselstine <mark.asselstine@windriver.com>
Date: Tue, 20 Sep 2016 10:57:45 -0400
X-Google-Sender-Auth: -_wA955FPSD9DP5zjwxVGYC0GmU
Message-ID: <CAPuovEJcD6mxJtB2KAPFnyyapNveJ4=oC9hj8kctZQYrS1JdKA@mail.gmail.com>
To: Jason Wessel <jason.wessel@windriver.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] go-cross: Fix host contamination for x86_64 host to x86_64 target
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
X-List-Received-Date: Tue, 20 Sep 2016 14:57:52 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 19, 2016 at 3:33 PM, Jason Wessel
<jason.wessel@windriver.com> wrote:
> The go-cross package is explicitly for compiling target libraries on
> the host system.  When the target architecture matches the host
> architecture it will actually use the host's linker and compiler
> however which can result in the generation of the cgo.a library having
> linker symbols which might not work properly when compiling other
> packages.
>
> A typical error looks like this when building consul-migrate:
>
> /opt/build-intel-x86/tmp/sysroots/x86_64-linux/usr/lib/x86_64-linux/go/pk=
g/tool/linux_amd64/link: running x86_64-yocto-linux-gcc failed: exit status=
 1
> /opt/build-intel-x86/tmp/sysroots/x86_64-linux/usr/libexec/x86_64-yocto-l=
inux/gcc/x86_64-yocto-linux/5.2.0/ld: /opt/build-intel-x86/tmp/work/core2-6=
4-yocto-linux/consul-migrate/git-r0/build-tmp/go-link-956548052/000002.o: u=
nrecognized relocation (0x2a) in section `.text'
> /opt/build-intel-x86/tmp/sysroots/x86_64-linux/usr/libexec/x86_64-yocto-l=
inux/gcc/x86_64-yocto-linux/5.2.0/ld: final link failed: Bad value
> collect2: error: ld returned 1 exit status
>
> The fix is to use the make.bash --target-only option to properly build
> the libraries with the target toolchain.
>
> Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
> ---
>  recipes-devtools/go-cross/go-cross.inc | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/recipes-devtools/go-cross/go-cross.inc b/recipes-devtools/go=
-cross/go-cross.inc
> index 613e9c7..c1577e3 100644
> --- a/recipes-devtools/go-cross/go-cross.inc
> +++ b/recipes-devtools/go-cross/go-cross.inc
> @@ -26,6 +26,10 @@ do_compile() {
>
>      cd src
>      ./make.bash --host-only
> +    if [ "${GOARCH}" =3D "amd64" -a "${BUILD_ARCH}" =3D "x86_64" ] ; the=
n
> +        # Ensure cgo.a is built with the target toolchain
> +        GO_FLAGS=3D"-a" ./make.bash --target-only
> +    fi

Since this is a "cross" tool it really does have a foot in both camps.
ie. it is not clearly something which is purely setup to run/exist on
the build host, nor is it something being built to be installed and
run on the target. It is rather something which is built to run on the
host but has ties with the -native sysroot (for example some of the
dependencies might exist not as part of the host system but only in
the -native sysroot, and to a certain extent it might expect the
sysroot has similarities to the target rootfs).

From what I can tell I believe that go-cross is being linked using the
host's linker and link flags which allows it to build, but when it
goes to be used as a crosstool it is attempting to use aspects of the
-native sysroot and due to the mismatch in binutils versions and
similar the result is the build failures we are seeing in
consul-migrate. Your workaround forces the build and linking to be
done as if we were building for the target, since if statement
restricts this to when the GOARCH and BUILD_ARCH match, this allows it
to function on the host as a crosstool. This is clever but could have
side effects since it might use dynamic libs and tools not in the
-native sysroot but actually in the -target sysroot, will this survive
rmwork or when 'tmp' is wiped out and things are built from sstate?

I have found another possible solution which doesn't have the possible
side effects mentioned above.

-      ./make.bash --host-only
+     GO_EXTLINK_ENABLED=3D"0" ./make.bash --host-only

According to the make.bash text this will force usage of the internal
linker and it appears that by using this instead of the host's linker
the environment we have setup for when we do_compile allows the
-native sysroot to be taken into account and the result is a proper
mix of host vs. -native sysroot bindings. Ideally I would like to use
the host LD and just pass the proper flags to allow a similar result
to using the internal linker, but I have not had any success.

Thoughts?

Mark

>  }
>
>  do_install() {
> --
> 1.9.1
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization

