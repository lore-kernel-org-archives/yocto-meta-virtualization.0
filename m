Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 690DFE00A16; Fri, 12 Oct 2018 07:32:25 -0700 (PDT)
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
	*      [209.85.208.195 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com
	[209.85.208.195])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id AC0BEE00A0A
	for <meta-virtualization@yoctoproject.org>;
	Fri, 12 Oct 2018 07:32:24 -0700 (PDT)
Received: by mail-lj1-f195.google.com with SMTP id u21-v6so11550281lja.8
	for <meta-virtualization@yoctoproject.org>;
	Fri, 12 Oct 2018 07:32:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=FjUP8wLNlW3S6Eutd5Y2Nj2M+0oCqVfacKKtskl9B2Q=;
	b=rLg9/NaMEGtDWg0U5G4s6UoQ6OXePqjh56561zgloATlTMP3AejjYrW7iaNusPqurY
	etgo7a/2+DsTPbiaLLJ6e5qBoAn+BZXJ5tK6T3qsoGRq2d6eu5/agpqejovaeyqhAILY
	u0KJsS8JwOMckBP2Ygla0ssLuv/MtBE7NH9yC/7YwZA1dovdxg2KMxTtfsFZKo/T20oi
	1OIKt8Fj5OvwhCNTXgJGbY0ywPyW/S4qktw+VLuMInmPesImgoXTn3h+FxQUm044aJPV
	6ldOPcpUtwV8Pxjq0Ctha0W2KKL9Fe5G3ihKtI55VCir+tujTEFsuv0+KVbO9k1hS16H
	jgEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=FjUP8wLNlW3S6Eutd5Y2Nj2M+0oCqVfacKKtskl9B2Q=;
	b=bpeRNnKfW/sEASK1lCUw1aa0Dg1JDvpxC6CwVhTTXYF0aA9OTT9d1rixvNaqNLw48z
	xRauRJ0pODE4bqv4WNFcQwznVQte5HpknPAQ9ywIdQhjlobarT9rgwfTcGfh85FJuS91
	yWSDY3bz9/IhvladfDjv3AIsiR4msOH7b6u+NZqTQhGqjZOMscSIN/SMasdlR4zQPGEM
	SDYxtwfuPQt2Tu534uWbpMQ4VX5M/aCQ0uJyiGLEp6BclwGpdQ0lGgF8D/ivpydhmNV+
	39qfRoFGNOt/aO+cvD0816DVLBFyJnl+K6MEJ4/6md4rpy6vBnlzo9aJ67foHfVuM+w8
	OOpw==
X-Gm-Message-State: ABuFfogRLDXaJmyW031+B62vV6GAhen8+8uAdbxzYTuL/tBe3cZpGj2v
	xpqgKi1Fkst2zwA+mSJ9b8b7EYQXRK8UiJNimBk=
X-Google-Smtp-Source: ACcGV63Y/fSyWC2EMiagMx7dIsSaHyPG4nAHr33/uNEBA/1FVOuGtc1UQkPPQSl7z8Ntn2BH1sfhAJfqopuQ8AqoKus=
X-Received: by 2002:a2e:8919:: with SMTP id
	d25-v6mr4649613lji.69.1539354743437; 
	Fri, 12 Oct 2018 07:32:23 -0700 (PDT)
MIME-Version: 1.0
References: <1539332115-342326-1-git-send-email-mingli.yu@windriver.com>
In-Reply-To: <1539332115-342326-1-git-send-email-mingli.yu@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 12 Oct 2018 10:32:12 -0400
Message-ID: <CADkTA4OGMdRK=5VUyeTzYGHdqqfMw8CHEKDwSGcwY_uQa0UtwQ@mail.gmail.com>
To: "Yu, Mingli" <mingli.yu@windriver.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [meta-cloud-services][PATCH v2 1/2] libibverbs: Update SRC_URI
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
X-List-Received-Date: Fri, 12 Oct 2018 14:32:25 -0000
Content-Type: text/plain; charset="UTF-8"

merged

Bruce
On Fri, Oct 12, 2018 at 4:15 AM <mingli.yu@windriver.com> wrote:
>
> From: Mingli Yu <Mingli.Yu@windriver.com>
>
> Update SRC_URI for libibverbs as the
> previous one is invalid.
>
> Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
> ---
>  recipes-extended/libibverbs/libibverbs_1.1.7.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/recipes-extended/libibverbs/libibverbs_1.1.7.bb b/recipes-extended/libibverbs/libibverbs_1.1.7.bb
> index b3cd73f..e7e8d65 100644
> --- a/recipes-extended/libibverbs/libibverbs_1.1.7.bb
> +++ b/recipes-extended/libibverbs/libibverbs_1.1.7.bb
> @@ -7,7 +7,7 @@ LICENSE = "BSD"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=7c557f27dd795ba77cc419dddc656b51"
>
>  # Official repo is at git://git.kernel.org/pub/scm/libs/infiniband/libibverbs.git
> -SRC_URI = "http://www.openfabrics.org/downloads/verbs/${BPN}-${PV}.tar.gz"
> +SRC_URI = "https://www.openfabrics.org/downloads/verbs/${BPN}-${PV}.tar.gz"
>
>  SRC_URI[md5sum] = "5aea59e4766ae4548419010ac84032ff"
>  SRC_URI[sha256sum] = "31b4114bf32d41c9fc81a862ec5febed1e982975f21fa177ea9c7516c9064690"
> --
> 2.7.4
>


-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

