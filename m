Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 3FA79E00994; Fri,  1 Mar 2019 08:39:06 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	https://www.dnswl.org/, no *      trust
	*      [209.85.167.68 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (bruce.ashfield[at]gmail.com)
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lf1-f68.google.com (mail-lf1-f68.google.com
	[209.85.167.68])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8E58FE0048C
	for <meta-virtualization@yoctoproject.org>;
	Fri,  1 Mar 2019 08:39:04 -0800 (PST)
Received: by mail-lf1-f68.google.com with SMTP id 131so9282916lfa.5
	for <meta-virtualization@yoctoproject.org>;
	Fri, 01 Mar 2019 08:39:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=PQs9JWzUpjZu9PP43JRj0oTFcoqubTXWxcd2dC+BtaQ=;
	b=m6McORKXgfYuGAtV+g+QErE8EKqtYpHtx+Ob3Ihn7GbaHY3ntHoNVA4lRs+658ghc7
	Nu70/qBzPxhBYgs/0ivjI6koBLa+wA0Wg5YKZBMHAFsle+OsuictO6MjMLMEJmt1xsrh
	ZXvxdCeKafrsOq+3J0BtZ9HljSfbnCCJvSdeCp3Wns805kzwQr4CFOL2zv7yvH/us2Ki
	K5eexoR9crdIuRlkpx8KRNplX9vLdfsWi6Ha9uewa/EOMF/vMuIcAAeHY4adr0XWdKFU
	JSLNYy+juP2fVYPPRq0Qcy8GWkdyq3Tq1dpY+S6Dh6Em2PpjIMJFp8zLCMdn2CunE4qW
	Ys5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=PQs9JWzUpjZu9PP43JRj0oTFcoqubTXWxcd2dC+BtaQ=;
	b=tK3PR+R2zX9egkatAbDSignnywNZe1Ixz8hza7FgONrgPYJk001BEWvxBULb73zI4r
	lkuTnEZL6XYo/DOiO6UhNbeo1RjLEAl4WaBcRDz2w7Ozba3MHJ3391Ibcc+UXRV+ThlY
	wHCPk+9Fwj1/P3+m+pZkFQ2CYGh+2I+Ocr1dmbvncgutRH9YlY9SYS4e0zsFWmlwPR4Q
	TTKwV1xNS1FZe/+mBmU3XAWBDnuOvoj/9WeLgHL7LHNQuqRkTp8KuKfC4lj19j/z4Qr+
	45PZ7yjJU4k6hc8K68568SaAmpy+qJqbHQDNcvdvLFCUQHzUZjM+U0eVorav9J5I9XfZ
	yaWg==
X-Gm-Message-State: APjAAAVKpqzwyeo77OQwZ2BtPTRG4TsPfzOzYF7FxEMKUFE4hjs6ZcAg
	wawqF9SCcnQpEwR+/9Sf4DEgHf0zn9jZvprnErbVXYiEhek=
X-Google-Smtp-Source: APXvYqwOSCXh1tp/oNHF/myTHw88ML6QgJFtQnRx48vpcm0QfPDAMREPIxf2aS7uKndDQkWpxfhZoHTXo3bkc3ujWFg=
X-Received: by 2002:a19:598f:: with SMTP id n137mr3769260lfb.140.1551458343522;
	Fri, 01 Mar 2019 08:39:03 -0800 (PST)
MIME-Version: 1.0
References: <1551317288-33865-1-git-send-email-dengke.du@windriver.com>
In-Reply-To: <1551317288-33865-1-git-send-email-dengke.du@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 1 Mar 2019 11:38:52 -0500
Message-ID: <CADkTA4OFFrZPMiJoDSK1xd6Vtgs4cePpYzoJHkjpdTBRGUbqgQ@mail.gmail.com>
To: Dengke Du <dengke.du@windriver.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH V2] criu: fix host gcc can't recognized option -fmacro-prefix-map
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
X-List-Received-Date: Fri, 01 Mar 2019 16:39:06 -0000
Content-Type: text/plain; charset="UTF-8"

merged

Bruce

On Wed, Feb 27, 2019 at 8:09 PM Dengke Du <dengke.du@windriver.com> wrote:
>
> Generally, our host gcc version below 8.0, but cross toolchain in yocto
> above 8.0, now 8.3, the option "macro-prefix-map" coming from 8.0, so if
> the host gcc below 8.0, it can't unrecognized the option "macro-prefix-map".
>
> In criu source code, the HOSTCFLAGS coming from CFLAGS:
>     https://github.com/checkpoint-restore/criu/blob/criu-dev/Makefile#L17
> In yocto project, the CFLAGS coming from the cross toolchain, containing
> the "-fmacro-prefix-map" default, so we should use the BUILD_CFLAGS, it
> contains the flags that used for host building.
>
> Signed-off-by: Dengke Du <dengke.du@windriver.com>
> ---
>  recipes-containers/criu/criu_git.bb | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/recipes-containers/criu/criu_git.bb b/recipes-containers/criu/criu_git.bb
> index 45195ea..123f6a3 100644
> --- a/recipes-containers/criu/criu_git.bb
> +++ b/recipes-containers/criu/criu_git.bb
> @@ -54,6 +54,7 @@ export C_INCLUDE_PATH="${STAGING_INCDIR}/libnl3"
>
>  export BUILD_SYS
>  export HOST_SYS
> +export HOSTCFLAGS = "${BUILD_CFLAGS}"
>
>  inherit setuptools
>
> --
> 2.7.4
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

