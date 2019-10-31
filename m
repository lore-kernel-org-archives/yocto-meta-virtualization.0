Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 2AD56E00DDC; Thu, 31 Oct 2019 15:09:53 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (bruce.ashfield[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/,
	no *      trust
	*      [209.85.208.66 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com
	[209.85.208.66])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B3829E00DFB
	for <meta-virtualization@yoctoproject.org>;
	Thu, 31 Oct 2019 15:09:32 -0700 (PDT)
Received: by mail-ed1-f66.google.com with SMTP id w3so3780665edt.2
	for <meta-virtualization@yoctoproject.org>;
	Thu, 31 Oct 2019 15:09:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=rTiLXMRWYc4K3DGctT2dekr7xqd2dQkGtbbOYeuU/Rk=;
	b=spI9MuVNszZ9ECDG0WVG8UBWXMBi4uSnArwPOJenlkwqT4YVcEaaZ2fdZCV6UL9TkE
	LZhKvrE/nNkGlMrKe8jyN+6EJQ82+FJqCPn+l/hTQg4QuARGdTX6kslqtmH/Fj+a43RP
	BxOItFJMCHG6OIf28B1wfuUL1H3FVne/xaHmL5ImoCDKfLHnZH1++2qQmLETb1GTvIYm
	XCC2nxSkgsDJKFzqleglU2xy3otWGwqlb/D0K+u9SxMc/AoVra8K9dvI041s5XXyldQA
	380yDPhEbyJAMfTaJyJHjtIbXct43jFHWp/RMHSOrpqjK34Szq800Fo/vcXtvumH9gwC
	mrmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=rTiLXMRWYc4K3DGctT2dekr7xqd2dQkGtbbOYeuU/Rk=;
	b=kX3o5d9MuGPmj/C4AAZF35y6x/6DnDGK9de7e4bUa1JLpuQP3kmmw31blPbkCTYeKQ
	7hsU5vcrM0uVrvIOBvrbHvBaIrVMs7Es4Hxw76cjSZOvpkfGjDSbDzhl06EwxFd9BBBl
	/yxobHa6xMsmTH2bB9YvdgkiBeVWc1K+/awnBeBeoGZV4U+rMVIQUuyAiePpWqs4zJU9
	GZkZgKli9Z2+95+1b6OSVs3w4vupOiywDSGxp4GoSsiSnMrlfzRgWUGwGFeHT5mcJzEX
	xSSyIQqB4zWlqBKu0rhBm++iMZebJPwCTMWpmv1M0r0lp4SeGZD0jhs97CbvzRd9wK9H
	OGUw==
X-Gm-Message-State: APjAAAVSCSrDC+H5K0OC3fXAyzGVxVhtzd/bR4ATC5nD/wcameZa7YrQ
	fZ5p82gQ+nfnV084KvdG5CIU1zGL0RjPJUccfFJjEmGg6zM=
X-Google-Smtp-Source: APXvYqwzj1S9LvZQSrN0F+frefEt8+zP/8JVsx8EDxeX1EKqoMHMDaIOvChpcdChOiHxa9SUyd6FoJ/Y0B3vJ8CTTnI=
X-Received: by 2002:a50:fe96:: with SMTP id d22mr9145745edt.227.1572559770862; 
	Thu, 31 Oct 2019 15:09:30 -0700 (PDT)
MIME-Version: 1.0
References: <c03f4a40-ed57-76a8-49f8-85e25738a69a@3mdeb.com>
In-Reply-To: <c03f4a40-ed57-76a8-49f8-85e25738a69a@3mdeb.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 31 Oct 2019 18:09:21 -0400
Message-ID: <CADkTA4PPaE3ijWo7-36-vhKepUwDH2YovZw3Ad9F3N2phiYcdg@mail.gmail.com>
To: Norbert Kaminski <norbert.kaminski@3mdeb.com>
Cc: meta-virtualization <meta-virtualization@yoctoproject.org>
Subject: Re: recipes-extended/images/xen-image-minimal.bb: change, hardcoded vmlinuz to the KERNEL_IMAGETYPE variable
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
X-List-Received-Date: Thu, 31 Oct 2019 22:09:56 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Oct 31, 2019 at 2:23 PM Norbert Kaminski
<norbert.kaminski@3mdeb.com> wrote:
>
> Why is vmlinuz hard-coded in the syslinux.cfg? Could it be replaced by
> the KERNEL_IMAGETYPE?
>

I'm guessing it just hasn't been something that others have wanted to configure.

The patch looks ok to me. I assume those that are currently relying on
/vmlinuz will have that already as their kernel build type (since it
is being built).

I'll wait a few days to see if anyone objects.

Bruce


>  From 450becb15192a3541b7a3d55ace75a1929d15add Mon Sep 17 00:00:00 2001
> From: Asiderr <norbert.kaminski@3mdeb.com>
> Date: Thu, 31 Oct 2019 17:50:53 +0100
> Subject: [PATCH] recipes-extended/images/xen-image-minimal.bb: change
> hardcoded vmlinuz to the variable
>
> Signed-off-by: Norbert Kaminski <norbert.kaminski@3mdeb.com>
> ---
>   recipes-extended/images/xen-image-minimal.bb | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/recipes-extended/images/xen-image-minimal.bb
> b/recipes-extended/images/xen-image-minimal.bb
> index c39d378..740ef1f 100644
> --- a/recipes-extended/images/xen-image-minimal.bb
> +++ b/recipes-extended/images/xen-image-minimal.bb
> @@ -61,6 +61,6 @@ build_syslinux_cfg () {
>       echo "PROMPT 1" >> ${SYSLINUX_CFG}
>       echo "LABEL boot" >> ${SYSLINUX_CFG}
>       echo "  KERNEL mboot.c32" >> ${SYSLINUX_CFG}
> -    echo "  APPEND /xen.gz ${SYSLINUX_XEN_ARGS} --- /vmlinuz
> ${SYSLINUX_KERNEL_ARGS} --- /initrd" >> ${SYSLINUX_CFG}
> +    echo "  APPEND /xen.gz ${SYSLINUX_XEN_ARGS} ---
> /${KERNEL_IMAGETYPE} ${SYSLINUX_KERNEL_ARGS} --- /initrd" >> ${SYSLINUX_CFG}
>   }
>
> --
> 2.17.1
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

