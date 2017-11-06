Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 27B8EE00D17; Mon,  6 Nov 2017 05:53:23 -0800 (PST)
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
	*      [209.85.216.172 listed in list.dnswl.org]
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.216.172 listed in dnsbl.sorbs.net]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-qt0-f172.google.com (mail-qt0-f172.google.com
	[209.85.216.172])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0856BE00D03
	for <meta-virtualization@yoctoproject.org>;
	Mon,  6 Nov 2017 05:53:21 -0800 (PST)
Received: by mail-qt0-f172.google.com with SMTP id j58so10971544qtj.0
	for <meta-virtualization@yoctoproject.org>;
	Mon, 06 Nov 2017 05:53:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=IIB+NIdEtopkgvKJEUOZnY2Xxh78uOiND6CE/hEU0BI=;
	b=jBjKx1TIWSRGguY9aEPBJi2PCUR641Q8ZQy148ss8iUq4gf0vczK6lktsLuoPhYIkf
	W3nY/8lkyGFm3XECCW1ixLOgr3WPXwSoqcwjsxeWoXrMa6iUKIbXnTW13cDzRijPcWG2
	Q4GaUYOaykDkbgcN/BRZPiHEgsBETcW7olxYKkYE5uxaSZ313Ac1X5pYZKMPd/9vWTjS
	YWt65to5Wc5f1MGP5vaGjTKL02MOvqemxxVopMRxgqeEbtsDCprDtD3+5m4kqh1Vqigf
	Tvrn0vXIPa0Nx9tS0HQRNXfZ7dAWUuSMSyofnrjJLoHG4qqbzX/1Y9njMJW0j4HKC9TG
	rPrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=IIB+NIdEtopkgvKJEUOZnY2Xxh78uOiND6CE/hEU0BI=;
	b=HmQ+YvkkpQEzultFwvlY+k9zORHIhAJj8NhSY9Evdg0P+5Y7czbXcQ9OXA0fo4iUjx
	Q921odVmFBrS++sp61hnG6A/2qQtoZN5xrc2e8MDwpIn0GxEAmmsB8HLVDHVnK7nS5oV
	w7xQZan98AAs+GHcnV8poWNP/+p+HC3AzPjCFIl9938BoebOPowLJouRcZG/m3TOJvOf
	8OFdwdv7vuVOQvp5ecO+djnaal0+tZqVI5xP9ZyHW2XSMV755lodTkTMtvc+fKdUKnWB
	tH5FZMZQEg5v3Vh34lSwVtbvUKDNcySiED0yhvirUIQzioux0ZBuWWf3hKehWGb1ooYQ
	uUqA==
X-Gm-Message-State: AMCzsaXULrfCFrAMfECz+vsLIAVNQLJC9dVqyLngUT0bp9vblJFbT5+J
	5kEIg2PiLIfPef5oOyE8ej5UAr7DPRvfUzge3B4brg==
X-Google-Smtp-Source: ABhQp+QUCCcImWk4vXPf5AN7L5uPwt1RXqnxW7YmKL+7IXDAtROwXA4hXsTugueMXxJIDUglN1hnGdqlaPc2aXeyscY=
X-Received: by 10.200.48.103 with SMTP id g36mr23167017qte.289.1509976401084; 
	Mon, 06 Nov 2017 05:53:21 -0800 (PST)
MIME-Version: 1.0
Received: by 10.12.182.80 with HTTP; Mon, 6 Nov 2017 05:53:20 -0800 (PST)
In-Reply-To: <1509810903-19796-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
References: <1509810903-19796-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 6 Nov 2017 08:53:20 -0500
Message-ID: <CADkTA4Nq4vCn4oqXFYd_bL0fONJd0jMpdm+Zi-E6vhjw34RDPA@mail.gmail.com>
To: zhengrq <zhengrq.fnst@cn.fujitsu.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [meta-cloud-services][PATCH]python-httplib2: upgrade to 0.10.3
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
X-List-Received-Date: Mon, 06 Nov 2017 13:53:23 -0000
Content-Type: text/plain; charset="UTF-8"

merged.

Bruce

On Sat, Nov 4, 2017 at 11:55 AM, zhengrq <zhengrq.fnst@cn.fujitsu.com> wrote:
> 1) Upgrade python-httplib2 from 0.9.2 to 0.10.3.
>
> 2) Modify LIC_FILES_CHKSUM as home-page in PKG-INFO has been changed from https://github.com/jcgregorio/httplib2 to https://github.com/httplib2/httplib2
>
> Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
> ---
>  .../{python-httplib2_0.9.2.bb => python-httplib2_0.10.3.bb}       | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>  rename meta-openstack/recipes-devtools/python/{python-httplib2_0.9.2.bb => python-httplib2_0.10.3.bb} (52%)
>
> diff --git a/meta-openstack/recipes-devtools/python/python-httplib2_0.9.2.bb b/meta-openstack/recipes-devtools/python/python-httplib2_0.10.3.bb
> similarity index 52%
> rename from meta-openstack/recipes-devtools/python/python-httplib2_0.9.2.bb
> rename to meta-openstack/recipes-devtools/python/python-httplib2_0.10.3.bb
> index 711411b..e2b27e7 100644
> --- a/meta-openstack/recipes-devtools/python/python-httplib2_0.9.2.bb
> +++ b/meta-openstack/recipes-devtools/python/python-httplib2_0.10.3.bb
> @@ -2,14 +2,14 @@ DESCRIPTION = "A comprehensive HTTP client library"
>  HOMEPAGE = "https://code.google.com/p/httplib2/"
>  SECTION = "devel/python"
>  LICENSE = "MIT"
> -LIC_FILES_CHKSUM = "file://PKG-INFO;md5=01abba5d32279f9ed6b3350390258547"
> +LIC_FILES_CHKSUM = "file://PKG-INFO;md5=41a98bc55b04b2a38acdb5c8ab0ae6b2"
>
>  SRCNAME = "httplib2"
>
> -SRC_URI = "https://pypi.python.org/packages/ff/a9/5751cdf17a70ea89f6dde23ceb1705bfb638fd8cee00f845308bf8d26397/${SRCNAME}-${PV}.tar.gz"
> +SRC_URI = "https://pypi.python.org/packages/e4/2e/a7e27d2c36076efeb8c0e519758968b20389adf57a9ce3af139891af2696/${SRCNAME}-${PV}.tar.gz"
>
> -SRC_URI[md5sum] = "bd1b1445b3b2dfa7276b09b1a07b7f0e"
> -SRC_URI[sha256sum] = "c3aba1c9539711551f4d83e857b316b5134a1c4ddce98a875b7027be7dd6d988"
> +SRC_URI[md5sum] = "709c305e1b00e9c0af49ee816429569c"
> +SRC_URI[sha256sum] = "e404d3b7bd86c1bc931906098e7c1305d6a3a6dcef141b8bb1059903abb3ceeb"
>
>  S = "${WORKDIR}/${SRCNAME}-${PV}"
>
> --
> 2.7.4
>
>
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

