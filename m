Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 87303E00D8C; Tue,  9 Jul 2019 12:26:28 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	https://www.dnswl.org/, no *      trust
	*      [209.85.208.193 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (bruce.ashfield[at]gmail.com)
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
	[209.85.208.193])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9A4EBE00D7E
	for <meta-virtualization@yoctoproject.org>;
	Tue,  9 Jul 2019 12:26:22 -0700 (PDT)
Received: by mail-lj1-f193.google.com with SMTP id v24so20694647ljg.13
	for <meta-virtualization@yoctoproject.org>;
	Tue, 09 Jul 2019 12:26:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=opbnmSZtYfqR/Gzf7tyAufHq9qrzo/Dx1TXR7mnHKis=;
	b=esxKPtLaF1fdvwcdBjKstMfL45bgg+xqOkc9QlF8XKTk3cS7ZFrmiS7uX+6O7iFHoj
	DfJ/Arz5um96qWSYiFaHPuFNNTIcV8QgvXxcxkHZRCi9ceU2kiTijLwHG1oI1DFMU6KF
	Li+tj141kembRLDEQtoC5CKkzPBYIaROZukRPEHGA2IY/sZi9Sy4whjSL3WKrP4HpZH7
	Y3E1aVAPv8G20gJLOuo46qsHAN8udiz1Gf+jpa0VxLi4iGwEZPtC7sVlxP25kWoMB0JH
	SP2Os++lKJkLRajpmstGlcpEcH2x5rfk6A49d7/W0WsrozheL3JbWmjUgESXtaEvbtLU
	xjEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=opbnmSZtYfqR/Gzf7tyAufHq9qrzo/Dx1TXR7mnHKis=;
	b=TnBPTwpqBrFEzjEsKy0oGI00V3ei/zPG+U5XZoDCe4K1eUBc8WHU2xgcEhq5UiQWM1
	kgkDInKVm8yc5dXR0fTg/YoHnDuf2cumSOUud8jcXqC2Ck+XSEr6mZZZMIXdRzCNM3OD
	gLLU0RiRjEy+0GfeVX4i06ie9LkLk9ELz5GCp8800Z8UafbLOWecsmIw9lZaFg1QNGkt
	CGTjwx8Cyz8LqvDIfhC8tTGWKodpaDzgnehV4QFAkQ+Xq02PuV+4Pf/w5RBBevlFocVJ
	+hsTndDYbesDvvVDicpxiAjvbjy8i04t8y4DDODbrmkwJIGOJ1hde1wXxtVsF/1v/GxM
	Lsdg==
X-Gm-Message-State: APjAAAVQInZA/xURKCNb6s5c+0O3wPeXvCLn2u84USLo20eiBnA5Lcsv
	vr8hsyn3Y5H4f1fiVgiqxnflWiIKWTAG/d1VZvmMY/w7
X-Google-Smtp-Source: APXvYqz5UHWSkUa0ms69PcVg1i78OCsSd5a+U9OmV735lnjzyvYSwQRYd+rLqNvTe9kjlHGhJQF/q2/jyEfO0fBB5Qc=
X-Received: by 2002:a2e:b048:: with SMTP id d8mr12384110ljl.118.1562700381563; 
	Tue, 09 Jul 2019 12:26:21 -0700 (PDT)
MIME-Version: 1.0
References: <20190708083014.31692-1-zangrc.fnst@cn.fujitsu.com>
In-Reply-To: <20190708083014.31692-1-zangrc.fnst@cn.fujitsu.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 9 Jul 2019 15:26:10 -0400
Message-ID: <CADkTA4MY3fWj84ytcZU0GY9-OoNhGxZ_TMGRphGwHPevgz8cjA@mail.gmail.com>
To: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] python-fasteners: upgrade 0.13.0 -> 0.15
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
X-List-Received-Date: Tue, 09 Jul 2019 19:26:28 -0000
Content-Type: text/plain; charset="UTF-8"

merged

Bruce

On Mon, Jul 8, 2019 at 4:41 AM Zang Ruochen <zangrc.fnst@cn.fujitsu.com> wrote:
>
> Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
> ---
>  meta-openstack/recipes-devtools/python/python-fasteners_git.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta-openstack/recipes-devtools/python/python-fasteners_git.bb b/meta-openstack/recipes-devtools/python/python-fasteners_git.bb
> index 5f496bc..2dd3698 100644
> --- a/meta-openstack/recipes-devtools/python/python-fasteners_git.bb
> +++ b/meta-openstack/recipes-devtools/python/python-fasteners_git.bb
> @@ -6,8 +6,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=4476c4be31402271e101d9a4a3430d52"
>
>  SRCNAME = "fasteners"
>
> -PV = "0.13.0+git${SRCPV}"
> -SRCREV = "c055890c98f67c343ff445973cd4efee67f081ce"
> +PV = "0.15+git${SRCPV}"
> +SRCREV = "75148cb679c351966cd4ad5e9d177048a0ea8380"
>
>  SRC_URI = "git://github.com/harlowja/${SRCNAME}.git"
>
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

