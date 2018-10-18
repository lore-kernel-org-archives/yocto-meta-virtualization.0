Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 2315FE00994; Thu, 18 Oct 2018 08:44:10 -0700 (PDT)
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
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.208.193 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
	[209.85.208.193])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 683D1E00971
	for <meta-virtualization@yoctoproject.org>;
	Thu, 18 Oct 2018 08:44:09 -0700 (PDT)
Received: by mail-lj1-f193.google.com with SMTP id v7-v6so28163475ljg.5
	for <meta-virtualization@yoctoproject.org>;
	Thu, 18 Oct 2018 08:44:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=MKLcLVT4r046I0iEG6Y7nL7YvnKg+vOmfN3TvHm+v5I=;
	b=dH1/upCiJuJpgRpphhkFK8wlF0S8v1vjn2dS+KLO6WL+6jLTL+Yp69U6cneee1zl//
	/+3CtTqNJzU6iCIK5gLmLqL47dVtyagPycw4sT/o9hrA9ujeJVPHszws0Paj5tA/MSAb
	To4iuRvTtsVNu3DYzmqwqDBknsmVAbQF5cZ2PfRWm6Ns4K/xNLI8BC1+atM4sLAXfLgI
	j9hSj0iFBuIgxidagH8/S5fp2ASS0cnAKuVJ5Gprc21uK2CnCOEtyHrPU4BlZzjyYebx
	QDWgH38zIeZG6oVXkdPmAQ8EzRtsB7RTMxh2u+ZrlPFi3NEaOLO7ucKNl1H91RDeNLsR
	S+jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=MKLcLVT4r046I0iEG6Y7nL7YvnKg+vOmfN3TvHm+v5I=;
	b=SF0xRiAKIURjfMdkLT2A9lW3SvI5+p1Q59aLr91BMAlXeVTk1Lco9d9qxpUjCQDScQ
	TuxXkHzzOX1WECzsGTqSaU+18cJ95jvGzZuqY22gyZyiWqJvfChI4xRb4TvOGMtjf8xu
	LlfOGxd4yBxyQ9XCaH7ftVbE5roPrCY/BOTVVEG25vWpRSBlBVVEStgALoXuy8TwY/Ow
	COmYrsKieJfPYlZSv7JXOdAU6GcLkHqAFbFSKQcQ93b90yOV6OjR59UDMgJu2BRzbep3
	VwNl1RlVjFZLVJnRuPB6shRZhT+siVibA/AD05QXOe8mBZnCkaZFhMkwDArHUowQpHXi
	2TPA==
X-Gm-Message-State: AGRZ1gLssWd78VQ70bovgzfcsAhRFYiWCYVAVNJeRShl1HtIswlnGGWQ
	uzjzFuNfJcT9l7gIeMX2xntQh8O+ztWqyswhXIQ=
X-Google-Smtp-Source: ACcGV60AoOsMCssPsOq9eSTPykWstfQ05jhDIWpYb5rEZbAqzR9pWDDamCzizje9dA2fl6iKL94eCM9FXcXvYSNvvow=
X-Received: by 2002:a2e:9e56:: with SMTP id
	g22-v6mr1825956ljk.120.1539877448282; 
	Thu, 18 Oct 2018 08:44:08 -0700 (PDT)
MIME-Version: 1.0
References: <20181017200410.114697-1-mark.hatle@windriver.com>
In-Reply-To: <20181017200410.114697-1-mark.hatle@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 18 Oct 2018 11:43:57 -0400
Message-ID: <CADkTA4OdrHyp9g83ztv8+q=rX7dmnu148Kqr3pTF=R65WzefCQ@mail.gmail.com>
To: "Hatle, Mark" <mark.hatle@windriver.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] openvswitch: Make openvswitch a machine_arch package
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
X-List-Received-Date: Thu, 18 Oct 2018 15:44:10 -0000
Content-Type: text/plain; charset="UTF-8"

merged

Bruce
On Wed, Oct 17, 2018 at 4:04 PM Mark Hatle <mark.hatle@windriver.com> wrote:
>
> Openvswitch recipe depends on the kernel source, which is machine specific.
> It can then use this machine specific resource to configure and build the
> recipe.  This mix causes the hash values of this package to change based on
> the machine, so this package must also be a machine_arch package.
>
> Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
> ---
>  recipes-networking/openvswitch/openvswitch_git.bb | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/recipes-networking/openvswitch/openvswitch_git.bb b/recipes-networking/openvswitch/openvswitch_git.bb
> index 4cd82d7..a930933 100644
> --- a/recipes-networking/openvswitch/openvswitch_git.bb
> +++ b/recipes-networking/openvswitch/openvswitch_git.bb
> @@ -2,6 +2,8 @@ require openvswitch.inc
>
>  DEPENDS += "virtual/kernel"
>
> +PACKAGE_ARCH = "${MACHINE_ARCH}"
> +
>  RDEPENDS_${PN}-ptest += "\
>         python3-logging python3-syslog python3-io \
>         python3-fcntl python3-shell python3-xml python3-math \
> --
> 2.16.0.rc2
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

