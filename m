Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 472DFE00EF0; Fri,  2 Oct 2015 06:09:16 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [209.85.160.178 listed in list.dnswl.org]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (bruce.ashfield[at]gmail.com)
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-yk0-f178.google.com (mail-yk0-f178.google.com
	[209.85.160.178])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8CD92E00D21
	for <meta-virtualization@yoctoproject.org>;
	Fri,  2 Oct 2015 06:09:15 -0700 (PDT)
Received: by ykft14 with SMTP id t14so109743123ykf.0
	for <meta-virtualization@yoctoproject.org>;
	Fri, 02 Oct 2015 06:09:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=sAPrIdm1ERojsSIshzvtxZpsYJZWUoX9fqMTvD0rH3E=;
	b=H034ozQIBENwOzCXul0lSLeK4/SJx3+D5eO4Jb0qOJrSVtQulmkBofSkOjAFpn4MzW
	EzANMJNPjL90EzyI4xshkCCl1kqnSwqHRRlyAMp0PqgM0qJLIAyqcEVuy+BYEPfb20bv
	3xPWqie9WqyBZcFCPyp5ykl02Kq83PbeChU8bpnKOjz8ib43GKA5OE74LT/Z74GkibIY
	kgsZtM7BwBiSyYSqT8cIvnU2d1gZTLNefLlxbbQSqhKwq5gffFhtb4C8/WUG29h62VY6
	Aa7KSh4Aajdq80kcKx7FULc9ZOrsZL9mZoOPWd6kCEzXE7RrSSPCA9PIqeol+frBrY4u
	fGCw==
MIME-Version: 1.0
X-Received: by 10.170.96.196 with SMTP id n187mr13280685yka.54.1443791354944; 
	Fri, 02 Oct 2015 06:09:14 -0700 (PDT)
Received: by 10.13.217.201 with HTTP; Fri, 2 Oct 2015 06:09:14 -0700 (PDT)
In-Reply-To: <1443597331-1166-1-git-send-email-jianchuan.wang@windriver.com>
References: <1443597331-1166-1-git-send-email-jianchuan.wang@windriver.com>
Date: Fri, 2 Oct 2015 09:09:14 -0400
Message-ID: <CADkTA4PbZF2=q6XJU6M7ULGbXM6+nRjt0J-GuC9w0VVej2=7Fw@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: jianchuan.wang@windriver.com
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] protobuf-c: Add protobuf's pkgconfig path into PKG_CONFIG_PATH
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
X-List-Received-Date: Fri, 02 Oct 2015 13:09:16 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Sep 30, 2015 at 3:15 AM,  <jianchuan.wang@windriver.com> wrote:
> From: Jianchuan Wang <jianchuan.wang@windriver.com>
>
> Add the protobuf's pkgconfig path into PKG_CONFIG_PATH
> so that pkg-config can find the protoc from sysroot in the configure process.
> And don't conflict even if installing the protobuf in the localhost.
>

merged.

Bruce

> Signed-off-by: Jianchuan Wang <jianchuan.wang@windriver.com>
> ---
>  recipes-containers/criu/protobuf-c_1.1.1.bb | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/recipes-containers/criu/protobuf-c_1.1.1.bb b/recipes-containers/criu/protobuf-c_1.1.1.bb
> index 8c2d2b7..2800f12 100644
> --- a/recipes-containers/criu/protobuf-c_1.1.1.bb
> +++ b/recipes-containers/criu/protobuf-c_1.1.1.bb
> @@ -19,6 +19,10 @@ inherit autotools
>
>  BBCLASSEXTEND = "native nativesdk"
>
> +do_configure_prepend_class-target() {
> +    export PKG_CONFIG_PATH="${STAGING_LIBDIR_NATIVE}/pkgconfig:${PKG_CONFIG_PATH}"
> +}
> +
>  do_install_append_class-native() {
>      install -m 755 ${B}/t/generated-code2/cxx-generate-packed-data ${D}/${bindir}
>  }
> --
> 1.9.1
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

