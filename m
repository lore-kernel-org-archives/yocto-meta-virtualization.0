Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 448EAE00D4D; Wed, 15 Nov 2017 13:02:24 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.216.193 listed in list.dnswl.org]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (bruce.ashfield[at]gmail.com)
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-qt0-f193.google.com (mail-qt0-f193.google.com
	[209.85.216.193])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9A8ECE00C11
	for <meta-virtualization@yoctoproject.org>;
	Wed, 15 Nov 2017 13:02:23 -0800 (PST)
Received: by mail-qt0-f193.google.com with SMTP id h42so15771240qtk.11
	for <meta-virtualization@yoctoproject.org>;
	Wed, 15 Nov 2017 13:02:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=rOipzOsoanRBK4TXZNKQVaJs2WUSdLXHZstR4MjjKFc=;
	b=vCS/WjN/0i+w4YhmaL3/QiuyVSGF8UrrDD4V3Lf4ZGj7OBEzsby4DyDwJmGJcOqd2m
	dDzDfLD9RlftBXXX9p725EV7vF1znSrGGlU4ihw6BsRjYI+q3uZpiarTxAuGxSJcSbV5
	Imv+NxWXJ2PGsdBg/2QbSQpM/Tgz9kWOODG67ZFs4e2IjgjBEnXWOEwWyPDk3gYssPZG
	en+L+nI3+oAogHd9OxzZ1W1nMH+6jsVgJzxD2qt4BKKYKykjdyhqSA9FABxmQpfBIhy6
	THOP9Kg0hP8NYY4a8lIdfYqonCkG1JSQMS+v73iisaGQpLGf8n1oLXMfPBfgzt/Ei/3h
	nB9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=rOipzOsoanRBK4TXZNKQVaJs2WUSdLXHZstR4MjjKFc=;
	b=MXdZSq/+X3B0Tkg52V5bg+rFnUxN4som2ZCUOr5G+OoC1htaE28jlD6fpI8PLCCgOy
	4P/TG9gwqKwb4XCuqjxlY2nbnakZnu8M9vJQGyjlmKvpvMDF0fbaQ/l0g8V7yz23hhZN
	GfQRDF62oXx2EkyPjVl4MelzmEVeLFLc6X60I07LB+gzdOgUCwEGxR0eIQEKyCWeUbg3
	JJGhLxJRTOrLrKKWyv5IY80lnNxHJJwkh3qpVONt7DHuwYCzWoR3d+D/b0tvcmsVzMsn
	7MTGekKvOsBhFlkNPEhOzuNHfxAM9aoi4cqXZNIvJJaAD9Oh2vRQJ4VeMhqEaKTqZqvI
	8pnA==
X-Gm-Message-State: AJaThX6SnE5o27PSc3gv25za0XlOJaBfNuj5xhVQkcBoDCUba8OuekLf
	lYAjvYeby4JY8S5+2IQYx1aeE0L7WrdcLFyTaEo=
X-Google-Smtp-Source: AGs4zMaHpPjjw9BgGHs0bzguAebMFviDU2B2iZRE/EOSfHRmlUKFkZnbWMlUBy97S9SbtBjjiiKqMZNdqCTYUhunbR4=
X-Received: by 10.55.121.2 with SMTP id u2mr25427266qkc.19.1510779742731; Wed,
	15 Nov 2017 13:02:22 -0800 (PST)
MIME-Version: 1.0
Received: by 10.12.182.80 with HTTP; Wed, 15 Nov 2017 13:02:22 -0800 (PST)
In-Reply-To: <1510762102-47580-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
References: <1510762102-47580-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 15 Nov 2017 16:02:22 -0500
Message-ID: <CADkTA4MUrKNocVrK-B1b856LZtt42y2_zQyNaL1exGZLAEwTaQ@mail.gmail.com>
To: zhengrq <zhengrq.fnst@cn.fujitsu.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [meta-cloud-services][PATCH]python-logutils: upgrade to 0.3.5
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
X-List-Received-Date: Wed, 15 Nov 2017 21:02:24 -0000
Content-Type: text/plain; charset="UTF-8"

merged

Bruce

On Wed, Nov 15, 2017 at 11:08 AM, zhengrq <zhengrq.fnst@cn.fujitsu.com> wrote:
> 1) Upgrade python-logutils from 0.3.3 to 0.3.5.
>
> 2) Modify LIC_FILES_CHKSUM as Copyright (c) in LICENSE.txt has been changed from 2008-2013 to 2008-2017.
>
> Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
> ---
>  .../python/{python-logutils_0.3.3.bb => python-logutils_0.3.5.bb} | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>  rename meta-openstack/recipes-devtools/python/{python-logutils_0.3.3.bb => python-logutils_0.3.5.bb} (57%)
>
> diff --git a/meta-openstack/recipes-devtools/python/python-logutils_0.3.3.bb b/meta-openstack/recipes-devtools/python/python-logutils_0.3.5.bb
> similarity index 57%
> rename from meta-openstack/recipes-devtools/python/python-logutils_0.3.3.bb
> rename to meta-openstack/recipes-devtools/python/python-logutils_0.3.5.bb
> index 5b72be1..80c9490 100644
> --- a/meta-openstack/recipes-devtools/python/python-logutils_0.3.3.bb
> +++ b/meta-openstack/recipes-devtools/python/python-logutils_0.3.5.bb
> @@ -2,15 +2,15 @@ DESCRIPTION = "Set of handlers for the Python standard library's logging package
>  HOMEPAGE = "https://pypi.python.org/pypi/logutils"
>  SECTION = "devel/python"
>  LICENSE = "BSD"
> -LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=5b3cbf3c3220969afbf461f4a6ac97c9"
> +LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=44c35f0b8e2a27a2f33a4e4a5c65d014"
>
>  PR = "r0"
>  SRCNAME = "logutils"
>
> -SRC_URI = "https://pypi.python.org/packages/source/l/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
> +SRC_URI = "https://pypi.python.org/packages/49/b2/b57450889bf73da26027f8b995fd5fbfab258ec24ef967e4c1892f7cb121/logutils-0.3.5.tar.gz"
>
> -SRC_URI[md5sum] = "07b2a31d3d48e4f748363d33c03639cd"
> -SRC_URI[sha256sum] = "4042b8e57cbe3b01552b3c84191595ae6c36f1ab5aef7e3a6ce5c2f15c297c9c"
> +SRC_URI[md5sum] = "fcd2f8e9217bfa0b580f253b35a9d954"
> +SRC_URI[sha256sum] = "bc058a25d5c209461f134e1f03cab637d66a7a5ccc12e593db56fbb279899a82"
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

