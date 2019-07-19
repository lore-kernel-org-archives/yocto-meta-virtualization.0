Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id ECA02E00DD3; Fri, 19 Jul 2019 12:17:39 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1795CE00A93
	for <meta-virtualization@yoctoproject.org>;
	Fri, 19 Jul 2019 12:17:38 -0700 (PDT)
Received: by mail-lj1-f196.google.com with SMTP id d24so31764940ljg.8
	for <meta-virtualization@yoctoproject.org>;
	Fri, 19 Jul 2019 12:17:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=i9MyODZUPZpkt9n+yYI1L+Ejnqmeyxj5tz5d4qdbSgE=;
	b=hBxr2ciKfhexGUZT68wAfvCrD5OrKQSpzNsLnNntQrZn5dba6gLmssJLcNwpGNsvGH
	+7kcjMmEuKsuo7D8QEOxNElxIi2GMIvG0K4eS+df2WFn5J+1aC0w8OFZrvZwas0iIxTR
	VL0QBbv1RzDJDWwq4OALXoM806WXriAoPTCK7XtfwobSOg7dDRiCHbCh4k69CB2H0PDU
	E2pSSyrBEej2urKqf5Nq+Zge53so6cBRgDRTK4e6BkmFbBSag/rBmXetgz4zWtfkPfUy
	zk4sJLCUijnP7VJHBHJJlnccowMzoFP1G2Wsk8iNgeeKp5SjyIY4mFjER6mH2iQCM+Jv
	T6qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=i9MyODZUPZpkt9n+yYI1L+Ejnqmeyxj5tz5d4qdbSgE=;
	b=PYcUzjAmUTjRsbGxTl2EIc0bLJ5w14gdisk/z4b/x/1KV4x28jSCzndtF+LH+bJORz
	f0kHpEdC6wUnrH884ieRDvZKQQLcEuKKfV1lzHwicxsP6PDAIgKWX/IHHX1XYdfwWpSN
	mppr06URRGw9RRb2zmgLkiYa7atAsSS+kZISA6Ti3X6X2TS9YnIX0vOnXGsqhgUp24S1
	OcssqnM85drPNf/9BZrTebBc1blE3i/7UK7u7Y+9CAH9G2EsKsqIGvXtgp3ERJxsemBa
	EH3BKoxk4HR1I2SiiOxTjjsSon6R/fTOJ1lwXiUWE/a9+YKWVSU5hVqFVZfHnVNDB/9a
	XObA==
X-Gm-Message-State: APjAAAXgT/81t2nSWen1A7Gfwn9EBGuH1v/ZQumgJMUQyFdPyzr9ejtb
	BDy9ksPFOdN3ffUC6NeDdPgOnLfWiX/x8Una3ls=
X-Google-Smtp-Source: APXvYqyGSIGNQk7hTN45Kh9z/kxW6HZJjJiuim2gBTKUxkYlZ0HA4PSh782HIfgsGAGtV6OKlBmo+AR1g2bYkcgRVjo=
X-Received: by 2002:a2e:9a49:: with SMTP id k9mr28106524ljj.78.1563563857957; 
	Fri, 19 Jul 2019 12:17:37 -0700 (PDT)
MIME-Version: 1.0
References: <1563357214-6963-1-git-send-email-hongxu.jia@windriver.com>
In-Reply-To: <1563357214-6963-1-git-send-email-hongxu.jia@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 19 Jul 2019 15:17:26 -0400
Message-ID: <CADkTA4OO_7tKbcWpxUa_=-4Kq+q2Fz8WoJYB+--gYFARJXV9Ag@mail.gmail.com>
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH V2] docker: improve hardcoded CC for cross compile
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
X-List-Received-Date: Fri, 19 Jul 2019 19:17:40 -0000
Content-Type: text/plain; charset="UTF-8"

Thanks.

I have this staged and will merge it once my build + runtime tests are done.

Bruce

On Wed, Jul 17, 2019 at 5:54 AM Hongxu Jia <hongxu.jia@windriver.com> wrote:
>
> Since commit applied in moby [61a3285 Support cross-compile for arm]
> it hardcoded var-CC to support cross-compile for arm
>
> Correct it with "${parameter:-word}" format, it is helpful for user
> define toolchains
>
> (Use Default Values.  If parameter is unset or null, the expansion of
> word is substituted.  Otherwise, the value of parameter is substituted.)
>
> https://github.com/moby/moby/commit/61a3285864d3f1b489f48f765b61b2c7bd300372
>
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>  recipes-containers/docker/docker_git.bb            |  3 +-
>  ...001-imporve-hardcoded-CC-on-cross-compile.patch | 61 ++++++++++++++++++++++
>  2 files changed, 63 insertions(+), 1 deletion(-)
>  create mode 100644 recipes-containers/docker/files/0001-imporve-hardcoded-CC-on-cross-compile.patch
>
> diff --git a/recipes-containers/docker/docker_git.bb b/recipes-containers/docker/docker_git.bb
> index 5b2f3b0..feca536 100644
> --- a/recipes-containers/docker/docker_git.bb
> +++ b/recipes-containers/docker/docker_git.bb
> @@ -43,7 +43,8 @@ SRC_URI = "\
>         git://github.com/docker/libnetwork.git;branch=master;name=libnetwork;destsuffix=git/libnetwork \
>         git://github.com/docker/cli;branch=19.03;name=cli;destsuffix=git/cli \
>         file://docker.init \
> -        file://0001-libnetwork-use-GO-instead-of-go.patch \
> +       file://0001-libnetwork-use-GO-instead-of-go.patch \
> +       file://0001-imporve-hardcoded-CC-on-cross-compile.patch \
>         "
>
>  require docker.inc
> diff --git a/recipes-containers/docker/files/0001-imporve-hardcoded-CC-on-cross-compile.patch b/recipes-containers/docker/files/0001-imporve-hardcoded-CC-on-cross-compile.patch
> new file mode 100644
> index 0000000..554d282
> --- /dev/null
> +++ b/recipes-containers/docker/files/0001-imporve-hardcoded-CC-on-cross-compile.patch
> @@ -0,0 +1,61 @@
> +From 975b3a8e761b20e570120e8ca99b19da8012cae5 Mon Sep 17 00:00:00 2001
> +From: Hongxu Jia <hongxu.jia@windriver.com>
> +Date: Wed, 17 Jul 2019 17:34:04 +0800
> +Subject: [PATCH] imporve hardcoded CC on cross compile
> +
> +Since commit applied in moby [61a3285 Support cross-compile for arm]
> +it hardcoded var-CC to support cross-compile for arm
> +
> +Correct it with "${parameter:-word}" format, it is helpful for user
> +define toolchains
> +
> +(Use Default Values.  If parameter is unset or null, the expansion of
> +word is substituted.  Otherwise, the value of parameter is substituted.)
> +
> +Upstream-Status: Submitted [https://github.com/moby/moby/pull/39546]
> +
> +Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> +---
> + hack/make/.binary | 10 +++++-----
> + 1 file changed, 5 insertions(+), 5 deletions(-)
> +
> +diff --git a/src/import/hack/make/.binary b/src/import/hack/make/.binary
> +index 53de674..66f4ca0 100644
> +--- a/src/import/hack/make/.binary
> ++++ b/src/import/hack/make/.binary
> +@@ -44,27 +44,27 @@ if [ "$(go env GOOS)/$(go env GOARCH)" != "$(go env GOHOSTOS)/$(go env GOHOSTARC
> +       # must be cross-compiling!
> +       case "$(go env GOOS)/$(go env GOARCH)" in
> +               windows/amd64)
> +-                      export CC=x86_64-w64-mingw32-gcc
> ++                      export CC="${CC:-x86_64-w64-mingw32-gcc}"
> +                       export CGO_ENABLED=1
> +                       ;;
> +               linux/arm)
> +                       case "${GOARM}" in
> +                       5|"")
> +-                              export CC=arm-linux-gnueabi-gcc
> ++                              export CC="${CC:-arm-linux-gnueabi-gcc}"
> +                               export CGO_ENABLED=1
> +                               ;;
> +                       7)
> +-                              export CC=arm-linux-gnueabihf-gcc
> ++                              export CC="${CC:-arm-linux-gnueabihf-gcc}"
> +                               export CGO_ENABLED=1
> +                               ;;
> +                       esac
> +                       ;;
> +               linux/arm64)
> +-                      export CC=aarch64-linux-gnu-gcc
> ++                      export CC="${CC:-aarch64-linux-gnu-gcc}"
> +                       export CGO_ENABLED=1
> +                       ;;
> +               linux/amd64)
> +-                      export CC=x86_64-linux-gnu-gcc
> ++                      export CC="${CC:-x86_64-linux-gnu-gcc}"
> +                       export CGO_ENABLED=1
> +                       ;;
> +       esac
> +--
> +2.7.4
> +
> --
> 2.7.4
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

