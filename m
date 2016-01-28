Return-Path: <cjp256@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 3BA41E008F5; Thu, 28 Jan 2016 12:50:12 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (cjp256[at]gmail.com)
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.213.196 listed in list.dnswl.org]
Received: from mail-ig0-f196.google.com (mail-ig0-f196.google.com
	[209.85.213.196])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id F155AE00803
	for <meta-virtualization@yoctoproject.org>;
	Thu, 28 Jan 2016 12:50:08 -0800 (PST)
Received: by mail-ig0-f196.google.com with SMTP id o2so2563878iga.3
	for <meta-virtualization@yoctoproject.org>;
	Thu, 28 Jan 2016 12:50:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=rbTR4BKQANbwhhnN3BGjuF6bBOjMwnKi9B9hoRAgG68=;
	b=0mrQIcWsqvgeIZ7LHIP4dDvJ81kfCU+aODTRp129gOCPbVZYN8nMxvJEKCX9Gv0WJp
	EkQWFEilGRb+arHJsEo5IV6OHafLJnkqyLr+/jIhc8dTbplr3bqGgMhsELal97qjmugq
	a1n166r2QAsUJQSpEdMhVI+cGDAGcHQLVrkNUsLMks/KiCMrbl2WKdS+jokIqwUHSVmq
	W131L1YE2KBN2sLyWquGfM8cjaAUPwYZ7lV8SUUydyXg84Z0D6DuMn02XPYSVWGSAuH9
	mejj0toZ835go5Sy6tZN8GQUyuB/rqnOcIcaZV1OjOQrAYBwOxDMauwEPHs2jt9cw0Bp
	Ms6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=rbTR4BKQANbwhhnN3BGjuF6bBOjMwnKi9B9hoRAgG68=;
	b=L6RvcXC0FKW5faiVjmZhwZ4Ke6emBw/8jW91qaYPtIidlthYz9I7RgcitWDAne9XOw
	q3z5Uj349VvlPDsStwmoOysRGSHJG/R3vch78jeaULh5d0AwpdM9TdztlL62Oc7GRy4E
	QndsvidDO2DeBeRZblX3mnznVGIAJm8PYd6g5L+QbItVn62AtiqXJLxfN3O5mj4LfpHA
	Z8Cni9MR2ZIedazVgJ2TFYv5s12clvImx4yNcJnTnLse3qAWoLe3Fy/GxgBuhUbC1cUP
	razY5njA3loIZZgKi/SzAXJs/RgxyqetV+ieVWmz84Prd+o5LQeltUA/842HpgJtW3Qx
	adIA==
X-Gm-Message-State: AG10YORKKhUVb/PxAr8/yIVJaVymnD8jhmpW5rXK+mef1Iq2sumTDoZlJ7Rt6FPPZCuy+Rg4F4XwigNOpeXFSQ==
MIME-Version: 1.0
X-Received: by 10.50.67.47 with SMTP id k15mr5766074igt.18.1454014208052; Thu,
	28 Jan 2016 12:50:08 -0800 (PST)
Received: by 10.79.125.142 with HTTP; Thu, 28 Jan 2016 12:50:07 -0800 (PST)
In-Reply-To: <1453835364-6473-1-git-send-email-cardoe@cardoe.com>
References: <1453835364-6473-1-git-send-email-cardoe@cardoe.com>
Date: Thu, 28 Jan 2016 15:50:07 -0500
Message-ID: <CABZSBQe7o9eoJqJGXG-zG7V51wmqv+d-EXm4wFhPgY8ju33FsA@mail.gmail.com>
From: Chris Patterson <cjp256@gmail.com>
To: Doug Goldstein <cardoe@cardoe.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH v2 0/8] Xen 4.6 updates
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
X-List-Received-Date: Thu, 28 Jan 2016 20:50:12 -0000
Content-Type: text/plain; charset=UTF-8

Ran a quick test of the series, LGTM.  +1

On Tue, Jan 26, 2016 at 2:09 PM, Doug Goldstein <cardoe@cardoe.com> wrote:
> A number of updates for building Xen 4.6. This should be the last of the
> patches that I've been carrying locally for 4.6 (save for init script
> changes but those I'm trying to upstream).
>
> change since v1:
> - readd libgcc to xen-xl per Chris Patterson's testing
> - add patches I forgot to submit in the first place
> - squash in EXTRA_OEMAKE and do_install_append changes into xen.inc
> - make sure xen_git is able to fetch
>
> Doug Goldstein (8):
>   xen: update git version to 4.6.x
>   xen: drop explicit DEPEND on libgcc
>   xen: fix up typo in XSM comments
>   xen: separate the extra steps into their own tasks
>   xen: move bits common to all Xen versions to xen.inc
>   xen: merge do_install_append to do_install
>   xen: don't allow the build system to fetch
>   xen: don't inject -mfpmath=sse which causes build issues
>
>  ...xen-x86-Fix-up-rules-when-forcing-mno-sse.patch | 28 ----------
>  recipes-extended/xen/xen.inc                       | 59 ++++++++++++++++++++--
>  recipes-extended/xen/xen_4.6.0.bb                  | 40 ---------------
>  recipes-extended/xen/xen_git.bb                    |  8 +--
>  4 files changed, 60 insertions(+), 75 deletions(-)
>  delete mode 100644 recipes-extended/xen/files/xen-x86-Fix-up-rules-when-forcing-mno-sse.patch
>
> --
> 2.4.10
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization

