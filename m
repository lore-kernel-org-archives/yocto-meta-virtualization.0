Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 774F7E00D94; Thu, 28 Dec 2017 08:18:05 -0800 (PST)
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
	*      [209.85.216.175 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-qt0-f175.google.com (mail-qt0-f175.google.com
	[209.85.216.175])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D661AE00D7B
	for <meta-virtualization@yoctoproject.org>;
	Thu, 28 Dec 2017 08:18:04 -0800 (PST)
Received: by mail-qt0-f175.google.com with SMTP id 33so51641839qtv.1
	for <meta-virtualization@yoctoproject.org>;
	Thu, 28 Dec 2017 08:18:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=LD/iO/nug7SfKm2hBwpzy+7dPYiBNhTMhFo/8EbtOM0=;
	b=P4nR+/ZKNJhMSx1GxEVGcGYXVB+RZgz6OifcnrZoxCBz4lH9WLukuNSQblu/OFurVS
	bNVveuMUSfPaDvax8FPn+ZWKtDZJ8qMIInG5fl0TFPB6CRcnMpyhW679ddVz+K6RGJlg
	tc9mhXI58OHZNg4eT/9j7ymHUYXnvmS00uiDDK0RT3Vi0ODvxgO2GjhsQjRuP6V/74SK
	5TZLANg8R9pO4Hw9n/6aXB7MOt5bLR25S8S9qiKIRhotv2qD9+EzxPfPbY5V8vHBrLFz
	gAjOo37dmSRiyrpYreGH27dhrvNkBjjxtQc0/rXWrn/CO9IXtjEvbeTtYp7QV7HNcPdU
	oBqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=LD/iO/nug7SfKm2hBwpzy+7dPYiBNhTMhFo/8EbtOM0=;
	b=WoD6gZPtOR81a0dhLMrZh4Dj8cEr24LMcb6vw4BcKRX/4FWMfKhcd2tazJQkD5bTjv
	R4f+s8sq1/aFiz831P2/6JQex79SsX+vTyoq+wAqfTsLAwiuoyNlixV8LzLdkxQfwlY+
	V2yF5srtkBMU74+erEgXrNEW5aPYEmHZYogQMtwEBYNCgXBSYNGevwyYQMtwOhWzKiZo
	AhIQeHeeGHbkvmm3rtbhY0l6gDrRNEIbkonwuAXkhi02OqWPSis3BiB1xiwBvUOmo+Ep
	JJZ9h6r2pf2ZDnkLkcB6vwQYmvOT9XSKpGXOqKMVm450D/XbfTihEkMD/JJiVCGbHMxN
	86aw==
X-Gm-Message-State: AKGB3mJOKZ0nuwU0qG+rvhQdsv9J6logBHmbsAYVk3GA+2IwAx4ABh3s
	wbP2/JJbjPwoHum/Bxw2nNRvcF9Zb/NTa7zmgv8=
X-Google-Smtp-Source: ACJfBosrDGvTwMQpIJjEkks3djvE/ZjcSr2uw4HtK8nEQf2YNIFzN9l0XxT35ZZFqK/QV/gMcAfWKQ64ohi884iPrQw=
X-Received: by 10.237.33.130 with SMTP id l2mr42939833qtc.120.1514477883677;
	Thu, 28 Dec 2017 08:18:03 -0800 (PST)
MIME-Version: 1.0
Received: by 10.12.182.96 with HTTP; Thu, 28 Dec 2017 08:18:03 -0800 (PST)
In-Reply-To: <20171228064148.16987-1-Qi.Chen@windriver.com>
References: <20171228064148.16987-1-Qi.Chen@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 28 Dec 2017 12:18:03 -0400
Message-ID: <CADkTA4NCnx8MdfYWy6E99Z9A73F4+XkOxmw2ZeJWekf3bjMhQg@mail.gmail.com>
To: Chen Qi <Qi.Chen@windriver.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] criu: set CLEANBROKEN to 1
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
X-List-Received-Date: Thu, 28 Dec 2017 16:18:05 -0000
Content-Type: text/plain; charset="UTF-8"

merged.

Bruce

On Thu, Dec 28, 2017 at 2:41 AM, Chen Qi <Qi.Chen@windriver.com> wrote:
> Rebuilding criu would cause the following error.
>
>   | make: .gitid: Command not found
>   | make: *** [Makefile:260: clean-top] Error 127
>
> Fix this problem by setting CLEANBROKEN to "1".
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  recipes-containers/criu/criu_git.bb | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/recipes-containers/criu/criu_git.bb b/recipes-containers/criu/criu_git.bb
> index 3a02103..083609f 100644
> --- a/recipes-containers/criu/criu_git.bb
> +++ b/recipes-containers/criu/criu_git.bb
> @@ -57,6 +57,8 @@ inherit setuptools
>  PACKAGECONFIG ??= ""
>  PACKAGECONFIG[selinux] = ",,libselinux"
>
> +CLEANBROKEN = "1"
> +
>  do_compile_prepend() {
>      rm -rf ${S}/images/google/protobuf/descriptor.proto
>      ln -s  ${PKG_CONFIG_SYSROOT_DIR}/usr/include/google/protobuf/descriptor.proto ${S}/images/google/protobuf/descriptor.proto
> --
> 2.11.0
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

