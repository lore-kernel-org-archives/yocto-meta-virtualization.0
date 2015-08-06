Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B4470E00A7D; Wed,  5 Aug 2015 19:45:59 -0700 (PDT)
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
	*      [209.85.160.171 listed in list.dnswl.org]
Received: from mail-yk0-f171.google.com (mail-yk0-f171.google.com
	[209.85.160.171])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8BFBDE00A53
	for <meta-virtualization@yoctoproject.org>;
	Wed,  5 Aug 2015 19:45:58 -0700 (PDT)
Received: by ykax123 with SMTP id x123so52221450yka.1
	for <meta-virtualization@yoctoproject.org>;
	Wed, 05 Aug 2015 19:45:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=5AM5uf3linThzPyiPE4LdV1/YpNi9bzv6kf5oXw3GjY=;
	b=iWgROenvGtbTZn/sjmHYxbgwEDX+VSQZeQvlg7KHqxfDsb4EM50F21VCliMQWhFz5h
	zmgZSm+pGuG+RVmtzRXwjXrzFChkgzR65HdS7q+BT/V+YRbx2jENfH086yXtQ2OGlJLF
	hXorC1dQSVSeq7w0n/quohcE0Ek6XoT5KVQl8tFpZnndc8SgkB0fOOo4flvSNMgwzWSb
	RbU7WBIDlfHbF4+h4hLEIy4lTWxZTdUWkkb758FtQeTfRbZ6kMPtZlfSntC+YpY0j82G
	uS75o0Vb0VoA3Vy/NvHU46mtw05hX64B018YGne3XB4rE/wVmymxRDPRTyX9BB4IWxic
	+buA==
MIME-Version: 1.0
X-Received: by 10.170.74.130 with SMTP id q124mr12099709ykq.21.1438829157772; 
	Wed, 05 Aug 2015 19:45:57 -0700 (PDT)
Received: by 10.13.226.203 with HTTP; Wed, 5 Aug 2015 19:45:57 -0700 (PDT)
In-Reply-To: <1438739950-2649-1-git-send-email-lixin.fnst@cn.fujitsu.com>
References: <1438739950-2649-1-git-send-email-lixin.fnst@cn.fujitsu.com>
Date: Wed, 5 Aug 2015 22:45:57 -0400
Message-ID: <CADkTA4N5rt9ZRCO6qHwUrKgZAYDUFKmB5fjV+W2jNQiMYNtJbQ@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Li xin <lixin.fnst@cn.fujitsu.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [meta-cloud-services][PATCH] python-cliff: upgrade 1.12.0 -> 1.13.0
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
X-List-Received-Date: Thu, 06 Aug 2015 02:45:59 -0000
Content-Type: text/plain; charset=UTF-8

merged!

Cheers,

Bruce

On Tue, Aug 4, 2015 at 9:59 PM, Li xin <lixin.fnst@cn.fujitsu.com> wrote:
> Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
> ---
>  .../python/{python-cliff_1.12.0.bb => python-cliff_1.13.0.bb}         | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta-openstack/recipes-devtools/python/{python-cliff_1.12.0.bb => python-cliff_1.13.0.bb} (78%)
>
> diff --git a/meta-openstack/recipes-devtools/python/python-cliff_1.12.0.bb b/meta-openstack/recipes-devtools/python/python-cliff_1.13.0.bb
> similarity index 78%
> rename from meta-openstack/recipes-devtools/python/python-cliff_1.12.0.bb
> rename to meta-openstack/recipes-devtools/python/python-cliff_1.13.0.bb
> index e6da930..d8ef0af 100644
> --- a/meta-openstack/recipes-devtools/python/python-cliff_1.12.0.bb
> +++ b/meta-openstack/recipes-devtools/python/python-cliff_1.13.0.bb
> @@ -8,8 +8,8 @@ SRCNAME = "cliff"
>
>  SRC_URI = "https://pypi.python.org/packages/source/c/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
>
> -SRC_URI[md5sum] = "feaa48620db2aeb9306ff33e5494fccc"
> -SRC_URI[sha256sum] = "7609abc1789522fc4e228ea5567a9fd1db3963850396178adca3332cdd9c929a"
> +SRC_URI[md5sum] = "188212b80ee152ee65b2018975193418"
> +SRC_URI[sha256sum] = "2b92d12cf1aa59c0cf1914b4b6b02b78daadac890a53d0e6b71b5220661ab9e0"
>
>  S = "${WORKDIR}/${SRCNAME}-${PV}"
>
> --
> 1.8.4.2
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

