Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 9DC6FE00D1E; Wed,  4 Oct 2017 13:55:10 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, RCVD_IN_DNSWL_NONE,
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.220.196 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.220.196 listed in dnsbl.sorbs.net]
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
	[209.85.220.196])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4AF4BE00D06
	for <meta-virtualization@yoctoproject.org>;
	Wed,  4 Oct 2017 13:55:08 -0700 (PDT)
Received: by mail-qk0-f196.google.com with SMTP id w63so7256141qkd.2
	for <meta-virtualization@yoctoproject.org>;
	Wed, 04 Oct 2017 13:55:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=lpmP4AygpRw3px7/VW3ZYXUVMjd33sB6PoV1sv/T6iM=;
	b=rP0Ja8lKvwXigOD3EeeKpScSbTebWRC2NBkoaKG7OuYOIppLVvD5fDh6HMfTyny7oB
	xGh6U86vOIY8WCORly28eBOLgkOkCOizeiC4PJ0wHwyLBx4cNba9zGKLTITPhqzBf8RQ
	CzmFgDSP+gF0jZ3PHnmuRIrnS4/tH3nZ66vJ4NIUY1rs+Jv2anUDNJRSD+4KBM6GEyRL
	GESlHxhXOBNvBmFEy+grlXWo56yhN14pmaBpQAskX36oGTEynD5mYaO0Qjf+AI8OrLS5
	gOX/4oBZxHg6ZxkzAHr2lokdscZ0h0zoKtrYBVXe7VYoSS9qt6qcZldBlZbeRQ108HLC
	HsMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=lpmP4AygpRw3px7/VW3ZYXUVMjd33sB6PoV1sv/T6iM=;
	b=LuYwGNBhIaBNGEYKdTeIIh1KN2YYtFC1zr+tYyvDRsuAlmzyLIIcH2G6+im7OWvoQL
	EUrXxmrYCFVvdBAzX+7PPRlDIUQSOH75Vgl2a6PPHPEnH1fw08iQjurHLW7naC16oK0D
	xCdgewoPFakAQE6tgnYmO9tmTjlffyHVb0DImoS3doBg0iu3LWumQLl9lYaDptvpnOMy
	/BJA3ny+hrX2gvI/khxUkge9nyMNcbtRurNrsFGCCyavTniNwp0gA7eJrPr/GbAm41jn
	LV8s5Pmnz+HM9LbqeUzj972Mq9FGVr5rctUL6yhrIBYxCP2FhHXnZTYbGLfR/c1AwntM
	g4RA==
X-Gm-Message-State: AMCzsaWynCMULGyZsyllIeLd5ODN8qF0kZiXdnt7YFPaMO8fiLiz3If6
	cJU1ZoHzDxB8QVS7QfFUPkrN0dHWyUEBQ0tLLqb2bg==
X-Google-Smtp-Source: AOwi7QB7wRjeGotrwuuzOYTorhtJJfm5pyPkOBfAj6sDZndm4B7Jr6oGNriv5yIf9NVu7tksH3xW+Mi+kRH/LllL+cA=
X-Received: by 10.55.15.139 with SMTP id 11mr27150088qkp.141.1507150508116;
	Wed, 04 Oct 2017 13:55:08 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.12.215.197 with HTTP; Wed, 4 Oct 2017 13:55:07 -0700 (PDT)
In-Reply-To: <1507113626-3022-3-git-send-email-pbarker@toganlabs.com>
References: <1507113626-3022-1-git-send-email-pbarker@toganlabs.com>
	<1507113626-3022-3-git-send-email-pbarker@toganlabs.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 4 Oct 2017 16:55:07 -0400
Message-ID: <CADkTA4NDQJzUb4gPg=Z8suvOV7P55ovSWK5uXkgvFYCYet5O+A@mail.gmail.com>
To: Paul Barker <pbarker@toganlabs.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH 2/2] runc-opencontainers: go.bbclass compile fixes
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
X-List-Received-Date: Wed, 04 Oct 2017 20:55:10 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Oct 4, 2017 at 6:40 AM, Paul Barker <pbarker@toganlabs.com> wrote:
> These fixes are needed due to updates to go.bbclass in oe-core. See commit
> 01a8d4537012ad93dc8510e9b762acdc8c4536c7 for more information.

Yah, same thing we did for the docker variant. This is now merged.

Bruce

>
> Signed-off-by: Paul Barker <pbarker@toganlabs.com>
> ---
>  recipes-containers/runc/runc-opencontainers_git.bb | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/recipes-containers/runc/runc-opencontainers_git.bb b/recipes-containers/runc/runc-opencontainers_git.bb
> index 940ae95..902a93d 100644
> --- a/recipes-containers/runc/runc-opencontainers_git.bb
> +++ b/recipes-containers/runc/runc-opencontainers_git.bb
> @@ -6,9 +6,11 @@ RUNC_VERSION = "1.0.0-rc4"
>  PROVIDES += "virtual/runc"
>  RPROVIDES_${PN} = "virtual/runc"
>
> +GO_IMPORT = "import"
> +
>  do_compile_prepend() {
>         # Go looks in a src directory under any directory in GOPATH but
>         # runc-opencontainers uses 'vendor' instead of 'vendor/src'. We can fix
>         # this with a symlink.
> -       ln -sfn . "${S}/vendor/src"
> +       ln -sfn . "${S}/src/import/vendor/src"
>  }
> --
> 2.7.4
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

