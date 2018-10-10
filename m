Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id AB6F1E00B81; Tue,  9 Oct 2018 20:26:29 -0700 (PDT)
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
	*      [209.85.167.68 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lf1-f68.google.com (mail-lf1-f68.google.com
	[209.85.167.68])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id F1BA1E0097C
	for <meta-virtualization@yoctoproject.org>;
	Tue,  9 Oct 2018 20:26:28 -0700 (PDT)
Received: by mail-lf1-f68.google.com with SMTP id q39-v6so2837200lfi.8
	for <meta-virtualization@yoctoproject.org>;
	Tue, 09 Oct 2018 20:26:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=OCEHciYmxVakLgWO+PlXuzkyfFok6jaQrI0f0aqReVY=;
	b=YXd/2JiWtbY2O08RWFCzcko3HshIgCfNkKZuU4oWjUkAy8cw+xY6R3AZceSoIxmuUZ
	+s1BJmnrVs3ooWLEwSNli3tGhLasAtlvdvEJc4lZzRKjVnIZwySc63+QWp1ps0OCy4RY
	NLy0/T8Nm7A5wZmGhNlrhTIpXBcaDTylCzXpbjTSvRxzl0NlRcrXN8UGLHqNjxbcIrpu
	LomzUdZiS3ymLCE9ihDo1ES/dK/rMcIQFyWqF5RVLrf+++Rgem1ZbtVzsq+lo3gAkAXE
	uUvUartSoNzazrSJs9IWaGF6U4Mo/ckejEI7g6/t1jrkd7xlhmmeEKgvPDd5UfIdea+l
	eGDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=OCEHciYmxVakLgWO+PlXuzkyfFok6jaQrI0f0aqReVY=;
	b=sVTqIgY04RQzmF16LV+6O01MqaYiDxJn6MFqxLkS7HKutwrzNJOi3ToOPbtveEw0Y8
	Wn7g9F5DzCz6BHyso6ID1srNyGi8bMaTXN5WITSTCTSOhddykuzaeAxpobCBL1iYXvsl
	CPmgNMwzgL+hoSkwivDDSzNfuQy8yhS0tLhE5dyLpIrCSS9JI+HxuxMjsSciBJPhN/au
	YWPUDQfPq0fxexjQeLkXzTRzxhP53ZC7a9wmdXwzY6qWRRsIPgQ8NVVSzAUL1y9UdF/G
	/IvEyolgzix/ZiAYi+rMCmYtZlUCnEFM4xx2LFb5n9vWHKe+e003VgACELrMVo4cPHeX
	SKPA==
X-Gm-Message-State: ABuFfog2Qs350A4vyH0YPin/hP/3zRDSW9s/jAaTg0GRhi8weAanw3MV
	RzAz76aQcrTnoE0pWGGGyizQ271JRN7YN8n1jDY=
X-Google-Smtp-Source: ACcGV63g51clI3cjMGzOOOE4a5rw26HT7Vg2F6OSbTWeqZ41MEC7H7NdlJXdcP9DGiPeOS/lWa4G3SgFkOBfYDeGZpI=
X-Received: by 2002:a19:e21c:: with SMTP id
	z28-v6mr16653121lfg.20.1539141987756; 
	Tue, 09 Oct 2018 20:26:27 -0700 (PDT)
MIME-Version: 1.0
References: <1539136093-3457-1-git-send-email-dengke.du@windriver.com>
In-Reply-To: <1539136093-3457-1-git-send-email-dengke.du@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 9 Oct 2018 23:26:16 -0400
Message-ID: <CADkTA4PtUQtntuRa9Ynbn6YLa8_wvE7a1_b8-BVO5HM1+WuOng@mail.gmail.com>
To: Dengke Du <dengke.du@windriver.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH V3] ceph: only support x86-64
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
X-List-Received-Date: Wed, 10 Oct 2018 03:26:29 -0000
Content-Type: text/plain; charset="UTF-8"

v3 is merged.

Bruce

On Tue, Oct 9, 2018 at 9:49 PM Dengke Du <dengke.du@windriver.com> wrote:
>
> Signed-off-by: Dengke Du <dengke.du@windriver.com>
> ---
>  0001-ceph-only-support-x86-64.patch  | 22 ++++++++++++++++++++++
>  recipes-extended/ceph/ceph_13.2.1.bb |  1 +
>  2 files changed, 23 insertions(+)
>  create mode 100644 0001-ceph-only-support-x86-64.patch
>
> diff --git a/0001-ceph-only-support-x86-64.patch b/0001-ceph-only-support-x86-64.patch
> new file mode 100644
> index 0000000..c907e23
> --- /dev/null
> +++ b/0001-ceph-only-support-x86-64.patch
> @@ -0,0 +1,22 @@
> +From c1410631e368569f8fa03a2a72938e603eb92578 Mon Sep 17 00:00:00 2001
> +From: Dengke Du <dengke.du@windriver.com>
> +Date: Mon, 8 Oct 2018 15:33:25 +0800
> +Subject: [PATCH V2] ceph: only support x86-64
> +
> +Signed-off-by: Dengke Du <dengke.du@windriver.com>
> +---
> + recipes-extended/ceph/ceph_13.2.1.bb | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/recipes-extended/ceph/ceph_13.2.1.bb b/recipes-extended/ceph/ceph_13.2.1.bb
> +index d7186b9..7888e64 100644
> +--- a/recipes-extended/ceph/ceph_13.2.1.bb
> ++++ b/recipes-extended/ceph/ceph_13.2.1.bb
> +@@ -60,3 +60,4 @@ FILES_${PN}-dev += "\
> + RDEPENDS_${PN} += "\
> +               python \
> + "
> ++COMPATIBLE_MACHINE = "(qemux86-64|intel-x86-64)"
> +--
> +2.7.4
> +
> diff --git a/recipes-extended/ceph/ceph_13.2.1.bb b/recipes-extended/ceph/ceph_13.2.1.bb
> index d7186b9..e89bbeb 100644
> --- a/recipes-extended/ceph/ceph_13.2.1.bb
> +++ b/recipes-extended/ceph/ceph_13.2.1.bb
> @@ -60,3 +60,4 @@ FILES_${PN}-dev += "\
>  RDEPENDS_${PN} += "\
>                 python \
>  "
> +COMPATIBLE_HOST = "(x86_64).*"
> --
> 2.7.4
>


-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

