Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 7A217E009B8; Mon, 27 Jul 2015 06:58:08 -0700 (PDT)
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
	*      [209.85.160.177 listed in list.dnswl.org]
Received: from mail-yk0-f177.google.com (mail-yk0-f177.google.com
	[209.85.160.177])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 52383E0094D
	for <meta-virtualization@yoctoproject.org>;
	Mon, 27 Jul 2015 06:58:04 -0700 (PDT)
Received: by ykfw194 with SMTP id w194so69520458ykf.0
	for <meta-virtualization@yoctoproject.org>;
	Mon, 27 Jul 2015 06:58:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=cSTQlcuFpD0edwh/WRlGF6HxSHHsaVyyxq3H7o8sX+0=;
	b=XUM/FU0kr3zKhu48EqeKBLZb3gVm7rhdWI9YSelEaWtMIt5+iCCPsOAf/Gf+uiJgK5
	5Egz71iYqA796chW+9tm65DEI/HnZS77aZUvNbJpSj19M7HeNmLhSxgxbGJ0n3T0/XPJ
	WtwJZQUcLT9q91GL5e7jlZc0iWzzv5WRPfDcsbhOTSPca3XlYftAsiQ/2ADpOfrb1lK1
	31EYtB7ej0TxE3G/MOF7muIC7YkE9L0fkgGIcl9hpMCppTguE+zOVIFim4LCr9JPnRv8
	2v+gv2e2SIHLGfvZJ0wxH2sXUq9zjZM0KFNULOraJdUJMJFMwHqQTzYDFfk7HnbBT0hV
	vVJw==
MIME-Version: 1.0
X-Received: by 10.170.89.130 with SMTP id g124mr16963996yka.60.1438005483924; 
	Mon, 27 Jul 2015 06:58:03 -0700 (PDT)
Received: by 10.129.128.2 with HTTP; Mon, 27 Jul 2015 06:58:03 -0700 (PDT)
In-Reply-To: <1437964261-1851-1-git-send-email-lixin.fnst@cn.fujitsu.com>
References: <1437964261-1851-1-git-send-email-lixin.fnst@cn.fujitsu.com>
Date: Mon, 27 Jul 2015 09:58:03 -0400
Message-ID: <CADkTA4Meyu2zEP5HqqMG+UJRnjck5ctzYfNB7jDb0_kZdn+TNA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Li xin <lixin.fnst@cn.fujitsu.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH 0/8] upgrade recipes
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
X-List-Received-Date: Mon, 27 Jul 2015 13:58:08 -0000
Content-Type: text/plain; charset=UTF-8

On Sun, Jul 26, 2015 at 10:30 PM, Li xin <lixin.fnst@cn.fujitsu.com> wrote:
> these recipes inherit ruby.
> After ruby upgrade to 2.2.2, the recipes will occur an
> Warning like this:
> WARNING: QA Issue: mixlib-log: Files/directories were installed but not shipped in any package:
>   /usr/lib/ruby/gems/2.2.0/build_info
>   /usr/lib/ruby/gems/2.2.0/extensions
> So,it is needed to apply the "[PATCH] ruby.bbclass: WARNING Fix" to avoid build Warnings.
>


Thanks!  I've merged this series, and your other patch..

To ssh://git@git.yoctoproject.org/meta-cloud-services
   d483af7aaffb..d7b18cea0850  dizzy-juno -> dizzy-juno
   2cb09aa8f2f6..a7bd749208db  fido-kilo -> fido-kilo
   cb835dd47a75..89f228ce884f  master -> master

Cheers,

Bruce

> Li xin (8):
>   chef-zero: upgrade 2.0.2 -> 4.2.3
>   hashie: upgrade 2.1.1 -> 3.4.2
>   highline: upgrade 1.6.21 -> 1.7.3
>   mime-types: upgrade 1.25.1 -> 2.5
>   mixlib-config: upgrade 2.1.0 -> 2.2.1
>   mixlib-shellout: upgrade 1.4.0 -> 2.1.0
>   net-ssh-multi: upgrade 1.2.0 -> 1.2.1
>   ohai: upgrade 7.0.4 -> 8.5.0
>
>  meta-openstack/recipes-devtools/ruby/chef-zero_git.bb       |  6 ++----
>  meta-openstack/recipes-devtools/ruby/hashie_git.bb          |  4 ++--
>  meta-openstack/recipes-devtools/ruby/highline_git.bb        |  4 ++--
>  meta-openstack/recipes-devtools/ruby/mime-types_git.bb      |  8 ++++----
>  meta-openstack/recipes-devtools/ruby/mixlib-config_git.bb   |  4 ++--
>  meta-openstack/recipes-devtools/ruby/mixlib-shellout_git.bb |  4 ++--
>  ...gemspec-don-t-force-the-use-of-gem-private_key.pem.patch | 13 +++++++------
>  meta-openstack/recipes-devtools/ruby/net-ssh-multi_git.bb   |  4 ++--
>  meta-openstack/recipes-devtools/ruby/ohai_git.bb            |  6 +++---
>  9 files changed, 26 insertions(+), 27 deletions(-)
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

