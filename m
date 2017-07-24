Return-Path: <asselsm@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id AD3B0E00C1C; Mon, 24 Jul 2017 12:29:57 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, RCVD_IN_DNSWL_NONE,
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.161.193 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.161.193 listed in dnsbl.sorbs.net]
Received: from mail-yw0-f193.google.com (mail-yw0-f193.google.com
	[209.85.161.193])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 20B0DE00C19
	for <meta-virtualization@yoctoproject.org>;
	Mon, 24 Jul 2017 12:29:56 -0700 (PDT)
Received: by mail-yw0-f193.google.com with SMTP id h189so5601877ywf.4
	for <meta-virtualization@yoctoproject.org>;
	Mon, 24 Jul 2017 12:29:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:reply-to:sender:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=eCdgvkOXqn6eY0wqtY4TIkdRtQoWGQvToswR/Gutrk4=;
	b=qR5ECy8bdAxwsrs57KSUczMkMI/fBQRWFTQxg3KP5HkF+jQfe3Ms6lAhjbctE4ywwT
	BB2omqOzWbnWYaUhJQdCcZ1P0M14onohPbZwK0rVD/Z2Afi1yJhep+BpJrqZQpSrFEDR
	lJKP8Oas7gVjhTNSChO1QqtLryp78J1tHdrZVaC++q/LrbjFij/IBEZwWBLQXyBF3BMW
	iuOEC7Ew2QiMR2ABzUQc7FmgxQmzTvFtcjDHV+KOUi3mEWIZTqRnkwxx3YnLprziUbQe
	zg/rwTbHKqpsRZQi6gJ8UF2f82/5yC9ghxt6SdIyTGb23p9w4MT+kFNVYwFyeKAq77hd
	+uDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:reply-to:sender:in-reply-to
	:references:from:date:message-id:subject:to:cc;
	bh=eCdgvkOXqn6eY0wqtY4TIkdRtQoWGQvToswR/Gutrk4=;
	b=eldFQETrwR4pf0G4UDvyo6aAuPV8kpivdoWr6S5FpCI5GN50g8uX37KvIg38wujNQS
	0zCRHCI4oB8txdFBjMS+1w1ieQl2Fu9hoZ8MOs/2XS/lvgvUDuM+4mN7Uzcn7d873OxN
	IJP2OEOW+g+nV8E2l9bTGuy4DtW/ttcGXjw9KhDZGd8Dt3gZZB+iDRkTIANywSGme4O6
	e7jpsawZna6SVIznSXnfN+Uaej6zsRZx2zwFhibrqB9d7lHjV5ZOo016AVb36saxaCst
	q5wclkN6thD77LjDvO6IEMaLriip3SrWDq8B8ramHfVaZvEsq5vyw2ZM9TkDI+qxSIyM
	pWrg==
X-Gm-Message-State: AIVw112qj8D66+AWSpy4JmmEoi5jfASFPMHs9noJ0FBOl+YGhUsA1Veq
	Sl7cLv7Vi+yBErXkKo3RltE8SvRUsuWD
X-Received: by 10.37.7.132 with SMTP id 126mr13878974ybh.97.1500924595888;
	Mon, 24 Jul 2017 12:29:55 -0700 (PDT)
MIME-Version: 1.0
Sender: asselsm@gmail.com
Received: by 10.37.11.134 with HTTP; Mon, 24 Jul 2017 12:29:55 -0700 (PDT)
In-Reply-To: <1500873264-24606-2-git-send-email-yi.zhao@windriver.com>
References: <1500873264-24606-1-git-send-email-yi.zhao@windriver.com>
	<1500873264-24606-2-git-send-email-yi.zhao@windriver.com>
From: Mark Asselstine <mark.asselstine@windriver.com>
Date: Mon, 24 Jul 2017 15:29:55 -0400
X-Google-Sender-Auth: phfpDSsYARP9_a5xj82fic-Ya9g
Message-ID: <CAPuovEKujQt1p+5+03X30p0NVQSOUxh1RXtAi+pjdywZZsgA1Q@mail.gmail.com>
To: Yi Zhao <yi.zhao@windriver.com>
Cc: Bruce Ashfield <bruce.ashfield@windriver.com>,
	"meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [meta-cloud-services][PATCH 1/3] libibverbs: add new recpie
X-BeenThere: meta-virtualization@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
Reply-To: mark.asselstine@windriver.com
List-Id: "Discussion of layer enabling hypervisor, virtualization tool stack,
	and cloud support" <meta-virtualization.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-virtualization>
List-Post: <mailto:meta-virtualization@yoctoproject.org>
List-Help: <mailto:meta-virtualization-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Mon, 24 Jul 2017 19:29:57 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Jul 24, 2017 at 1:14 AM, Yi Zhao <yi.zhao@windriver.com> wrote:
> Libibverbs is a library that allows userspace processes to use
> InfiniBand/RDMA 'verbs' directly.
>
> Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
> ---
>  recipes-extended/libibverbs/libibverbs_1.1.7.bb | 27 +++++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
>  create mode 100644 recipes-extended/libibverbs/libibverbs_1.1.7.bb
>
> diff --git a/recipes-extended/libibverbs/libibverbs_1.1.7.bb b/recipes-extended/libibverbs/libibverbs_1.1.7.bb
> new file mode 100644
> index 0000000..e75f90d
> --- /dev/null
> +++ b/recipes-extended/libibverbs/libibverbs_1.1.7.bb
> @@ -0,0 +1,27 @@
> +SUMMARY = "Support InfiniBand verbs"
> +DESCRIPTION = "Libibverbs is a library that allows userspace processes to use InfiniBand/RDMA 'verbs' directly."
> +HOMEPAGE = "http://www.openfabrics.org/downloads/verbs/"

I am fine with this series overall. It is nice to see an uprev to
gluster and an effort to get it working again. I only have one
request. The page above basically indicates that software which used
libibverbs should transition to rdma_core and that this software is
basically deprecated. Are we using this instead of rdma_core because
Gluster has yet to make this transition? We need to capture whatever
the reasons are in the commit log.

Regards,
Mark

> +SECTION = "libs/devel"
> +
> +LICENSE = "BSD"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=7c557f27dd795ba77cc419dddc656b51"
> +
> +# Official repo is at git://git.kernel.org/pub/scm/libs/infiniband/libibverbs.git
> +SRC_URI = "http://www.openfabrics.org/downloads/verbs/${BPN}-${PV}.tar.gz"
> +
> +SRC_URI[md5sum] = "5aea59e4766ae4548419010ac84032ff"
> +SRC_URI[sha256sum] = "31b4114bf32d41c9fc81a862ec5febed1e982975f21fa177ea9c7516c9064690"
> +
> +inherit autotools
> +
> +PACKAGES += "${PN}-utils"
> +FILES_${PN} = "${sysconfdir} ${libdir}/*.so.*"
> +FILES_${PN}-utils = "${bindir}"
> +
> +PACKAGECONFIG ??= ""
> +PACKAGECONFIG[valgrind] = "--with-valgrind,--without-valgrind,valgrind,"
> +
> +do_install_append() {
> +        mkdir -p ${D}${sysconfdir}/libibverbs.d
> +        rm -f ${D}${libdir}/libibverbs.la
> +}
> --
> 2.7.4
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization

