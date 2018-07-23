Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id CFAC0E00C99; Mon, 23 Jul 2018 12:54:02 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.208.181 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com
	[209.85.208.181])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B5101E00C74
	for <meta-virtualization@yoctoproject.org>;
	Mon, 23 Jul 2018 12:54:01 -0700 (PDT)
Received: by mail-lj1-f181.google.com with SMTP id v9-v6so1570055ljk.4
	for <meta-virtualization@yoctoproject.org>;
	Mon, 23 Jul 2018 12:54:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=7N6hRA/XlUj8T8CHE7XRpKZZgFsNcPlkB0KLwDHkL4M=;
	b=uvffw9wXjyhRWmRejxIZGELvqY5s6nD7ePqqPucQ4W0OxS/cYIyYTnuCsRCuZj3Giq
	SYRIW1ZVEQSoa97/2h2kUGLBc0MZY7ZciOEYv3E9yuQlv0wNuXt7x05bkua1mjsHPKVv
	vIb3iGf7t63ZjKEmQ7TPP9yqxFf94D1oCUaNRY2gqJ1A3XdRfuuqd8hHTjl4OOj1V8en
	X1Z8IlVvIRwmfoR2vWTY+LcOp3DWe9UZcpK3XSASWnUvCpHaiUVtCkGOvRuqFigdpEk4
	D0kB87Jhy8QEMEwEIEJCOSd7LsC0EsRHbCXWLc3n3/WTiBPgmQmofDn01630Vsc3I578
	VRzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=7N6hRA/XlUj8T8CHE7XRpKZZgFsNcPlkB0KLwDHkL4M=;
	b=icWClo46pwhqIFCwFlGf1/JMztcGOTXvcg+kGKygqiuzKwDBJFZqWBZpjj8wFrgPth
	X4i57R7IqYQwT6ekRQgLd2zAt6CEJCF5+sa3SIlZWqRgP/3LYHfkaZ3bLBwoaSvJYSmF
	VAPaHbfRaUZqaIwCPT6ah9fql/X8/w7/v33ysdEpR3bPkYl9QRhv/wETEw4r2+n9mVp4
	wHCpGckEmZ308g0OwW1gQ/tRr5tYNPxYZ7xgC3orpIup1kU3pvL5x/a5y/BA6jBsHJDA
	fWPBXH82zIfVmUZfD480O0kmEUng+qhdBBaQVM+SCnVOxPALlsJdJpcRgY3k4JUA77FK
	ZbbA==
X-Gm-Message-State: AOUpUlEZRqrS+4A+x4RJL9fRqUnGfaKH4tsOpj33y7j2wLJRlEd+GFu9
	kmQN5VcOsCDylZaLJm/QWB/0JknSnZ+411C5Log=
X-Google-Smtp-Source: AAOMgpdbsXY9pCGdzPF5YAiEKwWavXUIUTQbANDMX0+ZVJiV6FPy2J/AqytdmaZJI+Ty/aK+M5b8V3CRR8l6IEkJy6s=
X-Received: by 2002:a2e:2d2:: with SMTP id
	y79-v6mr9484204lje.100.1532375640129; 
	Mon, 23 Jul 2018 12:54:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a2e:9acd:0:0:0:0:0 with HTTP; Mon, 23 Jul 2018 12:53:59
	-0700 (PDT)
In-Reply-To: <20180723090011.11902-2-hongl.fnst@cn.fujitsu.com>
References: <20180723090011.11902-1-hongl.fnst@cn.fujitsu.com>
	<20180723090011.11902-2-hongl.fnst@cn.fujitsu.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 23 Jul 2018 15:53:59 -0400
Message-ID: <CADkTA4MZhJfSwt0LfrVgHwF2QVXsWp1DOMX-7JWJsoxFtfHhcg@mail.gmail.com>
To: Hong Liu <hongl.fnst@cn.fujitsu.com>
Cc: meta-virtualization@yoctoproject.org
Subject: =?UTF-8?B?UmU6IFtQQVRDSF0gW21ldGEtY2xvdWQtc2VydmljZXNdW3BhdGNoXe+8mnRndDoxLjAuNjcgLT4gMS4wLjcz?=
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
X-List-Received-Date: Mon, 23 Jul 2018 19:54:02 -0000
Content-Type: text/plain; charset="UTF-8"

merged.

Bruce

On Mon, Jul 23, 2018 at 5:00 AM, Hong Liu <hongl.fnst@cn.fujitsu.com> wrote:
> Upgrade tgt from 1.0.67 to 1.0.73
>
> Signed-off-by: Hong Liu <hongl.fnst@cn.fujitsu.com>
> ---
>  meta-openstack/recipes-support/tgt/tgt_git.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta-openstack/recipes-support/tgt/tgt_git.bb b/meta-openstack/recipes-support/tgt/tgt_git.bb
> index 9ca181a..f4e12da 100644
> --- a/meta-openstack/recipes-support/tgt/tgt_git.bb
> +++ b/meta-openstack/recipes-support/tgt/tgt_git.bb
> @@ -4,8 +4,8 @@ LICENSE = "GPLv2"
>  LIC_FILES_CHKSUM = "file://scripts/tgtd.spec;beginline=7;endline=7;md5=21c19ea7dad04648b9c2f791b6e29b4c"
>  DEPENDS = "sg3-utils"
>
> -SRCREV = "cb7971cfeecaa43c15eed4719dc82516d7e87b6c"
> -PV = "1.0.67+git${SRCPV}"
> +SRCREV = "013223dc886a03719ca02db52162056249d99448"
> +PV = "1.0.73+git${SRCPV}"
>
>  SRC_URI = "git://github.com/fujita/tgt.git \
>         file://0001-Correct-the-path-of-header-files-check-in-Yocto-buil.patch \
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

