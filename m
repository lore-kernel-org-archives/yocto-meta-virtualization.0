Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 36A04E00DB6; Thu, 28 Dec 2017 08:16:15 -0800 (PST)
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
	*      [209.85.220.195 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E766AE00D89
	for <meta-virtualization@yoctoproject.org>;
	Thu, 28 Dec 2017 08:16:13 -0800 (PST)
Received: by mail-qk0-f195.google.com with SMTP id d202so25654234qkc.9
	for <meta-virtualization@yoctoproject.org>;
	Thu, 28 Dec 2017 08:16:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=b4pNAcdPw0Vb2phrz0DyDzLRyWJQB0hPX8EhfDjoeSo=;
	b=OohYtv7N/4/Wlvdr+6e/VA78/dbbqMTI+wF7AWgfbzsQOBtIOpO6nNHyUGTMcSpSqQ
	59nIWEUaTRUb4du64iImiZ0PEvXhELa46sKyI7aiaEmOvD3Fq1Sm4Yzr5hM6gfLJecGN
	0ETFNUyjwpZv4SXzT1++JPmDvMDMC9v/ceLFWlPn3bUDaEtp+yvTppaf4qn6XifU+afh
	eLtVYCLx7i4Ig/xY/kaJSMEczYEkaWFPob+RZWydq6WHINv4otPlk3b/RNLjMLtLajYG
	Eu6dDm+cOMKZ1sqKIsFMJqfNr4bNbRBSt7M8yfc8PoTR2+HUGeUrWkYIfdbMBp35yRp/
	Fe9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=b4pNAcdPw0Vb2phrz0DyDzLRyWJQB0hPX8EhfDjoeSo=;
	b=Z70+f02dLIOQAuM61+k1ZSpGLFKbSYl4h/P4lcKuZ3eIgoNzpAt0BlR8EpgrN5TTSV
	ZCuVWrG5JfaQDY0N8hsQG/41FPYvqkbqFPI4ejGvMrbmU5B+g32d6OQbJuq7CYA6cpwP
	1/LbuL6B/zHSW2BikjtTWct81DWsYyC0jq4PGmbKrM95bwAF655lsRixf9vMD1TA5N7M
	LqdRbJdruZsgmc0R+kX7KHcGkb1o5n7urLVlHWXA+7EO5O6SJntDTpGHlQtLs1XF6tDa
	vbrDUObtvDHUgO98XcVQ1bh4aYexQdJi8Tf7L63Eb8j0P+w7Mc5dkAgOtzwEUCZjC/Ed
	31Mw==
X-Gm-Message-State: AKGB3mI6/r/HWpAtBvOe4UaMOKrpKS0y2I2SzjF6qxokNKh/Mv6GFQqS
	yPxlXRNl8PDYIP1ZK5fvJeZkdtoqta1jF+M9l9k=
X-Google-Smtp-Source: ACJfBova6+2A/5Qx4WJWGPvmuFAA/tBoLCiassGvl9FFGKMjq97kI76qNcNYeTJcRzj87NfJ62RCfClE3W1kA+jf4hs=
X-Received: by 10.55.112.3 with SMTP id l3mr26815135qkc.94.1514477773003; Thu,
	28 Dec 2017 08:16:13 -0800 (PST)
MIME-Version: 1.0
Received: by 10.12.182.96 with HTTP; Thu, 28 Dec 2017 08:16:12 -0800 (PST)
In-Reply-To: <1513742577-8379-1-git-send-email-mark.asselstine@windriver.com>
References: <1513742577-8379-1-git-send-email-mark.asselstine@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 28 Dec 2017 12:16:12 -0400
Message-ID: <CADkTA4O_V6Yw1_h5iDj2CoA3VfGxTQbChj5G3_VxMh2g8+MJNw@mail.gmail.com>
To: Mark Asselstine <mark.asselstine@windriver.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] kvm-image-minimal: drop remaining ROOTFS_PKGMANAGE_BOOTSTRAP
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
X-List-Received-Date: Thu, 28 Dec 2017 16:16:15 -0000
Content-Type: text/plain; charset="UTF-8"

merged.

Bruce

On Wed, Dec 20, 2017 at 12:02 AM, Mark Asselstine
<mark.asselstine@windriver.com> wrote:
> Commit 4eee02bd6405557c664f91b6079c2f203d48c545 [meta-virtualization:
> Drop ROOTFS_PKGMANAGE_BOOTSTRAP] missed this instance so we are
> removing this last reference to ROOTFS_PKGMANAGE_BOOTSTRAP now.
>
> The ROOTFS_PKGMANAGE_BOOTSTRAP has been universally removed since
> oe-core commit 697804229a172125ce7d3bfc9b343812d6fe3240
> [run-postinsts: simplify the logic of whether to install it to
> images].
>
> Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> ---
>  recipes-extended/images/kvm-image-minimal.bb | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/recipes-extended/images/kvm-image-minimal.bb b/recipes-extended/images/kvm-image-minimal.bb
> index c96edca..b28cc30 100644
> --- a/recipes-extended/images/kvm-image-minimal.bb
> +++ b/recipes-extended/images/kvm-image-minimal.bb
> @@ -2,7 +2,6 @@ DESCRIPTION = "A minimal kvm image"
>
>  IMAGE_INSTALL = " \
>      packagegroup-core-boot \
> -    ${ROOTFS_PKGMANAGE_BOOTSTRAP} \
>      qemu \
>      libvirt \
>      libvirt-libvirtd \
> --
> 2.7.4
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

