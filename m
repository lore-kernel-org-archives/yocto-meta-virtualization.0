Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 9C037E00B58; Sun, 30 Sep 2018 18:23:46 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (bruce.ashfield[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.208.193 listed in list.dnswl.org]
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
	[209.85.208.193])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 518ABE00901
	for <meta-virtualization@yoctoproject.org>;
	Sun, 30 Sep 2018 18:23:45 -0700 (PDT)
Received: by mail-lj1-f193.google.com with SMTP id 63-v6so1339902ljs.4
	for <meta-virtualization@yoctoproject.org>;
	Sun, 30 Sep 2018 18:23:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=MMkqKRqNIJ7p7nQWgwoEzsx2X5Q29R104+bJ9Dl0NSs=;
	b=Ilkm/jhxom3oV03cCbVLe1GXvBdtX8rOuk9Ks5xt8iGkEV4yGB+E+uwxbkgu2Tew6v
	U52jXDupVmbjKqN8fhfm2PrrPOoCxMIi4uXg7CZusG+TNyIPb6bZY+MCv9deJuvNeqzB
	D9iUvEpbNH4OquwFIZ5bOS0Zjzz1CvW5KcbwzkTvsU4Vbg8Xsh0699jtB52BfvCPkLkY
	hNOG6T+1g89xKM5/gtHdWbqcKmHg1fOGTe31zjrwmUBSOHZT6HXR2xycUGo39G/52mbV
	318yB2z5yoXaph+NoauMlNO1JLmkLK4J5ISqK5Sv5mrw6tnu14YmuEcFOyZGwe+tJPJ2
	r0Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=MMkqKRqNIJ7p7nQWgwoEzsx2X5Q29R104+bJ9Dl0NSs=;
	b=JdpnFq2nTcffGJVu/wxAQkrKDY/fz6EFGIa+dvHzHqJK3xA4VMqqxdrJmDMuS7cdDC
	Vg9vy45dSpOTaMIwWi+3O7VqthNr5S6W5H73csFX/M+Qv/hP2VkEh4+WbwtvsBdAwQTF
	WRx57epQdyINWNGu38OQXJfxh2G5zsvMFDTSJvnq9Pute1ZP+UZ8/RybadzDX/pYg9pi
	5U7PilzLHrLTBtfFIe6puoTzEiYNS3wSMz5Afx27pIgxo7fuNjfwG2nsoLm0CO4mocA8
	cjEonwNgtOKdtkzQGlmiwFHYYlypQp5tgA/CvXstWahaxWLcSskJe2ILnmAK6m8B/jRj
	OFxQ==
X-Gm-Message-State: ABuFfoilbTFY0yBTnFc+1MoQH+yeIg1U/23EPj0mI4GF7Rp4skXJW5e2
	Es3OYWPxFcMJSz1OhyZaJ5+MCJu6p7wz7BaiJpM=
X-Google-Smtp-Source: ACcGV60rXjRtuxQBLcQxyGvJqtQd5q1cZyK3tfdB/QBGzHvhCnLDeOUMkuJP69euQnFZhpMJAN2/WLIeJoyV0s4pQTU=
X-Received: by 2002:a2e:58e:: with SMTP id
	136-v6mr5117976ljf.130.1538357024167; 
	Sun, 30 Sep 2018 18:23:44 -0700 (PDT)
MIME-Version: 1.0
References: <1538277461-163634-1-git-send-email-changqing.li@windriver.com>
	<1538277461-163634-3-git-send-email-changqing.li@windriver.com>
In-Reply-To: <1538277461-163634-3-git-send-email-changqing.li@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Sun, 30 Sep 2018 21:23:32 -0400
Message-ID: <CADkTA4MVaJzEcerxbocVh8hqon96dYsSXf3sZ4tN-iaHoFETwg@mail.gmail.com>
To: changqing.li@windriver.com
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] docker: fix package qa warning
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
X-List-Received-Date: Mon, 01 Oct 2018 01:23:46 -0000
Content-Type: text/plain; charset="UTF-8"

On Sat, Sep 29, 2018 at 11:18 PM <changqing.li@windriver.com> wrote:
>
> From: Changqing Li <changqing.li@windriver.com>
>
> fix below warning:
> do_package_qa: QA Issue: ELF binary 'xxx/usr/bin/docker'
> has relocations in .text [textrel]
>
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>  recipes-containers/docker/docker_git.bb            |  1 +
>  .../files/0001-fix-do_package_qa-error.patch       | 31 ++++++++++++++++++++++
>  2 files changed, 32 insertions(+)
>  create mode 100644 recipes-containers/docker/files/0001-fix-do_package_qa-error.patch
>
> diff --git a/recipes-containers/docker/docker_git.bb b/recipes-containers/docker/docker_git.bb
> index 73e0120..1a8d1a6 100644
> --- a/recipes-containers/docker/docker_git.bb
> +++ b/recipes-containers/docker/docker_git.bb
> @@ -28,6 +28,7 @@ SRC_URI = "\
>         file://docker.init \
>         file://hi.Dockerfile \
>          file://0001-libnetwork-use-GO-instead-of-go.patch \
> +        file://0001-fix-do_package_qa-error.patch \
>         "
>
>  # Apache-2.0 for docker
> diff --git a/recipes-containers/docker/files/0001-fix-do_package_qa-error.patch b/recipes-containers/docker/files/0001-fix-do_package_qa-error.patch
> new file mode 100644
> index 0000000..79e71a5
> --- /dev/null
> +++ b/recipes-containers/docker/files/0001-fix-do_package_qa-error.patch
> @@ -0,0 +1,31 @@
> +From 56c865e2a7269d63f0780b4cd1ed6fdb18e3ff1b Mon Sep 17 00:00:00 2001
> +From: Changqing Li <changqing.li@windriver.com>
> +Date: Wed, 26 Sep 2018 17:41:59 +0800
> +Subject: [PATCH] fix do_package_qa error
> +
> +fix below error:
> +do_package_qa: QA Issue: ELF binary 'xxx/usr/bin/docker'
> +has relocations in .text [textrel]
> +
> +Upstream-Status: Inappropriate [oe-specific]
> +
> +Signed-off-by: Changqing Li <changqing.li@windriver.com>
> +---
> + cli/scripts/build/dynbinary | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/cli/scripts/build/dynbinary b/cli/scripts/build/dynbinary
> +index 3c32ed3..938e086 100755
> +--- a/cli/scripts/build/dynbinary
> ++++ b/cli/scripts/build/dynbinary
> +@@ -9,6 +9,6 @@ source ./scripts/build/.variables
> +
> + echo "Building dynamically linked $TARGET"
> + export CGO_ENABLED=1
> +-go build -o "${TARGET}" -tags pkcs11 --ldflags "${LDFLAGS}" "${SOURCE}"
> ++go build -o "${TARGET}" -tags pkcs11 --ldflags "${LDFLAGS}" -buildmode=pie "${SOURCE}"

As I mentioned in my other replies, I've never seen these warnings
myself. So I need to understand the configuration better.

Since I've never seen this before, my first reaction is that any
change of the flags to include buildmode=pie needs to be conditional
on some other distro feature that is enabled in your configuration.

Bruce

> +
> + ln -sf "$(basename "${TARGET}")" build/docker
> +--
> +2.7.4
> +
> --
> 2.7.4
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

