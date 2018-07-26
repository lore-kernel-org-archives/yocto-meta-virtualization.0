Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 78A8EE00CEA; Thu, 26 Jul 2018 07:41:05 -0700 (PDT)
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
	*      [209.85.208.179 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com
	[209.85.208.179])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E0638E00CDD
	for <meta-virtualization@yoctoproject.org>;
	Thu, 26 Jul 2018 07:41:02 -0700 (PDT)
Received: by mail-lj1-f179.google.com with SMTP id s12-v6so1732283ljj.0
	for <meta-virtualization@yoctoproject.org>;
	Thu, 26 Jul 2018 07:41:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=nd3TWGXwj+FOBO/cemM4qUxzTMsGOj0WTulUiu2yJYI=;
	b=kt28Y19pmxP1tDnoo8c29ekINal0yURRxA66octwnCLZtAVnGSF5R6B7pge59PsVUT
	OTj1+bqDAcGAqzMJW4MebiWkG+9erUpHyF2E3Ir+/BR/76EK0t2gXxr0IiVMSHklW1b6
	A3T+ieAiskjAEG5r49OWCMDPNvWCmpN4QsxBLGehadtFVXFjsthqvaBbG64wQA3f9woM
	bCoLGof6eWFDicLTDQCGuaeQZX7UcVvEL87T1E6KAd+uXiFX6TeHSpFSvgMqyfKCJqlq
	ofltp7uBHwQxP+2RKnihY0pxbvZ0OgZxZDEnYDU6bQ8FUDpWMTw5+KG9QpHsnLWCZiRj
	2WBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=nd3TWGXwj+FOBO/cemM4qUxzTMsGOj0WTulUiu2yJYI=;
	b=MsftAGbnP0CPsx3YYCS+FWRONB4E9q5mZFlnAIhsKEhkYaguRRwSwyXmSosWtL036p
	XpRWZngzeUBo54YkwO4slQ88y0Wb4Tp+ol+Xnb2Gmu3YdGL8K1jPb4J1KNzwy6gBKTZu
	HhNKtI0PjYe2Q3wCxcIr+m/VUYU2WuyJXCLp7CliUN/q4hntp1auOUN1Y0uIOi05QNDW
	gYRTPhUjZbchRy8IZE52Sa7raOD4gL2DiRbagvSIk72riv48DUgyXcXyj7sHnqf8XJvv
	N2aRJvoZ8ZSrxSsqD5GyrIwaznMWfBv6dZaBZfXz1+R2wnRVvfv8Wyy8lAO1NB4zdgbE
	pqLg==
X-Gm-Message-State: AOUpUlHAFsmgDWjIBrTKKwwfE1K8AHGu3l1spCz23Re5WIg4th0pVZmh
	po6IqLupzpkL9lONgexZtn5MSDB2Ln5AEy9+7j0=
X-Google-Smtp-Source: AAOMgpdhaTj0cfFGjby5IvKMBHlJQtWGrOu90HSfdlw2QzYa52MIpA0Wr0csjLVGfjG0pS30yppWwAH0BBwYKbg3O20=
X-Received: by 2002:a2e:195c:: with SMTP id
	p89-v6mr1886063lje.138.1532616061925; 
	Thu, 26 Jul 2018 07:41:01 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a2e:9acd:0:0:0:0:0 with HTTP; Thu, 26 Jul 2018 07:41:01
	-0700 (PDT)
In-Reply-To: <20180724101228.47140-1-hongzhi.song@windriver.com>
References: <20180724101228.47140-1-hongzhi.song@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 26 Jul 2018 10:41:01 -0400
Message-ID: <CADkTA4NHcq0z3dHdY9+7CPOrp9h7RDFOAs_RN42GvnyQhqM+tQ@mail.gmail.com>
To: "Hongzhi.Song" <hongzhi.song@windriver.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] libvmi: add a new recipe
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
X-List-Received-Date: Thu, 26 Jul 2018 14:41:05 -0000
Content-Type: text/plain; charset="UTF-8"

merged

Bruce

On Tue, Jul 24, 2018 at 6:12 AM, Hongzhi.Song
<hongzhi.song@windriver.com> wrote:
> LibVMI is a C library with Python bindings that makes it easy to
> monitor the low-level details of a running virtual machine by
> viewing its memory, trapping on hardware events, and accessing
> the vCPU registers. This is called virtual machine introspection.
>
> Signed-off-by: Hongzhi.Song <hongzhi.song@windriver.com>
> ---
>  recipes-extended/libvmi/libvmi_git.bb | 41 +++++++++++++++++++++++++++++++++++
>  1 file changed, 41 insertions(+)
>  create mode 100644 recipes-extended/libvmi/libvmi_git.bb
>
> diff --git a/recipes-extended/libvmi/libvmi_git.bb b/recipes-extended/libvmi/libvmi_git.bb
> new file mode 100644
> index 0000000..a746638
> --- /dev/null
> +++ b/recipes-extended/libvmi/libvmi_git.bb
> @@ -0,0 +1,41 @@
> +DESCRIPTION = "An introspection library, written in C, focused on reading \
> +               and writing memory from virtual machines (VM's)."
> +HOMEPAGE = "https://github.com/libvmi/libvmi"
> +LICENSE = "LGPLv3"
> +LIC_FILES_CHKSUM = "file://COPYING.LESSER;md5=e6a600fd5e1d9cbde2d983680233ad02"
> +SECTION = "console/tools"
> +PV = "0.12.0"
> +
> +DEPENDS = "libvirt libcheck bison fuse"
> +
> +SRC_URI = "git://github.com/libvmi/libvmi.git \
> +"
> +
> +SRCREV = "6934e8a4758018983ec53ec791dd14a7d6ac31a9"
> +
> +S = "${WORKDIR}/git"
> +
> +inherit autotools-brokensep pkgconfig
> +
> +# Noramlly dynamic libs would be of the form libXX.so.1.0.0 in which case
> +# bitbake should be able to properly populate the -dev package and the main
> +# packages. Since libvmi uses the form libXX.1.0.0.so it breaks this automatic
> +# packaging so we need to be more explicit about what goes where.
> +FILES_${PN} += "${libdir}/libvmi-0.9.so"
> +FILES_${PN}-dev = "${includedir} ${libdir}/${BPN}.so ${libdir}/*.la \
> +                ${libdir}/*.o ${libdir}/pkgconfig ${datadir}/pkgconfig \
> +                ${datadir}/aclocal ${base_libdir}/*.o \
> +                ${libdir}/${BPN}/*.la ${base_libdir}/*.la"
> +
> +PACKAGECONFIG ??= "json-c"
> +PACKAGECONFIG[xen] = "--enable-xen,--disable-xen,xen,"
> +PACKAGECONFIG[json-c] = ",,json-c,"
> +
> +# We include a sample conf file to which we have added
> +do_install_append () {
> +       mkdir ${D}${sysconfdir}
> +       cp etc/*.conf ${D}${sysconfdir}
> +}
> +
> +# Construction of grammar.h is not parallel safe.
> +PARALLEL_MAKE = "-j1"
> --
> 2.11.0
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

