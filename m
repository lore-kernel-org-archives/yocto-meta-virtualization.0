Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 0CFDCE00B23; Thu, 25 Oct 2018 03:01:28 -0700 (PDT)
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
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.167.65 listed in list.dnswl.org]
Received: from mail-lf1-f65.google.com (mail-lf1-f65.google.com
	[209.85.167.65])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6E173E00AD8
	for <meta-virtualization@yoctoproject.org>;
	Thu, 25 Oct 2018 03:01:27 -0700 (PDT)
Received: by mail-lf1-f65.google.com with SMTP id p11-v6so6287746lfc.6
	for <meta-virtualization@yoctoproject.org>;
	Thu, 25 Oct 2018 03:01:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=vtu5C+1+oLbMTySrDYq9oxi/zZnNVVVLcYxOlNFcSrA=;
	b=Wv1usclVTEbk6EgJRsODdlIe9ev0PYDcke++yxEXTNZZ9Cg8MoIRUnZYB4MB2JS2fF
	RajeXh94eEdbi80dITZhO1qNqzMIZHju2Z+2SFMEuRB4ikHlWuTAJWxZcly+55meGItf
	tQ+exuTn9/xrzGZmL7zR6uik57hSA+n4y0/HOJxXue+dLT0Eu5JsqK+4k6wKGMykRXhN
	Lm4+GchgzqY7pqbT18/wskwtL8yNhjBjxi9xfaWasU7tobIvWTkVBdF2GqFV55Ni13ZJ
	AEkCU35n80ZyqzbZ6M73jXlH4pTQb1WRuNW0l5EhGrh/XQ+gKTL8zDMoedLW7kCAtPqF
	08OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=vtu5C+1+oLbMTySrDYq9oxi/zZnNVVVLcYxOlNFcSrA=;
	b=LsKPGmK5ZgXv49A8kmRn/FxWj/FQKMwXRhI1rNtb5263JECb6be/N6q9eeIyKfDazd
	FAkzW6BLeQZ9QKhn09S2k2u7n9QeKGRhhz4wVyRhxMSxeCI8iDOqwTo7oGEuHGpp1WzB
	6nw+FhxDT8WxaLWFZpPrmQ4ejTcq7E8RBABJy6OV7fCoM85MqGzk0eqohe+BNL3mIFkh
	e1zPILkiTsJH2mBTdLCWg7kxW9BO9zk2lWNeaescfYcv21KOmC4XJzN2u+m8C95YM3ng
	GrI+S2hlgaDVlReQeoYDhlPIHUeq+UdmpVH18W+rfVQfhyog/RG2sqxM70Nhjm4UzXEC
	goHg==
X-Gm-Message-State: AGRZ1gLOYOyocowNX7tvunT4gEggsJZiK1Dn4KdAos7Ab6SuJGu5HFSJ
	tMHXBWryCVr2/lpU8/Nult/fHVfdKq0Y62xsHFs=
X-Google-Smtp-Source: AJdET5fwrpXLNczwYNvdLs9Wn0vdvJQmbqgmC2TN+Q8OZaozsstRHbA27gASKj6P2B9Ya+2YpaVblNjzh3pLgfGigBc=
X-Received: by 2002:a19:9d8d:: with SMTP id g135-v6mr753895lfe.3.1540461686226;
	Thu, 25 Oct 2018 03:01:26 -0700 (PDT)
MIME-Version: 1.0
References: <20181024143151.11516-1-Randy.MacLeod@windriver.com>
In-Reply-To: <20181024143151.11516-1-Randy.MacLeod@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 25 Oct 2018 06:01:13 -0400
Message-ID: <CADkTA4MYv0dc-DAsRSsw8C3O2y5HxZ99bpVViiwShogBF85xEw@mail.gmail.com>
To: Randy MacLeod <Randy.MacLeod@windriver.com>
Cc: meta-virtualization@yoctoproject.org, kbassford@apertussolutions.com
Subject: Re: [rocko][PATCH] seabios: update SRC_URI to track tarball move
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
X-List-Received-Date: Thu, 25 Oct 2018 10:01:28 -0000
Content-Type: text/plain; charset="UTF-8"

We should already have this fixed in the newer branches, so as such, we should
indicate that this is a cherry pick, or simply send a cherry-pick
request to the list
and I'll take care of it.

I just want that linkage to the fixes in the other branches, so it is
clear that they
are not isolated issues.

Bruce

On Wed, Oct 24, 2018 at 10:32 AM Randy MacLeod
<Randy.MacLeod@windriver.com> wrote:
>
> Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
> ---
>  recipes-extended/seabios/seabios_1.9.1.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/recipes-extended/seabios/seabios_1.9.1.bb b/recipes-extended/seabios/seabios_1.9.1.bb
> index 31b9cb9..335d102 100644
> --- a/recipes-extended/seabios/seabios_1.9.1.bb
> +++ b/recipes-extended/seabios/seabios_1.9.1.bb
> @@ -4,7 +4,7 @@ LICENSE = "LGPLv3"
>  SECTION = "firmware"
>
>  SRC_URI = " \
> -    https://www.seabios.org/downloads/get/${PN}-${PV}.tar.gz \
> +    https://www.seabios.org/downloads/${PN}-${PV}.tar.gz
>      file://hostcc.patch \
>      "
>
> --
> 2.17.0
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

