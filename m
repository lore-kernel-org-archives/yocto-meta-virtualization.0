Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id BA3DDE00932; Tue, 21 Apr 2015 18:10:42 -0700 (PDT)
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
	*      [209.85.214.172 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-ob0-f172.google.com (mail-ob0-f172.google.com
	[209.85.214.172])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5153EE003A8
	for <meta-virtualization@yoctoproject.org>;
	Tue, 21 Apr 2015 18:10:37 -0700 (PDT)
Received: by obbeb7 with SMTP id eb7so158696529obb.3
	for <meta-virtualization@yoctoproject.org>;
	Tue, 21 Apr 2015 18:10:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=IymEpOf3VIf/J/ZMOkBVqeA/dUyMyEcS7+TNibZ6HgY=;
	b=pNmosGhqnQ5DAYP33JGqYP1IbGQpfZWXvi4I2HBeDztejW2ErkSxYxYB3Jzzi4DHJv
	du6DFxIiEULgIMSOwMKdgSep1rrYWXv+UXwa5vU1yC/qH/K/pKAN6JZDMqDTbuhKXYf8
	U5H/sgaNiUHSngclCWO4C+KPyHAEy2H8ZDPwBgZOQS6y5iihMPNPYseUopM1D5ysXM8y
	gWeFsKWUH6CCKg+nfnOs8lidkcfcQ0fNWhFceI/f/t2l0iopXvKNS+TMooczBBz106yp
	jkvwsTZKQZIpKKuUoYR43L4+Fr4+njec/7m4/h5ihn9P5LDbNyXltPVGUw//T9E7mWEI
	YOww==
MIME-Version: 1.0
X-Received: by 10.60.149.166 with SMTP id ub6mr21573822oeb.41.1429665037227;
	Tue, 21 Apr 2015 18:10:37 -0700 (PDT)
Received: by 10.202.9.193 with HTTP; Tue, 21 Apr 2015 18:10:37 -0700 (PDT)
In-Reply-To: <1429369138-22226-1-git-send-email-dmitry_eremin@mentor.com>
References: <1429369138-22226-1-git-send-email-dmitry_eremin@mentor.com>
Date: Tue, 21 Apr 2015 21:10:37 -0400
Message-ID: <CADkTA4M-3XY4FfHFo+DW+a52EmiqBmiY0rsgSh+aNd0Y+68-yg@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Dmitry Eremin-Solenikov <dmitry_eremin@mentor.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH v2] conf: override SECURITY_CFLAGS for a set of recipes
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
X-List-Received-Date: Wed, 22 Apr 2015 01:10:42 -0000
Content-Type: text/plain; charset=UTF-8

On Sat, Apr 18, 2015 at 10:58 AM, Dmitry Eremin-Solenikov
<dmitry_eremin@mentor.com> wrote:
> Some of recipes produce errors if the distro has enabled usage of
> security_flags.inc file. Fix those errors (and QA warnings) by providing
> an additional include file that is require'd from conf/layer.conf.

merged.

Bruce

>

> Signed-off-by: Dmitry Eremin-Solenikov <dmitry_eremin@mentor.com>
> ---
>  conf/distro/include/virt_security_flags.inc | 5 +++++
>  conf/layer.conf                             | 3 +++
>  2 files changed, 8 insertions(+)
>  create mode 100644 conf/distro/include/virt_security_flags.inc
>
> diff --git a/conf/distro/include/virt_security_flags.inc b/conf/distro/include/virt_security_flags.inc
> new file mode 100644
> index 0000000..16db013
> --- /dev/null
> +++ b/conf/distro/include/virt_security_flags.inc
> @@ -0,0 +1,5 @@
> +# Build errors with the pie options enabled
> +SECURITY_CFLAGS_pn-libvirt = "${SECURITY_NO_PIE_CFLAGS}"
> +
> +# This has text reloc errors with the pie options enabled
> +SECURITY_CFLAGS_pn-lxc = "${SECURITY_NO_PIE_CFLAGS}"
> diff --git a/conf/layer.conf b/conf/layer.conf
> index 7ae9d09..f5c1b1e 100644
> --- a/conf/layer.conf
> +++ b/conf/layer.conf
> @@ -16,3 +16,6 @@ LICENSE_PATH += "${LAYERDIR}/files/custom-licenses"
>  LAYERVERSION_virtualization-layer = "1"
>
>  LAYERDEPENDS_virtualization-layer = "core networking-layer"
> +
> +# Override security flags
> +require conf/distro/include/virt_security_flags.inc
> --
> 2.1.4
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

