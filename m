Return-Path: <asselsm@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 19485E00BEA; Tue, 20 Sep 2016 11:28:13 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, RCVD_IN_DNSWL_NONE,
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * 0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.161.193 listed in dnsbl.sorbs.net]
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.161.193 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-yw0-f193.google.com (mail-yw0-f193.google.com
	[209.85.161.193])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D6AD8E00B95
	for <meta-virtualization@yoctoproject.org>;
	Tue, 20 Sep 2016 11:28:09 -0700 (PDT)
Received: by mail-yw0-f193.google.com with SMTP id t67so1052360ywg.1
	for <meta-virtualization@yoctoproject.org>;
	Tue, 20 Sep 2016 11:28:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:reply-to:sender:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=padV6+nviM9IALzQMuP9VJOnAvvkRUrxSXfiG0/afrE=;
	b=Au9xq0ovoltOpQo+IRwdVP9BoLD29GSLBGUHryQkluxfPPJHTUFcaEtmwC2/XliKzM
	UuBGTYDQc4WZzjUjsgjBhPbRPitlJGnK074hGKEZGbRZUqtjauDuKhWNjSf/sUkaFkSU
	4FWgYL3h4ju6HpsZb2u2XFPDGzMMeVO1G1kSsmAUNrVuCLVcl3zSVkOyxaT3J1ENsUIj
	l9iPNY1WcJ0JilO6wTZC5n28Hbp7JEXcCaN377qH1qL8Ue3+3M0uyxONqJVprsEID8vL
	Hvyvwk00Qzthb6SY3SW1qt4xZLAUfYHWPvpqMHU/yO4qRIKhe3uIlW+t9tIoCWOAJbOD
	znRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:reply-to:sender:in-reply-to
	:references:from:date:message-id:subject:to:cc
	:content-transfer-encoding;
	bh=padV6+nviM9IALzQMuP9VJOnAvvkRUrxSXfiG0/afrE=;
	b=dLBQVUqgIKMWnh7ZqWeghK/Ga4m2aW9GkuOVLIENPHwNka4BwRwrpGjC83nvcDVo/S
	EpkmRkd1XUJ+fa2Q0hQDGy/fxRLdfU0KbqFIVnJjzisDp25kSM2Ko7PxhvlnD0SLpL2n
	9dQlUvA/KB/opzfRGh/8RFdctJ8MT7jFtZIiQMl1n7wVMGZAtXfVC4wHFSrL+HEin8ED
	75EbER+OieflshHlsIxIvl4zJtQw+caUtbe0ViRYuVLQGipAyIijyzzynV93IUybElbp
	/Ee/JzsWrpRsD4CTz+nQdWdwTGgR6C0Ti/gu9wWf/XvaSXixjFyWU6UdqrqJ7kKJWsgx
	eFJw==
X-Gm-Message-State: AE9vXwPpQV8Bz6fF3hi22JUhUyozTtdwg2J4xLEOMcqatUt/5O1/vAIE1EdxWrmEl/Vr+COn8/Tek8o/FFGfIQ==
X-Received: by 10.13.248.129 with SMTP id i123mr30401555ywf.182.1474396088501; 
	Tue, 20 Sep 2016 11:28:08 -0700 (PDT)
MIME-Version: 1.0
Sender: asselsm@gmail.com
Received: by 10.37.171.207 with HTTP; Tue, 20 Sep 2016 11:27:59 -0700 (PDT)
In-Reply-To: <1474390872-43488-1-git-send-email-jason.wessel@windriver.com>
References: <1474390872-43488-1-git-send-email-jason.wessel@windriver.com>
From: Mark Asselstine <mark.asselstine@windriver.com>
Date: Tue, 20 Sep 2016 14:27:59 -0400
X-Google-Sender-Auth: ZfilSMxSEOE3VGoeyujQmsAO2YQ
Message-ID: <CAPuovEJFzbBZ09Z5YtqAw9uLQJStN2ChxfWtLEgU=9i7UvzAag@mail.gmail.com>
To: Jason Wessel <jason.wessel@windriver.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [v2 PATCH] go-cross: Fix host contamination for x86_64 host to x86_64 target
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
X-List-Received-Date: Tue, 20 Sep 2016 18:28:13 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 20, 2016 at 1:01 PM, Jason Wessel
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
> When the host architecture does not match the target architecture we
> must also force build the target libraries or they get dynamically
> populated into the sysroot in an uncontrolled manner by the first
> package that uses go-cross to compile code.
>
> Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
> ---

For the record book, V2 looks good.

Mark


>  recipes-devtools/go-cross/go-cross.inc | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
>
> diff --git a/recipes-devtools/go-cross/go-cross.inc b/recipes-devtools/go=
-cross/go-cross.inc
> index 613e9c7..6363a78 100644
> --- a/recipes-devtools/go-cross/go-cross.inc
> +++ b/recipes-devtools/go-cross/go-cross.inc
> @@ -2,6 +2,10 @@ inherit cross
>
>  DEPENDS +=3D "go-native"
>
> +# Prevent runstrip from running because you get errors when the host arc=
h !=3D target arch
> +#INHIBIT_PACKAGE_STRIP =3D "1"
> +STRIP =3D "echo"
> +
>  export GOHOSTOS =3D "${BUILD_GOOS}"
>  export GOHOSTARCH =3D "${BUILD_GOARCH}"
>  export GOOS =3D "${TARGET_GOOS}"
> @@ -26,6 +30,8 @@ do_compile() {
>
>      cd src
>      ./make.bash --host-only
> +    # Ensure cgo.a is built with the target toolchain
> +    GO_FLAGS=3D"-a" ./make.bash --target-only
>  }
>
>  do_install() {
> @@ -38,7 +44,9 @@ do_install() {
>      install -d ${D}${bindir}
>      for f in ${B}/bin/*
>      do
> -        install -m755 $f ${D}${bindir}
> +        if [ ! -d "$f" ] ; then
> +            install -m755 $f ${D}${bindir}
> +        fi
>      done
>  }
>
> --
> 1.9.1
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization

