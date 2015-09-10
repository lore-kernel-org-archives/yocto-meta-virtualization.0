Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 553AEE00D91; Thu, 10 Sep 2015 11:46:49 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.160.171 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-yk0-f171.google.com (mail-yk0-f171.google.com
	[209.85.160.171])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 125F7E00DB2
	for <meta-virtualization@yoctoproject.org>;
	Thu, 10 Sep 2015 11:46:42 -0700 (PDT)
Received: by ykdu9 with SMTP id u9so68191355ykd.2
	for <meta-virtualization@yoctoproject.org>;
	Thu, 10 Sep 2015 11:46:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=YbUzh8VVZROvpu9gsK/pBwBd353x0XXHY3zwHbtjbQ8=;
	b=iqmzAxpCkdZ70dwdVHRYnY0zIDWAEKLOkJTdCYJgBdrJZBvOvt0LwuBxtidv5PW+Vw
	Iky8SH2Nwd9dKdY8uwmGZl0doNIuxFOmdHtQsDDNJ9JQEnrfAE9L/b6NmFmq9j5ScY+E
	NKexaQql6JLfS8X5urPYzAL1KBKnMqweIuSzsisSuXIoYZ++5UiyRgUbFuXo0g0PZdAJ
	w6CURUHviFfxjzqtbCAPvSLc+NhUoqmjljmesfwEFFxG21TPrpvXCS70KOx2Ee11EnXf
	V1ACMZ5au5xEOzwBkRbMtK67J1rAAQxG/36cHsXTxODQz+V7EX/mrjoQmJQSW1aHpbPU
	dqLw==
MIME-Version: 1.0
X-Received: by 10.170.96.196 with SMTP id n187mr6854188yka.54.1441910802263;
	Thu, 10 Sep 2015 11:46:42 -0700 (PDT)
Received: by 10.129.34.212 with HTTP; Thu, 10 Sep 2015 11:46:42 -0700 (PDT)
In-Reply-To: <1441814544-7657-1-git-send-email-josep.puigdemont@enea.com>
References: <1441814544-7657-1-git-send-email-josep.puigdemont@enea.com>
Date: Thu, 10 Sep 2015 14:46:42 -0400
Message-ID: <CADkTA4MLRv0tPi4bfObEvg47D_n+schchC-cK=kTGvLp6XOBNQ@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Josep Puigdemont <josep.puigdemont@enea.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [fido-kilo][PATCH] python-memcache: add missing dependency
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
X-List-Received-Date: Thu, 10 Sep 2015 18:46:49 -0000
Content-Type: text/plain; charset=UTF-8

merged.

Bruce

On Wed, Sep 9, 2015 at 12:02 PM, Josep Puigdemont
<josep.puigdemont@enea.com> wrote:
> python-memcache requires python-nose, this fixes this build error:
>
> |   File ".../x86_64-linux/usr/lib/python2.7/site-packages/distribute-0.6.32-py2.7.egg/setuptools/command/easy_install.py", line 592, in easy_install
> |     raise DistutilsError(msg)
> | distutils.errors.DistutilsError: Could not find suitable distribution for Requirement.parse('nose>=1.0')
> | ERROR: python setup.py build_ext execution failed.
> | WARNING: exit code 1 from a shell command.
> | ERROR: Function failed: do_compile (log file is located at .../python-memcache/1.2.5-r0/temp/log.do_compile.24701)
>
> Signed-off-by: Josep Puigdemont <josep.puigdemont@enea.com>
> ---
>  meta-openstack/recipes-devtools/python/python-memcache_1.2.5.bb | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta-openstack/recipes-devtools/python/python-memcache_1.2.5.bb b/meta-openstack/recipes-devtools/python/python-memcache_1.2.5.bb
> index 6597e86..3e6f3f6 100644
> --- a/meta-openstack/recipes-devtools/python/python-memcache_1.2.5.bb
> +++ b/meta-openstack/recipes-devtools/python/python-memcache_1.2.5.bb
> @@ -20,8 +20,10 @@ inherit setuptools
>
>  DEPENDS += " \
>          python-pip \
> +        python-nose \
>          "
>
>  # RDEPENDS_default:
>  RDEPENDS_${PN} += " \
> +        python-nose \
>          "
> --
> 1.9.1
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

