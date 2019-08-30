Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D5E70E00E00; Thu, 29 Aug 2019 21:19:55 -0700 (PDT)
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
	*      [209.85.167.46 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
	[209.85.167.46])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 50E39E00D89
	for <meta-virtualization@yoctoproject.org>;
	Thu, 29 Aug 2019 21:19:52 -0700 (PDT)
Received: by mail-lf1-f46.google.com with SMTP id l11so4259766lfk.6
	for <meta-virtualization@yoctoproject.org>;
	Thu, 29 Aug 2019 21:19:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=B2DOv7J0ULB19kwPjZMf+QJiBX/5sTJpFeCOJHrNWzY=;
	b=eH+M2tuU+bBQ/5MRrdIRW2a18h+kjk1w2kmrMivSyYhcutp6NCwOl/0rkzWoleUaJd
	MeDD0r380kjkovBR0Bz/Au2jaA/BpE+LA/fYC/5AoorHz7XsFcYT9tg+j7loqqPY7hSr
	B2sdhCigNb8QOMLj9VPcSlivdWq2lmCdM4QmNloeBNj87Ay5ARdLmBBzv3EtyQi86H/q
	BmkH9j9bFb8C+j7VX27ei+q+bznK6LLYhA4ebz/qzSKsMGYesFMUpHqm9h8jfPFhkSjS
	WQ6hL00q3h1vVOe1uDVm9ZT6PUC3bpmnhFbHqn5CDY/d5L3379SFocmEl7k3WFXnkuQ+
	miFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=B2DOv7J0ULB19kwPjZMf+QJiBX/5sTJpFeCOJHrNWzY=;
	b=Jil87aDtSsC45u1LFSvVhoXV6M2JPCN14cBd0+GGZEuP/qTY+Z3HOkoEDoy5bssxp0
	8yW0MY/kcMQQYm4fZ6QwXA/gIV4IJCRa2TLSbGGfilYwbln99X291mXBPDVjKCcDBL0N
	PYuaG1jAKVce6DLND0EVqbKbkvl1sHIPEx9jQ83IcYRHQp5rfz1SDcscOj4LluLLJdfP
	GtDtf1+sa1MVo4IxH4pvYCbfhVnK23Fh8AxUgFoLF76lIFb4byUEZSnX4FX0ATpsXBPn
	qgqxGppSUPA3KkvUmmRX2hD25RW3id7xbLq64jnw4+9nXFFi/JCBQacgSmIKAV5ih03r
	FWIw==
X-Gm-Message-State: APjAAAXIh60T/xZH8WlVZMJiksWXLF5gIKuh0jJXemd6PKjs28AHut/T
	8Qt2myC2VdVIyay9qfC3JPcQS2yTrqnJt32JYMK90gs8
X-Google-Smtp-Source: APXvYqwvBA7nw3vpK+Ta1X7KzXQei2iPIbzDuxndspsgVR1WX8RACnGFibV1hR5CYLO0SSGz4k+jinCKGJoHXI7lA6o=
X-Received: by 2002:ac2:447c:: with SMTP id y28mr7854460lfl.177.1567138791323; 
	Thu, 29 Aug 2019 21:19:51 -0700 (PDT)
MIME-Version: 1.0
References: <1566805077-116548-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
In-Reply-To: <1566805077-116548-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 30 Aug 2019 00:19:40 -0400
Message-ID: <CADkTA4NrE_2HAAq=H4LOUpOUtO=F02jaGbo3R9U2tF+kQU58tg@mail.gmail.com>
To: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] python-netifaces: Add python3 version
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
X-List-Received-Date: Fri, 30 Aug 2019 04:19:56 -0000
Content-Type: text/plain; charset="UTF-8"

merged

Bruce

On Mon, Aug 26, 2019 at 3:38 AM Zheng Ruoqin
<zhengrq.fnst@cn.fujitsu.com> wrote:
>
> Providing a python3 version of python-netifaces.
>
> Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
> ---
>  .../recipes-devtools/python/python-netifaces.inc     | 10 ++++++++++
>  .../python/python-netifaces_0.10.9.bb                | 12 ++----------
>  .../python/python3-netifaces_0.10.9.bb               |  2 ++
>  3 files changed, 14 insertions(+), 10 deletions(-)
>  create mode 100644 meta-openstack/recipes-devtools/python/python-netifaces.inc
>  create mode 100644 meta-openstack/recipes-devtools/python/python3-netifaces_0.10.9.bb
>
> diff --git a/meta-openstack/recipes-devtools/python/python-netifaces.inc b/meta-openstack/recipes-devtools/python/python-netifaces.inc
> new file mode 100644
> index 0000000..b1b1ed5
> --- /dev/null
> +++ b/meta-openstack/recipes-devtools/python/python-netifaces.inc
> @@ -0,0 +1,10 @@
> +DESCRIPTION = "Portable network interface information."
> +HOMEPAGE = "http://alastairs-place.net/netifaces"
> +SECTION = "devel/python"
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
> +
> +SRC_URI[md5sum] = "de92cc322b4f56047c073f802ad77860"
> +SRC_URI[sha256sum] = "2dee9ffdd16292878336a58d04a20f0ffe95555465fee7c9bd23b3490ef2abf3"
> +
> +inherit pypi
> diff --git a/meta-openstack/recipes-devtools/python/python-netifaces_0.10.9.bb b/meta-openstack/recipes-devtools/python/python-netifaces_0.10.9.bb
> index 05f5f4a..aa9760b 100644
> --- a/meta-openstack/recipes-devtools/python/python-netifaces_0.10.9.bb
> +++ b/meta-openstack/recipes-devtools/python/python-netifaces_0.10.9.bb
> @@ -1,10 +1,2 @@
> -DESCRIPTION = "Portable network interface information."
> -HOMEPAGE = "http://alastairs-place.net/netifaces"
> -SECTION = "devel/python"
> -LICENSE = "MIT"
> -LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
> -
> -SRC_URI[md5sum] = "de92cc322b4f56047c073f802ad77860"
> -SRC_URI[sha256sum] = "2dee9ffdd16292878336a58d04a20f0ffe95555465fee7c9bd23b3490ef2abf3"
> -
> -inherit setuptools pypi
> +inherit setuptools
> +require python-netifaces.inc
> diff --git a/meta-openstack/recipes-devtools/python/python3-netifaces_0.10.9.bb b/meta-openstack/recipes-devtools/python/python3-netifaces_0.10.9.bb
> new file mode 100644
> index 0000000..a46326f
> --- /dev/null
> +++ b/meta-openstack/recipes-devtools/python/python3-netifaces_0.10.9.bb
> @@ -0,0 +1,2 @@
> +inherit setuptools3
> +require python-netifaces.inc
> --
> 2.17.1
>
>
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

