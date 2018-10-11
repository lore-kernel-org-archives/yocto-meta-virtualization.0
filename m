Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 06B05E00A9B; Thu, 11 Oct 2018 11:38:58 -0700 (PDT)
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
	*      [209.85.208.194 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com
	[209.85.208.194])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 444FFE0090C
	for <meta-virtualization@yoctoproject.org>;
	Thu, 11 Oct 2018 11:38:57 -0700 (PDT)
Received: by mail-lj1-f194.google.com with SMTP id v6-v6so9128628ljc.11
	for <meta-virtualization@yoctoproject.org>;
	Thu, 11 Oct 2018 11:38:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=koQ67PkjuIePxUpaDxuVsTjT0/s/d3/rDZ6XnU2ImpM=;
	b=dvC6B82e82kO92ekm5zLufpv1Bapxh1i6MXnQkTG7UNPFFmJQJtEldkEVMoO8yiWiR
	NS6C8L+U1UWmuYfzJYicTRofW0fARExpFIsIIE5LRFZmIAsZ+Woj/J9Z1c5Fa+ZrdxOW
	XP12LMZFotsVqfjuxlskiA+PKawYgwelQqL5HraROCLAEPiamYEjlFKvrVxgnui2gODH
	8Hke8nkJhMkEDImBbLf5t7I0QFojJ7dMfj1yNHfyYWzQju4zGpRG5T4X7gDAFrCk/IWG
	9rT4YUGdCBOS22EOtSRVmSVNKpmJRO0VPtDlAx5fnnrfRKCMRAvj7qCGALfTj6Yr0FBU
	ltgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=koQ67PkjuIePxUpaDxuVsTjT0/s/d3/rDZ6XnU2ImpM=;
	b=d7xiRIyNT5U+gmNYM2S5ymmJKdir9EXEO24Pz2Oa2zd9pDZG50qDpt3B5Au0DPYbMU
	q+tGl0znJWzvN+Rkuw7oOPpxRACSAKckkvxd3uWWI3YEhgFi39wAPHfOaij7KYsBZuYe
	y9wnPkp4Draae29qCeO24mNFJ+dz9aj+9VCy8baaqvuPTngnhh1ap0NkB/xbbimvh0OV
	ORqOfmOm5MtbC6OaULPif3ageAfVFJADC8gv5/2njU+39OEb8DMCEK0ayB6yFeMgXetL
	p6Z8mc4p+7BFDfb6tUhmHiXekw19MsR5rvOo4IvMajKByF6x/3+hHPA7ReBytsVsXGfZ
	/YYw==
X-Gm-Message-State: ABuFfog0Uzlq6qlB/HLlc8yD5AdXw8GRnBNkZ5An0EuNF++sZvtC9Zwn
	I9ZuuTYYtXgsrxq3atAICD5Ps+NFfpPAnSt6KEx/jA==
X-Google-Smtp-Source: ACcGV61xfR4KmJh/PyaQ+/VmViHigL1XkgjbrRaGQ7wzpbHcFl7NzQEknij5HrPvgIC1/VWcENv3IH6XzkCAGNQzRjQ=
X-Received: by 2002:a2e:9e56:: with SMTP id
	g22-v6mr1808608ljk.120.1539283136087; 
	Thu, 11 Oct 2018 11:38:56 -0700 (PDT)
MIME-Version: 1.0
References: <1539154754-137572-1-git-send-email-changqing.li@windriver.com>
	<1539154754-137572-4-git-send-email-changqing.li@windriver.com>
In-Reply-To: <1539154754-137572-4-git-send-email-changqing.li@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 11 Oct 2018 14:38:44 -0400
Message-ID: <CADkTA4MDjEEwyZuWipnTKYhGwAk+i7byoLnNyRY9oCkXnkM1KQ@mail.gmail.com>
To: changqing.li@windriver.com
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] docker: fix do package qa warning
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
X-List-Received-Date: Thu, 11 Oct 2018 18:38:58 -0000
Content-Type: text/plain; charset="UTF-8"

merged

Bruce
On Wed, Oct 10, 2018 at 3:00 AM <changqing.li@windriver.com> wrote:
>
> From: Changqing Li <changqing.li@windriver.com>
>
> 1. After security flag PIE is enabled by default, we might met
> below QA warning on some arch, like aarch64, fix it by skip
> textrel QA check refer commit b689c72a of oe-core
>
> WARNING: docker-18.03.0+git708b068d3095c6a6be939eb2da78c921d2e945e2-r0
> do_package_qa: QA Issue: ELF binary 'work/aarch64-poky-linux/docker/
> 18.03.0+git708b068d3095c6a6be939eb2da78c921d2e945e2-r0/packages-split/
> docker/usr/bin/docker' has relocations in .text [textrel]
>
> 2. This problem is caused since security_flags.inc is used by default.
>    so alternative work around is:
>       SECURITY_CFLAGS_pn-docker = "${SECURITY_NOPIE_CFLAGS}"
>       SECURITY_LDFLAGS_pn-docker = ""
>
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>  recipes-containers/docker/docker_git.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/recipes-containers/docker/docker_git.bb b/recipes-containers/docker/docker_git.bb
> index 73e0120..b3673d4 100644
> --- a/recipes-containers/docker/docker_git.bb
> +++ b/recipes-containers/docker/docker_git.bb
> @@ -172,4 +172,4 @@ RDEPENDS_${PN}-contrib += "bash"
>
>  # DO NOT STRIP docker
>  INHIBIT_PACKAGE_STRIP = "1"
> -INSANE_SKIP_${PN} += "ldflags"
> +INSANE_SKIP_${PN} += "ldflags textrel"
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

