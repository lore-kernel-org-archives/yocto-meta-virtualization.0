Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 4624FE00D12; Fri,  8 Mar 2019 13:02:30 -0800 (PST)
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
	*      [209.85.208.175 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com
	[209.85.208.175])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A4202E0091D
	for <meta-virtualization@yoctoproject.org>;
	Fri,  8 Mar 2019 13:02:29 -0800 (PST)
Received: by mail-lj1-f175.google.com with SMTP id z25so18576574ljk.8
	for <meta-virtualization@yoctoproject.org>;
	Fri, 08 Mar 2019 13:02:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=VMgKgfPEcn2iG8iQPAaTZ7g/ydk2aVrzfikQvk9uuXM=;
	b=RTSu5KhbY2B5E3cVut7moUo/TuLRy9W4jPimiwBhnbGVlzVBo5fgukF6wNzfk2xscm
	YARZcBUCzuuf02TywVv5QaFfRTFR3j3SwphO3MkAx073QhjFbE4xGVGY1xs8ybaPEq1Q
	KYFKgsftgrxb+kKTqO3gb3jL4oqi3Sq80A038QNMBMkuQqkON/yD+tRnadKlqOsFThnu
	hDv7oH6eMS8ACyNdCPummuN5ShKR4UUC5I9qwKhYT+ZhsfKKmgTuoagRLIK9mHb7GwKO
	PAeXiU0jtTheVqJ+C3IHW/gnc6wngdSUkoasZ0Ef+CL2Jb9YCa+cM9YdJFPvsUmvv+Om
	p12A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=VMgKgfPEcn2iG8iQPAaTZ7g/ydk2aVrzfikQvk9uuXM=;
	b=QZP3sUDN5/oxRZKT5g6OwuBZP8nrRlno/OxWNRZA+X5m2vTvxq7ElaRgXeEDnI6uOX
	C3EOnbkqWtS1vil08ormqVl8QYz84Mz6zk8+CTxDocESxid0xuDqK749XT5Eg4+8ZYGN
	tWNoOTUOyi86lTGozANB7m9oD4JIp30xMlrGu6E2U3Ia93ybPLnh0i2RMLYy+hO5iMqQ
	OfI6St/PhCTN2eYCB5ITkj3Xqh8m8fUkhEpkWeWOMa68wVYBEbiF4609h8z6KZnxRolb
	evbP8IBjbwOXtvksIXcUAnWDY7ZFyEhsJcdEBGp/O3mgABklJX0UG1ukVUSH2w+wFrQ/
	SqgA==
X-Gm-Message-State: APjAAAVMGZAcUHl1fHqDhytyKPIMFALybjYgv/lR/iv/Biq0OJKR5rNY
	ojCTC7XTWBqxpCvYK7Jdpdn/NERFCHliPrOMY4VlmWuU
X-Google-Smtp-Source: APXvYqyMTlb5o5jzD14v3Nf5fqW+DWUjCYCZrwyDgROBORpYOYfRK1byZHMMfsrbgO4GC2R7UOKANx4uSw476UAPAM4=
X-Received: by 2002:a2e:6309:: with SMTP id x9mr9902098ljb.75.1552078948495;
	Fri, 08 Mar 2019 13:02:28 -0800 (PST)
MIME-Version: 1.0
References: <20190308032817.114059-1-hongzhi.song@windriver.com>
In-Reply-To: <20190308032817.114059-1-hongzhi.song@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 8 Mar 2019 16:02:14 -0500
Message-ID: <CADkTA4NwyTKt55KkEuCA5JGoWproEuCphmcVY=3yTL39y2ksmA@mail.gmail.com>
To: "Hongzhi.Song" <hongzhi.song@windriver.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [meta-cloud-services][PATCH] consul: uprev to v1.4.3
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
X-List-Received-Date: Fri, 08 Mar 2019 21:02:30 -0000
Content-Type: text/plain; charset="UTF-8"

merged

Bruce

On Thu, Mar 7, 2019 at 10:28 PM Hongzhi.Song <hongzhi.song@windriver.com> wrote:
>
> Uprev to v1.4.3 and remove invalid patch.
>
> Signed-off-by: Hongzhi.Song <hongzhi.song@windriver.com>
> ---
>  recipes-connectivity/consul/consul_git.bb     |  5 +--
>  ...red_query-make-compatible-with-go1.5.patch | 31 -------------------
>  2 files changed, 3 insertions(+), 33 deletions(-)
>  delete mode 100644 recipes-connectivity/consul/files/0001-prepared_query-make-compatible-with-go1.5.patch
>
> diff --git a/recipes-connectivity/consul/consul_git.bb b/recipes-connectivity/consul/consul_git.bb
> index b0afa03..f9fb236 100644
> --- a/recipes-connectivity/consul/consul_git.bb
> +++ b/recipes-connectivity/consul/consul_git.bb
> @@ -4,14 +4,15 @@ LICENSE = "MPL-2.0 & BSD & Apache-2.0 & BSD-2-Clause & MIT"
>  LIC_FILES_CHKSUM = "file://src/github.com/hashicorp/consul/LICENSE;md5=b278a92d2c1509760384428817710378"
>
>  GO_IMPORT = "github.com/hashicorp/consul"
> -SRCREV = "f97afda8e15046b41d951bf3b4220372c45df7ab"
> +SRCREV = "567e41ff6b096a478333c804d5c18264050bc3f8"
>  SRC_URI = "git://${GO_IMPORT}.git \
>             file://consul.service \
> -           file://0001-prepared_query-make-compatible-with-go1.5.patch \
>            "
>
>  S = "${WORKDIR}/git"
>
> +RDEPENDS_${PN}-dev_append = " bash"
> +
>  inherit systemd go
>
>  # Besides the hosts specified in goarch, we do not build for mips.
> diff --git a/recipes-connectivity/consul/files/0001-prepared_query-make-compatible-with-go1.5.patch b/recipes-connectivity/consul/files/0001-prepared_query-make-compatible-with-go1.5.patch
> deleted file mode 100644
> index 324530b..0000000
> --- a/recipes-connectivity/consul/files/0001-prepared_query-make-compatible-with-go1.5.patch
> +++ /dev/null
> @@ -1,31 +0,0 @@
> -From fb11d9e31788c912f94faf8b188278d54dc9a8f1 Mon Sep 17 00:00:00 2001
> -From: Bruce Ashfield <bruce.ashfield@windriver.com>
> -Date: Wed, 20 Apr 2016 16:34:50 -0400
> -Subject: [PATCH] prepared_query: make compatible with go1.5
> -
> -The copying of a regex is only in go 1.6. We can take the chance of
> -lock contention, so we drop the copy and use the regex directly.
> -
> -Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
> ----
> - src/github.com/hashicorp/consul/consul/prepared_query/template.go | 4 ++--
> - 1 file changed, 2 insertions(+), 2 deletions(-)
> -
> -diff --git a/src/github.com/hashicorp/consul/consul/prepared_query/template.go b/src/github.com/hashicorp/consul/consul/prepared_query/template.go
> -index 984f0bcf9cc6..1c61910c1526 100644
> ---- a/src/github.com/hashicorp/consul/consul/prepared_query/template.go
> -+++ b/src/github.com/hashicorp/consul/consul/prepared_query/template.go
> -@@ -116,8 +116,8 @@ func (ct *CompiledTemplate) Render(name string) (*structs.PreparedQuery, error)
> -       // from multiple goroutines.
> -       var matches []string
> -       if ct.re != nil {
> --              re := ct.re.Copy()
> --              matches = re.FindStringSubmatch(name)
> -+              // re := ct.re.Copy()
> -+              matches = ct.re.FindStringSubmatch(name)
> -       }
> -
> -       // Create a safe match function that can't fail at run time. It will
> ---
> -2.4.0.53.g8440f74
> -
> --
> 2.17.1
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

