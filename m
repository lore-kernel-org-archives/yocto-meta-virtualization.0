Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B6309E00B58; Sun, 30 Sep 2018 18:22:13 -0700 (PDT)
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
	*      [209.85.208.194 listed in list.dnswl.org]
Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com
	[209.85.208.194])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3EB8BE00901
	for <meta-virtualization@yoctoproject.org>;
	Sun, 30 Sep 2018 18:22:12 -0700 (PDT)
Received: by mail-lj1-f194.google.com with SMTP id p89-v6so10567718ljb.3
	for <meta-virtualization@yoctoproject.org>;
	Sun, 30 Sep 2018 18:22:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=iQHGaoIhkezhHdO3uzqPf0trMcVL15rljc6kTlkv6QI=;
	b=WLV6WAz1KIumIn/muZLROhUHvj9G0VBHXbdNxlKOMpn+ruUdv5ZhBtNCWdIeReq9Zh
	+T6+QYbxTBKEP87IagvfTbBDxTHpZIK7m3Q+9/4ZVGevO729ihN+zhe5sHPFkKVYgLVB
	Fnvx9qgpy7p936aklffPFJzNmadceBvwiDVQRjLFWwFPLc2KUzPlyq0MZC/rVsMIqxIW
	ywFY/vwXdWaf4KdTL+bS20lFCVpKdDkDUrkNGl+BxgXkCqw7hRCL0JkeKuwuVXlMDGHE
	qxV5PcniBR/EiLtcmE6cEvvDRvw51u43vM2XbaCsyuESQONDCVsWANnB5LjtGcXh8ktU
	tdmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=iQHGaoIhkezhHdO3uzqPf0trMcVL15rljc6kTlkv6QI=;
	b=UZ6roWnXK/aIWSFpvuoy2NlQCEn2Dj65ynZyh9Wkbpoc2G0KgvknWvxIlx+0wN/8xK
	PMVQMEBPke29RIhyVLg+HamtZa0+3egwnAC2rolgi1375yG/xUTsNf23dJ/jdmasAO/q
	9txR5zA919+IiTHz2mJPdMhTUbJyJrE4YW5UWRmYyQzVWKtm83WyS75wVSwbsmtioBAy
	+PgClHihMTWgBVExdPqEb4/C2mBj0VEMneaskeONXgKlnReWKgvOVW9g2c3f0sBFuBhq
	4bSSF1SnU/H66q22hXguNewCnVRGd29O+mIA4lxQtGYnwkEa6A/m9IrXZ7XXHQqMjVIj
	8BPA==
X-Gm-Message-State: ABuFfogC/G4VbtCc4/NTpK7rtZRCCo3E/d38mIquXWATuIsceyQ8B3iS
	lkqhMSHXMmuA413ScTfDPEyAQUXGCR7QJU5U5eJPmg==
X-Google-Smtp-Source: ACcGV6100adlmqX5MOhfwNFa1/eytZWifXkvR/LpLXcUBtmPzvn9T+L1ahPFeTX1lb8Gr75q1xL9Z76R7teqmR7THAg=
X-Received: by 2002:a2e:7809:: with SMTP id
	t9-v6mr4321499ljc.120.1538356930920; 
	Sun, 30 Sep 2018 18:22:10 -0700 (PDT)
MIME-Version: 1.0
References: <1538277461-163634-1-git-send-email-changqing.li@windriver.com>
	<1538277461-163634-2-git-send-email-changqing.li@windriver.com>
In-Reply-To: <1538277461-163634-2-git-send-email-changqing.li@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Sun, 30 Sep 2018 21:22:00 -0400
Message-ID: <CADkTA4PWSA+Pf79s0CzxNaWpLo04CFkGBZEoPuqKFD3RSwxARQ@mail.gmail.com>
To: changqing.li@windriver.com
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] docker-distribution: fix do package qa warning [textrel]
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
X-List-Received-Date: Mon, 01 Oct 2018 01:22:13 -0000
Content-Type: text/plain; charset="UTF-8"

On Sat, Sep 29, 2018 at 11:18 PM <changqing.li@windriver.com> wrote:
>
> From: Changqing Li <changqing.li@windriver.com>
>
> fix below warning:
>
> do_package_qa: QA Issue: ELF binary 'xxx/usr/sbin/registry'
> has relocations in .text [textrel]
>
> Add GOBUILDFLAGS which have -buildmode=pie to fix it

This is not universally true, so your configuration needs more
explanation. We haven't needed these flags before, and I've never seen
the warnings.

I just build docker and dumped the environment, my GOBUILDFLAGS do not
have buildmode=pie

So clearly, your config is different.

I'm not against adding the extra variable, but we are taking a the
risk of injecting build configurations that we haven't needed before,
and may not want.

So I need to understand what configuration you are building that is
making them required, and then figure out what else is being injected
that wasn't being injected before.

Same comment applies for all the QA fixes.

Bruce

>
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>  .../docker-distribution/docker-distribution_git.bb |  1 +
>  .../files/0001-fix-do_package_qa-error.patch       | 32 ++++++++++++++++++++++
>  2 files changed, 33 insertions(+)
>  create mode 100644 recipes-containers/docker-distribution/files/0001-fix-do_package_qa-error.patch
>
> diff --git a/recipes-containers/docker-distribution/docker-distribution_git.bb b/recipes-containers/docker-distribution/docker-distribution_git.bb
> index add5ce1..7c7bce2 100644
> --- a/recipes-containers/docker-distribution/docker-distribution_git.bb
> +++ b/recipes-containers/docker-distribution/docker-distribution_git.bb
> @@ -6,6 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=d2794c0df5b907fdace235a619d80314"
>  SRCREV_distribution="48294d928ced5dd9b378f7fd7c6f5da3ff3f2c89"
>  SRC_URI = "git://github.com/docker/distribution.git;branch=release/2.6;name=distribution;destsuffix=git/src/github.com/docker/distribution \
>             file://docker-registry.service \
> +           file://0001-fix-do_package_qa-error.patch \
>            "
>
>  PACKAGES =+ "docker-registry"
> diff --git a/recipes-containers/docker-distribution/files/0001-fix-do_package_qa-error.patch b/recipes-containers/docker-distribution/files/0001-fix-do_package_qa-error.patch
> new file mode 100644
> index 0000000..269b0cd
> --- /dev/null
> +++ b/recipes-containers/docker-distribution/files/0001-fix-do_package_qa-error.patch
> @@ -0,0 +1,32 @@
> +From 4b9d701fabff8e7969db081406d00fa9fe46b3fd Mon Sep 17 00:00:00 2001
> +From: Changqing Li <changqing.li@windriver.com>
> +Date: Thu, 27 Sep 2018 11:05:51 +0800
> +Subject: [PATCH] fix do_package_qa error
> +
> +fix below error:
> +do_package_qa: QA Issue: ELF binary 'xxx/usr/sbin/registry'
> +has relocations in .text [textrel]
> +
> +Upstream-Status: Inappropriate [oe-specific]
> +
> +Signed-off-by: Changqing Li <changqing.li@windriver.com>
> +---
> + Makefile | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/Makefile b/Makefile
> +index 47b8f1d..13b0f92 100644
> +--- a/Makefile
> ++++ b/Makefile
> +@@ -39,7 +39,7 @@ GODEP=$(shell which godep || echo '')
> +
> + ${PREFIX}/bin/registry: $(GOFILES)
> +       @echo "+ $@"
> +-      @go build -tags "${DOCKER_BUILDTAGS}" -o $@ ${GO_LDFLAGS}  ${GO_GCFLAGS} ./cmd/registry
> ++      @go build -tags "${DOCKER_BUILDTAGS}" -o $@ ${GO_LDFLAGS} ${GOBUILDFLAGS} ${GO_GCFLAGS} ./cmd/registry
> +
> + ${PREFIX}/bin/digest:  $(GOFILES)
> +       @echo "+ $@"
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

