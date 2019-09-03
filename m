Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id F2300E00D35; Tue,  3 Sep 2019 14:09:21 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	https://www.dnswl.org/, no *      trust
	*      [209.85.208.175 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (bruce.ashfield[at]gmail.com)
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com
	[209.85.208.175])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6E5E8E00E10
	for <meta-virtualization@yoctoproject.org>;
	Tue,  3 Sep 2019 14:09:19 -0700 (PDT)
Received: by mail-lj1-f175.google.com with SMTP id l20so3035156ljj.3
	for <meta-virtualization@yoctoproject.org>;
	Tue, 03 Sep 2019 14:09:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=kdk+0FwO/L4kRymD5gNYOgepuB+6JTpf6EqEGouel8U=;
	b=Lu0ylaQgiGE0JpS06R2rnNTg43ZIjalg1PiZoIqE8A20t/WozNcnXeGhBIdM3S9w+2
	4W5W8HAwe6yMMHQcAbtAuQeNdkfEwgEYjNEnUVwGJUK3TaxuPiaMqAoBTATIOUtrIT3v
	BC7REQSyHDtAsIFr7xPEuCZhDDita9MMro2RvSpSFWlyYJp8/mQzunJBCcjyIE92Binr
	uVGyGp5COxKxKLbdDokvph0qCn7QegdUZGvn5QKALtCIbRA3L25uqlECRDr8hq4yVDRc
	b51+lZRy5uhQW3gt33Da0VPnaEPob7GNzLd7WrJq4t8FRbhLTh021n9iAqf4uWkTRwiP
	9CeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=kdk+0FwO/L4kRymD5gNYOgepuB+6JTpf6EqEGouel8U=;
	b=lYXsJVWP7St3kM6MI1z/ioQccpee/1XNlzpVNCISyh/6Zd/4BfwnXT4SDlGO+9LZDv
	CD0jRLsR0TicNwAi5G2xnSEpEHGLKhEVVG2RYMgwSBniC94lx4fLc2yabpROF6cm1cuU
	d7vLRjf6fcye6Xv6nkGSDzTSVR/qzu5MIt3R0fyPtEobOsbhlRgA5xU3ir0E3EplFz5r
	qKnWxtihSA7et4F3kSwWH0y7pCOZN9Wy7BbTWV5BtIBDde/LaoIkUu8vronE5o3bIoLN
	6nw1nhwyX9qjFHwsure2OklD109wvsrTd3w5E+2N9nHcKdNI3SgtCdykqQvH+dl3jgW9
	vBmg==
X-Gm-Message-State: APjAAAX3fJCTwAR7d8R21nX2KYHCPMdkSG//ZII6sRY3kwXVnx2HyOzr
	gn4Tx444nFb3b8wDS9ArMjrLphIV2gb9oSUgaqE=
X-Google-Smtp-Source: APXvYqx4QEgAvhvDJFHryb7Pi8FFK8ld7HS5GXrUfPo/BLXr1S1rcK/GD5oZtILJF/SWtiYjwhnEuzxz7nWxiwsLgsw=
X-Received: by 2002:a2e:5dc3:: with SMTP id v64mr14795038lje.118.1567544958353;
	Tue, 03 Sep 2019 14:09:18 -0700 (PDT)
MIME-Version: 1.0
References: <1566888999-4023-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
In-Reply-To: <1566888999-4023-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 3 Sep 2019 17:09:07 -0400
Message-ID: <CADkTA4PVr5TLQp3pshh8oLLozEA27ZuxPJ7hae8iqA5pfvtoZw@mail.gmail.com>
To: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] python-oslo.i18n: upgrade 3.20.0 -> 3.23.1
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
X-List-Received-Date: Tue, 03 Sep 2019 21:09:22 -0000
Content-Type: text/plain; charset="UTF-8"

merged

Bruce

On Tue, Aug 27, 2019 at 2:57 AM Zheng Ruoqin
<zhengrq.fnst@cn.fujitsu.com> wrote:
>
> Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
> ---
>  .../{python-oslo.i18n_3.20.0.bb => python-oslo.i18n_3.23.1.bb}  | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta-openstack/recipes-devtools/python/{python-oslo.i18n_3.20.0.bb => python-oslo.i18n_3.23.1.bb} (92%)
>
> diff --git a/meta-openstack/recipes-devtools/python/python-oslo.i18n_3.20.0.bb b/meta-openstack/recipes-devtools/python/python-oslo.i18n_3.23.1.bb
> similarity index 92%
> rename from meta-openstack/recipes-devtools/python/python-oslo.i18n_3.20.0.bb
> rename to meta-openstack/recipes-devtools/python/python-oslo.i18n_3.23.1.bb
> index 76a8b53..1910532 100644
> --- a/meta-openstack/recipes-devtools/python/python-oslo.i18n_3.20.0.bb
> +++ b/meta-openstack/recipes-devtools/python/python-oslo.i18n_3.23.1.bb
> @@ -4,7 +4,7 @@ SECTION = "devel/python"
>  LICENSE = "Apache-2"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=34400b68072d710fecd0a2940a0d1658"
>
> -SRCREV = "172e20b10981069c36b0f42377e5b4fbe22a9864"
> +SRCREV = "20bbee510b9714075b7f48f7c3968d7e2bd21a8a"
>
>  SRCNAME = "oslo.i18n"
>  SRC_URI = "git://github.com/openstack/${SRCNAME}.git;branch=master"
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

