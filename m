Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 35AE1E00C87; Wed,  3 Jul 2019 07:05:26 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 07062E00B65
	for <meta-virtualization@yoctoproject.org>;
	Wed,  3 Jul 2019 07:05:23 -0700 (PDT)
Received: by mail-lf1-f66.google.com with SMTP id b29so1898873lfq.1
	for <meta-virtualization@yoctoproject.org>;
	Wed, 03 Jul 2019 07:05:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=j7POXQtZB7hKat3ysFYGEZtQF12ZeWe6BzG8HQcIBK0=;
	b=XfY4W0ws6M0TgqoeNMJ3wD8/SQrXFMoV654p0KE4F/IcW/vXUMl4Xjst/UpIUvIpFX
	FOetNugC9WUGpLzKXsWuN1SJE/ioe8huvqpy+xjPJboQz4rT6BFVo9tKn7+hufoNsArH
	Sqo3jwo36Kh8gS2S6+kslw8dH+OTfdkFsSYwrs0W8fTay76NygWygi4B7Di1v6QrfO8H
	n3ftuJssEsH8jkMhbiaYXOiXyJ8/Ov8w4rHuO+vq7xvHAQMkGu3UKSmC+9hkcJSGYHEf
	EA+JBT3cWjEr0BxlOfLjaK5QQo+rdjIBKYjbSAN+Qmi8LKM+5oMI4CRvZ90SzWksEPJL
	dS6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=j7POXQtZB7hKat3ysFYGEZtQF12ZeWe6BzG8HQcIBK0=;
	b=dohyZZNkMS9C4Dz4njEVsLA5BfVq9YZ9Ix7cwEuE5KjBVM4B/bByxzmHNY97u7MYM4
	/2TossjYpTwYP7hgH8sNRCU1vuo8DypfW8aqQ8VHjli80FjY3kKWeJZp8zTjtqQdKAdx
	Z6+ktZWDDZWuIbNGwe+ctfeablmQ2s4Mdu2JZSUgJXHLaRAaVJnXp9tkpbJgcQhJFT/L
	/7H2R9Gl4b4ur+qodW20vpK95ges+80fJ1bxCrT4gBur17fYSEIxBjb12oouh5DMP0CW
	elV/J4Q9cXkVFzazQsmkWYgmLGs/3zxQP6hwboOKu5E5PXRS8NoiLgVDD/CZpneffgbv
	Jfbw==
X-Gm-Message-State: APjAAAXjQ0skO7K+jYGESpB4fpVPsAvgRGzCZ9odIhvDzYpQKNZAARkH
	r+zv3yk0PHVqph1reyNwGSOoAUoBtw+KzZQvuMfviCR7
X-Google-Smtp-Source: APXvYqy2VX6Nbm6Mnfoi8kXPPrMch9APcNVmlKIepO+cpnjWtCWgrc/Gv6aitUzXWj+IY6ZoyCcHqov5N9GyATB8HJE=
X-Received: by 2002:ac2:5285:: with SMTP id q5mr17830912lfm.146.1562162722745; 
	Wed, 03 Jul 2019 07:05:22 -0700 (PDT)
MIME-Version: 1.0
References: <1561701841-10341-1-git-send-email-changqing.li@windriver.com>
In-Reply-To: <1561701841-10341-1-git-send-email-changqing.li@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 3 Jul 2019 10:05:11 -0400
Message-ID: <CADkTA4NuEn-GxV2qO3nrCuXB=xi4ZQc_-+pd+zvvTmdY3xJ2EQ@mail.gmail.com>
To: changqing.li@windriver.com
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] docker-distribution: remove docker-distribution-ptest dependencies
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
X-List-Received-Date: Wed, 03 Jul 2019 14:05:26 -0000
Content-Type: text/plain; charset="UTF-8"

merged

Bruce

On Fri, Jun 28, 2019 at 2:04 AM <changqing.li@windriver.com> wrote:
>
> From: Changqing Li <changqing.li@windriver.com>
>
> after commit https://git.openembedded.org/openembedded-core/
> commit/meta/classes/ptest.bbclass?id=b47194b57d94260b4e6438c5bf74914027f0b520
> package ${PN}-ptest will depend on ${PN} by default,
> but for docker-distribution, ${PN} is empty package, remove it from dependency
> to avoid image do rootfs failure since nothing provides error.
>
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>  recipes-containers/docker-distribution/docker-distribution_git.bb | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/recipes-containers/docker-distribution/docker-distribution_git.bb b/recipes-containers/docker-distribution/docker-distribution_git.bb
> index 25e4db9..4bf3c6e 100644
> --- a/recipes-containers/docker-distribution/docker-distribution_git.bb
> +++ b/recipes-containers/docker-distribution/docker-distribution_git.bb
> @@ -66,3 +66,5 @@ FILES_docker-registry += "${localstatedir}/lib/registry/"
>
>  SYSTEMD_SERVICE_docker-registry = "${@bb.utils.contains('DISTRO_FEATURES','systemd','docker-registry.service','',d)}"
>  SYSTEMD_AUTO_ENABLE_docker-registry = "enable"
> +
> +RDEPENDS_${PN}-ptest_remove = "${PN}"
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

