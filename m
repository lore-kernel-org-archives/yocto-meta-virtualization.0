Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id CCCD0E00A92; Mon, 10 Aug 2015 06:52:57 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [209.85.160.172 listed in list.dnswl.org]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (bruce.ashfield[at]gmail.com)
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-yk0-f172.google.com (mail-yk0-f172.google.com
	[209.85.160.172])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 94F23E00A99
	for <meta-virtualization@yoctoproject.org>;
	Mon, 10 Aug 2015 06:52:56 -0700 (PDT)
Received: by ykaz130 with SMTP id z130so32194771yka.0
	for <meta-virtualization@yoctoproject.org>;
	Mon, 10 Aug 2015 06:52:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=ZWr6+VTZGV/WbtatG8uUGK5DVDH2CZGPHuzOvrem2Rk=;
	b=o0RZxK2XywccV+TY5XPyt1QWvz9KvyAqpO1ATCM7r8kN7+TXABbYydj3XZNyGk7oHx
	N7xk3BMz1yElp28twCslH2EE4l6jTmo7kjurLcEpIc0PtBAseq0sxwoECnhn2/hiACCM
	1caZs4BNBcg2he5fsfVe17guGac0ar5K4CTzMLkAneb8J3wl3Bm1fH/OqoURpR5zpbfm
	IPXb3vDQ/MHZ7YWhdJFNibQQipQR/nQEZIBkxPxOm2QMA9pjT/eeP6vAobeZV26QHy//
	zdG+HiFsThKlwyP523FFV5yl+536fwrIhZ9frRYP/o/v92w6kOrWbymE9n0VMQyW9eso
	IPNQ==
MIME-Version: 1.0
X-Received: by 10.129.73.82 with SMTP id w79mr16547260ywa.16.1439214776283;
	Mon, 10 Aug 2015 06:52:56 -0700 (PDT)
Received: by 10.13.226.203 with HTTP; Mon, 10 Aug 2015 06:52:56 -0700 (PDT)
In-Reply-To: <1438940412-2219-1-git-send-email-lixin.fnst@cn.fujitsu.com>
References: <1438940412-2219-1-git-send-email-lixin.fnst@cn.fujitsu.com>
Date: Mon, 10 Aug 2015 09:52:56 -0400
Message-ID: <CADkTA4NXu6sWhDmQxXJ3E44MiDr8qmycM-GtFu1TbP3AWNimfA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Li xin <lixin.fnst@cn.fujitsu.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [meta-cloud-services][PATCH] json: upgrade 1.8.1 -> 1.8.3
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
X-List-Received-Date: Mon, 10 Aug 2015 13:52:57 -0000
Content-Type: text/plain; charset=UTF-8

merged.

Bruce

On Fri, Aug 7, 2015 at 5:40 AM, Li xin <lixin.fnst@cn.fujitsu.com> wrote:
> Dropped 0001-Dont-compile-extensions.patch, it is not needed anymore.
>
> Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
> ---
>  .../ruby/json/0001-Dont-compile-extensions.patch     | 20 --------------------
>  meta-openstack/recipes-devtools/ruby/json_git.bb     |  5 ++---
>  2 files changed, 2 insertions(+), 23 deletions(-)
>  delete mode 100644 meta-openstack/recipes-devtools/ruby/json/0001-Dont-compile-extensions.patch
>
> diff --git a/meta-openstack/recipes-devtools/ruby/json/0001-Dont-compile-extensions.patch b/meta-openstack/recipes-devtools/ruby/json/0001-Dont-compile-extensions.patch
> deleted file mode 100644
> index 0c2f513..0000000
> --- a/meta-openstack/recipes-devtools/ruby/json/0001-Dont-compile-extensions.patch
> +++ /dev/null
> @@ -1,20 +0,0 @@
> -From 8c6e4b688cc7feade17caa832f9304262025fd17 Mon Sep 17 00:00:00 2001
> -From: Qian Lei <qianl.fnst@cn.fujitsu.com>
> -Date: Tue, 27 Jan 2015 19:34:26 +0800
> -Subject: [PATCH] Dont compile extensions
> -
> -Signed-off-by: Qian Lei <qianl.fnst@cn.fujitsu.com>
> ----
> - json.gemspec | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/json.gemspec b/json.gemspec
> -index 75926b1..af7e9ca 100644
> ---- a/json.gemspec
> -+++ b/json.gemspec
> -@@ -13 +13 @@ Gem::Specification.new do |s|
> --  s.extensions = ["ext/json/ext/generator/extconf.rb", "ext/json/ext/parser/extconf.rb"]
> -+#  s.extensions = ["ext/json/ext/generator/extconf.rb", "ext/json/ext/parser/extconf.rb"]
> ---
> -1.8.3.1
> -
> diff --git a/meta-openstack/recipes-devtools/ruby/json_git.bb b/meta-openstack/recipes-devtools/ruby/json_git.bb
> index f738ece..a417798 100644
> --- a/meta-openstack/recipes-devtools/ruby/json_git.bb
> +++ b/meta-openstack/recipes-devtools/ruby/json_git.bb
> @@ -9,15 +9,14 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=aef161fe3c86f1a8d6c71d3b8c5655c5"
>
>  PR = "r0"
>
> -BPV = "1.8.1"
> +BPV = "1.8.3"
>  PV = "${BPV}"
> -SRCREV = "92a96dea2b24b9c68856004d69491f46aedd0925"
> +SRCREV = "db4c71a7701b95c30f945ee1536240920dcfdc17"
>
>  S = "${WORKDIR}/git"
>
>  SRC_URI = " \
>      git://github.com/flori/json.git \
> -    file://0001-Dont-compile-extensions.patch \
>      "
>
>  inherit ruby
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

