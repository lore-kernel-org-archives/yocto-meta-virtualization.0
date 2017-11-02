Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 3C77EE00C59; Thu,  2 Nov 2017 16:30:41 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, RCVD_IN_DNSWL_NONE,
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.220.195 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.220.195 listed in dnsbl.sorbs.net]
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 24296E00C44
	for <meta-virtualization@yoctoproject.org>;
	Thu,  2 Nov 2017 16:30:39 -0700 (PDT)
Received: by mail-qk0-f195.google.com with SMTP id m189so1352303qke.4
	for <meta-virtualization@yoctoproject.org>;
	Thu, 02 Nov 2017 16:30:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Gw0k3cFjQYxT5jfJWlA8g6i2kpNXD5zev4cAQsgeNLo=;
	b=ByCQ3y98BuHsb8ys0cqcEjTVvEIEawkICRlROLqXDBCf1DW1TFzvcMfpZD1pouvP4V
	owxCwM65xemt9twAUf2WwoMslqRoXYfN7sEQhtZDVIjpuzhSHCMojkCrbBiJXur0Cfl+
	J2uPnbVlXDmggL4Hacye0Dt6+Iir6GpnAQAte/sqDZBWWVTT62pZFwrz+MgJVOsryNGH
	olukjib6DJ+FPWpxL74MR18erRSgDt2GqKW2th9WL+iXF3Yn648G/Ag9OapVhVxhulQK
	slpBfEVekL9Kr2MuwRVG8CUUpUZzzwkICYZjH4ZpHWCAZs9nLD/UcisuT7Tj10V7Kz8u
	o46Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Gw0k3cFjQYxT5jfJWlA8g6i2kpNXD5zev4cAQsgeNLo=;
	b=PVmEBwRqtaZnEKgRVzHzv4cBlKc0YWv3SvlG8IiyuTsfbJcwceWbkroXWZTSqHkyyJ
	1LYLOrS90W4ahST7HnA1uadJHe8EPSZgezOs8dfuCbtpRCh2GIm21zFEWh/5/yA+4tmj
	SRU8AIqpaFVa8DLMXJDSOpR1KiwcDQUzRRj+kzWL0fsXpSie12cFSKSB/DJPGhOtNtrZ
	rGHVtpvQSWUITb/aWMUA9eTAZiGMAPnDiYkPLKYgJsMZHETyMPPULqZIA/rwoRbY6OP+
	ScZvcPfKOsVnVZZsbYLvfAOtB7Duc9WQpUDbCcbU+4aZ6+2J3wq9hZMV2UOI5dAkWBty
	7qDg==
X-Gm-Message-State: AJaThX5kFjOVprHO0Ft3g/3LOflBczcMgaIt99OaSikSCr4WDCXdO5nh
	diEPfCHvnGSVGz0BTPYoLfrE0q7JBJh9uyMOTC4=
X-Google-Smtp-Source: ABhQp+R50f18Ct1pBKtsmAoveztTC3lzOUYqPO8uVRMKSo7763PgyZvhHjQ6gyE8U86AXb1ZOBwLUu/PCeptvYhN8Dg=
X-Received: by 10.233.237.193 with SMTP id c184mr6726782qkg.265.1509665439254; 
	Thu, 02 Nov 2017 16:30:39 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.12.182.80 with HTTP; Thu, 2 Nov 2017 16:30:38 -0700 (PDT)
In-Reply-To: <1509428605-885-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
References: <1509428605-885-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 2 Nov 2017 19:30:38 -0400
Message-ID: <CADkTA4Ox5YNwdpoHUVD8fQi8aW9maKCgdzyZtAxpEN7PNBA3eQ@mail.gmail.com>
To: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [meta-cloud-services][PATCH]python-happybase: upgrade to 1.1.0
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
X-List-Received-Date: Thu, 02 Nov 2017 23:30:41 -0000
Content-Type: text/plain; charset="UTF-8"

merged.

Bruce

On Tue, Oct 31, 2017 at 1:43 AM, Huang Qiyu <huangqy.fnst@cn.fujitsu.com> wrote:
> Upgrade python-happybase 1.0.0 to 1.1.0.
>
> Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
> ---
>  .../python/{python-happybase_1.0.0.bb => python-happybase_1.1.0.bb} | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>  rename meta-openstack/recipes-devtools/python/{python-happybase_1.0.0.bb => python-happybase_1.1.0.bb} (64%)
>
> diff --git a/meta-openstack/recipes-devtools/python/python-happybase_1.0.0.bb b/meta-openstack/recipes-devtools/python/python-happybase_1.1.0.bb
> similarity index 64%
> rename from meta-openstack/recipes-devtools/python/python-happybase_1.0.0.bb
> rename to meta-openstack/recipes-devtools/python/python-happybase_1.1.0.bb
> index 669a9cf..03ebd14 100644
> --- a/meta-openstack/recipes-devtools/python/python-happybase_1.0.0.bb
> +++ b/meta-openstack/recipes-devtools/python/python-happybase_1.1.0.bb
> @@ -7,10 +7,10 @@ LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=41f55ae3d7000e4323e84c468d8b42ee"
>  PR = "r0"
>  SRCNAME = "happybase"
>
> -SRC_URI = "https://pypi.python.org/packages/e8/6e/21ec2ff3f14084b2247e59dba89aecf115d1093a5256a343a7b158984b7f/${SRCNAME}-${PV}.tar.gz"
> +SRC_URI = "https://pypi.python.org/packages/8d/a4/9c1202ad4276d4e845594d534397c07082b90aee68c67f378fac38629e6f/${SRCNAME}-${PV}.tar.gz"
>
> -SRC_URI[md5sum] = "1274e74df553bbf800989578b7dfbe59"
> -SRC_URI[sha256sum] = "cee5f62735c6ba95c8f842decfd23bab5a07bc16cd0c5374f7461c975d4c608c"
> +SRC_URI[md5sum] = "62a09c784a65161e9f5f01129d115457"
> +SRC_URI[sha256sum] = "e20376e2e32291798d2226502994134c1c4e175136d8375b3c517a234fa22481"
>
>  S = "${WORKDIR}/${SRCNAME}-${PV}"
>
> --
> 2.7.4
>
>
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

