Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 374F0E00828; Thu, 29 Jan 2015 21:20:41 -0800 (PST)
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
	*      [209.85.215.48 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-la0-f48.google.com (mail-la0-f48.google.com
	[209.85.215.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D4AC7E007CF
	for <meta-virtualization@yoctoproject.org>;
	Thu, 29 Jan 2015 21:20:30 -0800 (PST)
Received: by mail-la0-f48.google.com with SMTP id pv20so21767187lab.7
	for <meta-virtualization@yoctoproject.org>;
	Thu, 29 Jan 2015 21:20:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=rKaqotZpoKHWkVE+OWlWVZtjFC11sm+CvucdkX4B/fk=;
	b=ZOJTomtwTR9BLvzMG5sxEJ5Y33PXf2YIpclSrxV5ej6SPGkMcUFxm9rCVR3MG5Cbhn
	uIR7+Wzq6YzGJ6Vgx0L0dwdLgwXlHeYr5CSTdcKoxMV6MhdbpA/KgFI1NjgVtQe6QPap
	Z5+qg2vioPAbfbpieOqR/bnXuFlQimE1oZSDKaO8Y2X2E6ZbYNpNf/gU5XJ4Hd/It3qR
	VBbi50dJpmyJP2K9F2u7FwzEF/NHfNC21dG1UT7CCnM/HQa3jWdwHiia4NOolMIW8vy5
	N0OJUfdD33eduYDQscuMYphV9SCP7KPsW3BdkHVfeGz8iYIf/VZv4c+6r/HzfihUJ/zB
	CFyw==
MIME-Version: 1.0
X-Received: by 10.112.166.73 with SMTP id ze9mr4750972lbb.38.1422595228163;
	Thu, 29 Jan 2015 21:20:28 -0800 (PST)
Received: by 10.112.48.41 with HTTP; Thu, 29 Jan 2015 21:20:28 -0800 (PST)
In-Reply-To: <1422410616-4342-1-git-send-email-qianl.fnst@cn.fujitsu.com>
References: <1422410616-4342-1-git-send-email-qianl.fnst@cn.fujitsu.com>
Date: Fri, 30 Jan 2015 00:20:28 -0500
Message-ID: <CADkTA4PKG2aCnNcNY6DkGfBfyygDf3s2ayJCWqo-fJM5dFyHvA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Qian Lei <qianl.fnst@cn.fujitsu.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH 0/2] Don't compile extensions
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
X-List-Received-Date: Fri, 30 Jan 2015 05:20:41 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Jan 27, 2015 at 9:03 PM, Qian Lei <qianl.fnst@cn.fujitsu.com> wrote:
> Ruby module mkmf is used in these extensions. But mkmf use native
> libraries instead of target libraries. so we don't compile them.

Thanks for the fixes. They look fine to me, and I've merged them to the master
branch.

Cheers,

Bruce

>
> Qian Lei (2):
>   json: Don't compile extensions
>   yajl-ruby: Don't compile extensions
>
>  .../ruby/json/0001-Dont-compile-extensions.patch     | 20 ++++++++++++++++++++
>  meta-openstack/recipes-devtools/ruby/json_git.bb     |  1 +
>  .../yajl-ruby/0001-Don-t-compile-extensions.patch    | 20 ++++++++++++++++++++
>  .../recipes-devtools/ruby/yajl-ruby_git.bb           |  1 +
>  4 files changed, 42 insertions(+)
>  create mode 100644 meta-openstack/recipes-devtools/ruby/json/0001-Dont-compile-extensions.patch
>  create mode 100644 meta-openstack/recipes-devtools/ruby/yajl-ruby/0001-Don-t-compile-extensions.patch
>
> --
> 1.8.3.1
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

