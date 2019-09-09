Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id ABBF0E00D33; Mon,  9 Sep 2019 10:36:56 -0700 (PDT)
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
	*      [209.85.208.193 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
	[209.85.208.193])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id EABB6E00D4E
	for <meta-virtualization@yoctoproject.org>;
	Mon,  9 Sep 2019 10:36:47 -0700 (PDT)
Received: by mail-lj1-f193.google.com with SMTP id l20so13616812ljj.3
	for <meta-virtualization@yoctoproject.org>;
	Mon, 09 Sep 2019 10:36:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=vVMlW7Yw6uETM8gRf4QYSnb08nyuGPuWQUQDaU/Xsmg=;
	b=aqmdPwkSYTwMO/Yg551tjTjAjjClmgjdoCbBSBx63pjwDFbBpZckVXy1XkxSdT6pNY
	BoUbvGJByzbzcpPc6SbHBUCPni9mGBSbeLsmDQMTGXq0zg1bOyc/PRLkpXe0p+WtY13g
	XgRXaMGphWoDiSPCXbozduUAEG39UyU/G4vXKCJiFZMh7TjbMgLsgFwMLf31iXMHq6z8
	8fnpMiZeHL1mzuhZaurhbmk5NZvXlJK3oCWkhKATsuiHsnNwr/HZ5kg8EfaVdkypb78j
	wTVxfbZU+mWI/LibTDDF1VtBZmaVydwwO3p0CntdmYTqH0Ek/EaeTUo1/cPpJDVHutnw
	9Cyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=vVMlW7Yw6uETM8gRf4QYSnb08nyuGPuWQUQDaU/Xsmg=;
	b=FXYbyTlOG4RML0aSsAWqM+9dBWXK4oqYZbuWuMGwCfUzbPbIzurRlBWgoCLdL3MahS
	LLgbUzjuehcGdks1cVcelTEO/LIdWqR83o8zsBpRPxagfjH9/0J7/QJTn9gz6grDu+TH
	nH9PUBmwX2ROwX4sTiyVCiHgZkS4GMApUmAqtSER3XzcnRyhmrAfqRTt2YZGp/IPRCm9
	OZHEEceVxqk3oa6/46XNIeTObU7GNDQ8Eu2hqW0WhxqaGEV5YQuwt9+OOqbm9qQbnOPP
	XCMgnBUZdJbMJ90/dPfNPgjIYFksH10OXGwlutC0pdPrq8B7SKt4h0GQEgPp+R+Psv9n
	Fy8g==
X-Gm-Message-State: APjAAAUlbVOCdBiwRv2WSxi2dykRsnex+qW2PAiVXsA8yMOmyCcD+LwV
	E+cJjvFuIphks9LJveYa45mbmIYKsQI9wNw0ERvpGk+F
X-Google-Smtp-Source: APXvYqxNhbjDesok7825N3t/omX+Ix++4ND13ZuzH4lw9VeL8uZdSoi/OSlhhE/GPmWo7nPGCUxKF6VmdCDAE643gKo=
X-Received: by 2002:a2e:b0e2:: with SMTP id h2mr16465507ljl.79.1568050606094; 
	Mon, 09 Sep 2019 10:36:46 -0700 (PDT)
MIME-Version: 1.0
References: <1568022130-15624-1-git-send-email-zhe.he@windriver.com>
In-Reply-To: <1568022130-15624-1-git-send-email-zhe.he@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 9 Sep 2019 13:36:35 -0400
Message-ID: <CADkTA4NUMcACHA6dibBRDx5ncn+UftPcRdv+gWZbnv80KszTJw@mail.gmail.com>
To: He Zhe <zhe.he@windriver.com>
Cc: meta-virtualization <meta-virtualization@yoctoproject.org>
Subject: Re: [meta-cloud-services] [PATCH 1/2] consul: Upgrade to 1.6.0
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
X-List-Received-Date: Mon, 09 Sep 2019 17:36:56 -0000
Content-Type: text/plain; charset="UTF-8"

merged

Bruce

On Mon, Sep 9, 2019 at 5:42 AM <zhe.he@windriver.com> wrote:
>
> From: He Zhe <zhe.he@windriver.com>
>
> 1.6.0 is the latest release.
>
> Signed-off-by: He Zhe <zhe.he@windriver.com>
> ---
>  recipes-connectivity/consul/consul_git.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/recipes-connectivity/consul/consul_git.bb b/recipes-connectivity/consul/consul_git.bb
> index ab78cbd..f3e64e9 100644
> --- a/recipes-connectivity/consul/consul_git.bb
> +++ b/recipes-connectivity/consul/consul_git.bb
> @@ -4,7 +4,7 @@ LICENSE = "MPL-2.0 & BSD & Apache-2.0 & BSD-2-Clause & MIT"
>  LIC_FILES_CHKSUM = "file://src/github.com/hashicorp/consul/LICENSE;md5=b278a92d2c1509760384428817710378"
>
>  GO_IMPORT = "github.com/hashicorp/consul"
> -SRCREV = "567e41ff6b096a478333c804d5c18264050bc3f8"
> +SRCREV = "944cc71026c007e7de9467ec3f38f0ad14464fcc"
>  SRC_URI = "git://${GO_IMPORT}.git \
>             file://consul.service \
>            "
> --
> 2.7.4
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

