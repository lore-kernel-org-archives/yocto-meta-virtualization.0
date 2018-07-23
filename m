Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 5CDA7E00BAA; Sun, 22 Jul 2018 20:21:48 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.208.182 listed in list.dnswl.org]
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com
	[209.85.208.182])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 07611E008E0
	for <meta-virtualization@yoctoproject.org>;
	Sun, 22 Jul 2018 20:21:46 -0700 (PDT)
Received: by mail-lj1-f182.google.com with SMTP id 203-v6so15548386ljj.13
	for <meta-virtualization@yoctoproject.org>;
	Sun, 22 Jul 2018 20:21:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=zBIuH89TSWtDSCsK20WdnM0trGCk3U+WzbytKmlAUDA=;
	b=PpwdRoAHDDztVbQw5N1sUegNhLE7Sj8LQ2WmTljYPjVfDTXgURN+fK2hhgendnEAkm
	tTmrE8d561F/ep3ACfFypsZ9cOT68hLdCm9I7UtL7RaSoNNUQs6NJgdthZSUZp0jeTGF
	3muSHdpLf22VyCWgItJmO1YI4EqTw2B9IKLhDE+o0/QIDHrM4i4hCdeylONcFrlj2Xyq
	WIDfK/CjVa0b2Jg7e4OOTuToZrU07q4d/ANk6VWByEdaGCQsJaNwOkzIJGS3NUtijxV3
	6M3EIF/8QlnE9u4ROWXS8PT+dTjcSCMGXYwdIXGtHV8SkQud5Tv2d7yhWmIKl3Seomak
	GhBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=zBIuH89TSWtDSCsK20WdnM0trGCk3U+WzbytKmlAUDA=;
	b=f9i9U3MUU5Vg6TO7N3Va1WZZ8HzjzHxgqU51EOLuTTnyV2xIypCwWdXVV1zcqHaLVL
	F6KKbUEleKrYhu3/uedsIZA+YwEnzhjYjva52UK65iuxJrbIsAI/8OHpKkQaj9CpNg9t
	kJxyuWa0GQanNXuToNOkgl2LR9ixh5Y1+piMzXEnG+OXBNS9IoQkAPc9X17it+jp4vlu
	yUqbpZzMoyzNa7/HADc/KxXOak5zwAdZiWAszYZ6e+71HZuQTkj2YHCzbF/cRjTyQIap
	kbtEFfXzwtHR3gW+Y3DVq+AJYKYrFnvGnb+PvUe3BOHNlzO5XusPpzBs0DGtA54UPUBi
	QpYA==
X-Gm-Message-State: AOUpUlEVYjWgEllPKHxskkHM7ri1Kn16sD2Qen+6AHeu2PucJNsRIBD/
	WLwUyRLGHCwN2/S+j9jjZMPVBUBqTo7fFshS5mM=
X-Google-Smtp-Source: AAOMgpd1IER4mG4aI50sphkvMX8ZL9cmVPenMqgrCpwCjCwaYwVVD+NiblJxbEowsJue+bae96SdE+dBRL7Z49DWuro=
X-Received: by 2002:a2e:439b:: with SMTP id
	z27-v6mr7399413lje.84.1532316105810; 
	Sun, 22 Jul 2018 20:21:45 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a2e:9acd:0:0:0:0:0 with HTTP; Sun, 22 Jul 2018 20:21:45
	-0700 (PDT)
In-Reply-To: <20180716093631.27024-1-hongl.fnst@cn.fujitsu.com>
References: <20180716093631.27024-1-hongl.fnst@cn.fujitsu.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Sun, 22 Jul 2018 23:21:45 -0400
Message-ID: <CADkTA4OnFso9KxCNu1BD77k1-Xqsv4dPMRbDJhArhC4i--uoqA@mail.gmail.com>
To: Hong Liu <hongl.fnst@cn.fujitsu.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] [meta-cloud-services][patch] python-amqp : 2.2.2 -> 2.3.2
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
X-List-Received-Date: Mon, 23 Jul 2018 03:21:48 -0000
Content-Type: text/plain; charset="UTF-8"

Merged.

Bruce

On Mon, Jul 16, 2018 at 5:36 AM, Hong Liu <hongl.fnst@cn.fujitsu.com> wrote:
> Upgrade python-amqp from 2.2.2 to 2.3.2.
>
> Signed-off-by: Hong Liu <hongl.fnst@cn.fujitsu.com>
> ---
>  .../python/{python-amqp_2.2.2.bb => python-amqp_2.3.2.bb}             | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta-openstack/recipes-devtools/python/{python-amqp_2.2.2.bb => python-amqp_2.3.2.bb} (68%)
>
> diff --git a/meta-openstack/recipes-devtools/python/python-amqp_2.2.2.bb b/meta-openstack/recipes-devtools/python/python-amqp_2.3.2.bb
> similarity index 68%
> rename from meta-openstack/recipes-devtools/python/python-amqp_2.2.2.bb
> rename to meta-openstack/recipes-devtools/python/python-amqp_2.3.2.bb
> index 94979d3..395c81e 100644
> --- a/meta-openstack/recipes-devtools/python/python-amqp_2.2.2.bb
> +++ b/meta-openstack/recipes-devtools/python/python-amqp_2.3.2.bb
> @@ -4,8 +4,8 @@ SECTION = "devel/python"
>  LICENSE = "BSD-3-Clause"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=9d6ba772ac59c08a25a12ce15bd5f27b"
>
> -SRC_URI[md5sum] = "0971a3fd2d635ded45c349cfc17106bd"
> -SRC_URI[sha256sum] = "cba1ace9d4ff6049b190d8b7991f9c1006b443a5238021aca96dd6ad2ac9da22"
> +SRC_URI[md5sum] = "11fce0d01f4ee6886a02415c20cece80"
> +SRC_URI[sha256sum] = "073dd02fdd73041bffc913b767866015147b61f2a9bc104daef172fc1a0066eb"
>
>  inherit setuptools pypi
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

