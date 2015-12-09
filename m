Return-Path: <asselsm@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D70B9E00B7D; Tue,  8 Dec 2015 17:31:57 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [74.125.82.50 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-wm0-f50.google.com (mail-wm0-f50.google.com [74.125.82.50])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 97DD8E00406
	for <meta-virtualization@yoctoproject.org>;
	Tue,  8 Dec 2015 17:31:54 -0800 (PST)
Received: by wmuu63 with SMTP id u63so202794997wmu.0
	for <meta-virtualization@yoctoproject.org>;
	Tue, 08 Dec 2015 17:31:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:reply-to:sender:date:message-id:subject:from:to:cc
	:content-type; bh=uhmS97ip1ZZKJn+Eecd5bFGj3se+47qsxbrlIpnVmzM=;
	b=vz2Idhq+j6r5dUcBKpApKM3X3HNn7rMZfl3FR0ncUopL5XuXDcrb9cwyxrNL+aGJ28
	aBJMgdNYl11xPSZfsOngXggS8uw4nv7+sFD91+jTCL5IuYu0JbX6elWeEeOW4qbu4Y2u
	ZSw/em0+4L6KE6rSbQKYvBVoUKb6VMa2uRsBwb84KNtq4DiWrsISihuEa9pti2tNZ63M
	Bdjn2y7yUAe9MaR6GcQ18ZzixB1ieX+3dh2sUHyWT/6V3XwjU6W2uqn87wBq03H6q5tw
	IZIpeWKU0HH/I7g+hPD+DLcWFFJX649mTMCMBZvl3RprujORyB2tq0Khfr65OyypJuvM
	WvOg==
MIME-Version: 1.0
X-Received: by 10.194.114.34 with SMTP id jd2mr2766591wjb.12.1449624713364;
	Tue, 08 Dec 2015 17:31:53 -0800 (PST)
Sender: asselsm@gmail.com
Received: by 10.194.59.176 with HTTP; Tue, 8 Dec 2015 17:31:53 -0800 (PST)
Date: Tue, 8 Dec 2015 20:31:53 -0500
X-Google-Sender-Auth: 2qQPyPsuMnQtTed89jOupJgtAEE
Message-ID: <CAPuovEKNdfoeP6ewE2gXHJB46OiBXAdsQ2wiLYWrDVmpM0Ay7A@mail.gmail.com>
From: Mark Asselstine <mark.asselstine@windriver.com>
To: Josep Puigdemont <josep.puigdemont@enea.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [meta-cloud-services][fido-kilo][PATCH 41/42] packagegroup-cloud-extras: include xterm only if x11 in DISTRO_FEATURES
X-BeenThere: meta-virtualization@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
Reply-To: mark.asselstine@windriver.com
List-Id: "Discussion of layer enabling hypervisor, virtualization tool stack,
	and cloud support" <meta-virtualization.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-virtualization>
List-Post: <mailto:meta-virtualization@yoctoproject.org>
List-Help: <mailto:meta-virtualization-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Wed, 09 Dec 2015 01:31:57 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Dec 8, 2015 at 12:33 PM, Josep Puigdemont
<josep.puigdemont@enea.com> wrote:
> Signed-off-by: Josep Puigdemont <josep.puigdemont@enea.com>
> ---

The reason we included xterm is to have the 'resize' command
available. Admittedly this is a big hammer to solve a small problem
but an annoying problem. Was xterm causing issues?

Mark

>  .../recipes-extended/packagegroups/packagegroup-cloud-extras.bb         | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-openstack/recipes-extended/packagegroups/packagegroup-cloud-extras.bb b/meta-openstack/recipes-extended/packagegroups/packagegroup-cloud-extras.bb
> index 35b9b6e..721e2c9 100644
> --- a/meta-openstack/recipes-extended/packagegroups/packagegroup-cloud-extras.bb
> +++ b/meta-openstack/recipes-extended/packagegroups/packagegroup-cloud-extras.bb
> @@ -8,7 +8,7 @@ inherit packagegroup
>
>  RDEPENDS_${PN} = " \
>      vim \
> -    xterm \
> +    ${@base_contains('DISTRO_FEATURES', 'x11', 'xterm', '', d)} \
>      "
>
>  IMAGE_FEATURES += "package-management"
> --
> 2.5.0
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization

