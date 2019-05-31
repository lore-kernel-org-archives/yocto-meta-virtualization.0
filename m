Return-Path: <asselsm@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 9F34FE00D52; Fri, 31 May 2019 07:23:54 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/,
	no *      trust
	*      [209.85.167.196 listed in list.dnswl.org]
Received: from mail-oi1-f196.google.com (mail-oi1-f196.google.com
	[209.85.167.196])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E7877E009A0
	for <meta-virtualization@yoctoproject.org>;
	Fri, 31 May 2019 07:23:53 -0700 (PDT)
Received: by mail-oi1-f196.google.com with SMTP id v25so7267366oic.9
	for <meta-virtualization@yoctoproject.org>;
	Fri, 31 May 2019 07:23:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
	:from:date:message-id:subject:to:cc;
	bh=T61eOpq9vY79RXZL930gx1tB5vGNfHxM7j739RdIueM=;
	b=ZUrt4S3prw8vMulO3x5yopKJoWtVuY6/I4Od6THxbcLb6Pi/b9SUgSh5B7PUCEVPBJ
	jXx/SqQu784fXydpuZrh2WNKu39ZFq5YleXjREhxH64+5J7Vuc0QbNayuDn3ZxHFWqiL
	d2KWN64NaagxcH4001myvEhe9gpr1ROEqTi/XcaY43pCpUEndTTsFszKZmYPeEHTZ4mc
	i38gzanT+0kv9gOdSRw7Azvgg3NjA4bR/0tNPzOmWccDbrJzMIqMxs4+f2SscmUyRpJ4
	vPVx84NHsgnAPsVLj+dlGN6NG4tkKJvYiREiHD6HjR7KQ6zLkTGxB6XUF7O5d8/S6f/a
	seCQ==
X-Gm-Message-State: APjAAAVAb12YK0r3e2u3WBzB2k0Kb4XVDvffxSt+6+0/WesJcasmUlqN
	HmzFd09YFtANfRmQNdXOguhrv0Jk1xTXY+P6WUaB1Q==
X-Google-Smtp-Source: APXvYqxrqvsp4bgNfOt5UOCuxeFghq3T48kI7adzFXnOeZb5RXTRVLSJemg3NtthsrvcdscGY1Whd1x9HiP57IpPEM0=
X-Received: by 2002:aca:58c4:: with SMTP id m187mr6089707oib.112.1559312633073;
	Fri, 31 May 2019 07:23:53 -0700 (PDT)
MIME-Version: 1.0
References: <1559195272-27896-1-git-send-email-hongzhi.song@windriver.com>
	<1559195272-27896-4-git-send-email-hongzhi.song@windriver.com>
In-Reply-To: <1559195272-27896-4-git-send-email-hongzhi.song@windriver.com>
From: Mark Asselstine <mark.asselstine@windriver.com>
Date: Fri, 31 May 2019 10:23:41 -0400
Message-ID: <CAPuovELB3jc_4bwQU1pZ2O_J5zGKkvYMMmPF=RugJGHbfehsBQ@mail.gmail.com>
To: "Hongzhi.Song" <hongzhi.song@windriver.com>
Cc: meta-virtualization <meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH 3/4] linux: update bbappend to match oe-core version
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
X-List-Received-Date: Fri, 31 May 2019 14:23:54 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, May 30, 2019 at 1:49 AM Hongzhi.Song <hongzhi.song@windriver.com> wrote:
>
> Since v4.18 was removed and v5.0 was created, bbappend should be
> adjusted to match oe-core.
>
> Signed-off-by: Hongzhi.Song <hongzhi.song@windriver.com>
> ---
>  meta-openstack/recipes-kernel/linux/linux-yocto_4.18.bbappend | 9 ---------
>  meta-openstack/recipes-kernel/linux/linux-yocto_5.0.bbappend  | 9 +++++++++
>  2 files changed, 9 insertions(+), 9 deletions(-)
>  delete mode 100644 meta-openstack/recipes-kernel/linux/linux-yocto_4.18.bbappend
>  create mode 100644 meta-openstack/recipes-kernel/linux/linux-yocto_5.0.bbappend
>

Please use '-M' when you generate your commit emails. In this case it
is easy enough to see that only the filename changed but for larger
reviews it helps the reviewer to narrow in on real changes.

Thanks,
Mark


> diff --git a/meta-openstack/recipes-kernel/linux/linux-yocto_4.18.bbappend b/meta-openstack/recipes-kernel/linux/linux-yocto_4.18.bbappend
> deleted file mode 100644
> index 843546c..0000000
> --- a/meta-openstack/recipes-kernel/linux/linux-yocto_4.18.bbappend
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
> diff --git a/meta-openstack/recipes-kernel/linux/linux-yocto_5.0.bbappend b/meta-openstack/recipes-kernel/linux/linux-yocto_5.0.bbappend
> new file mode 100644
> index 0000000..843546c
> --- /dev/null
> +++ b/meta-openstack/recipes-kernel/linux/linux-yocto_5.0.bbappend
> @@ -0,0 +1,9 @@
> +FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
> +
> +SRC_URI += "file://enable-veth.cfg \
> +            file://enable-iscsi-tcp.cfg \
> +            file://enable-nbd.cfg \
> +            file://enable-rtlink.cfg \
> +            file://nf.scc \
> +            file://nfs.scc \
> +       "
> --
> 2.8.1
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization

