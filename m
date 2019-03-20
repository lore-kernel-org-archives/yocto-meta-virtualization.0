Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 08F8CE00C1E; Wed, 20 Mar 2019 11:41:50 -0700 (PDT)
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
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/,
	no *      trust
	*      [209.85.208.196 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
	[209.85.208.196])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3F9BCE00BB7
	for <meta-virtualization@yoctoproject.org>;
	Wed, 20 Mar 2019 11:41:49 -0700 (PDT)
Received: by mail-lj1-f196.google.com with SMTP id z26so3135803lja.13
	for <meta-virtualization@yoctoproject.org>;
	Wed, 20 Mar 2019 11:41:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=OKy+vQ+D7yQnL7djfGUv/athckRoqbCZi/9+RMP8l88=;
	b=esA7QiH0GQ1LLJI9IIx651a8o0sAVAGTUUwHDfFC5xA9fNIj7ki6aQcF+NXsWXIDZz
	PTHvnP1fsAaqwpaDzm/11tfysFQKBvn3zYLeVmx6i8LJ76id7Me/RW3lZ/3BRaNAAc4v
	Un9ddgQ9mOaNcN4jRby7opE5ma6arMf4N5dPbyxeqL7K2Nndd5kAMgfxnCfuK7EiiFDJ
	C+a9a0r65AXXI4SbMFois28YjkevtBr8o0USZA5yqBpyd0ePK+ObaIghTo4Mt6M58Xf+
	8jwldns8zLtluuN4QUT26cDTafHA12N1Q10N3HU8NTwkM2UW8/7JYE3ZPHJCpBVjCPGd
	7wfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=OKy+vQ+D7yQnL7djfGUv/athckRoqbCZi/9+RMP8l88=;
	b=cDnN9vhsi+R+15nul7QPf0/3jAeP3Q/M9yltNy4CbiBxrgaxTcMOtGuOhUV3A6IFWO
	XZQ/0xJ3poB0Od1csH476Dm3/NlL1Esoxyw3A/wvySovf8zEIOk2AkoaWEkOlmHnCkpR
	ML3whli6v50NgP+NvHuzYpjRpn09mQfzsnRcSeG/dH2G3iEzK/y8abxBLQukGFyrGFuS
	hE6SuEetHS9eGucFHWo8+c8Ro1Ms2/hkCQZbaCgZ+u0XxTSkjQUlkN+507J4P7nKejeD
	jPXsVTeKNTMcQL9y5p2X4GSzIwWub9VJsSYEAn0CgBbqKQEXOwSUL33/L03iKZda8krF
	qQtQ==
X-Gm-Message-State: APjAAAWLfY/QgFVmoWSsOBfd0VNNwQJoNjeCUNFzKCp5CszplfXLeSRO
	EbZ4DLlwlP9k9JtjCbcArU3yIBPDL08ldBCeSIs=
X-Google-Smtp-Source: APXvYqzlhHCry72lnyK9G6rex3Vr/rEfHZyXAPaKrOJGoqmWp+I8Kv6mf9QQWMfOHwuoO4lnTKz5ZPne+d+Fs/g+smg=
X-Received: by 2002:a2e:408:: with SMTP id 8mr18047997lje.15.1553107308078;
	Wed, 20 Mar 2019 11:41:48 -0700 (PDT)
MIME-Version: 1.0
References: <20190319070519.117520-1-hongzhi.song@windriver.com>
In-Reply-To: <20190319070519.117520-1-hongzhi.song@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 20 Mar 2019 14:41:37 -0400
Message-ID: <CADkTA4PsDE7f6_EG8NjTneeOZCgLhPvY4kqjFQHj+u1t57tb1Q@mail.gmail.com>
To: "Hongzhi.Song" <hongzhi.song@windriver.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] notary: uprev to v0.6.1
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
X-List-Received-Date: Wed, 20 Mar 2019 18:41:50 -0000
Content-Type: text/plain; charset="UTF-8"

merged

Bruce

On Tue, Mar 19, 2019 at 3:06 AM Hongzhi.Song <hongzhi.song@windriver.com> wrote:
>
> Signed-off-by: Hongzhi.Song <hongzhi.song@windriver.com>
> ---
>  recipes-devtools/go/notary_git.bb | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/recipes-devtools/go/notary_git.bb b/recipes-devtools/go/notary_git.bb
> index d638dc1..9cfb46e 100644
> --- a/recipes-devtools/go/notary_git.bb
> +++ b/recipes-devtools/go/notary_git.bb
> @@ -2,15 +2,15 @@ DESCRIPTION = "Notary is a Docker project that allows anyone to have trust over
>  HOMEPAGE = "https://github.com/docker/notary"
>  SECTION = "devel/go"
>  LICENSE = "Apache-2.0"
> -LIC_FILES_CHKSUM = "file://src/${PKG_NAME}/LICENSE;md5=771ddb425ba03c8fab49e5bd9854a4a2"
> +LIC_FILES_CHKSUM = "file://src/${PKG_NAME}/LICENSE;md5=3596b980bb036e0875174ed15e4b982a"
>
>  SRCNAME = "notary"
>
>  PKG_NAME = "github.com/docker/${SRCNAME}"
>  SRC_URI = "git://${PKG_NAME}.git;destsuffix=git/src/${PKG_NAME}"
>
> -SRCREV = "c8aa8cf53cbcda2e92def0c9291e25d770493494"
> -PV = "0.4.2+git${SRCPV}"
> +SRCREV = "d6e1431feb32348e0650bf7551ac5cffd01d857b"
> +PV = "0.6.1+git${SRCPV}"
>
>  S = "${WORKDIR}/git"
>
> --
> 2.17.1
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

