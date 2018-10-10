Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 5D4EDE00971; Wed, 10 Oct 2018 05:31:14 -0700 (PDT)
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
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.208.193 listed in list.dnswl.org]
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
	[209.85.208.193])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id BF3B4E00950
	for <meta-virtualization@yoctoproject.org>;
	Wed, 10 Oct 2018 05:31:13 -0700 (PDT)
Received: by mail-lj1-f193.google.com with SMTP id j4-v6so4688120ljc.12
	for <meta-virtualization@yoctoproject.org>;
	Wed, 10 Oct 2018 05:31:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=4n4kwSRd/8s6tmEmonkP4xfeDLcbvZ9rId5KhlY33kA=;
	b=VTDSmewk/gi5ehbd3QaydaEF3WV1N/7wllk7p1k44ja+1TfiAGtJ9CpZ0LGWnrW91z
	wDUp+0pptvHi/KvxhZT8fwPMgCCiOA+GXmpCRUufbwLuxaC5YLluKKpD9Ap9lZ6FJuFP
	LvVRScpZ8oChcFl/lHfy47WI+CHXXZN8DiBbC8XarPfmgcYRJNF3YN4pEypvKzyvhBSM
	XqeyL8lWtvX3zjU+d+Od5eZRiNuzhlvF1fAgXKiW69A92NScaWsuLIQT1RnCa1Q3GbcH
	kqbt9lik80Frcp9NyroTQ532EJctipPSZq8pLcmBgQmZAfMEav6DV5h6M6a7Dh0vfgkU
	x9Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=4n4kwSRd/8s6tmEmonkP4xfeDLcbvZ9rId5KhlY33kA=;
	b=JTB3d4/h51qYlN16eiDjyPVIzqvg+Tup8Vb8O+anobR4ccSnywMQq7p3tcv0QT1O/s
	4TVv25EnBoNBxk3tl4/XOetumdFqR5/ZKX2i2tXl8a9kpwdKZnU3JHhqu+tT930PZ8Pf
	Vr1ffCF2fuy70ZCyMjRzd/xRBcJcdtxElnz9w06FKcbR171U8ygwWHHZV5xugTcg9yqF
	4eHM7UVIFVbixj60rLvGHmLR1VBSwai1wLYotuZsvJGxSolrjccxzl+W1422+sPPFS+O
	IEmfkhocZ9i39IfdzDA7rESURZfxvbmu8Df+6Zx78MPFLOI5tKf52EpjfF8DWw370vXl
	OhPw==
X-Gm-Message-State: ABuFfohLB9Q6eB6Qb7he3Ga25j6zZF02Xh9YN/qefQEk9SLzqDeAkBe2
	L7qauHHrmhfc0adwmvILsoO74rID5wg4cNynKK6Lsw==
X-Google-Smtp-Source: ACcGV62IUb5Y32aValSEs5UoWCmtPyHYkcRYG387Ai+CC3+Km14xzOjw3MMxz38lFl/7j+HELMjJyjZjDvDYN0/enaA=
X-Received: by 2002:a2e:501c:: with SMTP id
	e28-v6mr20548773ljb.45.1539174672446; 
	Wed, 10 Oct 2018 05:31:12 -0700 (PDT)
MIME-Version: 1.0
References: <1539163886-138214-1-git-send-email-mingli.yu@windriver.com>
In-Reply-To: <1539163886-138214-1-git-send-email-mingli.yu@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 10 Oct 2018 08:31:00 -0400
Message-ID: <CADkTA4P_7bHiT265JP+pdpzgXV=awtSFeaq+=xC1iC86vBTfqg@mail.gmail.com>
To: "Yu, Mingli" <mingli.yu@windriver.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [meta-openstack][PATCH] layer.conf: set PREFERRED_VERSION for python-networkx
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
X-List-Received-Date: Wed, 10 Oct 2018 12:31:14 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Oct 10, 2018 at 5:31 AM <mingli.yu@windriver.com> wrote:
>
> From: Mingli Yu <Mingli.Yu@windriver.com>
>
> Only set PREFERRED_VERSION for python-networkx
> when the openstack distro is enabled

If we are introducing a distro feature for openstack, there needs to
be a warning
generated if the layer is included, but the distro feature is not set.

That preserves the existing behaviour (enabled by default) by letting the user
know what they must enable in their config to get openstack building and the
right versions.

We should also have a variable to inhibit the warning for those that want the
layer, and know they haven't enabled it.

See meta-virtualization for an example of how to do both.

Bruce

>
> Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
> ---
>  meta-openstack/conf/layer.conf | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-openstack/conf/layer.conf b/meta-openstack/conf/layer.conf
> index 126f37f..2dceb47 100644
> --- a/meta-openstack/conf/layer.conf
> +++ b/meta-openstack/conf/layer.conf
> @@ -32,7 +32,7 @@ PREFERRED_VERSION_python-sqlalchemy = "1.0.16"
>  PREFERRED_VERSION_python-eventlet = "0.20.0"
>  PREFERRED_VERSION_python-warlock = "1.2.0"
>  PREFERRED_VERSION_python-jsonschema = "2.6.0"
> -PREFERRED_VERSION_python-networkx = "1.11"
> +PREFERRED_VERSION_python-networkx = "${@bb.utils.contains('DISTRO_FEATURES', 'openstack', '1.11', '', d)}"
>  PREFERRED_VERSION_python-oslo.i18n = "3.17.0+gitAUTOINC+f2729cd36f"
>
>  LICENSE_PATH += "${LAYERDIR}/licenses"
> --
> 2.7.4
>


-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

