Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id F3887E00D07; Tue, 14 Nov 2017 09:47:28 -0800 (PST)
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
	*      [209.85.216.195 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-qt0-f195.google.com (mail-qt0-f195.google.com
	[209.85.216.195])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 44B45E00C84
	for <meta-virtualization@yoctoproject.org>;
	Tue, 14 Nov 2017 09:47:27 -0800 (PST)
Received: by mail-qt0-f195.google.com with SMTP id v41so27184059qtv.12
	for <meta-virtualization@yoctoproject.org>;
	Tue, 14 Nov 2017 09:47:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=FPSSZtzPmInGDUpwBB8n+APGii+EZNxwnM8ZlGQTfEM=;
	b=anaMVIagRPT1jw/mkltD0KlbXWef0BvF9Jc1YOYI8g/sShepDY99cs65oZrbm1s4N4
	5k+S52o+JLJ66g/3eUlOpoy77E1dsD36EnQfPcfAm2PNCmz+ii2Y9d9vQ2MhX97C91ox
	zkQQ5eSaFPwgUX9owNHGDnJlasptBjIQ1ChkO4dsuE64gbWY2VCCRftYE35sGnfbvvH4
	yamlT2pmnoNpKYaM/+BemydVqcTbfeiXW6YL43nyKtOErcDvA9AuB0OlrMxo5uJ9dWAD
	+rRM3O3wHuCjIRVbuN/wWtBidLf2avBy3fGGS3XxBiUO4fZCP6iHCtU88bBl1aATacD4
	QfyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=FPSSZtzPmInGDUpwBB8n+APGii+EZNxwnM8ZlGQTfEM=;
	b=dHbVgqRp2vqM5S8kA7ZRkPIz8Y1cuiDErzh1udR+lDkcmFm5B2bTCPnwO/iTvASHbI
	4ZQ+in2hCzbZqTeO6KKxMKzbZ2k41BTbnA530SOpsNDZ2zpi+zsgDemLA+6yY1hbQJeN
	+J/t5wxch6oXueA0fCQEj3DXpeC0xhXJrZZzdMSIMgBa6DfxKNQuWC+zHg7PGvS4nA23
	Wx+cYjbfXYPD3cusaYhMO18eFriGL6o/AFE4lexv+V7317FpoQFBwCftlKLV/q2Cbddw
	4lZACZ2TDE14hEBEDO5F9c2RNUQtqku7cUq5yGte1vdBFyddgKCWCRhXbI1/KwfoB3Y4
	n9SQ==
X-Gm-Message-State: AJaThX5v9vBrSZeYTGwlZ6UJ9U4D0eyOsUiM9vPpCga0Ed9RLNrcrOzi
	uzCAfUSUoGmamUzQtMzXFUuSVvcm7pCLFcradd8=
X-Google-Smtp-Source: AGs4zMb3v+RbZobqxizzkPFIPEsKo4+VXc7UKWFkZFzducZfXAUQQWYgLlQKVsjZVNkildwYX+fyL/QtQkapqK4c21A=
X-Received: by 10.237.62.67 with SMTP id m3mr6948945qtf.289.1510681646994;
	Tue, 14 Nov 2017 09:47:26 -0800 (PST)
MIME-Version: 1.0
Received: by 10.12.182.80 with HTTP; Tue, 14 Nov 2017 09:47:26 -0800 (PST)
In-Reply-To: <1510628290-9038-1-git-send-email-vlsireddy@gmail.com>
References: <1510628290-9038-1-git-send-email-vlsireddy@gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 14 Nov 2017 12:47:26 -0500
Message-ID: <CADkTA4OvoUfn3S0BCq4JLgqAH-Mk5OR56p7A8fSdbTcEB1dZ4w@mail.gmail.com>
To: RC Reddy <vlsireddy@gmail.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [[PATCH]irqbalance updated to 1.3.0] irqbalance: fix compilation errors
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
X-List-Received-Date: Tue, 14 Nov 2017 17:47:29 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Nov 13, 2017 at 9:58 PM, RC Reddy <vlsireddy@gmail.com> wrote:
> Fixed issues:
>
> New features in this release:[From Neil Horman]
> =================================
> optimization of platform device irq detection
> Added sample udev rules to trigger irq rescans on device add/remove
> Made irqbalance ui an optional compile component
> Added support for Intel CoD
> Add -v | --version option to command line
>
> Bug fixes in this release:
> ==================================
> Misc compiler warning fixes and spelling errors
> Compilation error fix on aarch64
> Compilation error fix when using clang in c99 mode
> Unused variable cleanup
> Lots of memory leak cleanup in irqbalance-ui
> Prevent irqbalance from running in a container
> Fix irq affinity assignment in some cases to wrong numa node
> Fix oneshot mode
> exclude legacy irq 255
>
> Deprecations:
> =================================
> without-glib2 is removed, we just need it enough that we can't dummy it up anymore
>
> Tested:
> ================================
> Tested on AARCH64 and it compiles

the patch looks good, but we need your Signed-off-by: right here in the patch.

Also, if you do a git format-patch with -M the diff will be smaller.

So if you can send a v2 with those changes it should be ready to merge.

Bruce

> ---
>  recipes-extended/irqbalance/irqbalance_1.1.0.bb | 15 ---------------
>  recipes-extended/irqbalance/irqbalance_1.3.0.bb | 15 +++++++++++++++
>  2 files changed, 15 insertions(+), 15 deletions(-)
>  delete mode 100644 recipes-extended/irqbalance/irqbalance_1.1.0.bb
>  create mode 100644 recipes-extended/irqbalance/irqbalance_1.3.0.bb
>
> diff --git a/recipes-extended/irqbalance/irqbalance_1.1.0.bb b/recipes-extended/irqbalance/irqbalance_1.1.0.bb
> deleted file mode 100644
> index 16efa95..0000000
> --- a/recipes-extended/irqbalance/irqbalance_1.1.0.bb
> +++ /dev/null
> @@ -1,15 +0,0 @@
> -#
> -# Copyright (C) 2015 Wind River Systems, Inc.
> -#
> -
> -require irqbalance.inc
> -
> -SRC_URI[md5sum] = "b15d975336080bcac4be0c1752d43cf3"
> -SRC_URI[sha256sum] = "91506e638b03bf27cf5da7dc250d58a753ce8a0288a20265fc7ff0266040706b"
> -
> -SRC_URI = "https://github.com/Irqbalance/irqbalance/archive/v${PV}.tar.gz;downloadfilename=irqbalance-${PV}.tar.gz \
> -           file://add-initscript.patch \
> -           file://irqbalance-Add-status-and-reload-commands.patch \
> -           file://fix-configure-libcap-ng.patch \
> -           file://irqbalanced.service \
> -          "
> diff --git a/recipes-extended/irqbalance/irqbalance_1.3.0.bb b/recipes-extended/irqbalance/irqbalance_1.3.0.bb
> new file mode 100644
> index 0000000..5581a8b
> --- /dev/null
> +++ b/recipes-extended/irqbalance/irqbalance_1.3.0.bb
> @@ -0,0 +1,15 @@
> +#
> +# Copyright (C) 2015 Wind River Systems, Inc.
> +#
> +
> +require irqbalance.inc
> +
> +SRC_URI[md5sum] = "53ee393adcfbc8e5ab23cbbd920df687"
> +SRC_URI[sha256sum] = "41c2c0842d8fb24240d8069b389cd8d1669625a40009a17ad886967845dc6e43"
> +
> +SRC_URI = "https://github.com/Irqbalance/irqbalance/archive/v${PV}.tar.gz;downloadfilename=irqbalance-${PV}.tar.gz \
> +           file://add-initscript.patch \
> +           file://irqbalance-Add-status-and-reload-commands.patch \
> +           file://fix-configure-libcap-ng.patch \
> +           file://irqbalanced.service \
> +          "
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

