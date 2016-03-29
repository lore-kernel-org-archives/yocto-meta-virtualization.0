Return-Path: <cjp256@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id CBB39E00BF8; Tue, 29 Mar 2016 07:59:52 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (cjp256[at]gmail.com)
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.218.41 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-oi0-f41.google.com (mail-oi0-f41.google.com
	[209.85.218.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9AB3BE00951
	for <meta-virtualization@yoctoproject.org>;
	Tue, 29 Mar 2016 07:59:49 -0700 (PDT)
Received: by mail-oi0-f41.google.com with SMTP id d205so25386702oia.0
	for <meta-virtualization@yoctoproject.org>;
	Tue, 29 Mar 2016 07:59:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=krr+Rf8n8IbLoWnV1cAB0ZMbqwJ8DKnrQ11yy2FeQtM=;
	b=rdNrqH8e2d/LVJRycsN6tO2/Y5V3FYSOKY+POLc77NWdahudwxNUjf+ucYTC6Ermlj
	3KrV9UKom03uz7eJw4HhZsuyncs0sTyI2WBA6KixAcQi3hLWTggXsePeftUvhJoU/yCn
	imkvyRTkWXGdPk/iclnxfn9VvX/xlIF9/IFTCg8l1VxAxCJN1IYWBZdG0TVgXIJ7I3KL
	jfWEZBt6IuLdiic0Z5t3/+tMZ+VYK+MDWtNgyimT6Dv0L/weULUBjyvOom7VLxRKnoR9
	HLqY18/MJ5I38hlB+klHVINWiIpTEhovi2OQJBQ4NMPwQGb3XqcJhY7VdpMw+oEQYneq
	Nhhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=krr+Rf8n8IbLoWnV1cAB0ZMbqwJ8DKnrQ11yy2FeQtM=;
	b=miDVUZZKHWs+clQHx3acrIpy1lVIcV8H+XshOITsSzgXw1B4AsjYMk3LQZ0gvgZarL
	lNIHz+WGjxMV14PWpqXyPZLj2VWJeQPZm+7EGkcBDoET1M0p2yF4LozbdihR2XInppi2
	G5aDC3Nqem572B+hY/5rTlauqlNasYIpj4gX/BD7XwJnE5q/krtXV7mBgdjpuGGRI/ck
	fFK73evOaZ32ui2NEB64i7QiboN0OdLp5PwyAzBBF9a31XxF8KCMz6CbzADJH12klY1a
	sP4jWsZtDAgWXWx7EqdttqR+EGBVz/drVv0ilonWm/Pm8sDcT1NHakeOiieh6uCI5zKh
	bOzg==
X-Gm-Message-State: AD7BkJIyB5eWxZgVKRkgnMGMF36w9ucbZurD3c1NeNBUzOdIPw9nnIhTUZ+Rih1oF6Niqv+9rZHK+g/rcb4g1w==
X-Received: by 10.202.232.141 with SMTP id f135mr1301727oih.95.1459263588568; 
	Tue, 29 Mar 2016 07:59:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.157.15.72 with HTTP; Tue, 29 Mar 2016 07:59:28 -0700 (PDT)
In-Reply-To: <1459255600-14043-2-git-send-email-derek@asterius.io>
References: <1459255600-14043-1-git-send-email-derek@asterius.io>
	<1459255600-14043-2-git-send-email-derek@asterius.io>
From: Chris Patterson <cjp256@gmail.com>
Date: Tue, 29 Mar 2016 10:59:28 -0400
Message-ID: <CABZSBQe+FEGtkbz3o2xMF0ii4=2F7+sH_-2NZz6W3dXxgihLVw@mail.gmail.com>
To: Derek Straka <derek@asterius.io>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCHv2 2/4] xen: add the ability to configure the name of the policy
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
X-List-Received-Date: Tue, 29 Mar 2016 14:59:52 -0000
Content-Type: text/plain; charset=UTF-8

Built, package LGTM, +1

On Tue, Mar 29, 2016 at 8:46 AM, Derek Straka <derek@asterius.io> wrote:
> When using non-release versions, the policy files may have a different name (xenpolicy-${PV}-unstable).  Allow the policy file name to be configured by the xen recipe.
>
> Signed-off-by: Derek Straka <derek@asterius.io>
> ---
>  recipes-extended/xen/xen.inc | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc
> index bc5ff85..77740cf 100644
> --- a/recipes-extended/xen/xen.inc
> +++ b/recipes-extended/xen/xen.inc
> @@ -17,6 +17,8 @@ PACKAGECONFIG ??= " \
>      ${@bb.utils.contains('XEN_TARGET_ARCH', 'x86_64', 'hvm', '', d)} \
>      "
>
> +FLASK_POLICY_FILE ?= "xenpolicy-${PV}"
> +
>  PACKAGECONFIG[sdl] = "--enable-sdl,--disable-sdl,virtual/libsdl,"
>  PACKAGECONFIG[xsm] = "--enable-xsmpolicy,--disable-xsmpolicy,checkpolicy-native,"
>  PACKAGECONFIG[systemd] = "--enable-systemd,--disable-systemd,systemd,"
> @@ -343,7 +345,7 @@ FILES_${PN}-devd = "\
>      "
>
>  FILES_${PN}-flask = "\
> -    /boot/xenpolicy-${PV} \
> +    /boot/${FLASK_POLICY_FILE} \
>      "
>
>  FILES_${PN}-flask-tools = "\
> --
> 1.9.1
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization

