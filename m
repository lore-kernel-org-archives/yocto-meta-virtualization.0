Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 0CE6DE00C62; Tue,  8 Sep 2015 07:03:24 -0700 (PDT)
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
	*      [209.85.160.178 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-yk0-f178.google.com (mail-yk0-f178.google.com
	[209.85.160.178])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7E71CE00B5A
	for <meta-virtualization@yoctoproject.org>;
	Tue,  8 Sep 2015 07:03:23 -0700 (PDT)
Received: by ykcf206 with SMTP id f206so119782715ykc.3
	for <meta-virtualization@yoctoproject.org>;
	Tue, 08 Sep 2015 07:03:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=RxyugV1R6yOihvrwuK0dl+6l7Va86Aig6Ah9j2C9no4=;
	b=V0xdG2fM9SCwunQvKtDaI37fM2bAnEoG0sNWHZAlV7j2DVd8n6ardfS5XcecMKI8D5
	AciUPj9LEb6a7hFxX+kdfVFcOwf7a1pTzHCAkZrVckT1wr5ZVP3URu0JW0/FutqSMDdw
	oo+jLv+RKw/P2U9qFrvDmPdq4lGSwhoUVJstsTsS4eHKj92X5pcVwB7DWAl2FT5qXKZ0
	f9m9IXuMYUYXQBNiNjpwRQDwyYvumo3pnFW7I+hKVA/vuVLab//tRmnxvd0Uh9sKjs1E
	chTpavATJg98rOgbfV6wOXuDtumUd65Mm3jjQCZ3B1t31RnLw01hYz2dIIhoDSCPN2CJ
	JXdQ==
MIME-Version: 1.0
X-Received: by 10.170.159.214 with SMTP id a205mr28240159ykd.62.1441721001890; 
	Tue, 08 Sep 2015 07:03:21 -0700 (PDT)
Received: by 10.129.34.212 with HTTP; Tue, 8 Sep 2015 07:03:21 -0700 (PDT)
In-Reply-To: <1441695312-24264-1-git-send-email-zhe.he@windriver.com>
References: <1441695312-24264-1-git-send-email-zhe.he@windriver.com>
Date: Tue, 8 Sep 2015 10:03:21 -0400
Message-ID: <CADkTA4N2jGffH6PeJD3C_aCf4DYpOxogwPyns8EOOd8HL78LwQ@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: He Zhe <zhe.he@windriver.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH 1/1] linux-yocto: Add bbappend for 4.1 for virtualization configuration
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
X-List-Received-Date: Tue, 08 Sep 2015 14:03:24 -0000
Content-Type: text/plain; charset=UTF-8

merged.

Bruce

On Tue, Sep 8, 2015 at 2:55 AM,  <zhe.he@windriver.com> wrote:
> From: He Zhe <zhe.he@windriver.com>
>
> Signed-off-by: He Zhe <zhe.he@windriver.com>
> ---
>  recipes-kernel/linux/linux-yocto_4.1.bbappend | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>  create mode 100644 recipes-kernel/linux/linux-yocto_4.1.bbappend
>
> diff --git a/recipes-kernel/linux/linux-yocto_4.1.bbappend b/recipes-kernel/linux/linux-yocto_4.1.bbappend
> new file mode 100644
> index 0000000..85e98cc
> --- /dev/null
> +++ b/recipes-kernel/linux/linux-yocto_4.1.bbappend
> @@ -0,0 +1,19 @@
> +FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
> +
> +SRC_URI += "file://xt-checksum.scc \
> +            file://ebtables.scc \
> +           file://vswitch.scc \
> +           file://lxc.scc \
> +           "
> +KERNEL_FEATURES_append = " features/kvm/qemu-kvm-enable.scc"
> +
> +KERNEL_MODULE_AUTOLOAD += "openvswitch"
> +KERNEL_MODULE_AUTOLOAD += "kvm"
> +KERNEL_MODULE_AUTOLOAD += "kvm-amd"
> +KERNEL_MODULE_AUTOLOAD += "kvm-intel"
> +
> +# aufs kernel support required for xen-image-minimal
> +KERNEL_FEATURES_append += "${@base_contains('DISTRO_FEATURES', 'aufs', ' features/aufs/aufs-enable.scc', '', d)}"
> +
> +# xen kernel support
> +SRC_URI += "${@base_contains('DISTRO_FEATURES', 'xen', ' file://xen.scc', '', d)}"
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

