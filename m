Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C2964E00D12; Thu, 21 Mar 2019 07:54:58 -0700 (PDT)
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
	*      [209.85.167.54 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
	[209.85.167.54])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 392A3E00B43
	for <meta-virtualization@yoctoproject.org>;
	Thu, 21 Mar 2019 07:54:58 -0700 (PDT)
Received: by mail-lf1-f54.google.com with SMTP id m13so4814329lfb.6
	for <meta-virtualization@yoctoproject.org>;
	Thu, 21 Mar 2019 07:54:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=7oOh9AMth4zQa/kSbvQ3IVIdCaXfboqjwjng5LhgTaQ=;
	b=pZcTRdwAp6pLV63h9kO+aWEzxoxxCVEMq8UmUBGin6T+nZwKpiXvH8eHykgkeuotdq
	WHX/tEZ3pviZ+ZXG6zSlmNldFCLiGG15tNoWLymwKAVLWHz5th5ItLvbpTwQcFmeSkfR
	9Mc7cvP4QJisEAMkkaKHCV8jcWO2H7cYeVCllqxa29hJfh06OY83ZmUQJu0Yi0HkCdxV
	tYaYUgEVqDUqmn47upBcRgFDS1WlzSWTK22/8wu5bN8yKJRnAKcjX1srHXZ31xrQnw4U
	uK3pPnHiGKSeJ6b/v8IOvtfrBoYRbox8E16DriNt0yvlGIqQD3RziQhYvC3+mUDQ0qq+
	gh9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=7oOh9AMth4zQa/kSbvQ3IVIdCaXfboqjwjng5LhgTaQ=;
	b=BYMqEqjukR4CyBsUBuXNN5jtAGp1LkXL+jxpUDRNcr+7g8+g//RGRQtyREv27BDJjx
	XpZbQaXamWSSUOBoG9yv4tXCj1Co2yLMpFVCzvl7UqzM7Ic8oIhbTdqOQdC/91giBHVL
	TxoUoqHWj/Xm0AVvqOnHhl4/1ZtlpiS1TTKYZFcxtQrsaRukKKr2ujiED3QxWE4seM/c
	3O4Jt1J/DVJQs1qB2XOz/+mM4JMRmXRr12Qk8VTvjTqzzgsNu6xPDZDtDw2Qmbj6PGM/
	IacLcsaspgzSDehKIRujo4Eh9spKitJ3zO7Isd26u02JtiTpAghiQmeyqjYCHADHIsbX
	u+nA==
X-Gm-Message-State: APjAAAVj9R8IubSyP6KLi7tB3vkQT58Uz6zTz7Ar85zmd0Me/PMh+Iif
	/M6cbWX8NE0kWeyb3S3N3ARvElhgsu2uvqWlff4=
X-Google-Smtp-Source: APXvYqzChg7LS9ROVLV2oN6jrSPzTGsu856tvJb7rdZ7Nz8g7PRLOTlttRGm3/2IyzCcP3ZIWX8Z+faratKZMdTBQLw=
X-Received: by 2002:ac2:5966:: with SMTP id h6mr2221445lfp.86.1553180097137;
	Thu, 21 Mar 2019 07:54:57 -0700 (PDT)
MIME-Version: 1.0
References: <20190321084306.21915-1-kai.kang@windriver.com>
In-Reply-To: <20190321084306.21915-1-kai.kang@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 21 Mar 2019 10:54:46 -0400
Message-ID: <CADkTA4M5eHKOiARY2XHxWHDhpkcvsgmqfLuv8NE1wHtQgePaKQ@mail.gmail.com>
To: Kang Kai <kai.kang@windriver.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [meta-cloud-services][PATCH] glusterfs: fix installed-vs-shipped qa issue
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
X-List-Received-Date: Thu, 21 Mar 2019 14:54:58 -0000
Content-Type: text/plain; charset="UTF-8"

merged.

Bruce

On Thu, Mar 21, 2019 at 4:43 AM <kai.kang@windriver.com> wrote:
>
> From: Kai Kang <kai.kang@windriver.com>
>
> Fix installed-vs-shipped qa issue of glusterfs:
>
> | ERROR: glusterfs-5.4-r0 do_package: QA Issue: glusterfs:
>   Files/directories were installed but not shipped in any package:
> |   /usr/libexec/glusterfs/mount-shared-storage.sh
>
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---
>  recipes-extended/glusterfs/glusterfs.inc | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/recipes-extended/glusterfs/glusterfs.inc b/recipes-extended/glusterfs/glusterfs.inc
> index 17aaf75..5843d7c 100644
> --- a/recipes-extended/glusterfs/glusterfs.inc
> +++ b/recipes-extended/glusterfs/glusterfs.inc
> @@ -152,6 +152,7 @@ FILES_${PN} = "${libdir}/glusterfs/${PV}/auth \
>                 ${libexecdir}/glusterfs/events \
>                 ${libexecdir}/glusterfs/glusterfind \
>                 ${libexecdir}/glusterfs/gfind_missing_files \
> +               ${libexecdir}/glusterfs/mount-shared-storage.sh \
>                 ${libexecdir}/glusterfs/peer_mountbroker.py \
>                 ${libexecdir}/glusterfs/peer_eventsapi.py \
>                 ${libexecdir}/glusterfs/peer_mountbroker \
> --
> 2.20.0
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

