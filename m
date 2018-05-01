Return-Path: <asselsm@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B49A4E00C54; Tue,  1 May 2018 06:28:25 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.161.196 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-yw0-f196.google.com (mail-yw0-f196.google.com
	[209.85.161.196])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 85ECCE00C40
	for <meta-virtualization@yoctoproject.org>;
	Tue,  1 May 2018 06:28:24 -0700 (PDT)
Received: by mail-yw0-f196.google.com with SMTP id i17-v6so3520911ywg.13
	for <meta-virtualization@yoctoproject.org>;
	Tue, 01 May 2018 06:28:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:reply-to:sender:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=qr4D+QZgYTJzONouZCteD4YC/ZDGMadm27VUDmlTFQY=;
	b=kDFDT+KKAFHJh3W1P0jnvS2SRlwrn5XsCjdwm8ios71VXvPRUixTszAZUEqJ0KOZ+z
	vDgmnKuWG8I9+bxi9EYKmAZDwlyvnlH8l/OsID1oQ756FBNjToLESavV6Ve53qxWd80/
	ZijfeGkjqXc5iS/nquha/HSkjlcSrLQMP1serhZO+J6tndY96RS12S0TOz/PTZK0QG5Q
	Ux18/jzovqMh7NdBxoyWyhxeMYXi7gFPb0d8HppGNZT2lOBPy88kyuhKyRvoYjMd2Hc4
	GnmGtp4jFooZgxKtmQKtiLPiexIQ5Y193MKRrhWgi4uNf07src1ymeZA1f1tjpQiDt+4
	hfWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:reply-to:sender:in-reply-to
	:references:from:date:message-id:subject:to;
	bh=qr4D+QZgYTJzONouZCteD4YC/ZDGMadm27VUDmlTFQY=;
	b=BtvJDbc7nP3RbW85iBCNyH2HJhxj7aaZlXgi62UxNp1c9zMKURstlHFwz9N1TEgtyo
	OEQArB/m2dF5uja5LE5m1ZIbWAbXJzj5s5tQfiU7qBFdJj0AmqyCPqF4xJ1JqyYnjtvs
	ROkQog9QToLK+Hg5VWjjmhp+GnudbA8dbUrYlI1T+/HTx+Tr9U5eQUqgN29TcrWzL3Xu
	85ehB9GUYF6I3KQOvJJdAe8wKcFQ7Ca8pkap/Xq9+zzNHUHz3PruUDnNYfisk2o4W6cB
	SHgWruYqN6ebL9dQd+o+2MamhDqrI6yuAFVzXtxPtpopDtJrtv6SpGXkgTqoTEbWqDOM
	6QSA==
X-Gm-Message-State: ALQs6tAnNxbxmkqzNQQnVmSwlqpEJL11CC7w8xsPCRnDNizse0VPzfwX
	XZXhhRBWsJZEi8KFIe81dD2t7bpfKnBmABGmCJk=
X-Google-Smtp-Source: AB8JxZpJmiTIhVQb2L0EGSSR1avfBXbqaKy+SJ/hPsYBzbg7dpMt2N/jkHk5uRNwmrRQ8zC3+268MUjEuqgFlhyRF8o=
X-Received: by 2002:a81:7a54:: with SMTP id
	v81-v6mr8287193ywc.210.1525181303387; 
	Tue, 01 May 2018 06:28:23 -0700 (PDT)
MIME-Version: 1.0
Sender: asselsm@gmail.com
Received: by 2002:a25:62cc:0:0:0:0:0 with HTTP;
	Tue, 1 May 2018 06:28:22 -0700 (PDT)
In-Reply-To: <1525114301-2864-1-git-send-email-mark.asselstine@windriver.com>
References: <1525114301-2864-1-git-send-email-mark.asselstine@windriver.com>
From: Mark Asselstine <mark.asselstine@windriver.com>
Date: Tue, 1 May 2018 09:28:22 -0400
X-Google-Sender-Auth: y5xD_g5c6OAVgAOtkXcTBf4HwJ4
Message-ID: <CAPuovE+34RbGFrJAw6=231D0w3oJvkig1ifVx-FZ8yNtxZEn6Q@mail.gmail.com>
To: Bruce Ashfield <bruce.ashfield@windriver.com>,
	meta-virtualization@yoctoproject.org
Subject: Re: [m-c-s][PATCH 1/5] python-uritemplate: initial version (v3.0.0)
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
X-List-Received-Date: Tue, 01 May 2018 13:28:25 -0000
Content-Type: text/plain; charset="UTF-8"

For anyone wondering where the 5/5 is. Once again it was held up
pending moderator approval due to its size.

Mark

On Mon, Apr 30, 2018 at 2:51 PM, Mark Asselstine
<mark.asselstine@windriver.com> wrote:
> Needed by python-google-api-python-client.
>
> Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> ---
>  .../recipes-devtools/python/python-uritemplate_3.0.0.bb          | 9 +++++++++
>  1 file changed, 9 insertions(+)
>  create mode 100644 meta-openstack/recipes-devtools/python/python-uritemplate_3.0.0.bb
>
> diff --git a/meta-openstack/recipes-devtools/python/python-uritemplate_3.0.0.bb b/meta-openstack/recipes-devtools/python/python-uritemplate_3.0.0.bb
> new file mode 100644
> index 0000000..d32c1a8
> --- /dev/null
> +++ b/meta-openstack/recipes-devtools/python/python-uritemplate_3.0.0.bb
> @@ -0,0 +1,9 @@
> +SUMMARY = "Simple python library to deal with URI Templates."
> +AUTHOR = "Ian Cordasco"
> +LICENSE = "Apache-2.0 & BSD-3-Clause"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=f2e14cc8f5f696fd9d47092e992265c1"
> +
> +inherit setuptools pypi
> +
> +SRC_URI[md5sum] = "1ec31e0d8a2eec72357b2cef4bce5945"
> +SRC_URI[sha256sum] = "c02643cebe23fc8adb5e6becffe201185bf06c40bda5c0b4028a93f1527d011d"
> --
> 2.7.4
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization

