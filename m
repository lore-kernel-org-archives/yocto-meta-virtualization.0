Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C30D2E00CD4; Wed, 15 Nov 2017 13:01:29 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.216.193 listed in list.dnswl.org]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (bruce.ashfield[at]gmail.com)
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-qt0-f193.google.com (mail-qt0-f193.google.com
	[209.85.216.193])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 768C2E00C45
	for <meta-virtualization@yoctoproject.org>;
	Wed, 15 Nov 2017 13:01:27 -0800 (PST)
Received: by mail-qt0-f193.google.com with SMTP id p44so27146532qtj.6
	for <meta-virtualization@yoctoproject.org>;
	Wed, 15 Nov 2017 13:01:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=8u6dy8zoPRGvrMYloWnCMiL/RMdm5dI+/+j3twwh9tU=;
	b=NwIiDwL5r8bgGmoaHBwGgjWqcNZP+HzPx1qvjapndAba+zoJGrc1EdXrnaHSps4rkz
	6Qe8dx3FY/HCJmPIcKkA1dtT8gr4y0CixpXNpwXzi2JArDaw/Dqm25zKh3MiYHHt0V9n
	aq/IVeBc16PvHoB2qOkOLdYSLfmfx0DpRjjlwTCksJO7lYBM7oilfQDgMgnCAWg4QD6Z
	kHDp1RaqLMD7+DjIC2w0wR5q0Uulo64eW2WXXS1D/70qbuZK+AR64GjVTzhfX44mma1i
	IhROovUmufLO3TWd+HXotvNDOiblJQZJ3APnLAtkFR53pCIwyilFe/y1etbyQBpoFmT6
	LuCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=8u6dy8zoPRGvrMYloWnCMiL/RMdm5dI+/+j3twwh9tU=;
	b=tlmNpJi2G29MQXz2fMJga/wPPMAEImhzj8Uz/rOvnh+WLyzIM9yKpts0MBImzXu5ns
	4Uv9dDdulfl5D8Mr0g+HIdRRe+D0HkFWKjzy5rSIakQztKqckcE6kZwtxKMAQTbcJm/Q
	zTzEXGYP7vrILeYxMO1dzKKdv/pVEqoEyDSjzRlOE0ZuohnEAkWdyxM8GxfsTwg/OlXo
	X9dUqHJ/5Ca4AN7RNieqpa1zevq7B3WFkPx8hfatGdvG7R6ajUYPbYijvAELwJMdXwJE
	b63WLOx+//j4ixc/+YdIYGdQZ8HZYvg6ORSuHuZxsIxawBA8P325hEkRqswVn98Ns/nJ
	UJ/Q==
X-Gm-Message-State: AJaThX55SfCy+GxROy+GakxpFXBjxEpQtdVSYSWyubNc8PapL3NnaJS6
	LUf3L/CMqPDTco1CeDnHCOzx6n8671FEUzyyV0Et9g==
X-Google-Smtp-Source: AGs4zMbVhQjqiBIS+EGiAqkxzQXdv58nHXylkFt+eeIW1bwMnBVYlwPjVBmZdHx/W5w6dux87jv4VwMXTFs9sE8CFm4=
X-Received: by 10.55.195.216 with SMTP id r85mr25023493qkl.218.1510779687254; 
	Wed, 15 Nov 2017 13:01:27 -0800 (PST)
MIME-Version: 1.0
Received: by 10.12.182.80 with HTTP; Wed, 15 Nov 2017 13:01:26 -0800 (PST)
In-Reply-To: <1510694120-11068-1-git-send-email-vlsireddy@gmail.com>
References: <1510694120-11068-1-git-send-email-vlsireddy@gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 15 Nov 2017 16:01:26 -0500
Message-ID: <CADkTA4MyYOgGg7CgFC1xmFb8uiGWQkdf81AW_YSkRxmRd64Dbw@mail.gmail.com>
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
X-List-Received-Date: Wed, 15 Nov 2017 21:01:29 -0000
Content-Type: text/plain; charset="UTF-8"

merged.

Bruce

On Tue, Nov 14, 2017 at 4:15 PM, RC Reddy <vlsireddy@gmail.com> wrote:
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
>
> Signed-off-by: RC Reddy <vlsireddy@gmail.com>
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

