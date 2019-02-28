Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 8F317E00D00; Wed, 27 Feb 2019 19:29:29 -0800 (PST)
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
	*      [209.85.208.193 listed in list.dnswl.org]
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
	[209.85.208.193])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id BC768E007B3
	for <meta-virtualization@yoctoproject.org>;
	Wed, 27 Feb 2019 19:29:28 -0800 (PST)
Received: by mail-lj1-f193.google.com with SMTP id l5so15826064lje.1
	for <meta-virtualization@yoctoproject.org>;
	Wed, 27 Feb 2019 19:29:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=ORukHM3kMEX8v5jaHpbiqGCjzj6mbZ+l2eFUDyBo8Gc=;
	b=Xz4iX7gAAI34EHrEh/VZ1XtHGPKyXo6FW7JoFft3zSbCFHRlRArr7xjX8bhUirysrL
	MKphtSActY2iDrSCbwONnOMy6LF0val/9hQICnjXUI/qHvnf7T6kj70hiRNpFQlHa1V6
	P6QXh1EjayfcXRwdDtUWDuwRkfcwtPw/rXggr26a6nHBE3rZiN9z045E/XobnFe6GxBj
	jaKVrfG29xTPat8ysvOG8HMrSmTCBlfAKEZR11mQYN1QC7Wp4bJGSN7duEPZ39cV9oGe
	WcCtObnwi5TueRD/Ad90Y066T52VONFoCz4mFkqbhByKSyuo4KzEtNwfaXKqz+0NVWVr
	rvrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=ORukHM3kMEX8v5jaHpbiqGCjzj6mbZ+l2eFUDyBo8Gc=;
	b=BY7+xkTTV/kiPhjVwTwkeYvZXBGcSzipuDAGNes/aGEJb2v+h8GSDlb0ujfXC4z9kr
	S8F28w5RbJ0BzJTqIPj1XU/qB4CAp7uZW7WSkK8VaulMBnah+w8AeOi1f0s1zQAvEipT
	vroLwpNg7hAwmjwjBGlqOGbbnLKQkcvbJxSw3WN7zVFmyYDkPGapoHSY4JsUTKEY0dGR
	4wx9X08p2G2Jq8QMzxhkFnpYy2PrSYbR0txGBYOmN+hUGQ51ly0ZgB8tEWsM/wtIbn3d
	hoziTlDcxQW8cwU8PZ/3UesTuKZjx9ODnTw1qOKTCkQTfXI0d5yICfuLEkcQ2rqNwOKe
	ATAQ==
X-Gm-Message-State: APjAAAXoIB94vyyZqXaSJ+HSHXh3biPKnc66YzXDDFwoySOxKgubIWia
	031GpkQ4HHHiWLjZkD7QueUWxM9WiAB4ulb/tawx+NlzGkg=
X-Google-Smtp-Source: AHgI3Ibei96x5qBfe619fZ+yAy4k71BYdQQGgM5PWeEkgimsMOEridssnFPH+q6BY0Ag3If0LT3aJ+ZrPB0uOKJjG0w=
X-Received: by 2002:a2e:9b15:: with SMTP id u21mr3292858lji.82.1551324567373; 
	Wed, 27 Feb 2019 19:29:27 -0800 (PST)
MIME-Version: 1.0
References: <1551317288-33865-1-git-send-email-dengke.du@windriver.com>
In-Reply-To: <1551317288-33865-1-git-send-email-dengke.du@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 27 Feb 2019 22:29:16 -0500
Message-ID: <CADkTA4PzpWUgQ1WRww0UDDorQ+kEE_eErcxWuVd1KoVQKfef7A@mail.gmail.com>
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
X-List-Received-Date: Thu, 28 Feb 2019 03:29:29 -0000
Content-Type: text/plain; charset="UTF-8"

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

What's the difference from v1 ?

Bruce

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

