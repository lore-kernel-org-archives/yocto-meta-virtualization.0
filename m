Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 5801FE00D85; Mon, 17 Jun 2019 20:59:32 -0700 (PDT)
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
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/,
	no *      trust
	*      [209.85.208.194 listed in list.dnswl.org]
Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com
	[209.85.208.194])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9C135E00D64
	for <meta-virtualization@yoctoproject.org>;
	Mon, 17 Jun 2019 20:59:31 -0700 (PDT)
Received: by mail-lj1-f194.google.com with SMTP id a21so11542614ljh.7
	for <meta-virtualization@yoctoproject.org>;
	Mon, 17 Jun 2019 20:59:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=gMpNMapcZjiCAo9urpbU6L4yeQiEW2P1kYmdY9Zp24w=;
	b=H1w5ydaWiMfkhmjVV7dziIbVAs++Ka6hYJ4zxaeAPDI2NWfyi+GivB9ksQQ/EWDAaE
	9JXrkW7nOsFZY8ggWB4Mhasiy6MDBmYbL3Ce3eIGflCIzu5WJm5RHFQa/25il1UWTsHW
	zMC/z/W9FvNVUenegQlHWUN8U9bgaRnOpcZ4cOIjlXFT23ZsI1dPYD1M/m4CbZhfOdGG
	ERkC6HPuQUgfpkS24mrN+8XCr8hfxFw/ax7Fz3qZnjIBbTphWE/9YzIk43sKnB6QgPtD
	D7Si9HeAxsnLLpcv/ddRhD0ZYBOFTvIiHgJFC3JSuOArW/7fcXjcc7r7vCYaEoUR6Op1
	aB5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=gMpNMapcZjiCAo9urpbU6L4yeQiEW2P1kYmdY9Zp24w=;
	b=SX2sLbFoehmXMwco0ULjyIqz3Xy7/v+8ftpUn/0WFky6Gq/cMVchTORkE+/l7y3fdU
	MxOsEpbib9q6z/PqTpCyfXEfd3+TkFH5q65OWyeFuP0JLXqUQF+ZDs6MtwMxaYeNgvGI
	Rj4w4Jmz5XnhdZlMu8x3P+Jgke0UDmvfw4vhuQpPYdaXs7VVVqektTB+A3PEDV2GFJEV
	uF1puTiLm4zrKuMLEhxglK4KY7/6gZItnL8aeh+RyxZjO49sn4EMYNKYpqTltYTQ+VIC
	c/ljxCRzXoVH0qOdo9Qx2wSfQVBRYB0y+ML3O5adNBrE0mkquSneeQnwZyaymblj0Ius
	4lzQ==
X-Gm-Message-State: APjAAAU+GBesDSmoOzyHLcqAJAT6D8YiO+TarjjaKMOBZpJO1CBv1gVT
	QMFb5MKYeR6bvkBfp0R1q4X4kXeUeIijuTT4pXw=
X-Google-Smtp-Source: APXvYqxJA2fLJfad4V+zDsS2IzHGMHNxSAH6UGoru7bH8WcckrsKdtjv71v+rKumERxdDbmnaeZoVph2xHG3jSz54lM=
X-Received: by 2002:a2e:9ac4:: with SMTP id p4mr46783463ljj.185.1560830370363; 
	Mon, 17 Jun 2019 20:59:30 -0700 (PDT)
MIME-Version: 1.0
References: <1560222684-412783-1-git-send-email-zhe.he@windriver.com>
In-Reply-To: <1560222684-412783-1-git-send-email-zhe.he@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 17 Jun 2019 23:59:19 -0400
Message-ID: <CADkTA4PtWCEivQb8VumhCThszFqH4-QC8O1SUYBLib+N3jj2-A@mail.gmail.com>
To: He Zhe <zhe.he@windriver.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] kernel: Add conditional inclusion of linux-yocto_virtualization.inc for rt kernel
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
X-List-Received-Date: Tue, 18 Jun 2019 03:59:32 -0000
Content-Type: text/plain; charset="UTF-8"

merged

Bruce

On Mon, Jun 10, 2019 at 11:11 PM <zhe.he@windriver.com> wrote:
>
> From: He Zhe <zhe.he@windriver.com>
>
> This is the same as other kernel bbappend.
>
> Signed-off-by: He Zhe <zhe.he@windriver.com>
> ---
>  recipes-kernel/linux/linux-yocto-rt_%.bbappend | 1 +
>  1 file changed, 1 insertion(+)
>  create mode 100644 recipes-kernel/linux/linux-yocto-rt_%.bbappend
>
> diff --git a/recipes-kernel/linux/linux-yocto-rt_%.bbappend b/recipes-kernel/linux/linux-yocto-rt_%.bbappend
> new file mode 100644
> index 0000000..20eeba9
> --- /dev/null
> +++ b/recipes-kernel/linux/linux-yocto-rt_%.bbappend
> @@ -0,0 +1 @@
> +require ${@bb.utils.contains('DISTRO_FEATURES', 'virtualization', 'linux-yocto_virtualization.inc', '', d)}
> --
> 2.7.4
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

