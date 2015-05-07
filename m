Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 4947BE004F6; Thu,  7 May 2015 11:15:07 -0700 (PDT)
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
	*      [209.85.160.169 listed in list.dnswl.org]
Received: from mail-yk0-f169.google.com (mail-yk0-f169.google.com
	[209.85.160.169])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DD93CE00306
	for <meta-virtualization@yoctoproject.org>;
	Thu,  7 May 2015 11:15:04 -0700 (PDT)
Received: by ykec202 with SMTP id c202so13795438yke.2
	for <meta-virtualization@yoctoproject.org>;
	Thu, 07 May 2015 11:15:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=C7G2n+VOPmmmJLkocniL2OLQLEp2bvrzuynlOzGVcDY=;
	b=Ite7g/Ak9eJBqDgfxIduRWW0fa1MUzLcnd5uDYlXE+n//BJx6iAelY/fjeZi/fc+pk
	hcM/x0cemIl7UWEXZZ4/VWlsmBIXuAyweD7gglx091Vbk1Dl68gR0npPsmLg4UOoyVUY
	rbAV3w1hwC2TzA6KBL2jQdbkXHAEsVtZbgT7Fzv7m94AJCr8FPwPes/efjtAK+6tFiJy
	nc0MEKnCC8B1od7pnNM3mgfc4bOUPwPMpZJJhUUEfqBn1r/XXFBkjfVAYgNWkUDAKV65
	ifstXn2MXeyy5iojtb1LeR4V+8u1dna6Zok2cwZ8kKAsO+xi3ZSrDBMMnKjhkvOrKldf
	nDqA==
MIME-Version: 1.0
X-Received: by 10.170.149.194 with SMTP id q185mr4434504ykc.16.1431022504040; 
	Thu, 07 May 2015 11:15:04 -0700 (PDT)
Received: by 10.129.109.20 with HTTP; Thu, 7 May 2015 11:15:04 -0700 (PDT)
In-Reply-To: <cover.1430817811.git.jackie.huang@windriver.com>
References: <cover.1430817811.git.jackie.huang@windriver.com>
Date: Thu, 7 May 2015 14:15:04 -0400
Message-ID: <CADkTA4Ov-AJ7AAD9=MZLvQ_p2oG+toeZE=MKSiyeXx8rZ+bY4A@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: "Huang, Jie (Jackie)" <jackie.huang@windriver.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH 00/10] core: update to the kilo release
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
X-List-Received-Date: Thu, 07 May 2015 18:15:07 -0000
Content-Type: text/plain; charset=UTF-8

Thanks Jackie, I've merged these to the master and kilo branches.

Bruce

On Tue, May 5, 2015 at 9:44 PM,  <jackie.huang@windriver.com> wrote:
> From: Jackie Huang <jackie.huang@windriver.com>
>
> update to the kilo release and change to stable/kilo branch.
>
> --
> The following changes since commit 2ed930f23e4d5678ef943cef413d09cd10c78eb7:
>
>   python-setuptools-git: upgrade to 1.1 (2015-04-29 12:29:42 -0400)
>
> are available in the git repository at:
>
>   git://git.pokylinux.org/poky-contrib jhuang0/r_up_openstack-kilo_150505-0
>   http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=jhuang0/r_up_openstack-kilo_150505-0
>
> Jackie Huang (10):
>   python-keystonemiddleware: upgrade to 1.6.1
>   python-ceilometer: upgrade to 2015.1.0
>   python-cinder: upgrade to 2015.1.0
>   python-glance: upgrade to 2015.1.0
>   python-heat: upgrade to 2015.1.0
>   python-horizon: upgrade to 2015.1.0
>   python-keystone: upgrade to 2015.1.0
>   python-neutron: upgrade to 2015.1.0
>   python-nova: upgrade to 2015.1.0
>   python-barbican: upgrade to 2015.1.0
>
>  meta-openstack/recipes-devtools/python/python-barbican_git.bb      | 6 +++---
>  meta-openstack/recipes-devtools/python/python-ceilometer_git.bb    | 6 +++---
>  meta-openstack/recipes-devtools/python/python-cinder_git.bb        | 6 +++---
>  meta-openstack/recipes-devtools/python/python-glance_git.bb        | 6 +++---
>  meta-openstack/recipes-devtools/python/python-heat_git.bb          | 6 +++---
>  meta-openstack/recipes-devtools/python/python-horizon_git.bb       | 7 +++----
>  meta-openstack/recipes-devtools/python/python-keystone_git.bb      | 7 +++----
>  .../recipes-devtools/python/python-keystonemiddleware_git.bb       | 4 ++--
>  meta-openstack/recipes-devtools/python/python-neutron_git.bb       | 7 +++----
>  meta-openstack/recipes-devtools/python/python-nova_git.bb          | 7 +++----
>  10 files changed, 29 insertions(+), 33 deletions(-)
>
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

