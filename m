Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B4374E00994; Sun,  7 Apr 2019 20:09:18 -0700 (PDT)
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
	*      [209.85.167.66 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com
	[209.85.167.66])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 465BFE006D8
	for <meta-virtualization@yoctoproject.org>;
	Sun,  7 Apr 2019 20:09:17 -0700 (PDT)
Received: by mail-lf1-f66.google.com with SMTP id r25so8265747lfn.13
	for <meta-virtualization@yoctoproject.org>;
	Sun, 07 Apr 2019 20:09:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=aeyl47d9/KQzh1crzAoHhZgQIIoZe5f8GY06dQ5bU1o=;
	b=Amvh5OPrbzecRAooc8nXHsx5C0bQ9Vz/oQu5oqi306VNfp1qE7LqtLm8KS2Nvnwxat
	4co/lRxCxinu7SUw09xzI2ruHP99lTN8bdtikpz2TMgReC+e1seK+70JWTkfNW4iKxQL
	UAjBs+4mg0YGyJLb7nkD2lGXe0BjZozwyWuVcVSiI1VLPA9C3Pl7wcWbCWQeaiyJGMYM
	6JnnbZShJ3eWNzJBaVY9E2xv5747JHx0+9Gp+1TUCUvt8ZFr/SlX97Zrs7dbmqs7hVyp
	3uInnq/hk9gExuXPSzDX2EKSo71YJHQ2GRiBrQFrJu7PcALH7vsqOK1b+zqpM0+Xpv1K
	/tqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=aeyl47d9/KQzh1crzAoHhZgQIIoZe5f8GY06dQ5bU1o=;
	b=o99Vd10js5CBPhDdLkm8a/t2kmYVTjKo8MEVOLNM+a/Gvov+SyWKLejj0060Qsjoz0
	yadALQGdL7H7LeedEK3eSj+4sZJtq1mG0a0HXSedPWC8j9aSAQi0uNpRCTZG87gevf0/
	fXm3UvDmncaH6Kz7X+fFNHO5Pjye0v9P0ExrYie3rsqpDsVQEig8k/QOPrUZsu0ciAZJ
	49tpG+brbm+r4M1bZHEzeVgg8M4zAtxnMfSjn0uSnDdB9XfCdjdAH7XW3xLJ/qXxPIuV
	Y++97jnDNSFMqmIYCRpSdpO1Cjj5H/RuS0+GdfV8jb383XW4smtGxEGvDYBFXsMzoqaO
	25XA==
X-Gm-Message-State: APjAAAV7KL8mscTwWbKckOg3F1bu71nUB75I/61mDMPUM3pSnW8Oi1XR
	e2XlZq9bFCLlbzXwNIFc4/hwGfCFf47gIZazwdI=
X-Google-Smtp-Source: APXvYqzVBSZ3iFhTtwl/N+kk/5RgFKgBEoS0ILx6pTjd6wDx83td1b84302uDyigmUIkScvT27kvSPGTjrMkLSWOTss=
X-Received: by 2002:a19:f010:: with SMTP id p16mr6428141lfc.43.1554692955986; 
	Sun, 07 Apr 2019 20:09:15 -0700 (PDT)
MIME-Version: 1.0
References: <1554255386-24422-1-git-send-email-mark.asselstine@windriver.com>
In-Reply-To: <1554255386-24422-1-git-send-email-mark.asselstine@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Sun, 7 Apr 2019 23:09:04 -0400
Message-ID: <CADkTA4P3kJvDd0K7z1PpHt-BUVPjkWKj0J2Qyx9-ssNCm_AF+Q@mail.gmail.com>
To: Mark Asselstine <mark.asselstine@windriver.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [m-c-s][PATCH] consul: don't build with the '-linkshared' option
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
X-List-Received-Date: Mon, 08 Apr 2019 03:09:18 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Apr 2, 2019 at 9:36 PM Mark Asselstine
<mark.asselstine@windriver.com> wrote:
>
> We are currently seeing the following error:
> type..eUfRrckI: missing section for relocation target type..FEeY9FdU
> ...
>
> This is similar to the reported issues
> http://www.lyddzz.com/github_/golang/go/issues/30768
> and
> https://github.com/hashicorp/consul/issues/5486 (but this one appears
> to be a report of 'our' issue so isn't really valid)
>
> The go.bbclass currently completes 2 builds (if GO_DYNLINK is set),
> one without '-linkshared' and one with. The '--linkshared' option is
> marked as experimental (https://golang.org/cmd/link/ -- "-linkshared
> Link against installed Go shared libraries (experimental)").
>
> By setting GO_LINKSHARED prior to inheriting go.bbclass we can
> overwrite the default compile behavior and only perform the build
> without the '-linkshared' option. This shouldn't change the
> functionality of consul and we can revert to the default behavior when
> the issues have been addressed.

Agreed, and this works for me as well.

Merged.

Bruce

>
> Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> ---
>  recipes-connectivity/consul/consul_git.bb | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/recipes-connectivity/consul/consul_git.bb b/recipes-connectivity/consul/consul_git.bb
> index f9fb236..ab78cbd 100644
> --- a/recipes-connectivity/consul/consul_git.bb
> +++ b/recipes-connectivity/consul/consul_git.bb
> @@ -13,6 +13,11 @@ S = "${WORKDIR}/git"
>
>  RDEPENDS_${PN}-dev_append = " bash"
>
> +# Temporarily workaround an issue with GO 1.12.1
> +# http://www.lyddzz.com/github_/golang/go/issues/30768
> +# Disable experimental use of '-linkshared'.
> +GO_LINKSHARED = ""
> +
>  inherit systemd go
>
>  # Besides the hosts specified in goarch, we do not build for mips.
> --
> 2.7.4
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

