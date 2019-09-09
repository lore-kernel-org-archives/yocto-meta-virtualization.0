Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A5B63E00D4E; Mon,  9 Sep 2019 10:36:10 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	https://www.dnswl.org/, no *      trust
	*      [209.85.208.177 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (bruce.ashfield[at]gmail.com)
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com
	[209.85.208.177])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 097D8E00CD5
	for <meta-virtualization@yoctoproject.org>;
	Mon,  9 Sep 2019 10:36:09 -0700 (PDT)
Received: by mail-lj1-f177.google.com with SMTP id l20so13615036ljj.3
	for <meta-virtualization@yoctoproject.org>;
	Mon, 09 Sep 2019 10:36:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=7Lu/tpQw5UdJKCGTYdOJpMIDlL7Xq0Hi5iAlSJYieW8=;
	b=gQemfM/KkamI/WKsIEjBFC1jo8gWSFJUc95j1C+Syu/ehb//SXSqgKQv18ezNvC94U
	YSkGkVufRRo5hINMKqp5FVOk1MGqpcLDiWvcW5JDJDamOy1STbi8FcbuaTGhVIgdfIpz
	bn4K5BgHLqTHXctIks6H5PaXZJs27fecQfidOV43tbG19i6y7PIQ8kzH3D3ebAsPjIAR
	V3i+7JbrmhS/WmH4ucICSfElIZKaUsL5KUl5dnOhaF4ddb5BeEOl3U9ceDI6Yazw9qc/
	2OugM1Uq41AQBK1EN5+4CJc6miG7CWuLrIEjYLNIkqcrKb/Cb4dAxRiL2e2E3EJFqom1
	TYuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=7Lu/tpQw5UdJKCGTYdOJpMIDlL7Xq0Hi5iAlSJYieW8=;
	b=JG86me7T0lcmvuN0MLgvZbTiO4fnADe9Dr9i56HQgPcfrKaw++2T6ImKGNFI6wpKTK
	eBIdHgEb9RxiGnz3i3v6bE+y2IM22iB+Rz4VsRc1TCG6IzklRqvVGUZrRl+KVSR0yUSq
	J2QDNK3CJCfYo4Kcdjf/LPXtFCSQU0B96dTWRpRphAGWqGvYhR7m+wcUfqmoaw/5kD7T
	Dk0jKqtfBeCA4ZTWjjAgZnplkIoB3Jal0Jl77/28a1DKIP4eChuWp0h+rv3qglKkzAIr
	kgs3RehkBb7tZs3LhsvcMkF+k+HeT89vF11nj4vvdsxS9SsYjxybFiEi5FdqEEG53klP
	nP9A==
X-Gm-Message-State: APjAAAVQG47CxC8fR+OY0ugLvtXjsglSqlN1nZAdVlbCuJcOLI7z915A
	V+gJFc3aVS0wpNTmeinMw3+iPH5rJf+kkuFontI=
X-Google-Smtp-Source: APXvYqyWV59R+zMvT+1+QPdkOjA1qmzzwovUl6fHEes6eUkwmem60s5t7d+5Paice6zElNBBvGO/mth66JD5upq9hJQ=
X-Received: by 2002:a2e:8594:: with SMTP id b20mr16022885lji.232.1568050568828;
	Mon, 09 Sep 2019 10:36:08 -0700 (PDT)
MIME-Version: 1.0
References: <1568009428-113268-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
In-Reply-To: <1568009428-113268-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 9 Sep 2019 13:35:57 -0400
Message-ID: <CADkTA4MZXqE4Ods+Rg70GE3txpu0+ADub7+MgR-iWHmD3cgeHA@mail.gmail.com>
To: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
Cc: meta-virtualization <meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] python-colorama: upgrade 0.3.3 -> 0.4.1
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
X-List-Received-Date: Mon, 09 Sep 2019 17:36:10 -0000
Content-Type: text/plain; charset="UTF-8"

merged

Bruce

On Mon, Sep 9, 2019 at 2:11 AM Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com> wrote:
>
> 1) Upgrade python-colorama from 0.3.3 to 0.4.1.
>
> 2) License File LICENSE.txt content changed:
>    Remove the line break in last line.
>
> Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
> ---
>  .../{python-colorama_0.3.3.bb => python-colorama_0.4.1.bb}  | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>  rename meta-openstack/recipes-devtools/python/{python-colorama_0.3.3.bb => python-colorama_0.4.1.bb} (56%)
>
> diff --git a/meta-openstack/recipes-devtools/python/python-colorama_0.3.3.bb b/meta-openstack/recipes-devtools/python/python-colorama_0.4.1.bb
> similarity index 56%
> rename from meta-openstack/recipes-devtools/python/python-colorama_0.3.3.bb
> rename to meta-openstack/recipes-devtools/python/python-colorama_0.4.1.bb
> index 81b7e09..7df4e97 100644
> --- a/meta-openstack/recipes-devtools/python/python-colorama_0.3.3.bb
> +++ b/meta-openstack/recipes-devtools/python/python-colorama_0.4.1.bb
> @@ -5,10 +5,10 @@ DESCRIPTION = "Simple cross-platform colored terminal text in Python"
>  HOMEPAGE = "http://pypi.python.org/pypi/colorama"
>  SECTION = "devel/python"
>  LICENSE = "BSD"
> -LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=14d0b64047ed8f510b51ce0495995358"
> +LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=b4936429a56a652b84c5c01280dcaa26"
>
> -SRC_URI[md5sum] = "a56b8dc55158a41ab3c89c4c8feb8824"
> -SRC_URI[sha256sum] = "eb21f2ba718fbf357afdfdf6f641ab393901c7ca8d9f37edd0bee4806ffa269c"
> +SRC_URI[md5sum] = "f927529cd1735f6f50ee2c61628e9c1f"
> +SRC_URI[sha256sum] = "05eed71e2e327246ad6b38c540c4a3117230b19679b875190486ddd2d721422d"
>
>  inherit setuptools pypi
>
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

