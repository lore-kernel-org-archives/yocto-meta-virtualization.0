Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id F3BBAE00D46; Thu, 19 Oct 2017 20:56:44 -0700 (PDT)
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
	*      [209.85.216.193 listed in list.dnswl.org]
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.216.193 listed in dnsbl.sorbs.net]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-qt0-f193.google.com (mail-qt0-f193.google.com
	[209.85.216.193])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3C883E00D41
	for <meta-virtualization@yoctoproject.org>;
	Thu, 19 Oct 2017 20:56:43 -0700 (PDT)
Received: by mail-qt0-f193.google.com with SMTP id 8so17054044qtv.1
	for <meta-virtualization@yoctoproject.org>;
	Thu, 19 Oct 2017 20:56:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=xoVOXWOTcmjETN7vZISkjLZzhdATipr4elFg6ldc2ko=;
	b=as/1lx189CRCtstiWA6EBhc0vmxwB09pyL4+7pOvxXFt/ezAgVJX9CqTozPOpEThWO
	rC2rO3QG4U+jwrNgOwYUltxK3EMqomlI4UHVTu++amHTptlHL5d+5UVW/gbd4n9lWp1t
	Gq0kDVoaD1XQvQUPiKawj50KHyuTg5eFwo/zB7xFeRGAlaXMb6pJj+pxERs/plkLKMOQ
	NrcGgNDLZGUVr4moa7FTLv8bpV9kPXLBYfNRugnSfcUt+QGd+jFbnrwrADpcLQJOqPOm
	aCIC/d94nEimu/Q4FrmER4Sb/g0cwINAtHFJ5SPaxJKuDGBIuEVr2ntvMrIPuCs7xmDZ
	cFOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=xoVOXWOTcmjETN7vZISkjLZzhdATipr4elFg6ldc2ko=;
	b=IbNjIpMWNGsCNiKkiD4+aMSMkTJ2wNe70cTBCp0wqhKOVseJiAoUlNUpd8WCMGmbOg
	HXyk+EGY3F7/rcUqhFBXYqd3k6v2Pt5Fpfgg2KeFsHOIeDB5mj+QAn7p5dcdK/bs1cJw
	7twP6pAlkQvMGW7qRnxrlwDABNNpsjr5IpW65U8ZPH977v5+HXaBVraC3RQjhs9Zu7qm
	qgiLjwVf9+Zbz30RHbqOAtX1Xdjq+lMKJKBF6lXFNMhQLLXiXUDkVk999RCRr7euQbiC
	3Mc8naK+wguBHbm2XhQ8tuXvglH+6QdCNUCIRp+fAlzOYsgd/fccHpMoOR7jsPi7aKrL
	dj1g==
X-Gm-Message-State: AMCzsaXoG/8OhIt+2BHwoHnVur3uPGZ9LqvCsWVZIPZ6Gfk2enlJKfQ9
	e8tB54vIFkRnatm7G6m3kJ9ngYkTc8L4wYjz6uU=
X-Google-Smtp-Source: ABhQp+Ti+pJVMoRE2VJ2q50+AXAAePy2iANc9J4f/WPdiyRY905zM7MJ0sFtAdbTE4fBTxF25DWuP4Z5kJOIv1ame+U=
X-Received: by 10.200.45.110 with SMTP id o43mr5526084qta.80.1508471803346;
	Thu, 19 Oct 2017 20:56:43 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.12.182.80 with HTTP; Thu, 19 Oct 2017 20:56:42 -0700 (PDT)
In-Reply-To: <20171020012126.3575-1-kai.kang@windriver.com>
References: <20171020012126.3575-1-kai.kang@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 19 Oct 2017 23:56:42 -0400
Message-ID: <CADkTA4Op7A53NThX7zxgDaZZzJM+D+fq88t2KKjBt4BdessXoA@mail.gmail.com>
To: Kang Kai <kai.kang@windriver.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH 1/2] linux-yocto: remove bbappend for 4.1
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
X-List-Received-Date: Fri, 20 Oct 2017 03:56:45 -0000
Content-Type: text/plain; charset="UTF-8"

I just pushed a patch to do this, but thanks for the change regardless!

Bruce

On Thu, Oct 19, 2017 at 9:21 PM,  <kai.kang@windriver.com> wrote:
> From: Kai Kang <kai.kang@windriver.com>
>
> Remove linux-yocto bbappend of version 4.1 which has been removed in
> oe-core by:
>
> http://ala-git.wrs.com/cgit/oe-core/commit/?id=1a25cea311cbebb2af0c1a0b964208281e6026de
>
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---
>  meta-openstack/recipes-kernel/linux/linux-yocto_4.1.bbappend | 9 ---------
>  1 file changed, 9 deletions(-)
>  delete mode 100644 meta-openstack/recipes-kernel/linux/linux-yocto_4.1.bbappend
>
> diff --git a/meta-openstack/recipes-kernel/linux/linux-yocto_4.1.bbappend b/meta-openstack/recipes-kernel/linux/linux-yocto_4.1.bbappend
> deleted file mode 100644
> index 843546c..0000000
> --- a/meta-openstack/recipes-kernel/linux/linux-yocto_4.1.bbappend
> +++ /dev/null
> @@ -1,9 +0,0 @@
> -FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
> -
> -SRC_URI += "file://enable-veth.cfg \
> -            file://enable-iscsi-tcp.cfg \
> -            file://enable-nbd.cfg \
> -            file://enable-rtlink.cfg \
> -            file://nf.scc \
> -            file://nfs.scc \
> -       "
> --
> 2.14.1
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

