Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lb0-f170.google.com (mail-lb0-f170.google.com
	[209.85.217.170])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 546D0E00AC1
	for <meta-virtualization@yoctoproject.org>;
	Wed, 19 Mar 2014 08:00:17 -0700 (PDT)
Received: by mail-lb0-f170.google.com with SMTP id s7so6083888lbd.29
	for <meta-virtualization@yoctoproject.org>;
	Wed, 19 Mar 2014 08:00:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=nCSNriWGe3PgLiXlgfkTvjNzyY3hJ/VR+VYsdl+8DNE=;
	b=jqDcZP2E8uk0f99r5nJ8pnHyC1Cfe8h1CptxuSuUm8A/uFwIfhf/6gigRyqjLKl4fp
	ZJf7jQ4PGg49tUb6cQqrjvCV9l3Ufax9N6s+bOAaWI30GvfX2irJioiV6bC6NpGP2Cyi
	DAEHNTiNrLHPEMjLbvZOhNvr7oxyFLc0ygxal5cBIuhQgDX4Myl6mi0TCKXNaWQMSkoO
	0ixbVumakKgVUoTUWdzZydrAuxuT2X6Ufr1ivU+c1N1jPPkrZnEJbGn343+Ir6ATNd7w
	uIMi+vlL9obqBs1dOkWeWRFbUBuy5MxzMmLY19kom6cE+IZN0aPApUfJez8GfIkboNbX
	EWYw==
MIME-Version: 1.0
X-Received: by 10.112.151.146 with SMTP id uq18mr2015528lbb.38.1395241215968; 
	Wed, 19 Mar 2014 08:00:15 -0700 (PDT)
Received: by 10.112.170.166 with HTTP; Wed, 19 Mar 2014 08:00:15 -0700 (PDT)
In-Reply-To: <1395138852-21444-1-git-send-email-mihaela.sendrea@enea.com>
References: <1395138852-21444-1-git-send-email-mihaela.sendrea@enea.com>
Date: Wed, 19 Mar 2014 11:00:15 -0400
Message-ID: <CADkTA4PikYAfLRvu8RGr=nJekCp77maEjk9NJLOOwPAYt+EZ0g@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Mihaela Sendrea <mihaela.sendrea@enea.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH 0/2] libvirt ptest support and update to version 1.2.2
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
X-List-Received-Date: Wed, 19 Mar 2014 15:00:18 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Mar 18, 2014 at 6:34 AM, Mihaela Sendrea
<mihaela.sendrea@enea.com> wrote:
> Hi,
>
> This patch series adds libvirt to ptest framework and updates to 1.2.2.
> The testsuite summary for libvirt 1.2.2 looks similar to the one for libvirt 1.2.1 (8 new tests come with the new livbirt version).

This looks good to me. I threw the two other uprev patches to 1.2.2 out and
took your series, since it comes with testing information :)

Thanks for the update.

Bruce

>
> Best regards,
> Mihaela Sendrea.
>
> Mihaela Sendrea (2):
>   libvirt: Add ptest support
>   libvirt: Update version to 1.2.2
>
>  recipes-extended/libvirt/libvirt-python.inc        |   4 +-
>  recipes-extended/libvirt/libvirt/run-ptest         |   3 +
>  recipes-extended/libvirt/libvirt/runptest.patch    | 112 +++++++++++++++++++++
>  .../libvirt/{libvirt_1.2.1.bb => libvirt_1.2.2.bb} |  43 +++++++-
>  4 files changed, 155 insertions(+), 7 deletions(-)
>  create mode 100644 recipes-extended/libvirt/libvirt/run-ptest
>  create mode 100644 recipes-extended/libvirt/libvirt/runptest.patch
>  rename recipes-extended/libvirt/{libvirt_1.2.1.bb => libvirt_1.2.2.bb} (87%)
>
> --
> 1.8.5.3
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

