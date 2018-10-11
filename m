Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 5D64DE00A54; Thu, 11 Oct 2018 11:37:34 -0700 (PDT)
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
	*      [209.85.208.196 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
	[209.85.208.196])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 84567E00566
	for <meta-virtualization@yoctoproject.org>;
	Thu, 11 Oct 2018 11:37:33 -0700 (PDT)
Received: by mail-lj1-f196.google.com with SMTP id v6-v6so9124976ljc.11
	for <meta-virtualization@yoctoproject.org>;
	Thu, 11 Oct 2018 11:37:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=FdkpYdLGIY9z3CQnfLIzpJwnRLzCs6n45HfZO4umjeQ=;
	b=Tj7iH2QH29UnspZlczMXuPHberWktzvntKKx4IP1Qo5T0X+MUYNXRwtL+mdBGqXYga
	E0SVAg4I3IgOdC0kJ19Nduh2ysAmKiV7fIiLP1noz7QapJ4/Y7cyCr3Rxuryv4qEsq7a
	Mb9h6cdISjH2lQk8L8rqXbMP5aXIUAQ1hLwesCTTSev24Dv6fMS2Dkys19nZAZProO4z
	GTYyuypOg+ssH8I7hveN2zM3Jq/NXAFecxWbz17FPwI+wiNRR+gWPlIEWBoUy/EaApN9
	IiUgEKsSjYzetmztQAy+hDgyxAPEH/XGZxvEtdCuZcAxncoR3vx5m+Lu+8FLd9YHclpd
	xdTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=FdkpYdLGIY9z3CQnfLIzpJwnRLzCs6n45HfZO4umjeQ=;
	b=HlsjVXxwylHZPd74HUyq+azvqOeUVXNZL//qwUTqrrdMpUmmTU0oMeMf8fyBwoBuVY
	c5jrku04wT4l14B/CVZe1F0A6P7Yk4DC5DCTC/maHTy6anAkNQO/46jk5otU1bBWqv9m
	HAbocNWvum0se5NdvfKjblK4RkCtkEd9ZVWFNg0f46Z6iqBDAAGdd0MVLEAN7tCjRERB
	3AKLecoQdWoMgbQsD/VyQYoPNxn/Trfw9C3rX2E4I4+Ep2D29//x9b/hOQFQAdF4d26x
	E9moi2/xSlGvuyjRzJ147O5LqwhA0xFGSrWerfkJ2H9B70zn5q3uJmlell/kOCgmd2jQ
	atKw==
X-Gm-Message-State: ABuFfoiWYRx6Nuwczvp9fbnQrXA5Dro/zZyOGJNj3qnvf65f8rMOk4T9
	UORNGYS6rhT2ZazxZaNd8AXKmcjhbLM3vZlSL7E=
X-Google-Smtp-Source: ACcGV61B7ke2eiYd58ASS+0GvTKSv0513dUFk7CzIVkuv/XwaPfNTCI/DohrnVxaj5gxRf0b+DEekuR2iEuOZXo9uiY=
X-Received: by 2002:a2e:501c:: with SMTP id
	e28-v6mr1962048ljb.45.1539283052344; 
	Thu, 11 Oct 2018 11:37:32 -0700 (PDT)
MIME-Version: 1.0
References: <1539154754-137572-1-git-send-email-changqing.li@windriver.com>
	<1539154754-137572-2-git-send-email-changqing.li@windriver.com>
In-Reply-To: <1539154754-137572-2-git-send-email-changqing.li@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 11 Oct 2018 14:37:20 -0400
Message-ID: <CADkTA4P0Y_8+abXbYAEnR9r6Bb01YSgFa4H=t7_ZRju5GLSPqw@mail.gmail.com>
To: changqing.li@windriver.com
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] docker-distribution: fix do package qa warning[ldflags]
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
X-List-Received-Date: Thu, 11 Oct 2018 18:37:34 -0000
Content-Type: text/plain; charset="UTF-8"

merged

Bruce
On Wed, Oct 10, 2018 at 2:59 AM <changqing.li@windriver.com> wrote:
>
> From: Changqing Li <changqing.li@windriver.com>
>
> when bitbake lib32-docker-distribution, we might met below
> warning:
>
> lib32-docker-distribution-v2.6.2-r0 do_package_qa: QA Issue: No GNU_HASH
> in the elf binary: 'work/core2-32-wrsmllib32-linux/lib32-docker-distribution
> /v2.6.2-r0/packages-split/lib32-docker-registry/usr/sbin/registry' [ldflags]
>
> which caused by "INSANE_SKIP_docker-registry += "ldflags already-stripped"
> don't cover case for multilib, so add multilib prefix MLPREFIX
> to fix it.
>
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>  recipes-containers/docker-distribution/docker-distribution_git.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/recipes-containers/docker-distribution/docker-distribution_git.bb b/recipes-containers/docker-distribution/docker-distribution_git.bb
> index add5ce1..d4f8098 100644
> --- a/recipes-containers/docker-distribution/docker-distribution_git.bb
> +++ b/recipes-containers/docker-distribution/docker-distribution_git.bb
> @@ -57,7 +57,7 @@ do_install() {
>  }
>
>  INSANE_SKIP_${PN} += "ldflags already-stripped"
> -INSANE_SKIP_docker-registry += "ldflags already-stripped"
> +INSANE_SKIP_${MLPREFIX}docker-registry += "ldflags already-stripped"
>
>  FILES_docker-registry = "${sbindir}/*"
>  FILES_docker-registry += "${systemd_unitdir}/system/docker-registry.service"
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

