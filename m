Return-Path: <cjp256@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 811F7E00BF8; Tue, 29 Mar 2016 08:01:06 -0700 (PDT)
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
	*      [209.85.214.172 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-ob0-f172.google.com (mail-ob0-f172.google.com
	[209.85.214.172])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4F909E00951
	for <meta-virtualization@yoctoproject.org>;
	Tue, 29 Mar 2016 08:01:02 -0700 (PDT)
Received: by mail-ob0-f172.google.com with SMTP id fp4so13459325obb.2
	for <meta-virtualization@yoctoproject.org>;
	Tue, 29 Mar 2016 08:01:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=9U31vSeuuy/3f/sAZqG5KhQazYtZDvTv4V3G6FcyFIk=;
	b=LiepjgS/r1Dzskb8L8bMBC0GdzIFenzzNlm+gRzwSGNKj8nSffCKXjNuYEmmZ4zSON
	atS68xE3X+Zbwm8gwkXp8XLj7/lL8VpEFhVvDvBI4Ca+nXoI+2rbIC33D8kbVJ/UPpLP
	kBubwGgCK9fnEpDUTnULKKB6DDoKJYr8BiNPeU4f1jbabB1Gk5Bbs9txm3l6YnBVoDoc
	4PNKmFtYH51tH52zwgTWb5c2EIOrKfEDvKg1a64zlhtPl+XxhjthXwVFq6XC5fd6NPv1
	TODI6NEwZy6Saah2mbiiP6u+cLoY4Q8jc1wbsPBmE+qAXc1wA6ANFXm7AHQzzFin+cfI
	f1YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=9U31vSeuuy/3f/sAZqG5KhQazYtZDvTv4V3G6FcyFIk=;
	b=PqlvEuROyaRjuW3JQGlxyAy4vdu1dmAFfqc7DbnIKbXevQp6TFdCMZqW4L098ki6yd
	l27eQQ/feoMfzdFu2kywF05d4dQT8tx+XlycemetUMN1EPFnibU07/qsPOPeO1LJkCTD
	c3N3JnBlAsdqCObGtuknxy2WpFjOAn9JpHTNX2rojwY8mwgAdvGyHCtNzazhgqn8mncQ
	SJX7nf6u90rKtPivlQBnT48mPnUIpKJd3OHFi0OlbYde3v+QYJPLzP420fYyC3x9/vbW
	NRnEiA5TVbRmcxVd73vf/pijp38fdDuo/hIpwF2c9Z7yuHUZQCgjqOxDejr/otFlqYPR
	9OYw==
X-Gm-Message-State: AD7BkJLhLe+Zf6ORYQSb3bdiYun8tk8ugjXI6C1kzSVBFg7cFDfwfYJc4KfoneZ41f5piP3UZCFYtiCHj9O9lg==
X-Received: by 10.60.74.33 with SMTP id q1mr683748oev.72.1459263661590; Tue,
	29 Mar 2016 08:01:01 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.157.15.72 with HTTP; Tue, 29 Mar 2016 08:00:42 -0700 (PDT)
In-Reply-To: <1459255600-14043-3-git-send-email-derek@asterius.io>
References: <1459255600-14043-1-git-send-email-derek@asterius.io>
	<1459255600-14043-3-git-send-email-derek@asterius.io>
From: Chris Patterson <cjp256@gmail.com>
Date: Tue, 29 Mar 2016 11:00:42 -0400
Message-ID: <CABZSBQfTzxq=yQXvX6y3Y1WdPk+ktYvtNbrGxf-2pSL0m2e44A@mail.gmail.com>
To: Derek Straka <derek@asterius.io>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCHv2 3/4] xen: add the flask policy to the set of files installed to the deploy directory
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
X-List-Received-Date: Tue, 29 Mar 2016 15:01:06 -0000
Content-Type: text/plain; charset=UTF-8

Built, deployed OK, LGTM, +1

On Tue, Mar 29, 2016 at 8:46 AM, Derek Straka <derek@asterius.io> wrote:
> Signed-off-by: Derek Straka <derek@asterius.io>
> ---
>  recipes-extended/xen/xen.inc | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc
> index 77740cf..ae09b8b 100644
> --- a/recipes-extended/xen/xen.inc
> +++ b/recipes-extended/xen/xen.inc
> @@ -878,6 +878,11 @@ do_deploy() {
>      if [ -f ${D}/boot/xen.gz ]; then
>          install -m 0644 ${D}/boot/xen.gz ${DEPLOYDIR}/xen-${MACHINE}.gz
>      fi
> +    # Install the flask policy in the deploy directory if it exists
> +    if [ -f ${D}/boot/${FLASK_POLICY_FILE} ]; then
> +        install -m 0644 ${D}/boot/${FLASK_POLICY_FILE} ${DEPLOYDIR}
> +        ln -sf ${FLASK_POLICY_FILE} ${DEPLOYDIR}/xenpolicy-${MACHINE}
> +    fi
>  }
>
>  addtask deploy after do_populate_sysroot
> --
> 1.9.1
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization

