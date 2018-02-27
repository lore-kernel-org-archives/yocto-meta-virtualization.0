Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A8F3DE00EEE; Mon, 26 Feb 2018 22:15:39 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.215.43 listed in list.dnswl.org]
Received: from mail-lf0-f43.google.com (mail-lf0-f43.google.com
	[209.85.215.43])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 73F04E00D91
	for <meta-virtualization@yoctoproject.org>;
	Mon, 26 Feb 2018 22:15:38 -0800 (PST)
Received: by mail-lf0-f43.google.com with SMTP id r80so25782897lfe.13
	for <meta-virtualization@yoctoproject.org>;
	Mon, 26 Feb 2018 22:15:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=DQVJx3Jgzm6spl95u8GOzj8X+ECzhucQD2mD352pk74=;
	b=BTy1K3YmhcrXKdDpp3j7cWY7JojlNeTQGw23vQTsWCNGsesMmnYERbKKcrjRA84FlE
	X6RHaJDkN5VVGL9lk4uANGO8h8aTlgnielSlWNpvW0WPVc68W+fInlEMrJgOyH7hnab7
	J3Kv0FYVhgIw6vszcJDmjwKB/zZhcEcjTZ6EbenrVr7Vbq6ON+hXS9AOo4qHVrlioQTP
	8jWlHC4kgLc+qRLlY3qrb/eRhMXtPKvsZSSAM44awguRFWe8otWU6c957DggIuNgmmNR
	JsfcX4FsVkF3p0qqRV3OthDGh84eOLx8Z5Is+NA4qIK9DqElywrrAtrITgbfVp91dGiN
	Nntg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=DQVJx3Jgzm6spl95u8GOzj8X+ECzhucQD2mD352pk74=;
	b=sPzBmQ2wLtO+WPJhLa8CEXqw5R7zQ2OG4TAaom1yjCExRzAqa1BNvAzTZZFG9uTNP7
	Avjt1VleVxYXeTIlWXVC4We/5mrhVkCs7QtfnaGZV/A/hB83pHqMaSPYmuEsEiYC1Fj2
	Ca/o7Vyg9BWs445KmZPSt3tSpBy23Bd9S2zv2qBV3Sll/DqkloGda0Ioczlc+UX77Fjs
	Bjy9NP/tAP0Hh4X9C6wN1ijN2MjORv5C9B8/JdHjcju3frXiyIJIaYj4n7wbCMY4PVTI
	06DEdaROG6/SqWrAnOv2fQNmpJsXO9JjYhJLC4ti+kd2P4q3TJUduoSN8Xw3KKb8QOFA
	ohcA==
X-Gm-Message-State: APf1xPBli+EDvBliLGkEX4wUlgA28H1bCM63OaEXx0x0+Dq9W68rvtFC
	YDmQE3b7QsvXGJrsdGX3imX00KQf6KPHEohrkfs=
X-Google-Smtp-Source: AG47ELv1/7HjC8wt6f+XFvz6XNXdUMSFypeqsAczDvIZu790nkr83JxTImWr9/6yK3yiUOvl6WRfsvgMflkWWOSRDbI=
X-Received: by 10.25.181.8 with SMTP id e8mr8789663lff.94.1519712137011; Mon,
	26 Feb 2018 22:15:37 -0800 (PST)
MIME-Version: 1.0
Received: by 10.46.48.4 with HTTP; Mon, 26 Feb 2018 22:15:36 -0800 (PST)
In-Reply-To: <20180227015512.27675-1-liezhi.yang@windriver.com>
References: <20180227015512.27675-1-liezhi.yang@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 27 Feb 2018 01:15:36 -0500
Message-ID: <CADkTA4OXm3Ji7qM7=Ra7J1qH14zArfUU5kyAUDe5FzfwaMSRJA@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] python-pyparsing: fix SRC_URI's checksum
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
X-List-Received-Date: Tue, 27 Feb 2018 06:15:39 -0000
Content-Type: text/plain; charset="UTF-8"

We need to document the reason why the checksum changed.

What happened to trigger the bad checksum ?

Bruce

On Mon, Feb 26, 2018 at 8:55 PM, Robert Yang <liezhi.yang@windriver.com> wrote:
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>  recipes-devtools/python/python-pyparsing_2.0.1.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/recipes-devtools/python/python-pyparsing_2.0.1.bb b/recipes-devtools/python/python-pyparsing_2.0.1.bb
> index 2ef6df9..c19f137 100644
> --- a/recipes-devtools/python/python-pyparsing_2.0.1.bb
> +++ b/recipes-devtools/python/python-pyparsing_2.0.1.bb
> @@ -4,7 +4,7 @@ SECTION = "devel/python"
>  LICENSE = "MIT"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=fb46329938e6bc829b256e37d5c1e31a"
>
> -SRC_URI[md5sum] = "dc7036a6f1ab01c3baed3d97af8d77c0"
> -SRC_URI[sha256sum] = "7e1766ee747cca79fe172b670fd53ef58fc55d2b1804fd6c66d857abb62d143a"
> +SRC_URI[md5sum] = "37adec94104b98591507218bc82e7c31"
> +SRC_URI[sha256sum] = "0007cd3f008eba4a203f1f6b4b133ddc352552c8808b694c88c23db56416e4e4"
>
>  inherit distutils pypi
> --
> 2.10.2
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

