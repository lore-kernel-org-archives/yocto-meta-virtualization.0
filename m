Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id EAA7FE0077E; Mon, 16 Feb 2015 20:42:52 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.215.47 listed in list.dnswl.org]
Received: from mail-la0-f47.google.com (mail-la0-f47.google.com
	[209.85.215.47])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 24C0CE00777
	for <meta-virtualization@yoctoproject.org>;
	Mon, 16 Feb 2015 20:42:47 -0800 (PST)
Received: by labpn19 with SMTP id pn19so33569303lab.4
	for <meta-virtualization@yoctoproject.org>;
	Mon, 16 Feb 2015 20:42:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=OxwAgS+AQn89YhFk3ax9rZqG0Iiwe0BWcTAFmQUtzx0=;
	b=1EvjQBVkpjWHBeZOj2w64jmEOkhaZz8AmElnEgzT+D1pVlxncgLmCj7Ty1yjjGrwzi
	a/qmSAPs13swyHiePiDOf8HKFu7eYd+TX45QUy5JfCsFR+11zFok+vlO1UTWPY5tERYg
	iI7fJghS/YaDX0cJYbm3bQ8Tf/J96EipZOwJLC3oq/8TKR4u1PoRhI2v2FHAyfgOVrd4
	ECszp9n08jAP7liJkzfbYcOv3koVQwglK/o5qAtjiQemLJ4Ng0V2457IH3ErZXSlZ0I8
	tERJlsm09dZ+cP2GlnvnViD05/AWoP3F/izz9oH9htlpXhZW1cb4YhYgq/60Kp193gte
	h99w==
MIME-Version: 1.0
X-Received: by 10.112.126.162 with SMTP id mz2mr26406757lbb.51.1424148164979; 
	Mon, 16 Feb 2015 20:42:44 -0800 (PST)
Received: by 10.112.40.34 with HTTP; Mon, 16 Feb 2015 20:42:44 -0800 (PST)
In-Reply-To: <1423829042-21574-1-git-send-email-j105.rob@gmail.com>
References: <1423829042-21574-1-git-send-email-j105.rob@gmail.com>
Date: Mon, 16 Feb 2015 23:42:44 -0500
Message-ID: <CADkTA4P3GCWxZ3+kDMec+Vg28Y3J_0xBH7NB0mHEqye55s5=rw@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: j105rob <j105.rob@gmail.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] dev86: Adjusted the SRC_URI of the source code.
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
X-List-Received-Date: Tue, 17 Feb 2015 04:42:53 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Feb 13, 2015 at 7:04 AM, j105rob <j105.rob@gmail.com> wrote:
> The SRC_URI of the source code was returning a 404. After locating the correct URI
> for this version of the source code, updated the SRC_URI & hashes.

merged

Bruce

>
> Signed-off-by: j105rob <j105.rob@gmail.com>
> ---
>  recipes-extended/dev86/dev86_0.16.19.bb | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/recipes-extended/dev86/dev86_0.16.19.bb b/recipes-extended/dev86/dev86_0.16.19.bb
> index 807504e..5e26a75 100644
> --- a/recipes-extended/dev86/dev86_0.16.19.bb
> +++ b/recipes-extended/dev86/dev86_0.16.19.bb
> @@ -5,10 +5,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b"
>  SECTION = "console/tools"
>  PR="r0"
>
> -SRC_URI="http://www.debath.co.uk/dev86/Dev86src-${PV}.tar.gz"
> +SRC_URI="https://github.com/lkundrak/dev86/archive/v${PV}.zip"
>
> -SRC_URI[md5sum] = "442e98e1afa23fe00d40c5a996385942"
> -SRC_URI[sha256sum] = "33398b87ca85e2b69e4062cf59f2f7354af46da5edcba036c6f97bae17b8d00e"
> +SRC_URI[md5sum] = "1308759f36f9907e7dae92c46f35c51e"
> +SRC_URI[sha256sum] = "efd33d456ff87d6d0308608f6a34052b22ea8629913d0597d98c73815ed0f9f0"
>
>  S = "${WORKDIR}/dev86-${PV}"
>
> --
> 2.3.0
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

