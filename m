Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 388B2E00A54; Thu, 11 Oct 2018 11:38:47 -0700 (PDT)
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
	*      [209.85.167.67 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com
	[209.85.167.67])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 975A4E00566
	for <meta-virtualization@yoctoproject.org>;
	Thu, 11 Oct 2018 11:38:46 -0700 (PDT)
Received: by mail-lf1-f67.google.com with SMTP id d4-v6so7470635lfa.3
	for <meta-virtualization@yoctoproject.org>;
	Thu, 11 Oct 2018 11:38:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=1PSv0ZS/JhXT79K5N9oXJSUCv5y15JtqWTYPY1yvkCo=;
	b=EgK3+yHXQN5koELMkSFAIGWNbr1CGqTJDHDtgh1igM49WERfghbrx/pL0zlAjBZIRg
	CYzrrnYDjHBQafyxvyoJGiBvgQx0xo2RSze11Z71yasd3w/kTySVqEpWCnIAUlcHsJYt
	oxGyto3z+FWBw1J1LlZS4QO71Q0EZmTaxJEFCSqiJr7AX9jzmxmGPbSnx22iGYR3GdPq
	scQcnjIzMtwDhrzKJfdxFRHTWBePaclv5lgFYQhNFFXvICZaMA9RL5xMGGlfvPKYv/0I
	vpFjiNHh6uwa6Tgv5dAJfrEnx/e+GdvuXi9jjXFrWtM85kFflVSq82QKlQhcnVUUSKVD
	L2VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=1PSv0ZS/JhXT79K5N9oXJSUCv5y15JtqWTYPY1yvkCo=;
	b=j9jg21GAh1bK9YQqSnkrDWCFq+vNSe4BGiFR9yH55JVaFrI9hm1q15dtcpZcB+0vpF
	USxzyiFiSJ55ZX3MuocyEg0E85WaWzR3wO3w8addHKDwLfprAOizSwAqdU0UkY2BTue+
	8gLpu/XHzM5+nmHaSZ8XVR+NsbByA5UYpWUveHPmWQFzgCdV1IqdilDjcvsaj6GatdZ2
	Knt4BZkcIPggzW95lIATQwCEJEf/40lZJHo0BMI5E2DzIOSBq8trA+uJtswzIIWN89tL
	B3pSXjlexCyupEtB+KoC6czWdWjBoBqJehpasnqq5eVo4XJNWrTN2Up0MWib4R+tDa6x
	A4gQ==
X-Gm-Message-State: ABuFfoi50K1zP303QsnqYk9Al+RDhFlRUhepB5kxerJQDqTYkgwTW3BK
	kep4BAwuDmez3GUEp8DN9VVrBTOVMtWvWsYdvlxCpw==
X-Google-Smtp-Source: ACcGV60c52tHp8XcFx6UEhdSFReEV2sWBGsR07ocfs3ZKC2zz6CAzgMsztNsUukyYjEeNp4h1JYyOdQgqyBnLjiGPLQ=
X-Received: by 2002:a19:504e:: with SMTP id
	z14-v6mr1900286lfj.120.1539283125383; 
	Thu, 11 Oct 2018 11:38:45 -0700 (PDT)
MIME-Version: 1.0
References: <1539154754-137572-1-git-send-email-changqing.li@windriver.com>
	<1539154754-137572-5-git-send-email-changqing.li@windriver.com>
In-Reply-To: <1539154754-137572-5-git-send-email-changqing.li@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 11 Oct 2018 14:38:34 -0400
Message-ID: <CADkTA4OQ7eSui4iqyP9zwKTYtPcWWfNjKAmakDvfiJ_XM4GiLw@mail.gmail.com>
To: changqing.li@windriver.com
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] oci-image-tools: fix do package qa warning
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
X-List-Received-Date: Thu, 11 Oct 2018 18:38:47 -0000
Content-Type: text/plain; charset="UTF-8"

merged

Bruce
On Wed, Oct 10, 2018 at 2:59 AM <changqing.li@windriver.com> wrote:
>
> From: Changqing Li <changqing.li@windriver.com>
>
> 1. After security flag PIE is enabled by default, we might met
> below QA warning on some arch, like aarch64, fix it by skip
> textrel QA check refer commit b689c72a of oe-core
>
> oci-image-tools-0.2.0-dev+gitAUTOINC+4abe1a166f-r0 do_package_qa:
> QA Issue: ELF binary 'work/aarch64-poky-linux/oci-image-tools/
> 0.2.0-dev+gitAUTOINC+4abe1a166f-r0/packages-split/oci-image-tools/
> usr/sbin/oci-image-tool' has relocations in .text [textrel]
>
> 2. This problem is caused since security_flags.inc is used by default.
>    so alternative work around is:
>       SECURITY_CFLAGS_pn-oci-image-tools = "${SECURITY_NOPIE_CFLAGS}"
>       SECURITY_LDFLAGS_pn-oci-image-tools = ""
>
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>  recipes-containers/oci-image-tools/oci-image-tools_git.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/recipes-containers/oci-image-tools/oci-image-tools_git.bb b/recipes-containers/oci-image-tools/oci-image-tools_git.bb
> index 807ee26..8c41b6e 100644
> --- a/recipes-containers/oci-image-tools/oci-image-tools_git.bb
> +++ b/recipes-containers/oci-image-tools/oci-image-tools_git.bb
> @@ -61,4 +61,4 @@ do_install() {
>         install ${S}/src/import/oci-image-tool ${D}/${sbindir}/
>  }
>
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

