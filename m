Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id DF076E00770; Wed,  7 May 2014 06:10:57 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.217.178 listed in list.dnswl.org]
Received: from mail-lb0-f178.google.com (mail-lb0-f178.google.com
	[209.85.217.178])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id F03BFE003C7
	for <meta-virtualization@yoctoproject.org>;
	Wed,  7 May 2014 06:10:48 -0700 (PDT)
Received: by mail-lb0-f178.google.com with SMTP id w7so1297957lbi.23
	for <meta-virtualization@yoctoproject.org>;
	Wed, 07 May 2014 06:10:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=Ukw25W6dAn7XT9yHwmqzTI2avpwJ2qXgF7HjgWrLm8w=;
	b=pg3AGqbjEkyP61zwd+koYetBTTxpyUD0YyztcDmQuoFSlgyUFKWpE6UzXQC8rvUatG
	INBeiNAv1raQKMgM4p5c8b51Ldbucdlt3WgmTCPCo17bXHSzRfioDfsMIcOHepalhwk8
	IhqFcRe6j9j94JZOsA1ekTw7ykYRl882xdYnNhwks347R4xvujhnZ5p2+/n8NiThPv1M
	EiLOrBMYRlx3XTlnuFVXeie32atnY01GuBDeJBdS75uaQc71jndtbf7fbH1cKh/oGCag
	eXFV+HKBIuEx02l8H/gDFsExkQ0fOIdox023fy9pevLTKjz5zvIk850jz0k7sXXT2Oc3
	qHHQ==
MIME-Version: 1.0
X-Received: by 10.112.13.72 with SMTP id f8mr4935209lbc.40.1399468247131; Wed,
	07 May 2014 06:10:47 -0700 (PDT)
Received: by 10.112.58.132 with HTTP; Wed, 7 May 2014 06:10:47 -0700 (PDT)
In-Reply-To: <20140507124513.GA18437@iapetus.enea.se>
References: <20140507124513.GA18437@iapetus.enea.se>
Date: Wed, 7 May 2014 09:10:47 -0400
Message-ID: <CADkTA4NXTB558rHETszFB9WuRwKEWRvr7gwRkDfhJB_fMhwxgA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Josep Puigdemont <josep.puigdemont@enea.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>, Joe Slater <jslater@windriver.com>
Subject: Re: libvirt requires libssh2
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
X-List-Received-Date: Wed, 07 May 2014 13:10:57 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, May 7, 2014 at 8:45 AM, Josep Puigdemont
<josep.puigdemont@enea.com> wrote:
> Hi,
>
> A default dependency on libssh2 for libvirt was added recently. Where is libssh2
> provided? I can not find it in either meta-oe or oe-core.

Joe ? Did that leak in from something local to you ?

Regardless, I'll revert the change for now.

Bruce

>
> Thanks,
> Josep
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

