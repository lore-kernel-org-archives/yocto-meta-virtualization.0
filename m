Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id ED758E00A9A; Mon, 10 Aug 2015 06:52:49 -0700 (PDT)
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
	*      [209.85.160.172 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-yk0-f172.google.com (mail-yk0-f172.google.com
	[209.85.160.172])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5C5EDE00A7D
	for <meta-virtualization@yoctoproject.org>;
	Mon, 10 Aug 2015 06:52:47 -0700 (PDT)
Received: by ykeo23 with SMTP id o23so139276696yke.3
	for <meta-virtualization@yoctoproject.org>;
	Mon, 10 Aug 2015 06:52:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=Jp4OWGOknzaTOStmK6jrZSQG1ZTid2Ob52Ury13d7IQ=;
	b=RKJ23M2szbxVSSrb0lqWOr8DafqPbf4FpsLmik6IOK/HFcVy5IsY2JC84qKUQdJqcH
	G0+hG8kxk9jMGN5Y4/bixdxPYvRVKu5fpXuHXv3FGWxO5dKsTAYYK8OBIqOToxNluJR3
	5fLu2D7jUu+ZevHN29ak5PEnQWMFaMGj5fHbNPdkmvITnU0HhXKzG7Xe2ybwFrl7qQl+
	NA83OYfy/k7d++mbhmyc9IE2qCVsesY3W93LWedtAtGrJWAAxC9pSLa95x8FJyr3dga6
	wY8vJIaxT8yKNEFN8LnHla4N7mz5RkUcHJKHoy0u7uh3lecb3qCvuPmp937tA/cHggMa
	uRGQ==
MIME-Version: 1.0
X-Received: by 10.13.212.207 with SMTP id w198mr7305803ywd.68.1439214767429;
	Mon, 10 Aug 2015 06:52:47 -0700 (PDT)
Received: by 10.13.226.203 with HTTP; Mon, 10 Aug 2015 06:52:47 -0700 (PDT)
In-Reply-To: <1438938864-25610-1-git-send-email-leimaohui@cn.fujitsu.com>
References: <1438938864-25610-1-git-send-email-leimaohui@cn.fujitsu.com>
Date: Mon, 10 Aug 2015 09:52:47 -0400
Message-ID: <CADkTA4PQiyEn1jEAAtSWv3PP7BZ+ZNt9VNy5sk=+nt-yg7Micg@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Lei Maohui <leimaohui@cn.fujitsu.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [m-c-s][PATCH] chef: upgrade 11.12.4->12.4.1
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
X-List-Received-Date: Mon, 10 Aug 2015 13:52:50 -0000
Content-Type: text/plain; charset=UTF-8

merged.

Bruce

On Fri, Aug 7, 2015 at 5:14 AM, Lei Maohui <leimaohui@cn.fujitsu.com> wrote:
> Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
> ---
>  .../chef/chef/0001-chang-ksh-to-sh.patch           | 23 ++++++++++++++++++++++
>  meta-openstack/recipes-support/chef/chef_git.bb    | 14 +++++++------
>  2 files changed, 31 insertions(+), 6 deletions(-)
>  create mode 100644 meta-openstack/recipes-support/chef/chef/0001-chang-ksh-to-sh.patch
>
> diff --git a/meta-openstack/recipes-support/chef/chef/0001-chang-ksh-to-sh.patch b/meta-openstack/recipes-support/chef/chef/0001-chang-ksh-to-sh.patch
> new file mode 100644
> index 0000000..b3d13fc
> --- /dev/null
> +++ b/meta-openstack/recipes-support/chef/chef/0001-chang-ksh-to-sh.patch
> @@ -0,0 +1,23 @@
> +From b819187d45984b4bc37aebc41570a7f4fff94b14 Mon Sep 17 00:00:00 2001
> +From: Lei Maohui <leimaohui@cn.fujitsu.com>
> +Date: Tue, 4 Aug 2015 03:56:28 +0900
> +Subject: [PATCH] chang ksh to sh
> +
> +Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
> +---
> + spec/functional/assets/chefinittest | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/spec/functional/assets/chefinittest b/spec/functional/assets/chefinittest
> +index 79e064c..46a7c3b 100755
> +--- a/spec/functional/assets/chefinittest
> ++++ b/spec/functional/assets/chefinittest
> +@@ -1,4 +1,4 @@
> +-#!/bin/ksh
> ++#!/bin/sh
> +
> + function create_chef_txt {
> +         touch /tmp/chefinittest.txt
> +--
> +1.8.4.2
> +
> diff --git a/meta-openstack/recipes-support/chef/chef_git.bb b/meta-openstack/recipes-support/chef/chef_git.bb
> index c8a422b..86e4165 100644
> --- a/meta-openstack/recipes-support/chef/chef_git.bb
> +++ b/meta-openstack/recipes-support/chef/chef_git.bb
> @@ -11,17 +11,15 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=8f7bb094c7232b058c7e9f2e431f389c"
>
>  PR = "r0"
>
> -#SRC_URI[md5sum] = "521d9184648b12e0ea331367d287314f"
> -#SRC_URI[sha256sum] ="d00874468a4f9e43d6acb0d5238a50ebb4c79f17fd502741a0fc83d76eb253cf"
> -
> -BPV = "11.12.4"
> +BPV = "12.4.1"
>  PV = "${BPV}"
> -SRCREV = "410af3e88cf9f0793c56363563be8fa173244d3a"
> +SRCREV = "1dc20627aa5d742376269dc5b4d5c67f34d08008"
>
>  S = "${WORKDIR}/git"
>
>  SRC_URI = " \
> -    git://github.com/opscode/chef.git;branch=11-stable \
> +    git://github.com/opscode/chef.git;branch=12.4-stable \
> +    file://0001-chang-ksh-to-sh.patch \
>      "
>
>  inherit ruby
> @@ -61,10 +59,14 @@ RDEPENDS_${PN} += " \
>          systemu \
>          yajl-ruby \
>          make \
> +        bash \
>          "
>
>  RUBY_INSTALL_GEMS = "pkg/chef-${BPV}.gem"
>
> +FILES_${PN} += "${libdir}/ruby/gems/2.2.0/build_info"
> +FILES_${PN} += "${libdir}/ruby/gems/2.2.0/extensions"
> +
>  do_install_prepend() {
>         rake gem
>  }
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

