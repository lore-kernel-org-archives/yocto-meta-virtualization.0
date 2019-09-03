Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 20CC8E00DAA; Tue,  3 Sep 2019 13:02:57 -0700 (PDT)
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
	*      [209.85.208.172 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com
	[209.85.208.172])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 92C3BE0074B
	for <meta-virtualization@yoctoproject.org>;
	Tue,  3 Sep 2019 13:02:56 -0700 (PDT)
Received: by mail-lj1-f172.google.com with SMTP id l1so17281357lji.12
	for <meta-virtualization@yoctoproject.org>;
	Tue, 03 Sep 2019 13:02:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=FSXDu2Erpf8UuJSSyBVUsX0UisPhKMOU1F34unn67JQ=;
	b=E9jfYnCqEF8/jKfQi01zrcpJctBY+16rQZgeJrwJwjiP1vOXYi0x8+3znF6RqqKA+Z
	pmxGCPZAgghDmfTVXX38FI85eJmVdjaioNmhYK15HBWM1yVyW32bwYjLI9B5SY0dw5Yj
	Wzp3dyRwpcw1q77547yIHcw1cTTm3sluEuCaXOrLO3vm8G2jAzl6dvsIwOZVRy/BwlPp
	Feb4CTO7WcFhLCwG+KF5EmHCq6CnWVi+68nEo5Y5ne27u21FtfqQw13WfP1SFXAeA9BZ
	ULkYlDWsOiosAZbYSWStgkqxd5hAKYVZXLyFmTF5utDX2437DXhbZuCCzrW5Qi7Uhl1b
	p19Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=FSXDu2Erpf8UuJSSyBVUsX0UisPhKMOU1F34unn67JQ=;
	b=GfwJs5g1ms5kwpht/Ros8VCaBxciqFCKE5QLrUxt2TgvbLJYMP/UtZn5ryGA0fEILO
	6F5JL2HJYdzX0ZHII4c6vcquNjk/GS+v4iaPxbfRqEQ5Jrr49FI8PGHn1MXjoHLetgmR
	6evh8UnpNjy7mA3U9A6X+lLPAsY5+CvnHrTfjxpCiZw7jlXl6TxaYCoOJX1JHy/dLDvr
	zRFsB6/ycYDhVHqu8w68BCFvqXWSTPAhjIzZuN96ovQ0ptecBxGTsoAzF1G+iwJ8ypcy
	nHwc3+WPYvBqM6nESN9WzTebTfYBSfU6Ai5FYRseZKcJobEAanhPFiMry0gB7+OpG9hq
	9mDw==
X-Gm-Message-State: APjAAAVvcY29EVo6lqjrg/0nDOrvaeHAaDFx7yeDwAAYFbCKYAOQYCYy
	66ABE7EKQ36MsgMINqknIyM0kocgxPEar3G1XXQmvVer
X-Google-Smtp-Source: APXvYqyQZl0mHb6kQ3j9pE8onGlaRMG1AGwxGngt4ql8yY4qdeiaGM7k/Ju17KHHCIUVg2Mo2kuaxGMOoJDEOJcletY=
X-Received: by 2002:a2e:b0e2:: with SMTP id h2mr3114993ljl.79.1567540975414;
	Tue, 03 Sep 2019 13:02:55 -0700 (PDT)
MIME-Version: 1.0
References: <1567418900-117406-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
In-Reply-To: <1567418900-117406-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 3 Sep 2019 16:02:44 -0400
Message-ID: <CADkTA4PNxa5FEM6=2MH6KqR_xtMFfseH1EJyRvQkgpng_ci_-w@mail.gmail.com>
To: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] python-webob: RDEPENDS remove
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
X-List-Received-Date: Tue, 03 Sep 2019 20:02:57 -0000
Content-Type: text/plain; charset="UTF-8"

merged

Bruce

On Mon, Sep 2, 2019 at 6:09 AM Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com> wrote:
>
> Remove python-nose from RDEPENDS for it has been removed from oe-core.
>
> Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
> ---
>  recipes-devtools/python/python-webob_1.8.5.bb | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/recipes-devtools/python/python-webob_1.8.5.bb b/recipes-devtools/python/python-webob_1.8.5.bb
> index 0ce928a..b9f8a9f 100644
> --- a/recipes-devtools/python/python-webob_1.8.5.bb
> +++ b/recipes-devtools/python/python-webob_1.8.5.bb
> @@ -13,6 +13,5 @@ inherit setuptools pypi
>
>  RDEPENDS_${PN} += " \
>         python-sphinx \
> -       python-nose \
>         "
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

