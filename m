Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A7006E00D61; Tue,  9 Jul 2019 12:22:28 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	https://www.dnswl.org/, no *      trust
	*      [209.85.208.196 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (bruce.ashfield[at]gmail.com)
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
	[209.85.208.196])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id AFD45E00B8F
	for <meta-virtualization@yoctoproject.org>;
	Tue,  9 Jul 2019 12:22:27 -0700 (PDT)
Received: by mail-lj1-f196.google.com with SMTP id p17so20722020ljg.1
	for <meta-virtualization@yoctoproject.org>;
	Tue, 09 Jul 2019 12:22:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=oAv956CV101IizLS9c9viHbrhAvvhKdULRM9zzDJxaI=;
	b=Ss1/lMmFni954hxx84ApRq3mPHZdXhFLX9JvMsgK3NdcGI6+ren9cfqtMdxFhR2lb3
	1qPQvuVoZLeQhrT2LySemYsObqKkifCWlWO1SGlcxIIZQUO6Ov3W4FCiIP/SAtchA9c4
	U5IczgginFkIacHiqL9/MwZ831XlSsdpcAGSBCSBU8eL5PhjrC/R41k39D6WnivIDMZp
	zvAGD9Zqvhw+fm6YvCiqZKDRL73K2NEQSn+VHQRsuksOgeZ0xGNbI34bNnDbvVqvlEr4
	w8dQG0IE+9Rdhdd5nHTpueMMAP/jS45U4QzBbrPQiDiOsbC2+FoZG/GOWsQqVQtK/l3r
	fmlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=oAv956CV101IizLS9c9viHbrhAvvhKdULRM9zzDJxaI=;
	b=H8Rx3LFMbFERzr0MR7msJxt/+Ou9B4J39jCWKSt2Wv4/kAgKsxL5jeoQnscy53D5Zg
	DCbrtEsRCVyCG5RHQd8+kaOboK5IUUO8YWC+ReBjPb4+3TRpglCY5SOnzDu1KJLZQDWK
	3QnCGtqyUOSSIlJd/NPFOiwM9rJNJV97pABt4+1nxCdosQhdI4xk/uMCKGNbl/+/Bc4v
	aHFFr+NHVh+PiB5WevWb4KDe14f5QgvNPYASUUrBP+e10HZl5sh/bKoskpxH1KZkLgms
	VbEduIDvY+J9yPeSzx6Esl7Y8y/z/wycdt72wj+nVX20CCue8+ljGeMqsdqOziBfSl98
	aq6Q==
X-Gm-Message-State: APjAAAVIIdHymb+H9GYFISUM9GS6nEIAlyRPnnCaLPgio3+Nzu2ijSQE
	gi+Sc30riy15yqiDIbMSmbxm3rYRDmu+IuKcSNwusmHs
X-Google-Smtp-Source: APXvYqykuadzuHkA2mvNbifi11y+HRjxqrSFCROTRfH0nTbAv8BHCLf+FTDlmmGlh4qAdjq6IyZLHRMKbY/GYsB+8tg=
X-Received: by 2002:a2e:9ac4:: with SMTP id p4mr14601147ljj.185.1562700146698; 
	Tue, 09 Jul 2019 12:22:26 -0700 (PDT)
MIME-Version: 1.0
References: <20190708055128.30496-1-zangrc.fnst@cn.fujitsu.com>
In-Reply-To: <20190708055128.30496-1-zangrc.fnst@cn.fujitsu.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 9 Jul 2019 15:22:15 -0400
Message-ID: <CADkTA4NTQiE-JKMqW8HTy5sXM8n55j2BcVEiSC7D_XHPvsTuQQ@mail.gmail.com>
To: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] tgt: upgrade 1.0.73 -> 1.0.79
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
X-List-Received-Date: Tue, 09 Jul 2019 19:22:28 -0000
Content-Type: text/plain; charset="UTF-8"

merged.

Bruce

On Mon, Jul 8, 2019 at 1:56 AM Zang Ruochen <zangrc.fnst@cn.fujitsu.com> wrote:
>
> Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
> ---
>  meta-openstack/recipes-support/tgt/tgt_git.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta-openstack/recipes-support/tgt/tgt_git.bb b/meta-openstack/recipes-support/tgt/tgt_git.bb
> index b94b034..ddec8c4 100644
> --- a/meta-openstack/recipes-support/tgt/tgt_git.bb
> +++ b/meta-openstack/recipes-support/tgt/tgt_git.bb
> @@ -4,8 +4,8 @@ LICENSE = "GPLv2"
>  LIC_FILES_CHKSUM = "file://scripts/tgtd.spec;beginline=7;endline=7;md5=21c19ea7dad04648b9c2f791b6e29b4c"
>  DEPENDS = "sg3-utils"
>
> -SRCREV = "013223dc886a03719ca02db52162056249d99448"
> -PV = "1.0.73+git${SRCPV}"
> +SRCREV = "b43dbc6711e43c0a32cc4d9df22884841d911d51"
> +PV = "1.0.79+git${SRCPV}"
>
>  SRC_URI = "git://github.com/fujita/tgt.git \
>         file://0001-Correct-the-path-of-header-files-check-in-Yocto-buil.patch \
> --
> 2.7.4
>
>
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

